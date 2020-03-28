class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.string :familiarity_name
      t.float :familiarity_name_corresponding_points

      t.boolean :studying_now, default: false
      t.belongs_to :user, null: false, foreign_key: true
 
      t.timestamps
    end
  end
end
