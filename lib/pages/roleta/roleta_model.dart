import '/flutter_flow/flutter_flow_util.dart';
import 'roleta_widget.dart' show RoletaWidget;
import 'package:flutter/material.dart';

class RoletaModel extends FlutterFlowModel<RoletaWidget> {
  ///  Local state fields for this page.

  double rotationNumber = 1.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
