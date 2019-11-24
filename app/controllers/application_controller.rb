class ApplicationController < ActionController::Base
  inertia_share do
    {
      errors: session.delete(:errors) || [],
      flash: session.delete(:flash) || {}
    }
  end

  before_action :set_csrf_cookie

  private

  def set_csrf_cookie
    cookies["CSRF-TOKEN"] = form_authenticity_token
  end
end
