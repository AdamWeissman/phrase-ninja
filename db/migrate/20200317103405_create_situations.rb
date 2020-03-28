class CreateSituations < ActiveRecord::Migration[6.0]
  def change
    create_table :situations do |t|
      t.string :name

      t.float :score_average
      t.float :score_median
      t.float :score_mode

      t.text :text_blob_for_phrases

      t.boolean :studying_now, default: false

      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
