class CreatePhraseScores < ActiveRecord::Migration[6.0]
  def change
    create_table :phrase_scores do |t|
      t.float :english_familiarity_rank
      t.float :japanese_familiarity_rank
      t.boolean :studying_now, default: false
      t.belongs_to :phrase, null: false, foreign_key: true

      t.timestamps
    end
  end
end
