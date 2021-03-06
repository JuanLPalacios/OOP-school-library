require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true, id: nil)
    super(age, name, parent_permission: parent_permission, id: id)
    classroom&.students&.push(self)
    @classroom = classroom
  end

  def classroom=(classroom)
    classroom.students.push(self)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
