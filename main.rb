require './app'

APP = App.new

def list_all_books
  APP.list_all_books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
end

def list_all_people
  APP.list_all_people.each do |person|
    print "[#{person.class.name}] "
    print "Name: #{person.name}, "
    print "ID: #{person.id}, "
    puts "Age: #{person.age}"
  end
end

def create_a_person
  print 'Do you want to create a student (1) or a techer (2) [Input the number]:'
  is_teacher = gets.to_i == 1
  print 'Age: '
  age = gets.to_i
  print 'Name: '
  name = gets.chomp
  if is_teacher
    print 'Specialization: '
    aditional = gets.chomp
  else
    print 'Has parent permission? [Y/N]: '
    aditional = gets.chomp.lowcase == 'y'
  end
  APP.create_a_person(is_teacher, name, age, aditional)
  puts 'Person created successfully!'
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

def main_menu
  puts
  puts 'Please, choose an option by entering a number:'
  puts '1 - List all books'
  puts '2 - List all people'
  puts '3 - Create a person'
  puts '4 - Create a book'
  puts '5 - Create a rental'
  puts '6 - List all rentals for a given person id'
  puts '7 - Exit'
  gets.to_i
end

# rubocop:disable Metrics/CyclomaticComplexity
def main
  puts 'Welcome to School Library App!'
  loop do
    option = main_menu
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
puts 'Thank you for using this app!'
