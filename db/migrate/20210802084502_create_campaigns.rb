# frozen_string_literal: true

class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :title
      t.string :purpose
      t.string :estimated_duration
      t.references :user

      t.timestamps
    end
  end
end
