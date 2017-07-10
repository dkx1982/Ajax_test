class Post < ApplicationRecord
  belongs_to :user
  validates :content, presence: true
  has_many :likes, :dependent => :destroy
  has_many :liked_users, :through => :likes, :source => :user

  def find_like(user)
    self.likes.where(:user_id => user.id).first
  end
end
