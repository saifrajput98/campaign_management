# frozen_string_literal: true

class Campaign < ApplicationRecord
  DURATION_TYPE = {
    within_1_week: 'within 1 week',
    within_1_month: 'within 1 month',
    within_3_months: 'within 3 months'
  }.freeze

  has_many :users, class_name: 'Expert'
  has_many :tags
  has_many :sub_tags
  has_many :discussion_topics
  has_many :comments, as: :commentable

  has_one :todo_lists

  scope :expert, -> { where(type = 'Expert') }

  validates :title, :purpose, :estimated_duration, presence: true

  enum estimated_duration: DURATION_TYPE
end
