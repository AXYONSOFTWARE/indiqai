import '/flutter_flow/flutter_flow_util.dart';
import 'testeapenasparasetarestaurante_widget.dart'
    show TesteapenasparasetarestauranteWidget;
import 'package:flutter/material.dart';

class TesteapenasparasetarestauranteModel
    extends FlutterFlowModel<TesteapenasparasetarestauranteWidget> {
  ///  Local state fields for this page.

  int? id;

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for productName widget.
  FocusNode? productNameFocusNode;
  TextEditingController? productNameTextController;
  String? Function(BuildContext, String?)? productNameTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    productNameFocusNode?.dispose();
    productNameTextController?.dispose();
  }
}
