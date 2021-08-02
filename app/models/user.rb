class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  USER_TYPE = {
    Expert: "Expert",
    Novice: "Novice"
  }

  has_many :comments

  enum type: USER_TYPE
end
