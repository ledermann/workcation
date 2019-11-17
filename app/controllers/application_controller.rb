class ApplicationController < ActionController::Base
  # inertia_share does not work in dev mode, so do it manually for now
  def shared_inertia_data
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
