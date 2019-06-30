class PropertiesController < ApplicationController
  layout 'page_with_header'

  def index
    @properties = if search_param
      Property.search_for(search_param)
    else
      Property.all
    end.includes(:location)
  end
end
