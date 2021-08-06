# frozen_string_literal: true

class CreateSubTags < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_tags do |t|
      t.string :name
      t.references :campaign, :tag

      t.timestamps
    end
  end
end
