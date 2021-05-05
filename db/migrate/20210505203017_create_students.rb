class CreateStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :students do |t|
      t.string :name
      t.string :degree
      t.date :birthday
      t.integer :year
    end
  end
end
