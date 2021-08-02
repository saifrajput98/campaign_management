class Campaign < ApplicationRecord
  has_many :users, class_name: "Expert"
  has_many :tags, :sub_tags
  has_many :discussion_topics
  has_many :comments, as: :commentable

  has_one :todo_lists

  scope :expert, -> { where(type = 'Expert')}
end
