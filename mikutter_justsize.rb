Plugin.create :justsize do
  class Gtk::PostBox < Gtk::EventBox
    def extractor
      if Twitter.const_defined?(:Extractor)
        Twitter::Extractor
      else
        Twitter::TwitterText::Extractor
      end
    end

    def remain_charcount
      if not widget_post.destroyed?
        text = trim_hidden_regions(widget_post.buffer.text + UserConfig[:footer])
        extractor.extract_urls(text).map{|url|
          if url.length < posted_url_length(url)
            -(posted_url_length(url) - url.length)
          else
            url.length - posted_url_length(url) end
        }.inject(text.size, &:+)
      end
    end
  end
end
