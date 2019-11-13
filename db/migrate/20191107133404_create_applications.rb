class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.integer :token, unique: true
      t.string :name
      t.integer :chat_counts

      t.timestamps
    end
  end
end
