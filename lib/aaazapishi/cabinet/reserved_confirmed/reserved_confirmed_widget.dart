import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'reserved_confirmed_model.dart';
export 'reserved_confirmed_model.dart';

class ReservedConfirmedWidget extends StatefulWidget {
  const ReservedConfirmedWidget({super.key});

  @override
  State<ReservedConfirmedWidget> createState() =>
      _ReservedConfirmedWidgetState();
}

class _ReservedConfirmedWidgetState extends State<ReservedConfirmedWidget> {
  late ReservedConfirmedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReservedConfirmedModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(
        Duration(
          milliseconds: 1000,
        ),
      );
      Navigator.pop(context);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 60.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondary,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: Color(0xFFEEEEEE),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlutterFlowIconButton(
            borderRadius: 100.0,
            buttonSize: 28.0,
            fillColor: FlutterFlowTheme.of(context).primaryText,
            icon: Icon(
              Icons.done,
              color: FlutterFlowTheme.of(context).secondary,
              size: 12.0,
            ),
            onPressed: () {
              print('IconButton pressed ...');
            },
          ),
          Text(
            'Запись подтверждена',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts:
                      !FlutterFlowTheme.of(context).titleMediumIsCustom,
                ),
          ),
        ].divide(SizedBox(width: 16.0)),
      ),
    );
  }
}
