import '/flutter_flow/flutter_flow_util.dart';
import 'foto_perfil_copy_widget.dart' show FotoPerfilCopyWidget;
import 'package:flutter/material.dart';

class FotoPerfilCopyModel extends FlutterFlowModel<FotoPerfilCopyWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for nomeCadastro widget.
  FocusNode? nomeCadastroFocusNode;
  TextEditingController? nomeCadastroTextController;
  String? Function(BuildContext, String?)? nomeCadastroTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nomeCadastroFocusNode?.dispose();
    nomeCadastroTextController?.dispose();
  }
}
