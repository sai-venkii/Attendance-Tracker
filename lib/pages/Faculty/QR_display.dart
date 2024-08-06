
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrDisplay extends StatefulWidget {
  final String email;
  final String courseId;
  final String hour;

  QrDisplay({
    super.key,
    required this.email,
    required this.courseId,
    required this.hour,
  });
  @override
  State<QrDisplay> createState() => _QrDisplayState();
}

class _QrDisplayState extends State<QrDisplay> {
  bool isSent=false;
  Position? position;
  @override
  void initState() {
    super.initState();
    _initializePosition();
  }

  Future<void> _initializePosition() async {
    LocationPermission permission;
    permission = await Geolocator.requestPermission();
    Position currentPosition = await Geolocator.getCurrentPosition();
    position = currentPosition;
    _sendToFirebase(position!);
  }
  Future<void> _sendToFirebase(Position position) async{
    await FirebaseFirestore.instance.collection('Attendence').add({
      'Course Id': widget.courseId,
      'Date': FieldValue.serverTimestamp(),
      'Hour': widget.hour,
      'Lecturer Id': widget.email,
      'Lecturer Location':{
        'Latitude': position.latitude,
        'Longitude': position.longitude
      },
      'isValid':true
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: QrImageView(
          data: "{ 'Course Id': '${widget.courseId}', 'Hour': '${widget.hour}' }",
          version: QrVersions.auto,
        ),
      ),
    );
  }
}
