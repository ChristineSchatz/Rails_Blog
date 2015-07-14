class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    if session[:id]
      return User.find(session[:id])
    else
      return nil
    end
  end

  def require_logged_in
    redirect_to :root unless is_authenticated?
  end

  def is_authenticated?
    return !!session[:id]
  end

  def permission_denied
    render :file => "public/401.html", :status => :unauthorized
  end
end
