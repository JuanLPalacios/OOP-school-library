class App
  def list_all_books
    @books
  end

  def list_all_people
    @people
  end

  def create_a_person(is_teacher, name, age, aditional); end

  def create_a_book(title, author); end

  def create_a_rental(book, person, date); end

  def list_all_rentals_for_person_id(id); end

  def initialize
    @books = []
    @people = []
  end
end
