class Section < ActiveRecord::Base
  has_many :enrollments
  has_many :students, through: :enrollments
  belongs_to :teacher
  has_many :quizzes
  has_many :sittings, through: :quizzes
  has_many :requirements
  has_many :standards, through: :requirements

  after_create { generate_passcode }

    def generate_passcode
      self.passcode = ('a'..'z').to_a.sample(7).join
    end

    def calculate_scores_by_standard
      requirements = self.requirements
      students = self.students
      scores = {}

      students.each do |student|
        s = student.calculate_scores_by_standard({
          requirements: requirements,
          section_id: self.id
        })
        scores[student.id] = s
      end
      scores
    end
end
