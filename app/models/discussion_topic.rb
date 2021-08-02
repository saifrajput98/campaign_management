class DiscussionTopic < ApplicationRecord
  has_many :users, class_name: "Novice"
  has_many :comments, as: :commentable
  belongs_to :campaign
end
