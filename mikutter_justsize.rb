Plugin.create :justsize do
  class Gtk::PostBox < Gtk::EventBox
    def remain_charcount
      if not widget_post.destroyed?
        text = trim_hidden_regions(widget_post.buffer.text + UserConfig[:footer])
        Twitter::Extractor.extract_urls(text).map{|url|
          if url.length < posted_url_length(url)
            -(posted_url_length(url) - url.length)
          else
            url.length - posted_url_length(url) end
        }.inject(text.size, &:+)
      end
    end
  end
end
