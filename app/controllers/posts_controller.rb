class PostsController < ApplicationController


  def show
    @post = Post.find(params[:id])
  end

  def index
  end

  def like
    @post = Post.find(params[:id])
    @post.likes += 1
    @post.save
    redirect_to post_path(@post)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :blogger_id, :destination_id, :likes)
  end
end
