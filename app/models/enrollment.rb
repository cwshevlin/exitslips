class Enrollment < ActiveRecord::Base
  belongs_to :student
  belongs_to :section

end
