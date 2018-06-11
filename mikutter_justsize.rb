Plugin.create :justsize do
  class Gtk::PostBox < Gtk::EventBox
    def update_remain_charcount
      if not widget_post.destroyed?
        text = widget_post.buffer.text + UserConfig[:footer]
        @remain.set_text(text.size.to_s) if not @remain.destroyed?
      end
    end
  end
end
