class DestinationsController < ApplicationController


  def show
    @destination = Destination.find(params[:id])
    @featured_post = Post.joins(:destination).where(destination_id: @destination.id).order('likes desc').limit(1)[0]
    @recent_5 = Post.joins(:destination).where(destination_id: @destination.id).order('created_at desc').limit(5)
    @average_age =  @destination.posts.map {|post| post.blogger.age}.inject(:+)/@destination.posts.count
  end

  def index
  end

end
