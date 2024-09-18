import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:async';
import 'profile_modal_widget.dart' show ProfileModalWidget;
import 'package:flutter/material.dart';

class ProfileModalModel extends FlutterFlowModel<ProfileModalWidget> {
  ///  State fields for stateful widgets in this component.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  Completer<List<UsuariosRow>>? requestCompleter;
  // State field(s) for nameEdit widget.
  FocusNode? nameEditFocusNode;
  TextEditingController? nameEditTextController;
  String? Function(BuildContext, String?)? nameEditTextControllerValidator;
  // State field(s) for emailEdit widget.
  FocusNode? emailEditFocusNode;
  TextEditingController? emailEditTextController;
  String? Function(BuildContext, String?)? emailEditTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    nameEditFocusNode?.dispose();
    nameEditTextController?.dispose();

    emailEditFocusNode?.dispose();
    emailEditTextController?.dispose();
  }

  /// Additional helper methods.
  Future waitForRequestCompleted({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(const Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = requestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
