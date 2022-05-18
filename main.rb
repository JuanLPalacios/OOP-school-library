require './app'
require './controllers/books_controller'
require './controllers/people_controller'
require './controllers/rental_controller'

APP = App.new(
  books_controller: BooksController.new,
  people_controller: PeopleController.new,
  rental_controller: RentalController.new
)

OPTIONS = [
  -> { APP.list_all_books },
  -> { APP.list_all_people },
  -> { APP.create_a_person },
  -> { APP.create_a_book },
  -> { APP.create_a_rental },
  -> { APP.list_all_rentals_for_person_id }
].freeze

def main
  APP.load
  puts 'Welcome to School Library App!'
  loop do
    option = APP.main_menu
    case option
    when 1..6
      OPTIONS[option - 1].call
    when 7
      APP.save
      return puts 'Thank you for using this app!'
    end
  end
end
main
