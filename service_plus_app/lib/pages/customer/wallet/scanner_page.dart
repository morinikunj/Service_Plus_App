import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:service_plus_app/pages/customer/wallet/wallet_controller.dart';
import 'package:service_plus_app/utils/constants/app_colors.dart';
import 'package:service_plus_app/utils/local_storage/session_manager.dart';

class SacnnerPage extends StatefulWidget {
  const SacnnerPage({super.key});

  @override
  State<SacnnerPage> createState() => _SacnnerPageState();
}

class _SacnnerPageState extends State<SacnnerPage> {
  QRViewController? qrcontroller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  WalletController walletController = Get.put(WalletController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  void dispose() {
    qrcontroller!.dispose();
    super.dispose();
  }
  
  fetch() async {
    
  }

  void _onQRViewCreated(QRViewController controller) {
    controller = qrcontroller!;
    controller.scannedDataStream.listen((scanData) {
      print('Scanned data: ${scanData.code}');
      walletController.payUserId = scanData.code;
      

      // Do something with the scanned data, e.g., navigate to a new screen
    });
  }
  @override
  Widget build(BuildContext context) {
    return QRView(key: qrKey, onQRViewCreated: _onQRViewCreated, overlay: QrScannerOverlayShape(
      borderColor: AppColors.secondaryColor
    ),);
  }
}