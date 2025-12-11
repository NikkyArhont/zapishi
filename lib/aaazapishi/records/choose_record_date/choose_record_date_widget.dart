import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'choose_record_date_model.dart';
export 'choose_record_date_model.dart';

class ChooseRecordDateWidget extends StatefulWidget {
  const ChooseRecordDateWidget({
    super.key,
    required this.schedulle,
    required this.choosenDay,
  });

  final List<WorkSchedulleStruct>? schedulle;
  final DateTime? choosenDay;

  @override
  State<ChooseRecordDateWidget> createState() => _ChooseRecordDateWidgetState();
}

class _ChooseRecordDateWidgetState extends State<ChooseRecordDateWidget> {
  late ChooseRecordDateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ChooseRecordDateModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.dateForCalendar = widget.choosenDay;
      _model.scheduleDate = widget.schedulle!
          .map((e) => e.data)
          .withoutNulls
          .toList()
          .toList()
          .cast<DateTime>();
      safeSetState(() {});
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
      height: 420.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(12.0, 24.0, 12.0, 80.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Выберите удобную для вас дату',
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    font: GoogleFonts.geologica(
                      fontWeight:
                          FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                    ),
                    fontSize: 20.0,
                    letterSpacing: 0.0,
                    fontWeight:
                        FlutterFlowTheme.of(context).headlineLarge.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).headlineLarge.fontStyle,
                  ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Text(
                    dateTimeFormat(
                      "LLLL yyyy",
                      _model.dateForCalendar,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 100.0,
                    buttonSize: 32.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    disabledColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    disabledIconColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                    icon: FaIcon(
                      FontAwesomeIcons.angleLeft,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 16.0,
                    ),
                    onPressed: functions.sameMonth(
                            getCurrentTimestamp, _model.dateForCalendar)!
                        ? null
                        : () async {
                            _model.dateForCalendar =
                                functions.mathCalendarMonth(
                                    _model.dateForCalendar, false);
                            safeSetState(() {});
                          },
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 100.0,
                    buttonSize: 32.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: FaIcon(
                      FontAwesomeIcons.angleRight,
                      color: FlutterFlowTheme.of(context).primaryText,
                      size: 16.0,
                    ),
                    onPressed: () async {
                      _model.dateForCalendar = functions.mathCalendarMonth(
                          _model.dateForCalendar, true);
                      safeSetState(() {});
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Пн',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                  Text(
                    'Вт',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                  Text(
                    'Ср',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                  Text(
                    'Чт',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                  Text(
                    'Пт',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                  Text(
                    'Сб',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                  Text(
                    'Вс',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).bodyMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                        ),
                  ),
                ],
              ),
            ),
            Builder(
              builder: (context) {
                final updateCalendar = functions
                        .createCalendar(_model.dateForCalendar)
                        ?.toList() ??
                    [];

                return GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 7,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                    childAspectRatio: 1.0,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: updateCalendar.length,
                  itemBuilder: (context, updateCalendarIndex) {
                    final updateCalendarItem =
                        updateCalendar[updateCalendarIndex];
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        if (updateCalendarItem >= getCurrentTimestamp) {
                          Navigator.pop(context, updateCalendarItem);
                        }
                      },
                      child: Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: _model.scheduleDate
                                      .contains(updateCalendarItem) &&
                                  functions.sameMonth(updateCalendarItem,
                                      _model.dateForCalendar)!
                              ? FlutterFlowTheme.of(context).secondary
                              : FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: dateTimeFormat(
                                      "yMd",
                                      updateCalendarItem,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    ) ==
                                    dateTimeFormat(
                                      "yMd",
                                      getCurrentTimestamp,
                                      locale: FFLocalizations.of(context)
                                          .languageCode,
                                    )
                                ? FlutterFlowTheme.of(context).primary
                                : Color(0x00000000),
                          ),
                        ),
                        child: Align(
                          alignment: AlignmentDirectional(0.0, 0.0),
                          child: Text(
                            dateTimeFormat(
                              "d",
                              updateCalendarItem,
                              locale: FFLocalizations.of(context).languageCode,
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: functions.sameMonth(updateCalendarItem,
                                          _model.dateForCalendar)!
                                      ? FlutterFlowTheme.of(context).primaryText
                                      : FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ].divide(SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
