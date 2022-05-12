class Person
  attr_reader :id
  attr_accessor :name, :age

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age, name = 'Unknown', parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end
  # rubocop:enable Style/OptionalBooleanParameter

  private

  # rubocop:disable Naming/PredicateName
  def is_of_age?
    @age >= 18
  end
  # rubocop:enable Naming/PredicateName

  public

  def can_use_services
    this.is_of_age? or @parent_permission
  end
end
