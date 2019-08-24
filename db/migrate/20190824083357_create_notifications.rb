class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :content
      t.boolean :seen, default: false

      t.timestamps
    end
  end
end
