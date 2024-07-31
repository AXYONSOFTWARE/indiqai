import '/flutter_flow/flutter_flow_util.dart';
import 'cadastro_v2_widget.dart' show CadastroV2Widget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastroV2Model extends FlutterFlowModel<CadastroV2Widget> {
  ///  Local state fields for this page.

  String? email;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

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
  FocusNode? senhaFocusNode1;
  TextEditingController? senhaTextController1;
  late bool senhaVisibility1;
  String? Function(BuildContext, String?)? senhaTextController1Validator;
  // State field(s) for senhaConfirmar widget.
  FocusNode? senhaConfirmarFocusNode;
  TextEditingController? senhaConfirmarTextController;
  late bool senhaConfirmarVisibility;
  String? Function(BuildContext, String?)?
      senhaConfirmarTextControllerValidator;
  // State field(s) for emailLogin widget.
  final emailLoginKey = GlobalKey();
  FocusNode? emailLoginFocusNode;
  TextEditingController? emailLoginTextController;
  String? emailLoginSelectedOption;
  String? Function(BuildContext, String?)? emailLoginTextControllerValidator;
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode2;
  TextEditingController? senhaTextController2;
  late bool senhaVisibility2;
  String? Function(BuildContext, String?)? senhaTextController2Validator;

  @override
  void initState(BuildContext context) {
    senhaVisibility1 = false;
    senhaConfirmarVisibility = false;
    senhaVisibility2 = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    emailCadastroFocusNode?.dispose();

    cpfCadastroFocusNode?.dispose();
    cpfCadastroTextController?.dispose();

    senhaFocusNode1?.dispose();
    senhaTextController1?.dispose();

    senhaConfirmarFocusNode?.dispose();
    senhaConfirmarTextController?.dispose();

    emailLoginFocusNode?.dispose();

    senhaFocusNode2?.dispose();
    senhaTextController2?.dispose();
  }
}
