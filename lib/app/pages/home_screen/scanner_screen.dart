import 'package:diaries/app/pages/pages.dart';
import 'package:diaries/app/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          body: MobileScanner(
            controller: MobileScannerController(
              formats: [BarcodeFormat.qrCode],
            ),
            fit: BoxFit.cover,
            tapToFocus: true,
            onDetect: (BarcodeCapture capture) {
              print(
                'Valid barcode detected: ${capture.barcodes.first.rawValue}',
              );
              Get.back();
            },
          ),
        );
      },
    );
  }
}
