import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'roleta_widget.dart' show RoletaWidget;
import 'package:flutter/material.dart';

class RoletaModel extends FlutterFlowModel<RoletaWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Query Rows] action in roleta widget.
  List<ProductsRow>? queryroleta;
  // Stores action output result for [Backend Call - Query Rows] action in roleta widget.
  List<EmpresasRow>? queryEmpresa;
  // Stores action output result for [Backend Call - Query Rows] action in roleta widget.
  List<UsuariosRow>? queryUser;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
