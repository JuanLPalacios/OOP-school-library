require 'json'
class RentalController
  def create_a_rental(person, book, date)
    Rental.new(person, book, date)
  end

  def list_all_rentals_for_person_id(id)
    person = @people.find { |item| item.id == id }
    return person.rentals unless person.nil?

    []
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
