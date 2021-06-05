@students = [] # an empty array accessible to all methods

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def interactive_menu
  loop do
    print_menu
    choice(STDIN.gets.chomp)
  end
end

def choice(selection)
  case selection
  when "1"
    puts "You selected 'input the students'"
    input_students
  when "2"
    puts "You selected 'show the students'"
    show_students
  when "9"
    puts "You selected exit"
    exit # this will cause the program to terminate
  when "3"
    puts "You selected 'save the list of students'"
    # Ask what file the user would like to save to
    puts "What file would you like to save to?"
    filename = gets.chomp
    save_students(filename)
  when "4"
    puts "You selected 'load the list of students'"
    puts "What file would you like to load?"
    filename = gets.chomp
    load_students(filename)
  else
    puts "I don't know what you meant, try again"
  end
end

def add_students(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  @name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !@name.empty? do
    # add the student hash to the array
    add_students(@name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    @name = STDIN.gets.chomp
  end
end

def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students(filename)
  # open the file for writing
  file = File.open(filename = "students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename)
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort)
  end
  file.close
end

def does_file_exist(filename)
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def try_load_students
  ARGV.first ? filename = ARGV.first : filename = "students.csv"
  # filename = ARGV.first# first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  does_file_exist(filename)
end

try_load_students
interactive_menu