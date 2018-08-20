class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    if params["likes"]
      @post = Post.find(params[:id])
      @post.add_like
    else
      @post = Post.find(params[:id])
    end
  end

private
  def post_params
    params.require(:post).permit(:title, :content, :likes, :blogger_id, :destination_id)
  end

end
