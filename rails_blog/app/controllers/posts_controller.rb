  class PostsController < ApplicationController
  def index
    @blog = Blog.find_by_id(params[:blog_id])
    @posts = @blog.posts
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
    @blog = Blog.find_by_id(params[:blog_id])
  end

  def create
    post = Post.new(post_params)
    blog = Blog.find_by_id(params[:blog_id])
    blog.posts << post
    # error handling
    redirect_to blog_posts_path(blog)
  end

  def edit
    @post = Post.find_by_id(params[:id])
    @blog = Blog.find_by_id(params[:blog_id])
  end

  def update
    Post.update(params[:id], post_params)
    redirect_to blog_posts_path(params[:blog_id])
  end

  def destroy
    Post.find_by_id(params[:id]).destroy
    redirect_to blog_posts_path(params[:blog_id])
  end

  private
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
