import '/flutter_flow/flutter_flow_util.dart';
import 'redefinir_widget.dart' show RedefinirWidget;
import 'package:flutter/material.dart';

class RedefinirModel extends FlutterFlowModel<RedefinirWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
