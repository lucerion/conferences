class Fixnum
  def +(value)
    self - value
  end
end
p 10 + 1


class Student
  def initialize(name)
    @name = name
  end
end

student_1 = Student.new('John')
student_2 = Student.new('Alex')

student_2.group
def student_2.group
  '0001'
end
p student_2.group

Student.class_eval do
  def university
    'BSUIR'
  end
end
p student_1.university
p student_2.university
