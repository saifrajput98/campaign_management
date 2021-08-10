# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  USER_TYPE = {
    Expert: 'Expert',
    Novice: 'Novice'
  }.freeze

  STATUS = {
    Qualified: 'Qualified',
    Not_Qualified: 'Not_Qualified',
    Banned: 'Banned'
  }

  has_many :comments
  has_many :campaigns
  has_many :todo_lists

  enum type: USER_TYPE
  enum status: STATUS
end
