puts "Clearing old data..."
StudentExam.destroy_all
StudentExam.reset_pk_sequence
Exam.destroy_all
Exam.reset_pk_sequence
Student.destroy_all
Student.reset_pk_sequence

puts "Seeding students..."

10.times do
  Student.create(name: Faker::FunnyName.name,
                 degree: Faker::Educator.degree,
                 birthday: Faker::Date.birthday(min_age: 15, max_age: 105),
                 year: rand(1..4))
end

puts "Seeding exams..."

subject = ["English", "Math", "Science"]
10.times do
  Exam.create(subject: subject.sample,
              total_questions: rand(1..100),
              is_pop_quiz: [true, false].sample,
              administration_date: Faker::Date.between(from: 365.days.ago, to: Date.today))
end

puts "Seeding StudentExams..."
20.times do
  exam = Exam.all.sample
  student = Student.all.sample
  grade_score = rand(0..100)

  # TODO: create StudentExams! Remember, a StudentExam belongs to an exam
  # and a StudentExam belongs to a student.
  StudentExam.create(exam_id: exam.id, student_id: student.id, grade: grade_score) # <- insert key value pairs required to create a studentExam!

end

puts "Done!"
