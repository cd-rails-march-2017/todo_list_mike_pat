class User < ActiveRecord::Base
  has_many :tasks, :dependent => :destroy_all
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 4 }
end
