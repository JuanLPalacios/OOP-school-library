require './person'
require './student'
require './classroom'
require './book'
require './rental'

person1 = Person.new(23, 'Jose')
person2 = Person.new(19, 'Mary')
person3 = Person.new(33, 'Jesus')
classroom1 = Classroom.new('A-1')
classroom2 = Classroom.new('B-2')
classroom3 = Classroom.new('C-3')
student1 = Student.new(21, classroom1, 'Joey')
student2 = Student.new(22, classroom2, 'Beltran')
student3 = Student.new(31, classroom2, 'Bickenstain')
puts(classroom1.label)
classroom1.students.each { |student| puts("  - #{student.name}") }
puts(classroom2.label)
classroom2.students.each { |student| puts("  - #{student.name}") }
puts(classroom3.label)
classroom3.students.each { |student| puts("  - #{student.name}") }
book1 = Book.new('Book1', '')
book2 = Book.new('Book2', '')
book3 = Book.new('Book3', '')
person2.add_rental(book1, '2021/11/02')
book1.add_rental(person1, '2022/05/30')
student2.add_rental(book2, '2021/09/09')
book2.add_rental(student3, '2022/01/12')
Rental.new(student2, book2, '2022/01/12')
Rental.new(person2, book3, '2022/01/21')
puts("#{person1.name} rentals:")
person1.rentals.each { |rental| puts("  - #{rental.book.title} #{rental.date}") }
puts("#{person2.name} rentals:")
person2.rentals.each { |rental| puts("  - #{rental.book.title} #{rental.date}") }
puts("#{person3.name} rentals:")
person3.rentals.each { |rental| puts("  - #{rental.book.title} #{rental.date}") }
puts("#{student1.name} rentals:")
student1.rentals.each { |rental| puts("  - #{rental.book.title} #{rental.date}") }
puts("#{student2.name} rentals:")
student2.rentals.each { |rental| puts("  - #{rental.book.title} #{rental.date}") }
puts("#{student3.name} rentals:")
student3.rentals.each { |rental| puts("  - #{rental.book.title} #{rental.date}") }
