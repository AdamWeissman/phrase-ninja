class CreateEmotions < ActiveRecord::Migration[6.0]
  def change
    create_table :emotions do |t|
      t.string :name
      t.boolean :studying_now, default: false
      t.belongs_to :situation, null: false, foreign_key: true
      t.belongs_to :phrase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
