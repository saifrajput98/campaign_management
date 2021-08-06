# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :sub_tags

  belongs_to :campaign
end
