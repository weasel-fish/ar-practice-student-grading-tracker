class CreateExams < ActiveRecord::Migration[5.2]
  def change
    create_table :exams do |t|
      t.string :subject
      t.integer :total_questions
      t.boolean :is_pop_quiz
      t.date :administration_date
    end
  end
end
