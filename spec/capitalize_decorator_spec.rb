require './decorators/capitalize_decorator'
require './models/person'

describe CapitalizeDecorator do
  context 'Give name' do
    it 'correct_name Returns Capitalized Name' do
      name = Person.new(34, 'awais')

      capital_name = CapitalizeDecorator.new(name)

      expect(capital_name.correct_name).to eq 'Awais'
    end
  end
end
