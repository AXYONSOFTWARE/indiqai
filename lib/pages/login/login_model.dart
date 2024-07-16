import '/flutter_flow/flutter_flow_util.dart';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  Local state fields for this page.

  String? email;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for emailLogin widget.
  final emailLoginKey = GlobalKey();
  FocusNode? emailLoginFocusNode;
  TextEditingController? emailLoginTextController;
  String? emailLoginSelectedOption;
  String? Function(BuildContext, String?)? emailLoginTextControllerValidator;
  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;

  @override
  void initState(BuildContext context) {
    senhaVisibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    emailLoginFocusNode?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();
  }
}
