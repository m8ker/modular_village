class ApplicationController < ActionController::Base
  protect_from_forgery
  is_cancan=true
    begin
      Kernel.const_get('CanCan')
    rescue
      is_cancan=false
    end
    if is_cancan
      rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = 'Access denied.'
        redirect_to main_app.root_url
      end
    end
end