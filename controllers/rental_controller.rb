require 'json'
class RentalController
  def create_a_rental(person, book, date)
    Rental.new(person, book, date)
  end

  def list_all_rentals_for_person(person)
    return person.rentals unless person.nil?

    []
  end

  def load(people, books, filename = './data/retals.json')
    return false unless File.exist?(filename)

    JSON.parse(File.read(filename)).each do |rental|
      person = people.find { |p| p.id == rental['person_id'] }
      book = books.find do |b|
        b.title == rental['book_id']['title'] && b.author == rental['book_id']['author']
      end
      Rental.new(person, book, rental['date'])
    end
  end

  def save(people, filename = './data/retals.json')
    File.write(
      filename,
      (people.map(&:rentals).flatten.map do |rental|
        {
          person_id: rental.person.id,
          book_id: {
            title: rental.book.title,
            author: rental.book.author
          },
          date: rental.date
        }
      end).to_json
    )
  end
end
