require './models/rental'
require './models/person'
require './models/book'

describe Rental do
  context 'Given a person, book and date' do
    it 'Should create a rental' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = Person.new(32)
      date = '2022/01/01'

      rental = Rental.new(person, book, date)

      expect(rental).to be_truthy
    end
    it 'Should create a rental with date equal to given date' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = Person.new(32)
      date = '2022/01/01'

      rental = Rental.new(person, book, date)

      expect(rental.date).to eq date
    end
    it 'Should create a rental add it self to the person rentals' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = Person.new(32)
      date = '2022/01/01'

      rental = Rental.new(person, book, date)

      expect(person.rentals[0]).to be rental
    end
    it 'Should create a rental add it self to the book rentals ' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = Person.new(32)
      date = '2022/01/01'

      rental = Rental.new(person, book, date)

      expect(book.rentals[0]).to be rental
    end
  end

  context 'Given a rental and a new person' do
    it 'Should add it self to new person\'s rentals when rental property person asigned to new person' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = Person.new(32)
      new_person = Person.new(45)
      date = '2022/01/01'
      rental = Rental.new(person, book, date)

      rental.person = new_person

      expect(new_person.rentals[0]).to be rental
    end
  end

  context 'Given a rental and a new book' do
    it 'Should add it self to new book\'s rentals when rental property book asigned to new book' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = Person.new(32)
      new_book = Book.new('How does the mind work', 'Steven Pinker')
      date = '2022/02/01'
      rental = Rental.new(person, book, date)

      rental.book = new_book

      expect(new_book.rentals[0]).to be rental
    end
  end
end
