import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'fail_c_ode_model.dart';
export 'fail_c_ode_model.dart';

class FailCOdeWidget extends StatefulWidget {
  const FailCOdeWidget({super.key});

  @override
  State<FailCOdeWidget> createState() => _FailCOdeWidgetState();
}

class _FailCOdeWidgetState extends State<FailCOdeWidget> {
  late FailCOdeModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FailCOdeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
