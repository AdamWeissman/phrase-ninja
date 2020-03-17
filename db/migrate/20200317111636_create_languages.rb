class CreateLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :languages do |t|
      t.string :name
      t.boolean :studying_now, default: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
