import '/aaazapishi/admin/admin_chats/admin_debate_close/admin_debate_close_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'admin_complete_debate_model.dart';
export 'admin_complete_debate_model.dart';

class AdminCompleteDebateWidget extends StatefulWidget {
  const AdminCompleteDebateWidget({
    super.key,
    required this.record,
  });

  final DocumentReference? record;

  @override
  State<AdminCompleteDebateWidget> createState() =>
      _AdminCompleteDebateWidgetState();
}

class _AdminCompleteDebateWidgetState extends State<AdminCompleteDebateWidget> {
  late AdminCompleteDebateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminCompleteDebateModel());

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
      width: 430.0,
      height: 380.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primaryBackground,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 16.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primary,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                Flexible(
                  child: Align(
                    alignment: AlignmentDirectional(-1.0, 0.0),
                    child: Text(
                      'Решить спор',
                      style:
                          FlutterFlowTheme.of(context).displayMedium.override(
                                font: GoogleFonts.geologica(
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .fontStyle,
                                ),
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .fontStyle,
                              ),
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 24.0,
                    ),
                  ),
                ),
              ].divide(SizedBox(width: 12.0)),
            ),
            StreamBuilder<RecordsRecord>(
              stream: RecordsRecord.getDocument(widget.record!),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 10.0,
                      height: 10.0,
                      child: SpinKitCircle(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        size: 10.0,
                      ),
                    ),
                  );
                }

                final richTextRecordsRecord = snapshot.data!;

                return RichText(
                  textScaler: MediaQuery.of(context).textScaler,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Сумма по заказу (',
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: richTextRecordsRecord.totalCost.toString(),
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text: FFAppConstants.currency,
                        style: TextStyle(),
                      ),
                      TextSpan(
                        text:
                            ') будет перечислена лицу, в чью пользу был решён спор',
                        style: TextStyle(),
                      )
                    ],
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                );
              },
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.debateStatus = ReportStatus.master;
                safeSetState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if ((_model.debateStatus != ReportStatus.master) ||
                      (_model.debateStatus == null))
                    FaIcon(
                      FontAwesomeIcons.circle,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  if (_model.debateStatus == ReportStatus.master)
                    FaIcon(
                      FontAwesomeIcons.dotCircle,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  Text(
                    'Исполнитель',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ),
            InkWell(
              splashColor: Colors.transparent,
              focusColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onTap: () async {
                _model.debateStatus = ReportStatus.client;
                safeSetState(() {});
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  if ((_model.debateStatus != ReportStatus.client) ||
                      (_model.debateStatus == null))
                    FaIcon(
                      FontAwesomeIcons.circle,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  if (_model.debateStatus == ReportStatus.client)
                    FaIcon(
                      FontAwesomeIcons.dotCircle,
                      color: FlutterFlowTheme.of(context).primary,
                      size: 24.0,
                    ),
                  Text(
                    'Заказчик',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w600,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(1.0, 0.0),
              child: Builder(
                builder: (context) => FFButtonWidget(
                  onPressed: (_model.debateStatus == null)
                      ? null
                      : () async {
                          await widget.record!.update(createRecordsRecordData(
                            report: updateReportStruct(
                              ReportStruct(
                                status: _model.debateStatus,
                              ),
                              clearUnsetFields: false,
                            ),
                          ));
                          Navigator.pop(context);
                          await showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return Dialog(
                                elevation: 0,
                                insetPadding: EdgeInsets.zero,
                                backgroundColor: Colors.transparent,
                                alignment: AlignmentDirectional(0.0, 0.0)
                                    .resolve(Directionality.of(context)),
                                child: AdminDebateCloseWidget(
                                  debateResult: _model.debateStatus!,
                                ),
                              );
                            },
                          );
                        },
                  text: 'Далее',
                  options: FFButtonOptions(
                    width: 160.0,
                    height: 48.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily: 'involve',
                          letterSpacing: 0.0,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(16.0),
                    disabledColor: FlutterFlowTheme.of(context).secondary,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
