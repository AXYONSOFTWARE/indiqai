import '/flutter_flow/flutter_flow_util.dart';
import 'sad_face_widget.dart' show SadFaceWidget;
import 'package:flutter/material.dart';

class SadFaceModel extends FlutterFlowModel<SadFaceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
