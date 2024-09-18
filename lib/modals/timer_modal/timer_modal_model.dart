import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'timer_modal_widget.dart' show TimerModalWidget;
import 'package:flutter/material.dart';

class TimerModalModel extends FlutterFlowModel<TimerModalWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;
  // Stores action output result for [Backend Call - Query Rows] action in timer-modal widget.
  List<EmpresasRow>? openquery;
  DateTime? datePicked;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
