class CreateTeachers < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :category
      t.text :description
      t.references :user_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
