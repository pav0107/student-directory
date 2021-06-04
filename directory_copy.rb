# def input_students
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#   # create an empty array
#   students = []
#   # gets the first name
#   name = gets.chomp
#   # while the name is not empty, repeat this code
#   while !name.empty? do
#     #add the student hash to the array
#     students << {name: name, cohort: :november}
#     puts "Now we have #{students.count} students"
#     # get another name from the user
#     name = gets.chomp
#   end
#   # return the array of students
#   students
# end

# def input_students_longer
#   puts "Please enter the names of the students"
#   puts "To finish, just hit return twice"
#   # create an empty array
#   students = []
#   # gets the first name
#   name = gets.chomp
#   # while the name is not empty, repeat this code
#   while !name.empty? do
#     puts "Please enter your country of birth"
#     birth = gets.chomp
#     puts "Please enter your height"
#     height = gets.chomp
#     #add the student hash to the array
#     students << {name: name, cohort: :november, country_of_birth: birth, height: height}
#     puts "Now we have #{students.count} students"
#     # get another name from the user
#     puts "Add another name or press enter to finish"
#     name = gets.chomp
#   end
#   # return the array of students
#   students
# end
@cohorts = []

def input_students_cohort
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # gets the first name
  name = gets.delete "\n"
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter your cohort"
    cohort = gets.chomp
    if cohort.empty?
      cohort = n/a
    end
    months = %w[ January February March April May June July August September October November December]
    while !months.include?(cohort)
      puts "please re-enter cohort"
      cohort = gets.chomp
    end
    cohort = cohort.to_sym
    if !@cohorts.include?(cohort)
      @cohorts.push(cohort)
    end
    #add the student hash to the array
    students << {name: name, cohort: cohort}
    p students
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "Add another name or press enter to finish"
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# def print(students)
#   students.each_with_index do |student, index|
#     puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end

# def print_while(students)
#   index = 0
#   while index < students.length
#     puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort) from #{students[index][:country_of_birth]}, who is #{students[index][:height]}m tall".center(70)
#     index += 1
#   end
# end

def print_while(students)
  index = 0
  while index < students.length
    puts "#{index + 1}. #{students[index][:name]} (#{students[index][:cohort]} cohort)}"
    index += 1
  end
end

def print_letter(students, letter)
  index = 1
  students.each do |student|
    if student[:name][0].upcase == letter.upcase
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
      index += 1
    end
  end
end

def print_shorter_than_12(students)
  students.each do |student|
    if student[:name].length < 12
      puts "#{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have #{students.count} great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end

def print_cohort(students)
  @cohorts.each do |cohort|
    puts cohort
    students.each do |student|
      if student[:cohort] == cohort
        puts student[:name]
      end
    end
  end
end

students = input_students_cohort
# nothing happens until we call the methods
print_header
# print(students)
# print_letter(students, "A")
# print_shorter_than_12(students)
# print_while(students)
if students.count > 0
  print_cohort(students)
end
print_footer(students)