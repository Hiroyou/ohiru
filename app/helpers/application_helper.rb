module ApplicationHelper
  def nl2br(text)
    h(text).gsub(/\r\n|\r|\n/, '<br />').html_safe
  end
end
