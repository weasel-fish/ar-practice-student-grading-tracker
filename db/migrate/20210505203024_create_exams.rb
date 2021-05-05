class CreateExams < ActiveRecord::Migration[6.1]
  def change
    t.string :subject
    t.integer :total_questions
    t.boolean :is_pop_quiz
    t.date :administration_date
  end
end
