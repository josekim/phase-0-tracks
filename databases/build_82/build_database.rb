# require gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
class College_Students
  attr_reader :database_done
  def initialize(file_name)
    puts "initializing Database - One Moment"
    @db = SQLite3::Database.new("#{file_name}.db")
    initialize_database()
    update_universities_populations
    @db.results_as_hash = true
    puts "Database Created!"
    @database_done = true
  end
    #################### initialize the DataBase######################
  def initialize_database()
    create_table_universities= <<-SQL
      CREATE TABLE IF NOT EXISTS universities(
        id INTEGER PRIMARY KEY,
        name VARCHAR(255),
        population INTEGER
      )
    SQL
    create_table_majors= <<-SQL
      CREATE TABLE IF NOT EXISTS majors(
        id INTEGER PRIMARY KEY,
        subject VARCHAR(255)
      )
    SQL
    create_table_students= <<-SQL
      CREATE TABLE IF NOT EXISTS students(
        id INTEGER PRIMARY KEY,
        first_name VARCHAR(255),
        last_name VARCHAR(255),
        age INTEGER,
        university INTEGER,
        major INTEGER,
        FOREIGN KEY (university) REFERENCES universities(id),
        FOREIGN KEY (major) REFERENCES majors(id)
      )
    SQL
    @db.execute(create_table_universities)
    @db.execute(create_table_majors)
    @db.execute(create_table_students)
    create_majors()
    50.times do
      create_universities(Faker::University.name)
    end
    500.times do
      create_students(Faker::Name.first_name, Faker::Name.last_name, Faker::Number.between(15, 40), Faker::Number.between(1, 50), Faker::Number.between(1,7) )
    end
  end

  def create_universities(name)
    @db.execute("INSERT INTO universities (name) VALUES (?)", [name])
  end

  def create_majors()
    @db.execute("INSERT INTO majors (subject) VALUES ('Computer Science')")
    @db.execute("INSERT INTO majors (subject) VALUES ('Math')")
    @db.execute("INSERT INTO majors (subject) VALUES ('Psychology')")
    @db.execute("INSERT INTO majors (subject) VALUES ('Business')")
    @db.execute("INSERT INTO majors (subject) VALUES ('Radio Television Film')")
    @db.execute("INSERT INTO majors (subject) VALUES ('English')")
    @db.execute("INSERT INTO majors (subject) VALUES ('Engineering')")
  end

  def create_students(first_name, last_name, age, university, major)
    @db.execute("INSERT INTO students (first_name,last_name,age,university, major) VALUES (?,?,?,?,?)", [first_name, last_name, age, university,major])
  end

  def create_new_student(first_name, last_name, age, university, major)
    university_id = get_university_number(university.capitalize)
    major_id = get_major_number(major)
    create_students(first_name.capitalize, last_name.capitalize, age, university_id, major_id)
  end

  def get_university_number(university)
    school = @db.execute("select * from universities where name = ?",[university])
    if school.length == 0
      create_universities(university)
      school = @db.execute("select * from universities where name = ?",[university])
      update_universities_populations
      return school[0][0]
    else
      update_universities_populations
      return school[0][0]
    end
  end

  def get_major_number(majors)
    major = @db.execute("select * from majors where subject = ?",[majors])
    if major.length == 0
      @db.execute("INSERT INTO majors (subject) VALUES (?)",[majors])
      major = @db.execute("select * from majors where subject = ?",[majors])
      major[0][0]
    else
      major[0][0]
    end
  end

  def print_student(student)
      puts "#{student["first_name"]} #{student["last_name"]} age: #{student["age"]} university: #{student["name"]} major: #{student["subject"]}"
  end

  def search(options,term)
    option = ""
    if options == 1
      option = "first_name"
    elsif options == 2
      option = "last_name"
    elsif options == 3
      option = "age"
    elsif options == 4
      option = "major"
    elsif options == 5
      option = "university"
    end
    search_student = "SELECT students.first_name, students.last_name, students.age, universities.name, majors.subject FROM students JOIN universities ON students.university = universities.id JOIN majors ON students.major = majors.id WHERE students.#{option} = ?"
    students = @db.execute(search_student,[term.capitalize])
    students.each do|student|
      print_student(student)
    end
  end

  def update_university_population(name,population)
    @db.execute('UPDATE universities SET population=? WHERE name=?',[population,name])
  end

  def update_universities_populations
    universities = @db.execute("SELECT * FROM universities")
    universities.each do |university|
      students = @db.execute( 'SELECT * FROM students, universities where students.university= universities.id AND universities.id = ?',[university[0]])
      update_university_population(university[1], students.length)
    end
  end
end