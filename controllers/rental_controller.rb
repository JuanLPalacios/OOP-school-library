class RentalController
  def create_a_rental(person, book, date)
    Rental.new(person, book, date)
  end

  def list_all_rentals_for_person_id(id)
    person = @people.find { |item| item.id == id }
    return person.rentals unless person.nil?

    []
  end
end
