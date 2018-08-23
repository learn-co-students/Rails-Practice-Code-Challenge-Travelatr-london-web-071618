class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true
  validates :age, numericality: { greater_than: 0}
  validates :bio, length: {minimum: 30}


  def total_likes
    total_likes = self.posts.map {|post| post.likes}
    total_likes.inject(0){|sum, x| sum + x}
  end

  def featured_post
    feat = self.posts.sort_by do |item|
      item[:likes]
    end
     feat.map {|post| post.title}.reverse.first
  end
end
