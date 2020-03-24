class CreatePhraseScores < ActiveRecord::Migration[6.0]
  def change
    create_table :phrase_scores do |t|
      t.float :familiarity_rank

      t.boolean :studying_now, default: false

      t.timestamps
    end
  end
end
