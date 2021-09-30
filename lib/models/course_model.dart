import 'package:flutter/material.dart';

class Course{
  int  id;
  String name;
  String courseType;
  String department;
  String startDate;
  String endDate;
  String location;
  int userId;

  Course({@required this.userId, @required this.name, this.id,this.courseType,this.department,this.endDate,this.location,this.startDate});

  Map<String, dynamic> toMap() {
    return {'name': name, 'userId': userId};
  }

}