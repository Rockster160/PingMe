module ApplicationHelper
  def timeago(time, options={})
    return if time.blank?

    date = time.strftime("%b %-d '%y")
    time = time.strftime("%-l:%M %p")
    simple_time = "#{date} #{time}"

    content_tag(:time, simple_time, options.merge(datetime: time.to_i, title: simple_time))
  end
end
