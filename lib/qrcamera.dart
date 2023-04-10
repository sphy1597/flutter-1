// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';

// class QRcodeWidget extends StatefulWidget {
//   const QRcodeWidget({super.key});

//   @override
//   State<QRcodeWidget> createState() => _QRcodeWidgetState();
// }

// class _QRcodeWidgetState extends State<QRcodeWidget> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: "QR");
//   QRViewController? controller;
//   String result = "";

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   //QR코드 기능
//   void _onQRViewCreated(QRViewController controller) {
//     this.controller = controller;
//     controller.scannedDataStream.listen((scanData) {
//       if (scanData.code != null) {
//         if (scanData.code!.contains('레세티정')) {
//           this.controller!.dispose();
//           Navigator.pop(context, scanData.code);
//         }
//       }

//       setState(() {
//         result = scanData.code!;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("QR Code Scanner"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//               flex: 5,
//               child: QRView(
//                 key: qrKey,
//                 onQRViewCreated: _onQRViewCreated,
//               )),
//           Expanded(
//               flex: 1,
//               child: Center(
//                 child: Text(
//                   "Scan Result: $result",
//                   style: TextStyle(
//                     fontSize: 18,
//                   ),
//                 ),
//               )),
//           Expanded(
//               flex: 1,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                     child: Text('QRinfo'),
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/qrinfo',
//                           arguments: result);
//                       result = "";
//                     },
//                   )
//                 ],
//               ))
//         ],
//       ),
//     );
//   }
// }
