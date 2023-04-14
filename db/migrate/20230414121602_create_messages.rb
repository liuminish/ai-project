class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :role
      t.string :content

      t.references :chat, foreign_key: true, index: true

      t.timestamps
    end
  end
end
