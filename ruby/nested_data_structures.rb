school = {
  first_grade: {
    teacher1:{
        name: "Amy",
        subject:["Math", "Science", "PE"],
        students:[
          {
          name:"Bob",
          grade: "A"
          },
         {
          name:"Chris",
          grade: "C"
          },
          {
          name:"Diana",
          grade: "A"
          },
          {
          name:"Erik",
          grade:"F"
          },
        ]
    },
    teacher2:{
        name: "Francis",
        subject: ["Social Studies", "Language Arts", "Music"],
        students:[
          {
          name:"Greg",
          grade: "B"
          },
         {
          name:"Hubert",
          grade: "C"
          },
          {
          name:"Iris",
          grade: "A"
          },
          {
          name:"Jill",
          grade: "A"
          },
        ]
    }
  },
  second_grade: {
   teacher1:{
        name: "Kathy",
        subject:["Math", "Science", "PE"],
        students:[
          {
          name:"Leon",
          grade: "A"
          },
         {
          name:"Mark",
          grade: "C"
          },
          {
          name:"Nancy",
          grade: "A"
          },
          {
          name:"Oscar",
          grade:"F"
          },
        ]
    },
    teacher2:{
        name: "Philip",
        subject: ["Social Studies", "Language Arts", "Music"],
        students:[
          {
          name:"Quincy",
          grade: "B"
          },
         {
          name:"Rachel",
          grade: "C"
          },
          {
          name:"Stacy",
          grade: "A"
          },
          {
          name:"Jill",
          grade: "A"
          },
        ]
    }
  },
  third_grade:{
    teacher1:{},
    teacher2:{},
  },
  fourth_grade:{
    teacher1:{},
    teacher2:{},
  },
  fifth_grade:{
    teacher1:{},
    teacher2:{},
  }
}

##### driver code#######
studentclasses= ""
subject_taught = school[:second_grade][:teacher2][:subject]
subject_taught.each {|subject|
  if (subject == subject_taught.last)
    studentclasses += "and #{subject}"
  else
    studentclasses += subject + ", "
  end
}
studentName = school[:second_grade][:teacher2][:students][3][:name]
studentTeacher = school[:second_grade][:teacher2][:name]
studentGrade = school[:second_grade][:teacher2][:students][3][:grade]
# Driving
# Jill's Grade
puts "#{studentName}'s grade in Mr #{ studentTeacher } class ,who teaches #{studentclasses}, is an #{studentGrade}"
