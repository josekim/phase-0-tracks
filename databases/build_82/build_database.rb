# require gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
class College_Students
  def initialize(file_name)
    puts "initializing Database - One Moment"
    db = SQLite3::Database.new("#{file_name}.db")
    db.results_as_hash = true

    #################### initialize the DataBase######################
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

    # Create Tables
    db.execute(create_table_universities)
    db.execute(create_table_majors)
    db.execute(create_table_students)

    def create_universities(db, name)
      db.execute("INSERT INTO universities (name) VALUES (?)", [name])
    end

    def create_majors(db)
      db.execute("INSERT INTO majors (subject) VALUES ('Computer Science')")
      db.execute("INSERT INTO majors (subject) VALUES ('Math')")
      db.execute("INSERT INTO majors (subject) VALUES ('Psychology')")
      db.execute("INSERT INTO majors (subject) VALUES ('Business')")
      db.execute("INSERT INTO majors (subject) VALUES ('Radio Television Film')")
      db.execute("INSERT INTO majors (subject) VALUES ('English')")
      db.execute("INSERT INTO majors (subject) VALUES ('Engineering')")
    end

    def create_students(db, first_name, last_name, age, university, major)
      db.execute("INSERT INTO students (first_name,last_name,age,university, major) VALUES (?,?,?,?,?)", [first_name, last_name, age, university,major])
    end

    500.times do
      create_universities(db, Faker::University.name)
    end

    create_majors(db)

    500.times do
      create_students(db, Faker::Name.first_name, Faker::Name.last_name, Faker::Number.between(15, 40), Faker::Number.between(1, 500), Faker::Number.between(1,7) )
    end
  end
end