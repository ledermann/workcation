class ApplicationController < ActionController::Base
  private

  helper_method def search_param
    params[:search]
  end
end
