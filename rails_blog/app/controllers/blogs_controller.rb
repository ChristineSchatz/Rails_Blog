class BlogsController < ApplicationController
  def new
    @blog = Blog.new
  end

  def create
    user = User.find_by_id(session[:user_id])
    blog = Blog.new(blog_params)
    user.blogs << blog
    redirect_to user_path(user)
  end

  def edit
    @blog = Blog.find_by_id(params[:id])
  end

  def update
    Blog.update(params[:id], blog_params)
    redirect_to user_path(session[:user_id])
  end

  def destroy
    Blog.find_by_id(params[:id]).destroy
    redirect_to user_path(session[:user_id])
  end

  private
  def blog_params
    params.require(:blog).permit(:name, :description)
  end
end
