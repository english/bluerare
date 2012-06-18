require 'sinatra'

helpers do
  def partial template
    haml template, layout: false
  end

  def is_home?
    request.path_info == "/"
  end

  def slider_arrow_class
    is_home? ? 'arrow_up' : 'arrow_down'
  end

  def slider_style
    'display: none' unless is_home?
  end

  def slider_container_style
    is_home? ? 'height: 404px' : 'height: 80px'
  end
end

get '/' do
  haml :home
end
