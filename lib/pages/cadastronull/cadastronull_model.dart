import '/flutter_flow/flutter_flow_util.dart';
import 'cadastronull_widget.dart' show CadastronullWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastronullModel extends FlutterFlowModel<CadastronullWidget> {
  ///  Local state fields for this page.

  String? email;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailCadastro widget.
  final emailCadastroKey = GlobalKey();
  FocusNode? emailCadastroFocusNode;
  TextEditingController? emailCadastroTextController;
  String? emailCadastroSelectedOption;
  String? Function(BuildContext, String?)? emailCadastroTextControllerValidator;
  // State field(s) for cpfCadastro widget.
  FocusNode? cpfCadastroFocusNode;
  TextEditingController? cpfCadastroTextController;
  final cpfCadastroMask = MaskTextInputFormatter(mask: '###.###.###-##');
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

    cpfCadastroFocusNode?.dispose();
    cpfCadastroTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();

    senhaConfirmarFocusNode?.dispose();
    senhaConfirmarTextController?.dispose();
  }
}
