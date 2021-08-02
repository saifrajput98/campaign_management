class SubTag < ApplicationRecord
  belongs_to :tags
  belongs_to :campaign
end
