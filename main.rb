require './person'
require './capitalize_decorator'
require './trimmer_decorator'

# rubocop:disable Naming/VariableName
puts(nameable = Person.new(22, 'maximilianus'))
puts(nameable.correct_name)
puts(capitalizedPerson = CapitalizeDecorator.new(nameable))
puts(capitalizedPerson.correct_name)
puts(capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson))
puts(capitalizedTrimmedPerson.correct_name)
# rubocop:enable Naming/VariableName
