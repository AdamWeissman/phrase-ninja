class CreatePhrases < ActiveRecord::Migration[6.0]
  def change
    create_table :phrases do |t|
      t.text :english
      t.text :japanese
      t.text :japanese_phonetic
      t.string :category
      t.boolean :studying_now, default: false

      t.timestamps
    end
  end
end
