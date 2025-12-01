import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'my_job_status_model.dart';
export 'my_job_status_model.dart';

class MyJobStatusWidget extends StatefulWidget {
  const MyJobStatusWidget({
    super.key,
    required this.jobStatus,
  });

  final RecordStatus? jobStatus;

  @override
  State<MyJobStatusWidget> createState() => _MyJobStatusWidgetState();
}

class _MyJobStatusWidgetState extends State<MyJobStatusWidget> {
  late MyJobStatusModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyJobStatusModel());

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
      decoration: BoxDecoration(
        color: () {
          if (widget.jobStatus == RecordStatus.confirmed) {
            return FlutterFlowTheme.of(context).lightGreen;
          } else if (widget.jobStatus == RecordStatus.newREc) {
            return Color(0xFFFFE893);
          } else if (widget.jobStatus == RecordStatus.denied) {
            return Color(0xFFFF8D8D);
          } else {
            return FlutterFlowTheme.of(context).primaryBackground;
          }
        }(),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 8.0),
        child: Text(
          () {
            if (widget.jobStatus == RecordStatus.newREc) {
              return 'Подтверждена';
            } else if (widget.jobStatus == RecordStatus.newREc) {
              return 'На подтверждении';
            } else {
              return 'Отклонена';
            }
          }(),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                color: () {
                  if (widget.jobStatus == RecordStatus.confirmed) {
                    return FlutterFlowTheme.of(context).success;
                  } else if (widget.jobStatus == RecordStatus.newREc) {
                    return FlutterFlowTheme.of(context).customer;
                  } else if (widget.jobStatus == RecordStatus.denied) {
                    return FlutterFlowTheme.of(context).error;
                  } else {
                    return FlutterFlowTheme.of(context).primaryBackground;
                  }
                }(),
                letterSpacing: 0.0,
                fontWeight: FontWeight.w600,
                useGoogleFonts:
                    !FlutterFlowTheme.of(context).bodyMediumIsCustom,
              ),
        ),
      ),
    );
  }
}
