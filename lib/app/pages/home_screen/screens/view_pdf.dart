import 'package:diaries/app/app.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPDFinFullScreen extends StatelessWidget {
  const ViewPDFinFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      initState: (state) async {
        final controller = Get.find<HomeController>();
        final customerId = Get.arguments[0];
        final orderId = Get.arguments[1];
        await controller.getPDFApi(customerId: customerId, orderId: orderId);
      },
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.pink.shade50,
          bottomNavigationBar: SafeArea(
            child: Padding(
              padding: Dimens.edgeInsets20_00_20_00.copyWith(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final pdfUrl = controller.pdfModel?.pdfUrl ?? '';
                        downloadPdf(pdfUrl);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height:
                            Utility.isTablet()
                                ? Dimens.fiftyFive
                                : Dimens.fourty,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: ColorsValue.whiteColor,
                          borderRadius: BorderRadius.circular(Dimens.ten),
                          border: Border.all(
                            color: ColorsValue.blackColor,
                            width: Dimens.one,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Dimens.boxWidth5,
                            Text(
                              'Download PDF'.tr,
                              style: Styles.txtBlackColorW50014.copyWith(
                                fontSize:
                                    Utility.isTablet()
                                        ? Dimens.twenty
                                        : Dimens.fourteen,
                                color: ColorsValue.blackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Dimens.boxWidth20,
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        final url = controller.pdfModel?.pdfUrl ?? '';
                        sharePdfUrl(url);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height:
                            Utility.isTablet()
                                ? Dimens.fiftyFive
                                : Dimens.fourty,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          color: ColorsValue.appColor,
                          borderRadius: BorderRadius.circular(Dimens.ten),
                        ),
                        child: Text(
                          'Share PDF',
                          style: Styles.whiteColorW50014.copyWith(
                            fontSize:
                                Utility.isTablet()
                                    ? Dimens.twenty
                                    : Dimens.fourteen,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          appBar: AppBar(title: const Text("View PDF"), centerTitle: true),
          body: Scaffold(
            backgroundColor: ColorsValue.appBg,
            body: SafeArea(
              child: Stack(
                children: [
                  Container(
                    color: ColorsValue.redColor,
                    child: SfPdfViewer.network(
                      controller.pdfModel?.pdfUrl ??
                          'https://res.cloudinary.com/dufkn6v9v/raw/upload/v1761722104/invoices/pdfs/a4ec3153-9e6e-452e-94be-ef29c3804652/1761722103250.pdf',
                      key: controller.pdfViewerKey,
                      currentSearchTextHighlightColor: ColorsValue.appBg,
                      canShowPaginationDialog: true,
                      enableDoubleTapZooming: true,
                      onDocumentLoaded: (details) {
                        controller.isLoading = false;
                        controller.update();
                      },
                      onDocumentLoadFailed: (details) {
                        controller.isLoading = false;
                        controller.hasError = true;
                        controller.update();
                      },
                    ),
                  ),
                  if (controller.isLoading)
                    const Center(child: CircularProgressIndicator()),
                  if (controller.hasError)
                    Center(
                      child: Text(
                        'Failed to load PDF. Please try again.'.tr,
                        style: Styles.blackColorW50016,
                      ),
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void sharePdfUrl(String pdfUrl) {
  Share.share('Here is your invoice PDF: $pdfUrl', subject: 'Invoice PDF');
}

Future<void> downloadPdf(String pdfUrl) async {
  try {
    final dir = await getApplicationDocumentsDirectory();
    final filePath =
        '${dir.path}/invoice_${DateTime.now().millisecondsSinceEpoch}.pdf';

    await Dio().download(pdfUrl, filePath);

    print('PDF downloaded to: $filePath');
    await OpenFilex.open(filePath);
  } catch (e) {
    print('Error downloading PDF: $e');
  }
}
