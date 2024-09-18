import '/flutter_flow/flutter_flow_util.dart';
import 'nova_senha_widget.dart' show NovaSenhaWidget;
import 'package:flutter/material.dart';

class NovaSenhaModel extends FlutterFlowModel<NovaSenhaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for newPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  late bool newPasswordVisibility;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // State field(s) for newPasswordConfirm widget.
  FocusNode? newPasswordConfirmFocusNode;
  TextEditingController? newPasswordConfirmTextController;
  late bool newPasswordConfirmVisibility;
  String? Function(BuildContext, String?)?
      newPasswordConfirmTextControllerValidator;
  // Stores action output result for [Custom Action - resetPassword] action in Button widget.
  String? error;

  @override
  void initState(BuildContext context) {
    newPasswordVisibility = false;
    newPasswordConfirmVisibility = false;
  }

  @override
  void dispose() {
    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    newPasswordConfirmFocusNode?.dispose();
    newPasswordConfirmTextController?.dispose();
  }
}
