Plugin.create :justsize do
  class Gtk::PostBox < Gtk::EventBox
    def remain_charcount
      if not widget_post.destroyed?
        trim_hidden_regions(widget_post.buffer.text + UserConfig[:footer]).size
      end
    end
  end
end
