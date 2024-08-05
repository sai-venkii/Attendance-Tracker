import 'package:cloud_firestore/cloud_firestore.dart';

class AttendenceModel{
  String CourseId;
  String LecturerId;
  double Latitude;
  double Longitude;
  DateTime dateTime;
  AttendenceModel({
        required this.CourseId,
        required this.LecturerId,
        required this.Latitude,
        required this.Longitude,
        this.dateTime=DateTime().now()
      }
      );

}