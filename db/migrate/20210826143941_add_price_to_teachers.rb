class AddPriceToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :price, :float
  end
end
