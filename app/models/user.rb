class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  has_many :likes, :dependent => :destroy
  has_many :liked_posts, :through => :likes, :source => :post

  def display_name
    ##取email的前边来显示，如果你也可以另开一个字段是nickname 让用户可以自己编辑显示名称
    self.email.split("@").first
  end
  def is_admin?
    role == "admin"
  end
end
