# frozen_string_literal: true

class Campaign < ApplicationRecord
  DURATION_TYPE = {
    within_1_week: 'within 1 week',
    within_1_month: 'within 1 month',
    within_3_months: 'within 3 months'
  }.freeze

  has_many :users, class_name: 'Expert'
  has_many :taggings, dependent: :destroy
  has_many :tags, through: :taggings
  has_many :sub_tags
  has_many :discussion_topics
  has_many :comments, as: :commentable

  has_many :todo_lists

  belongs_to :user

  scope :expert, -> { where(type = 'Expert') }

  validates :title, :purpose, :estimated_duration, presence: true

  enum estimated_duration: DURATION_TYPE

  # setter method
  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name).first_or_create!
    end
  end

  #getter method
  def all_tags
    tags.map(&:name).join(", ")
  end

  def self.search(term)
    campaigns = all
    campaigns = Campaign.joins(:tags).where('lower(name) ILIKE ?',"%#{term}%") if term&.downcase.present?
    campaigns
  end
end
