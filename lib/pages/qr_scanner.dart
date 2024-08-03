import 'dart:convert';
import 'package:attendence/services/imei_service.dart';
import 'package:attendence/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:intl/intl.dart';

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

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
                  _isScanning = false; // Disable scanning after processing the data
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

      jsonData['Latitude'] = locationData.latitude;
      jsonData['Longitude'] = locationData.longitude;
      jsonData['IMEI'] = imeiData;

      final now = DateTime.now();
      final formattedDate = DateFormat('HH:mm:ss').format(now);
      jsonData['timestamp'] = formattedDate;

      //print(jsonData);  
      //

      //JSON DATA CONTAINS THE QRDATA ALONG WITH LAT, LONG, TIME, IMEI


      //

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('QR successfully scanned')),
      );

      Future.delayed(const Duration(seconds: 2), () {
        Navigator.pop(context);
      });

    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid QR code data')),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
