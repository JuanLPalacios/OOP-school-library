class App
  def list_all_books
    @books
  end

  def list_all_people
    @people
  end

  def create_a_person(is_teacher, name, age, aditional)
    @people.push(
      is_teacher ? Teacher.new(age, aditional, name) : Student.new(age, nil, name, parent_permission: aditional)
    )
  end

  def create_a_book(title, author); end

  def create_a_rental(book, person, date); end

  def list_all_rentals_for_person_id(id); end

  def initialize
    @books = []
    @people = []
  end
end
