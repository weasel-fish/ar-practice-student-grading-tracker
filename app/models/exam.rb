class Exam < ActiveRecord::Base
    has_many :student_exams
    has_many :students, through: :student_exams

    def insert_feedback(student, grade, comment)
        StudentExam.create(student_id: "#{student.id}", exam_id: self.id, grade: grade, teacher_comment: comment)
    end

    def class_average
        student_exams.average(:grade).to_f
    end

    def self.used_exams
        joins(:student_exams).uniq
    end

    def self.lowest_average
        id = joins(:student_exams).group(:exam_id).average(:grade).min_by {|k, v| v}[0]
        find(id)
    end

    def self.drop_lowest_average
        exam_id = lowest_average.id
        delete(exam_id)
        StudentExam.where(exam_id: exam_id).delete_all
    end

end
