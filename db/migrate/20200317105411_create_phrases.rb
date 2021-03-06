class CreatePhrases < ActiveRecord::Migration[6.0]
  def change
    create_table :phrases do |t|
      t.text :english
      t.text :english_equivalent
      t.text :japanese
      t.text :japanese_phonetic
      t.float :familiarity_score

      t.string :category

      t.boolean :studying_now, default: false

      t.belongs_to :situation, null: false, foreign_key: true
      t.belongs_to :score, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
