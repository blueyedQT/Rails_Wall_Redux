class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :user, presence: true
  validates :message, presence: true, length: { minimum: 5 }
end
