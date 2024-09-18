// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:mobile_scanner/mobile_scanner.dart';

class BarcodeScannerWidgett extends StatefulWidget {
  const BarcodeScannerWidgett({
    super.key,
    this.width,
    this.height,
    required this.onBarcodeScanned,
  });

  final double? width;
  final double? height;
  final Future Function(String? barcodeValue)
      onBarcodeScanned; // Callback para o código escaneado

  @override
  State<BarcodeScannerWidgett> createState() => _BarcodeScannerWidgettState();
}

class _BarcodeScannerWidgettState extends State<BarcodeScannerWidgett> {
  MobileScannerController controller = MobileScannerController();
  String? _lastScannedCode;
  DateTime? _lastScanTime;

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  void _handleBarcode(BarcodeCapture capture) {
    final barcode = capture.barcodes.first;
    final barcodeValue = barcode.rawValue;

    // Verificar se o código de barras é diferente do último e se não foi escaneado nos últimos 5 segundos
    if (barcodeValue != null &&
        (barcodeValue != _lastScannedCode ||
            DateTime.now()
                    .difference(_lastScanTime ?? DateTime.now())
                    .inSeconds >
                5)) {
      // Atualizar o último código escaneado e o tempo do último escaneamento
      _lastScannedCode = barcodeValue;
      _lastScanTime = DateTime.now();

      // Chamar o callback com o valor do código de barras
      widget.onBarcodeScanned(barcodeValue);
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: MobileScanner(
        controller: controller,
        onDetect: _handleBarcode,
        // Opcionalmente, você pode adicionar uma sobreposição visual para o scanner
        overlayBuilder: (context, constraints) {
          return Container(
            alignment: Alignment.center,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.red,
                  width: 3,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
