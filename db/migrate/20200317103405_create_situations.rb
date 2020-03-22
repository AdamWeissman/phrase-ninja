class CreateSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :situations do |t|
      t.string :name

      t.float :phrase_score_average
      t.float :phrase_score_median
      t.float :phrase_score_mode

      t.text :text_blob_for_phrases

      t.boolean :studying_now, default: false

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
