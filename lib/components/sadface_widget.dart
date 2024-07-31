import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'sadface_model.dart';
export 'sadface_model.dart';

class SadfaceWidget extends StatefulWidget {
  const SadfaceWidget({super.key});

  @override
  State<SadfaceWidget> createState() => _SadfaceWidgetState();
}

class _SadfaceWidgetState extends State<SadfaceWidget> {
  late SadfaceModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SadfaceModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/lottie_animations/Animation_-_1721168513513.json',
      width: MediaQuery.sizeOf(context).width * 1.0,
      height: MediaQuery.sizeOf(context).height * 1.0,
      fit: BoxFit.contain,
      repeat: false,
      animate: true,
    );
  }
}
