require './models/student'
require './models/classroom'

describe Student do
  context 'Given a age and classroom' do
    it 'Should create a Student' do
      age = 23
      classroom = Classroom.new('A-2')

      student = Student.new(age, classroom)

      expect(student).to be_truthy
    end

    it 'Should create a Student and age to be equal to the given age' do
      age = 23
      classroom = Classroom.new('A-2')

      student = Student.new(age, classroom)

      expect(student.age).to eq age
    end

    it 'Should create a Student and calssroom to be equal to the given calssroom' do
      age = 23
      classroom = Classroom.new('A-2')

      student = Student.new(age, classroom)

      expect(student.calssroom).to be classroom
    end

    it 'Should create a Student and add it self to calssroom\'s students' do
      age = 23
      classroom = Classroom.new('A-2')

      Student.new(age, classroom)

      expect(classroom.students.length).to be 1
    end
  end

  context 'Given a student and a new classroom' do
    it 'Should add it self to new classroom\'s students when student property classroom asigned to new classroom' do
      student = Student.new(23, Classroom.new('A-2'))
      new_classroom = Classroom.new('B-3')

      student.classroom = new_classroom

      expect(new_classroom.students[0]).to be student
    end
  end

  context 'Given a student' do
    it 'Should return "¯\(ツ)/¯" when play_hooky' do
      student = Student.new(23, Classroom.new('A-2'))

      value = student.play_hooky

      expect(value).to eq "¯\(ツ)/¯"
    end
  end
end
