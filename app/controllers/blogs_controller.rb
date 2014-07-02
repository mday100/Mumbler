class BlogsController < ApplicationController
before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user = User.find(session[:user_id])
    if @blog.save
      flash[:notice] = "New Blog Post! Woop Woop!"
      redirect_to @blog.user
    else
      flash[:alert] = "There was a problem. :("
      redirect_to new_blog_path
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      flash[:notice] = "Blog updated! Yeah!"
      redirect_to @blog.user
    else
      flash[:alert] = "Boo. Something went wrong."
      redirect_to edit_blog_path(@blog)
    end
  end

  def destroy
    if @blog.delete
      flash[:notice] = "Blog go bye bye."
      redirect_to @blog.user
    else
      flash[:alert] = "Hmm. Something weird happened."
      redirect_to :back
    end
  end

  private

  def blog_params
    params.require(:blog).permit(:body)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end
end
