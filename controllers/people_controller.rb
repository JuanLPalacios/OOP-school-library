require 'json'

class PeopleController
  def list_all_people
    @people
  end

  def create_a_person(is_teacher, name, age, aditional)
    @people.push(
      is_teacher ? Teacher.new(age, aditional, name) : Student.new(age, nil, name, parent_permission: aditional)
    )
  end

  def save(filename = './people.json')
    arr_people = @people.map do |person|
      special = person.is_a?(Teacher) ? person.specialization : nil
      classroom = person.is_a?(Student) ? person.classroom : nil
      {
        id: person.id,
        name: person.name,
        age: person.age,
        parent_permission: person.parent_permission,
        classroom: classroom,
        specialization: special
      }
    end
    File.write(filename, arr_people.to_json)
  end

  def initialize
    @people = []
  end
end
