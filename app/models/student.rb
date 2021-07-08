class Student < ActiveRecord::Base
    has_many :student_exams
    has_many :exams, through: :student_exams

    def self.upper_classmen

    end


end
