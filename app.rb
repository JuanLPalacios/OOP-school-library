require './models/teacher'
require './models/student'
require './models/book'
require './models/rental'

class App
  def list_all_books
    @books_controller.list_all_books.each { |book| puts "Title: \"#{book.title}\", Author: #{book.author}" }
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books_controller.create_a_book(title, author)
    puts 'Book created successfully'
  end

  def list_all_people
    @people_controller.list_all_people.each do |person|
      print "[#{person.class.name}] "
      print "Name: #{person.name}, "
      print "ID: #{person.id}, "
      puts "Age: #{person.age}"
    end
  end

  def create_a_person
    print 'Do you want to create a student (1) or a techer (2) [Input the number]:'
    is_teacher = gets.to_i == 2
    print 'Age: '
    age = gets.to_i
    print 'Name: '
    name = gets.chomp
    if is_teacher
      print 'Specialization: '
      aditional = gets.chomp
    else
      print 'Has parent permission? [Y/N]: '
      aditional = gets.chomp.downcase == 'y'
    end
    @people_controller.create_a_person(is_teacher, name, age, aditional)
    puts 'Person created successfully!'
  end

  def create_a_rental
    return puts 'No books for rental!' if @books_controller.list_all_books.length.zero?
    return puts 'No people to rent them!' if @people_controller.list_all_people.length.zero?

    book = pick_a_book
    person = pick_a_person

    print 'Date: '
    date = gets.chomp
    @rental_controller.create_a_rental(person, book, date)
    puts 'Rental created successfully'
  end

  def pick_a_person
    person = nil
    while person.nil?
      puts 'Select a person from the following list by number (not id)'
      @people_controller.list_all_people.each_with_index do |item, i|
        puts "#{i}) [#{item.class.name}] Name: #{item.name}, ID: #{item.id}, Age: #{item.age}"
      end
      person = @people_controller.list_all_people[gets.to_i]
    end
    person
  end

  def pick_a_book
    book = nil
    while book.nil?
      puts 'Select a book from the following list by number'
      @books_controller.list_all_books.each_with_index do |item, i|
        puts "#{i}) Title: \"#{item.title}\", Author: #{item.author}"
      end
      book = @books_controller.list_all_books[gets.to_i]
    end
    book
  end

  def list_all_rentals_for_person_id
    print 'ID of a person '
    id = gets.to_i
    @rental_controller.list_all_rentals_for_person_id(id).each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
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

  def save
    @books_controller.save
    @people_controller.save
    @rental_controller.save(@people_controller.list_all_people)
  end

  def initialize(books_controller:, people_controller:, rental_controller:)
    @books_controller = books_controller
    @people_controller = people_controller
    @rental_controller = rental_controller
  end
end
