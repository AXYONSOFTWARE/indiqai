import '/flutter_flow/flutter_flow_util.dart';
import 'detalhe_premio_widget.dart' show DetalhePremioWidget;
import 'package:flutter/material.dart';

class DetalhePremioModel extends FlutterFlowModel<DetalhePremioWidget> {
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
