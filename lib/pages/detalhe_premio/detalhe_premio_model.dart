import '/components/returndada_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'detalhe_premio_widget.dart' show DetalhePremioWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class DetalhePremioModel extends FlutterFlowModel<DetalhePremioWidget> {
  ///  Local state fields for this page.

  String cuponCode = '0';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for returndada component.
  late ReturndadaModel returndadaModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  @override
  void initState(BuildContext context) {
    returndadaModel = createModel(context, () => ReturndadaModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    returndadaModel.dispose();
    expandableExpandableController.dispose();
  }
}
