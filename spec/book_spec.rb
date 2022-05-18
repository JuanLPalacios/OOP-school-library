require './models/book'
require './models/person'

describe Book do
  context 'given a title and an author' do
    it 'should create a book' do
      title = 'Logicomix: an epic serch for truth'
      author = 'Apotolos doxiadis'

      book = Book.new(title, author)

      expect(book).to be_truthy
    end

    it 'should create a book with the given title' do
      title = 'Logicomix: an epic serch for truth'
      author = 'Apotolos doxiadis'

      book = Book.new(title, author)

      expect(book).to be_truthy
      expect(book.title).to eq title
    end

    it 'should create a book with the given author' do
      title = 'Logicomix: an epic serch for truth'
      author = 'Apotolos doxiadis'

      book = Book.new(title, author)

      expect(book).to be_truthy
      expect(book.author).to eq author
    end
  end

  context 'given a book, a person and a date' do
    it 'Should be posible to ad a rental to the rentals property' do
      book = Book.new('Logicomix: an epic serch for truth', 'Apotolos doxiadis')
      person = person.new(32)
      date = '2022/01/01'

      book.add_rental(person, date)

      expect(book.rentals.length).to eq 1
    end
  end
end
