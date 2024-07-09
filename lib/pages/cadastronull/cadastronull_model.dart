import '/flutter_flow/flutter_flow_util.dart';
import 'cadastronull_widget.dart' show CadastronullWidget;
import 'package:flutter/material.dart';

class CadastronullModel extends FlutterFlowModel<CadastronullWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailCadastro widget.
  FocusNode? emailCadastroFocusNode;
  TextEditingController? emailCadastroTextController;
  String? Function(BuildContext, String?)? emailCadastroTextControllerValidator;
  // State field(s) for cpfCadastro widget.
  FocusNode? cpfCadastroFocusNode;
  TextEditingController? cpfCadastroTextController;
  String? Function(BuildContext, String?)? cpfCadastroTextControllerValidator;
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  // State field(s) for senhaConfirmar widget.
  FocusNode? senhaConfirmarFocusNode;
  TextEditingController? senhaConfirmarTextController;
  late bool senhaConfirmarVisibility;
  String? Function(BuildContext, String?)?
      senhaConfirmarTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaVisibility = false;
    senhaConfirmarVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailCadastroFocusNode?.dispose();
    emailCadastroTextController?.dispose();

    cpfCadastroFocusNode?.dispose();
    cpfCadastroTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();

    senhaConfirmarFocusNode?.dispose();
    senhaConfirmarTextController?.dispose();
  }
}
