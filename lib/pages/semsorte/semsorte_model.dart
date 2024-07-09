import '/flutter_flow/flutter_flow_util.dart';
import 'semsorte_widget.dart' show SemsorteWidget;
import 'package:flutter/material.dart';

class SemsorteModel extends FlutterFlowModel<SemsorteWidget> {
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
