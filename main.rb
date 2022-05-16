require './app'
require './controller'

APP = App.new(controller: Controller.new)

# rubocop:disable Metrics/CyclomaticComplexity
def main
  puts 'Welcome to School Library App!'
  loop do
    option = APP.main_menu
    case option
    when 1
      APP.list_all_books
    when 2
      APP.list_all_people
    when 3
      APP.create_a_person
    when 4
      APP.create_a_book
    when 5
      APP.create_a_rental
    when 6
      APP.list_all_rentals_for_person_id
    when 7
      return puts 'Thank you for using this app!'
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

main
