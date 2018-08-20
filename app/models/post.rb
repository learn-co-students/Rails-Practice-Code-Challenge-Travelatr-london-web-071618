class Post < ApplicationRecord
  belongs_to :blogger
  belongs_to :destination

  validates :title, presence: true, uniqueness: true
  validates :content, length: {minimum: 100}

  def add_like
    no_likes = self.likes +=1
    self.update(likes: no_likes)
  end

end
