class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :status
      t.string :profession
      t.string :service
      t.string :type

      t.timestamps
    end
  end
end
