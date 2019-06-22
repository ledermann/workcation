class PropertiesController < ApplicationController
  def index
    @properties = Property.all.includes(:location)
  end
end
