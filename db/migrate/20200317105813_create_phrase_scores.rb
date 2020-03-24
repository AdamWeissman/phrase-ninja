class CreatePhraseScores < ActiveRecord::Migration[6.0]
  def change
    create_table :phrase_scores do |t|
      t.string :familiarity_name
      t.float :familiarity_name_corresponding_points


      t.boolean :studying_now, default: false

      t.timestamps
    end
  end
end
