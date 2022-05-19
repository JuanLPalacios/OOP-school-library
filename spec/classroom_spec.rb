require './models/classroom'
require './models/student'

describe Classroom do
  context 'test classroom class' do
    it 'should create classroom' do
      label = 'Computer Science'

      classroom = Classroom.new(label)

      expect(classroom).to be_truthy
      expect(classroom.label).to eq label
    end

    it 'should add student to the list' do
      student = Student.new(12, nil)
      classroom = Classroom.new('Computer Science')

      classroom.add_student(student)

      expect(classroom.students.length).to eq 1
    end
  end
end
