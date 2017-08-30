module ApplicationHelper
  def page_name
    original_page_name = "#{params[:controller]}-page".gsub('/','-')
    dashed_page_name = original_page_name.gsub('_', '-')

    [original_page_name, dashed_page_name, params[:action]].join(' ')
  end
end
