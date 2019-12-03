class ApplicationController < ActionController::Base
  inertia_share do
    {
      errors: session.delete(:errors) || [],
      flash: session.delete(:flash) || {}
    }
  end
end
