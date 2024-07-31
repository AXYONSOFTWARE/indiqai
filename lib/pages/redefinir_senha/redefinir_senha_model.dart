import '/flutter_flow/flutter_flow_util.dart';
import 'redefinir_senha_widget.dart' show RedefinirSenhaWidget;
import 'package:flutter/material.dart';

class RedefinirSenhaModel extends FlutterFlowModel<RedefinirSenhaWidget> {
  ///  Local state fields for this page.

  String? email;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailRedefinir widget.
  final emailRedefinirKey = GlobalKey();
  FocusNode? emailRedefinirFocusNode;
  TextEditingController? emailRedefinirTextController;
  String? emailRedefinirSelectedOption;
  String? Function(BuildContext, String?)?
      emailRedefinirTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    emailRedefinirFocusNode?.dispose();
  }
}
