import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:attendence/services/imei_service.dart';
import 'package:attendence/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:intl/intl.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key, required this.email});
  final String email;
  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  final MobileScannerController _controller = MobileScannerController();
  final LocationService _location = LocationService();
  final DeviceInfoService _imei = DeviceInfoService();
  bool _isScanning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: MobileScanner(
              controller: _controller,
              onDetect: (barcodeCapture) {
                if (_isScanning && barcodeCapture.barcodes.isNotEmpty) {
                  _processScanData(barcodeCapture.barcodes.first.rawValue!);
                  _isScanning = false; 
                }
              },
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: ElevatedButton(
                onPressed: _scanQRCode,
                child: const Text('Scan QR Code'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _scanQRCode() {
    _isScanning = true;
  }

  Future<void> _processScanData(String scanData) async {
    try {
      final jsonData = jsonDecode(scanData);

      final locationData = await _location.getCurrentPosition();
      if (locationData == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Location permissions are not granted or location services are disabled. Please enable them.'),
          ),
        );
        return;
      }

      final imeiData = await _imei.getDeviceIdentifier();

      jsonData['StudentData'] = {
        'Latitude': locationData.latitude,
        'Longitude': locationData.longitude,
        'IMEI': imeiData,
        'timestamp': DateFormat('HH:mm:ss').format(DateTime.now())
      };
      print(jsonData);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('QR successfully scanned')),
      );

      DocumentSnapshot document = await FirebaseFirestore.instance
          .collection('Students')
          .doc('22PC')
          .collection('Student_Info')
          .doc(widget.email)
          .get();

      final imei = document.get('IMEI'); // Checking if IMEI is same as in Database
      if (imei == null || imei.isEmpty) { // If IMEI is empty in Firebase DB
        await FirebaseFirestore.instance
            .collection('Student')
            .doc(widget.email)
            .set({'IMEI': imeiData}, SetOptions(merge: true));
      } else { // Check if retrieved IMEI and database's IMEI are the same
        if (imei == imeiData) { // IMEI matches, check if latitude and longitude matches
          final bool isLocationValid = checkLocation(jsonData);
          final bool isTimeValid = checkTime(jsonData);
          print("Is location valid: $isLocationValid");
          //Use Timestamp to check if valid

        }
      }
      Navigator.pop(context); // Back to Student home page
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid QR code data')),
      );
    }
  }

  bool checkTime(dynamic jsonData){

    //Complete timestamp Function

    return false;
  }

  bool checkLocation(dynamic jsonData) {
    final pos = [
      jsonData['LecturerLocation']['Latitude'],
      jsonData['LecturerLocation']['Longitude'],
      jsonData['StudentData']['Latitude'],
      jsonData['StudentData']['Longitude']
    ];

    int lecturerLat = (pos[0] * 1000).toInt();
    int lecturerLon = (pos[1] * 1000).toInt();
    int studentLat = (pos[2] * 1000).toInt();
    int studentLon = (pos[3] * 1000).toInt();

    if (lecturerLat == studentLat && lecturerLon == studentLon) {
      return true;
    }
    return false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
