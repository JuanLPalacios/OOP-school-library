class PeopleController
  def list_all_people
    @people
  end

  def create_a_person(is_teacher, name, age, aditional)
    @people.push(
      is_teacher ? Teacher.new(age, aditional, name) : Student.new(age, nil, name, parent_permission: aditional)
    )
  end

  def initialize
    @people = []
  end
end
