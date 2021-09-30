// import 'dart:async';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:youth_emp/models/course_model.dart';
//
//
// class DBCourseManager {
//  /* static final DBStudentManager _instance = DBStudentManager._internal();
//   Future<Database> database;
//   factory DBStudentManager() {
//     return _instance;
//   }
//
//   DBStudentManager._internal() {
//     openDB();
//   }*/
//   Database _datebase;
//
//   Future openDB() async {
//     if (_datebase == null) {
//       _datebase = await openDatabase(
//           join(await getDatabasesPath(), "youth_emp"),
//           version: 1, onCreate: (Database db, int version) async {
//             print("open");
//
//         await db.execute(
//             "CREATE TABLE  courses(id INTEGER PRIMERY KEY,name TEXT,code TEXT,department TEXT,start_date TEXT,end_date TEXT,location Text,,user_id INTEGER ",);
//         await db.execute(
//             "CREATE TABLE  trainers(id INTEGER PRIMERY KEY,father_name TEXT,mother_name TEXT,email TEXT,sex TEXT,password TEXT,birth_date TEXT,birth_city TEXT,social_status TEXT,address TEXT,course TEXT,");
//       });
//     }
//   }
//
//  /* Future<int> insertStudent(Student student) async {
//     await openDB();
//     return await _datebase.insert('student', student.toMap());
//   }*/
//
//   Future<List<Course>> getStudentList() async {
//     await openDB();
//     final List<Map<String, dynamic>> maps = await _datebase.query('course');
//
//     return List.generate(maps.length, (index) {
//       return Course(
//           id: maps[index]['id'],
//           name: maps[index]['name'],
//           userId: maps[index]['userId']);
//     });
//   }
//
//   /*Future<int> updateStudent(Student student) async {
//     await openDB();
//     return await _datebase.update('student', student.toMap(),
//         where: 'id=?', whereArgs: [student.id]);
//   }
//
//   Future<void> deleteStudent(int id) async {
//     await openDB();
//     await _datebase.delete("student", where: "id = ? ", whereArgs: [id]);
//   }
// }*/
