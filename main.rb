require './app'

APP = App.new

def list_all_books
  APP.list_all_books
end

def list_all_people
  APP.list_all_people
end

def create_a_person
  is_teacher = gets.to_i == 1
  name = gets.chomp
  age = gets.to_i
  aditional = gets.chomp
  APP.create_a_person(is_teacher, name, age, aditional)
end

def create_a_book
  title = gets.chomp
  author = gets.chomp
  APP.create_a_book(title, author)
end

def create_a_rental
  book = APP.list_all_books[gets.to_i]
  person = APP.list_all_people[gets.to_i]
  date = gets.chomp
  APP.create_a_rental(book, person, date)
end

def list_all_rentals_for_person_id
  id = gets.to_i
  APP.list_all_rentals_for_person_id(id)
end

# rubocop:disable Metrics/CyclomaticComplexity
def main
  puts 'Welcome to School Library App!\n'
  loop do
    # print main menu
    option = gets.to_i
    case option
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_a_person
    when 4
      create_a_book
    when 5
      create_a_rental
    when 6
      list_all_rentals_for_person_id
    when 7
      break
    end
  end
end
# rubocop:enable Metrics/CyclomaticComplexity

main
