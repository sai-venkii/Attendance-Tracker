import 'dart:convert';
import 'package:attendence/services/imei_service.dart';
import 'package:attendence/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class QrScanner extends StatefulWidget
{
  const QrScanner({super.key});
  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner>
{
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  LocationService Location = LocationService();
  DeviceInfoService IMEI = DeviceInfoService();

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
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


  void _onQRViewCreated(QRViewController controller)
  {
    this.controller = controller;
  }

  void _scanQRCode() async
  {
    final QRData = await controller?.scannedDataStream.first;
    if (QRData != null)
    {
      try{ //Checking if QRdata is json
        final jsonData = jsonDecode(QRData.code!);

        //Code to validate if json contains valid Data Eg: RollNumber, email

        final location = await LocationService.getCurrentPosition();
         if (location == null) {  //Prompting user to enable Location services
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Location permissions are not granted or location services are disabled. Please enable them.'),
            ),
          );
          return;
        }
        final imei = await IMEI.getDeviceIdentifier();

        jsonData['Latitude'] = location.latitude;
        jsonData['Longitude'] = location.longitude;
        jsonData['IMEI'] = imei;
        jsonData['timestamp'] = DateTime.now().toIso8601String();

        print(jsonData);
      }
      catch(excep){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid QR code data')),
        );
      }

    }
  } //End of Scan Data function
}
