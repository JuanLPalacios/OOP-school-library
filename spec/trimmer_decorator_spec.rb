require './decorators/trimmer_decorator'
require './models/person'

describe TrimmerDecorator do
  context 'Give name' do
    it 'correct_name Returns first 10 characaters of the name' do
      name = Person.new(34, 'Kausar Naheed Anwar')

      capital_name = TrimmerDecorator.new(name)

      expect(capital_name.correct_name).to eq 'Kausar Nah'
    end
  end
end
