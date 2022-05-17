require_relative './nameable'
require_relative './rental'

class Person < Nameable
  attr_reader :id, :rentals, :parent_permission
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Time.now.to_i
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(self, book, date)
  end

  private

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    @age >= 18
  end
  # rubocop:enable Naming/PredicateName

  public

  def can_use_services?
    is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
