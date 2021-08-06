# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :title
      t.references :user
      t.references :commentable, polymorphic: true

      t.timestamps
    end
  end
end
