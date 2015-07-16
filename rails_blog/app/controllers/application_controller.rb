class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user, :require_logged_in, except: :index

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  # Now that you have an @current_user instance and you have a before_action that runs this method, you will have access to @current_user in the view.

  # def current_user
  #   if session[:id]
  #     # this should always be session[:user_id] - more specific.
  #     return User.find(session[:id])
  #   else
  #     return nil
  #   end
  # end



  end

  def require_logged_in
    redirect_to :root unless is_authenticated?
  end

  def is_authenticated?
    return !!session[:id]
  end

  def permission_denied
    render :file => "public/401.html", :status => :unauthorized
    # Cooool, I like this - we don't have a 403 given to us in the public folder, but check out the difference between 401 and 403 here and when to use one vs the other. Just food for future thought: http://stackoverflow.com/questions/3297048/403-forbidden-vs-401-unauthorized-http-responses
  end
end
