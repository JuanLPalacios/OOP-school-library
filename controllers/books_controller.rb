require 'json'

class BooksController
  def list_all_books
    @books
  end

  def create_a_book(title, author)
    @books.push(Book.new(title, author))
  end

  def initialize
    @books = []
  end

  def save(filename = './book.json')
    File.write(filename, @books.to_json)
  end
end
