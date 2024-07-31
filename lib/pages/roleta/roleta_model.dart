import '/flutter_flow/flutter_flow_rive_controller.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'roleta_widget.dart' show RoletaWidget;
import 'package:flutter/material.dart';

class RoletaModel extends FlutterFlowModel<RoletaWidget> {
  ///  Local state fields for this page.

  double rotationNumber = 1.0;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for RiveAnimation widget.
  final riveAnimationAnimationsList = [
    'Main',
  ];
  List<FlutterFlowRiveController> riveAnimationControllers = [];

  @override
  void initState(BuildContext context) {
    for (var name in riveAnimationAnimationsList) {
      riveAnimationControllers.add(FlutterFlowRiveController(
        name,
        autoplay: false,
      ));
    }
  }

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
