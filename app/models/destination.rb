class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def top_five_posts
    self.posts[0..4].map {|post| post}
  end

  def bloggers_age
    self.bloggers.map {|blogger| blogger.age}.uniq
  end

  def average_age
    bloggers_age.inject(0) { |sum, el| sum+el } /bloggers_age.size
  end

end
