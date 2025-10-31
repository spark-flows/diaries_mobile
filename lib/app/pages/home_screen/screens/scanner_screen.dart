import 'package:diaries/app/app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScannerScreen extends StatelessWidget {
  const ScannerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        // final controller = Get.find<HomeController>();
        // await controller.getProductApi(srjobno: '1/2750');
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: ColorsValue.appBg,
          body: MobileScanner(
            controller: MobileScannerController(
              formats: [BarcodeFormat.qrCode],
            ),
            fit: BoxFit.cover,
            // tapToFocus: true,
            onDetect: (BarcodeCapture capture) {
              controller.getProductApi(
                srjobno: capture.barcodes.first.rawValue ?? '',
              );
              Get.back();
            },
          ),
        );
      },
    );
  }
}
