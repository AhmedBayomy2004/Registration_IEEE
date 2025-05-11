import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
//import 'package:qr_scanner_overlay/qr_scanner_overlay.dart';
import 'package:registration_ieee/api_logic/api_logic.dart';
import 'package:registration_ieee/const/const_color.dart';

class QRScanPage extends StatefulWidget {
  const QRScanPage({super.key});

  @override
  State<QRScanPage> createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final ApiService api = ApiService();
  bool scanned = false;
  MobileScannerController scannerController = MobileScannerController();
  bool torch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.secondary,
        appBar: AppBar(
          title: Text("QR Scan",
              style: TextStyle(
                color: AppColors.secondary,
              )),
          backgroundColor: AppColors.primary,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("QR Scan",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.primary2,
                  )),
              SizedBox(height: 30),
              SizedBox(
                height: 200,
                width: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  child: Builder(
                    builder: (context) {
                      return MobileScanner(
                        controller: scannerController,
                        onDetect: (result) async {
                          if (scanned) return;
                          scanned = true;
                          String? userId = result.barcodes.first.rawValue;

                          String message = await api.register(userId);
                          if (!context.mounted) {
                            return;
                          }
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(message),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text("OK"),
                                  ),
                                ],
                              );
                            },
                          ).then((onValue) {
                            scanned = false;
                          });
                        },
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        scannerController.toggleTorch();
                        setState(() {
                          torch = !torch;
                        });
                      },
                      icon: Icon(
                        torch ? Icons.flash_on : Icons.flash_off,
                        color: AppColors.primary2,
                      )),
                  SizedBox(width: 85),
                  IconButton(
                      onPressed: () {
                        scannerController.start();
                        scannerController.switchCamera();
                        scannerController.stop();
                      },
                      icon: Icon(
                        Icons.cameraswitch_sharp,
                        color: AppColors.primary2,
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
