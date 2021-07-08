class StudentExam < ActiveRecord::Base
    belongs_to :student
    belongs_to :exam

    def print_details
        puts "#{student.name} took the #{exam.subject} exam receiving a score of #{grade}"
    end

    def questions_correct_ratio
        puts "#{grade} questions correct out of #{exam.total_questions} questions total"
    end
end