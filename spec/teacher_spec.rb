require './models/teacher'

describe Teacher do
  context 'Given age and specialization' do
    it 'Should Create Teacher' do
      teacher = Teacher.new(34, 'Computer Science')

      expect(teacher).to be_truthy
    end

    it 'Should Create Teacher with given age' do
      teacher = Teacher.new(34, 'Computer Science')

      expect(teacher.age).to eq 34
    end

    it 'Should Create Teacher with given specialization' do
      teacher = Teacher.new(34, 'Computer Science')

      expect(teacher.specialization).to eq 'Computer Science'
    end

    it 'can_use_service? Should always return true' do
      teacher = Teacher.new(34, 'Computer Science')

      expect(teacher.can_use_services?).to be_truthy
    end
  end
end
