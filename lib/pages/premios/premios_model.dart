import '/flutter_flow/flutter_flow_util.dart';
import 'premios_widget.dart' show PremiosWidget;
import 'package:flutter/material.dart';

class PremiosModel extends FlutterFlowModel<PremiosWidget> {
  ///  Local state fields for this page.

  String cuponCode = '0';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
