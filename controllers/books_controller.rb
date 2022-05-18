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

  def save(filename = './data/book.json')
    File.write(filename, (@books.map { |book| { title: book.title, author: book.author } }).to_json)
  end

  def load(filename = './data/book.json')
    return false unless File.exist?(filename)

    JSON.parse(File.read(filename)).each do |book|
      create_a_book(book['title'], book['author'])
    end
  end
end
