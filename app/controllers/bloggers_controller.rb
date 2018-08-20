class BloggersController < ApplicationController
  def new
    @blogger = Blogger.new
  end
  def create
    @blogger = Blogger.new(blogger_params)
    if @blogger.valid?
      @blogger.save
      redirect_to blogger_path(@blogger)
    else
      render :new
    end
  end

  def show
    @blogger = Blogger.find(params[:id])
    @featured_post = Post.joins(:blogger).where(blogger_id: @blogger.id).order('likes desc').limit(1)
    @top_5_destinations = Post.joins(:blogger).where(blogger_id: @blogger.id).group('destination_id').order("count(destination_id) desc").limit(5)
  end

  def index
  end
end
