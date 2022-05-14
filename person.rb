require './nameable'

class Person < Nameable
  attr_reader :id
  attr_accessor :name, :age

  def initialize(age, name = 'Unknown', parent_permission: true)
    super
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    @age >= 18
  end
  # rubocop:enable Naming/PredicateName

  public

  def can_use_services?
    this.is_of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
