require './models/person'
require './models/book'

describe Person do
  context 'Given age' do
    it 'should create person' do
      person = Person.new(34)

      expect(person).to be_truthy
    end

    it 'should create person with age 34' do
      person = Person.new(34)

      expect(person.age).to eq 34
    end

    it 'should populate the rentals' do
      person = Person.new(34)
      book = Book.new('A new book', 'A new Author')

      person.add_rental(book, '2022/01/01')

      expect(person.rentals.length).to eq 1
    end

    it 'should return parent permission' do
      person = Person.new(34)

      expect(person.can_use_services?).to be_truthy
    end

    it 'should return correnct name' do
      person = Person.new(34, 'Awais')

      expect(person.correct_name).to eq 'Awais'
    end
  end
end
