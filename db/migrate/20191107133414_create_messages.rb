class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :number, unique: true
      t.references :chat, foreign_key: true

      t.timestamps
    end
  end
end
