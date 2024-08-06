
import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../services/location_service.dart';

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
  bool isValid=true;
  Position? position;
  @override
  void initState() {
    super.initState();
    _initializePosition();
    Timer(const Duration(seconds: 10), () {
      if (mounted) {
        setState(() {
          isValid = false;
        });

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code'),
      ),
      body: Center(
        child: isValid?QrImageView(
          data: "{ 'Course Id': '${widget.courseId}', 'Hour': '${widget.hour}' }",
          version: QrVersions.auto,
        ):const Text('QR Timeout'),
      ),
    );
  }

  Future<bool> _initializePosition() async {
    final LocationService _location = LocationService();
    position = await _location.getCurrentPosition();
    if (position == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
              'Location permissions are not granted or location services are disabled. Please enable them.'),
        ),
      );
      return false;
    } else {
      _sendToFirebase(position!);
      return true;
    }
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
}
