import 'dart:convert';

class Students {
    //List of student
  List<Map<String, String>> students;

  Students(this.students);
//sorting the list of students and comparing values of the member fields
  void sort(String field) {
    students.sort((a, b) => a[field]!.compareTo(b[field]!));
  }
  void output() {
//using a for loop to print each student in the list
    for (var student in students) {
      print(student);
    }
  }

  void plus(Map<String, String> student) {
    //adding a student to the list!
    students.add(student);
  }

  void remove(String field) {
    //removing a student from the list
    students.removeWhere((student) => student.containsKey(field));
  }
}

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  // converting json string to dart object using jsonDecode and mapping it
  List<Map<String, String>> studentList = List<Map<String, String>>.from(
    jsonDecode(json).map((item) => Map<String, String>.from(item))
  );

  //creating a new student instance with the student list
  Students students = Students(studentList);

//printing the list of students
  print("List of students!");
  students.output();

//sorting the list of students by last name
  print("\nSorted by last name!");
  students.sort("last");
  students.output();

///adding a new student to the list
  print("\nAdding a new student!");
  students.plus({"first": "Jay", "last": "Calderon", "email": "cald0145@algonquinlive.com"});
  students.output();

//removing a student from the list
  print("\nRemoving all students!");
  students.remove("first");
  students.output();
}