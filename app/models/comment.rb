class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  validates :user, :post, presence: true
  validates :message, presence: true, length: { minimum: 5 }
end
