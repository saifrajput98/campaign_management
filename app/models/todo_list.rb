# frozen_string_literal: true

class TodoList < ApplicationRecord
  belongs_to :campaign
  belongs_to :user

  validates :objective, presence: true
end
