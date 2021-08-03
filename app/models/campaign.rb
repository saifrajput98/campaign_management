class Campaign < ApplicationRecord
  DURATION_TYPE = {
    within_1_week: 'within_1 _week',
    within_1_month: 'within_1_month',
    within_3_months: 'within_3_months'
  }.freeze

  has_many :users, class_name: "Expert"
  has_many :tags
  has_many :sub_tags
  has_many :discussion_topics
  has_many :comments, as: :commentable

  has_one :todo_lists

  scope :expert, -> { where(type = 'Expert')}

  enum estimated_duration: DURATION_TYPE
end
