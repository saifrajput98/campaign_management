# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :sub_tags
  has_many :taggings, dependent: :destroy
  has_many :campaigns, through: :taggings
end
