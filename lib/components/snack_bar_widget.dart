import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'snack_bar_model.dart';
export 'snack_bar_model.dart';

class SnackBarWidget extends StatefulWidget {
  const SnackBarWidget({
    super.key,
    Color? color,
    Color? borderColor,
    required this.text,
  })  : color = color ?? const Color(0xFF5DE9B0),
        borderColor = borderColor ?? const Color(0x7D5DE9B0);

  final Color color;
  final Color borderColor;
  final String? text;

  @override
  State<SnackBarWidget> createState() => _SnackBarWidgetState();
}

class _SnackBarWidgetState extends State<SnackBarWidget> {
  late SnackBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SnackBarModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Align(
            alignment: const AlignmentDirectional(0.0, 1.0),
            child: Container(
              height: 40.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget.color,
                  FlutterFlowTheme.of(context).success,
                ),
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(
                  color: valueOrDefault<Color>(
                    widget.borderColor,
                    const Color(0x83249689),
                  ),
                  width: 3.0,
                ),
              ),
              child: Align(
                alignment: const AlignmentDirectional(0.0, 0.0),
                child: Text(
                  valueOrDefault<String>(
                    widget.text,
                    'Carregando...',
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).bodyMediumFamily,
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.bold,
                        useGoogleFonts: GoogleFonts.asMap().containsKey(
                            FlutterFlowTheme.of(context).bodyMediumFamily),
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
