class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(person, book, date)
    @date = date
    book.rentals.push(self)
    @book = book
    person.rentals.push(self)
    @person = person
  end

  def book=(book)
    book.rentals.push(self)
    @book = book
  end

  def person=(person)
    person.rentals.push(self)
    @person = person
  end
end
