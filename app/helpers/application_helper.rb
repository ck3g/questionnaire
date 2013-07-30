module ApplicationHelper
  def nav_link_to(title, path)
    content_tag :li, :class => ('active' if current_page?(path)) do
      link_to title, path
    end
  end
end
