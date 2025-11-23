import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'vacation_model.dart';
export 'vacation_model.dart';

class VacationWidget extends StatefulWidget {
  const VacationWidget({super.key});

  @override
  State<VacationWidget> createState() => _VacationWidgetState();
}

class _VacationWidgetState extends State<VacationWidget> {
  late VacationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VacationModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.asset(
            'assets/images/Group_(4).png',
            width: 200.0,
            height: 200.0,
            fit: BoxFit.cover,
          ),
        ),
        Text(
          'Выходной',
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                letterSpacing: 0.0,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).bodyMediumIsCustom,
              ),
        ),
      ].divide(SizedBox(height: 12.0)),
    );
  }
}
