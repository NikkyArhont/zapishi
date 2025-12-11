import '/aaazapishi/cabinet/cabenet_master_del_serv/cabenet_master_del_serv_widget.dart';
import '/aaazapishi/cabinet/cabenet_master_delete/cabenet_master_delete_widget.dart';
import '/aaazapishi/cabinet/cabenet_master_delete_p_r_o_f_i_l_e/cabenet_master_delete_p_r_o_f_i_l_e_widget.dart';
import '/aaazapishi/components/empty_widjet/empty_widjet_widget.dart';
import '/aaazapishi/components/menu/menu_widget.dart';
import '/aaazapishi/records/choose_record_date/choose_record_date_widget.dart';
import '/aaazapishi/reviews/empty_r_eviews/empty_r_eviews_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/avatar_mini_widget.dart';
import '/components/vacation_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'cabinet_model.dart';
export 'cabinet_model.dart';

class CabinetWidget extends StatefulWidget {
  const CabinetWidget({super.key});

  static String routeName = 'cabinet';
  static String routePath = '/cabinet';

  @override
  State<CabinetWidget> createState() => _CabinetWidgetState();
}

class _CabinetWidgetState extends State<CabinetWidget>
    with TickerProviderStateMixin {
  late CabinetModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CabinetModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.choosenDate = getCurrentTimestamp;
      _model.choosenMaster = null;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 5,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<MastersRecord>(
        stream: MastersRecord.getDocument(currentUserDocument!.mainMaster!),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Scaffold(
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Center(
                child: SizedBox(
                  width: 10.0,
                  height: 10.0,
                  child: SpinKitCircle(
                    color: FlutterFlowTheme.of(context).primaryBackground,
                    size: 10.0,
                  ),
                ),
              ),
            );
          }

          final cabinetMastersRecord = snapshot.data!;

          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: SafeArea(
                top: true,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                  child: Stack(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Кабинет',
                                  style: FlutterFlowTheme.of(context)
                                      .displayMedium
                                      .override(
                                        font: GoogleFonts.geologica(
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .displayMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .displayMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontStyle,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: StreamBuilder<List<RecordsRecord>>(
                              stream: queryRecordsRecord(
                                queryBuilder: (recordsRecord) =>
                                    recordsRecord.where(Filter.or(
                                  Filter(
                                    'organisation',
                                    isEqualTo: cabinetMastersRecord.reference,
                                  ),
                                  Filter(
                                    'master',
                                    isEqualTo: cabinetMastersRecord.reference,
                                  ),
                                )),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 10.0,
                                      height: 10.0,
                                      child: SpinKitCircle(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        size: 10.0,
                                      ),
                                    ),
                                  );
                                }
                                List<RecordsRecord> tabBarRecordsRecordList =
                                    snapshot.data!;

                                return Column(
                                  children: [
                                    Align(
                                      alignment: Alignment(0.0, 0),
                                      child: TabBar(
                                        isScrollable: true,
                                        tabAlignment: TabAlignment.center,
                                        labelColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        unselectedLabelColor:
                                            FlutterFlowTheme.of(context)
                                                .secondaryText,
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
                                            ),
                                        unselectedLabelStyle: FlutterFlowTheme
                                                .of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleMediumIsCustom,
                                            ),
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        tabs: [
                                          Tab(
                                            text: 'Календарь',
                                          ),
                                          Tab(
                                            text: 'Записи',
                                          ),
                                          Tab(
                                            text: 'Профиль',
                                          ),
                                          Tab(
                                            text: 'Отзывы',
                                          ),
                                          Tab(
                                            text: 'Сотрудники',
                                          ),
                                        ],
                                        controller: _model.tabBarController,
                                        onTap: (i) async {
                                          [
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {},
                                            () async {}
                                          ][i]();
                                        },
                                      ),
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _model.tabBarController,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        children: [
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Stack(
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderRadius: 100.0,
                                                            buttonSize: 50.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            icon: FaIcon(
                                                              FontAwesomeIcons
                                                                  .angleRight,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 24.0,
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  'IconButton pressed ...');
                                                            },
                                                          ),
                                                          Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                children: [
                                                                  FlutterFlowIconButton(
                                                                    borderRadius:
                                                                        100.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    fillColor:
                                                                        Color(
                                                                            0xFFE0E0E0),
                                                                    disabledIconColor:
                                                                        Color(
                                                                            0x78616161),
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .angleLeft,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed: (_model.choosenDate! <=
                                                                            getCurrentTimestamp)
                                                                        ? null
                                                                        : () async {
                                                                            _model.choosenDate =
                                                                                functions.mathCalendarDay(_model.choosenDate, false);
                                                                            _model.pin =
                                                                                valueOrDefault<int>(
                                                                              functions.pinNumbers(_model.choosenDate, cabinetMastersRecord.workTime.toList(), getCurrentTimestamp),
                                                                              222,
                                                                            );
                                                                            safeSetState(() {});
                                                                          },
                                                                  ),
                                                                  Text(
                                                                    dateTimeFormat(
                                                                      "dd LLLL",
                                                                      _model
                                                                          .choosenDate,
                                                                      locale: FFLocalizations.of(
                                                                              context)
                                                                          .languageCode,
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelLargeFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                        ),
                                                                  ),
                                                                  FlutterFlowIconButton(
                                                                    borderRadius:
                                                                        100.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    fillColor:
                                                                        Color(
                                                                            0xFFE0E0E0),
                                                                    icon:
                                                                        FaIcon(
                                                                      FontAwesomeIcons
                                                                          .angleRight,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      _model.choosenDate = functions.mathCalendarDay(
                                                                          _model
                                                                              .choosenDate,
                                                                          true);
                                                                      _model.pin =
                                                                          valueOrDefault<
                                                                              int>(
                                                                        functions.pinNumbers(
                                                                            _model.choosenDate,
                                                                            cabinetMastersRecord.workTime.toList(),
                                                                            getCurrentTimestamp),
                                                                        222,
                                                                      );
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderRadius: 100.0,
                                                            buttonSize: 50.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                            icon: Icon(
                                                              Icons
                                                                  .calendar_month,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 24.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              await showModalBottomSheet(
                                                                isScrollControlled:
                                                                    true,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                isDismissible:
                                                                    false,
                                                                enableDrag:
                                                                    false,
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (context) {
                                                                  return GestureDetector(
                                                                    onTap: () {
                                                                      FocusScope.of(
                                                                              context)
                                                                          .unfocus();
                                                                      FocusManager
                                                                          .instance
                                                                          .primaryFocus
                                                                          ?.unfocus();
                                                                    },
                                                                    child:
                                                                        Padding(
                                                                      padding: MediaQuery
                                                                          .viewInsetsOf(
                                                                              context),
                                                                      child:
                                                                          ChooseRecordDateWidget(
                                                                        schedulle:
                                                                            cabinetMastersRecord.workTime,
                                                                        choosenDay:
                                                                            _model.choosenDate!,
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ).then((value) =>
                                                                  safeSetState(() =>
                                                                      _model.setDate =
                                                                          value));

                                                              _model.choosenDate =
                                                                  _model
                                                                      .setDate;
                                                              _model.pin =
                                                                  valueOrDefault<
                                                                      int>(
                                                                functions.pinNumbers(
                                                                    _model
                                                                        .choosenDate,
                                                                    cabinetMastersRecord
                                                                        .workTime
                                                                        .toList(),
                                                                    getCurrentTimestamp),
                                                                222,
                                                              );
                                                              safeSetState(
                                                                  () {});

                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Builder(
                                                        builder: (context) {
                                                          if (cabinetMastersRecord
                                                                  .type ==
                                                              UserStatus
                                                                  .manager) {
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Stack(
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final planerHour =
                                                                                functions.createDayPlaner(cabinetMastersRecord.workTime.toList(), _model.choosenDate)?.toList() ?? [];
                                                                            if (planerHour.isEmpty) {
                                                                              return Center(
                                                                                child: VacationWidget(),
                                                                              );
                                                                            }

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.fromLTRB(
                                                                                0,
                                                                                0,
                                                                                0,
                                                                                12.0,
                                                                              ),
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: planerHour.length,
                                                                              itemBuilder: (context, planerHourIndex) {
                                                                                final planerHourItem = planerHour[planerHourIndex];
                                                                                return Container(
                                                                                  height: valueOrDefault<double>(
                                                                                    FFAppState().hourHeight.toDouble(),
                                                                                    300.0,
                                                                                  ),
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 40.0,
                                                                                        height: valueOrDefault<double>(
                                                                                          FFAppState().hourHeight.toDouble(),
                                                                                          300.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            Text(
                                                                                              dateTimeFormat(
                                                                                                "Hm",
                                                                                                planerHourItem,
                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              '15',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              '30',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              '45',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 54.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Container(
                                                                                          height: valueOrDefault<double>(
                                                                                            FFAppState().hourHeight.toDouble(),
                                                                                            300.0,
                                                                                          ),
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 8.0)),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final masterCalendar =
                                                                                functions.createPlanerMaster(tabBarRecordsRecordList.toList(), cabinetMastersRecord.workTime.toList(), _model.choosenDate)?.toList() ?? [];

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              primary: false,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: masterCalendar.length,
                                                                              itemBuilder: (context, masterCalendarIndex) {
                                                                                final masterCalendarItem = masterCalendar[masterCalendarIndex];
                                                                                return Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    InkWell(
                                                                                      splashColor: Colors.transparent,
                                                                                      focusColor: Colors.transparent,
                                                                                      hoverColor: Colors.transparent,
                                                                                      highlightColor: Colors.transparent,
                                                                                      onTap: () async {
                                                                                        context.pushNamed(
                                                                                          CreateRecordWidget.routeName,
                                                                                          queryParameters: {
                                                                                            'organisationCard': serializeParam(
                                                                                              cabinetMastersRecord,
                                                                                              ParamType.Document,
                                                                                            ),
                                                                                            'records': serializeParam(
                                                                                              tabBarRecordsRecordList,
                                                                                              ParamType.Document,
                                                                                              isList: true,
                                                                                            ),
                                                                                          }.withoutNulls,
                                                                                          extra: <String, dynamic>{
                                                                                            'organisationCard': cabinetMastersRecord,
                                                                                            'records': tabBarRecordsRecordList,
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                        height: valueOrDefault<double>(
                                                                                          masterCalendarItem.emptyHeight.toDouble(),
                                                                                          100.0,
                                                                                        ),
                                                                                        decoration: BoxDecoration(),
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 40.0,
                                                                                          decoration: BoxDecoration(),
                                                                                        ),
                                                                                        Expanded(
                                                                                          child: InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              context.pushNamed(
                                                                                                ReservePageWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'recordRef': serializeParam(
                                                                                                    tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.reference,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Container(
                                                                                              height: valueOrDefault<double>(
                                                                                                masterCalendarItem.recordHeight.toDouble(),
                                                                                                225.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.newREc ? Color(0xFFF9C393) : (tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.confirmed ? Color(0xFFE4EAD6) : FlutterFlowTheme.of(context).secondaryBackground),
                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(12.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.clientName,
                                                                                                              'noName',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.bold,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          'от',
                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.totalCost.toString(),
                                                                                                            'noCost',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          FFAppConstants.currency,
                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                              ),
                                                                                                        ),
                                                                                                        if (tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.newREc)
                                                                                                          FaIcon(
                                                                                                            FontAwesomeIcons.solidClock,
                                                                                                            color: Color(0xFFE7872F),
                                                                                                            size: 20.0,
                                                                                                          ),
                                                                                                        if (tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.confirmed)
                                                                                                          Icon(
                                                                                                            Icons.check_box,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            size: 20.0,
                                                                                                          ),
                                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      'Услуги',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Builder(
                                                                                                      builder: (context) {
                                                                                                        final servInRec = tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.services.toList() ?? [];

                                                                                                        return ListView.separated(
                                                                                                          padding: EdgeInsets.zero,
                                                                                                          shrinkWrap: true,
                                                                                                          scrollDirection: Axis.vertical,
                                                                                                          itemCount: servInRec.length,
                                                                                                          separatorBuilder: (_, __) => SizedBox(height: 8.0),
                                                                                                          itemBuilder: (context, servInRecIndex) {
                                                                                                            final servInRecItem = servInRec[servInRecIndex];
                                                                                                            return StreamBuilder<ServicesRecord>(
                                                                                                              stream: ServicesRecord.getDocument(servInRecItem),
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

                                                                                                                final containerServicesRecord = snapshot.data!;

                                                                                                                return Container(
                                                                                                                  width: 100.0,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.newREc ? Color(0xFFFF8B1F) : (tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.confirmed ? Color(0x67679249) : Color(0xFFA5A6A8)),
                                                                                                                    borderRadius: BorderRadius.circular(12.0),
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsets.all(8.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Expanded(
                                                                                                                          child: Text(
                                                                                                                            containerServicesRecord.title,
                                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        if (!containerServicesRecord.fixedPrice)
                                                                                                                          Text(
                                                                                                                            'от',
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        Text(
                                                                                                                          '${containerServicesRecord.price.toString()} ${FFAppConstants.currency}',
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            );
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 8.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 8.0)),
                                                                                    ),
                                                                                  ],
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                      if (FFAppState()
                                                                          .firstTime)
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              12.0,
                                                                              0.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Align(
                                                                                alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                child: Container(
                                                                                  width: 1.0,
                                                                                  height: _model.pin?.toDouble(),
                                                                                  decoration: BoxDecoration(),
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 10.0,
                                                                                    height: 10.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                      borderRadius: BorderRadius.circular(100.0),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                    height: 2.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).error,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ].addToEnd(
                                                                    SizedBox(
                                                                        height:
                                                                            12.0)),
                                                              ),
                                                            );
                                                          } else {
                                                            return SingleChildScrollView(
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            2.0,
                                                                            0.0,
                                                                            2.0),
                                                                    child:
                                                                        SingleChildScrollView(
                                                                      scrollDirection:
                                                                          Axis.horizontal,
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          FFButtonWidget(
                                                                            onPressed: (_model.choosenMaster == null)
                                                                                ? null
                                                                                : () async {
                                                                                    _model.choosenMaster = null;
                                                                                    safeSetState(() {});
                                                                                  },
                                                                            text:
                                                                                'Все',
                                                                            options:
                                                                                FFButtonOptions(
                                                                              height: 38.0,
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                  ),
                                                                              elevation: 0.0,
                                                                              borderSide: BorderSide(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                              ),
                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                              disabledColor: FlutterFlowTheme.of(context).secondary,
                                                                              disabledTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                            ),
                                                                          ),
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final masterInOrg = cabinetMastersRecord.worker.toList();

                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(masterInOrg.length, (masterInOrgIndex) {
                                                                                  final masterInOrgItem = masterInOrg[masterInOrgIndex];
                                                                                  return StreamBuilder<MastersRecord>(
                                                                                    stream: MastersRecord.getDocument(masterInOrgItem),
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

                                                                                      final buttonMastersRecord = snapshot.data!;

                                                                                      return FFButtonWidget(
                                                                                        onPressed: (_model.choosenMaster == masterInOrgItem)
                                                                                            ? null
                                                                                            : () async {
                                                                                                _model.choosenMaster = masterInOrgItem;
                                                                                                safeSetState(() {});
                                                                                              },
                                                                                        text: buttonMastersRecord.title,
                                                                                        options: FFButtonOptions(
                                                                                          height: 38.0,
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                              ),
                                                                                          elevation: 0.0,
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                          disabledColor: FlutterFlowTheme.of(context).secondary,
                                                                                          disabledTextColor: FlutterFlowTheme.of(context).primaryText,
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  );
                                                                                }).divide(SizedBox(width: 12.0)),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ].divide(SizedBox(width: 12.0)).addToStart(SizedBox(width: 12.0)).addToEnd(SizedBox(width: 12.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Builder(
                                                                        builder:
                                                                            (context) {
                                                                          if (_model.choosenMaster !=
                                                                              null) {
                                                                            return Stack(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final planerHour = functions.createDayPlaner(cabinetMastersRecord.workTime.toList(), _model.choosenDate)?.toList() ?? [];
                                                                                      if (planerHour.isEmpty) {
                                                                                        return Center(
                                                                                          child: VacationWidget(),
                                                                                        );
                                                                                      }

                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.fromLTRB(
                                                                                          0,
                                                                                          0,
                                                                                          0,
                                                                                          12.0,
                                                                                        ),
                                                                                        primary: false,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: planerHour.length,
                                                                                        itemBuilder: (context, planerHourIndex) {
                                                                                          final planerHourItem = planerHour[planerHourIndex];
                                                                                          return Container(
                                                                                            height: valueOrDefault<double>(
                                                                                              FFAppState().hourHeight.toDouble(),
                                                                                              300.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 40.0,
                                                                                                  height: valueOrDefault<double>(
                                                                                                    FFAppState().hourHeight.toDouble(),
                                                                                                    300.0,
                                                                                                  ),
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        dateTimeFormat(
                                                                                                          "Hm",
                                                                                                          planerHourItem,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '15',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '30',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '45',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 54.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    height: valueOrDefault<double>(
                                                                                                      FFAppState().hourHeight.toDouble(),
                                                                                                      300.0,
                                                                                                    ),
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 8.0)),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final masterCalendar = functions.createPlanerMaster(tabBarRecordsRecordList.where((e) => e.master == _model.choosenMaster).toList(), cabinetMastersRecord.workTime.toList(), _model.choosenDate)?.toList() ?? [];

                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        primary: false,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: masterCalendar.length,
                                                                                        itemBuilder: (context, masterCalendarIndex) {
                                                                                          final masterCalendarItem = masterCalendar[masterCalendarIndex];
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  context.pushNamed(
                                                                                                    CreateRecordWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'organisationCard': serializeParam(
                                                                                                        cabinetMastersRecord,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                      'records': serializeParam(
                                                                                                        tabBarRecordsRecordList,
                                                                                                        ParamType.Document,
                                                                                                        isList: true,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'organisationCard': cabinetMastersRecord,
                                                                                                      'records': tabBarRecordsRecordList,
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  height: valueOrDefault<double>(
                                                                                                    masterCalendarItem.emptyHeight.toDouble(),
                                                                                                    100.0,
                                                                                                  ),
                                                                                                  decoration: BoxDecoration(),
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 40.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        context.pushNamed(
                                                                                                          ReservePageWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'recordRef': serializeParam(
                                                                                                              tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.reference,
                                                                                                              ParamType.DocumentReference,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        height: valueOrDefault<double>(
                                                                                                          masterCalendarItem.recordHeight.toDouble(),
                                                                                                          225.0,
                                                                                                        ),
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.newREc ? Color(0xFFF9C393) : (tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.confirmed ? Color(0xFFE4EAD6) : FlutterFlowTheme.of(context).secondaryBackground),
                                                                                                          borderRadius: BorderRadius.circular(12.0),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsets.all(12.0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    child: Text(
                                                                                                                      valueOrDefault<String>(
                                                                                                                        tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.clientName,
                                                                                                                        'noName',
                                                                                                                      ),
                                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            fontWeight: FontWeight.bold,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    'от',
                                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    valueOrDefault<String>(
                                                                                                                      tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.totalCost.toString(),
                                                                                                                      'noCost',
                                                                                                                    ),
                                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    FFAppConstants.currency,
                                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          fontWeight: FontWeight.bold,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  if (tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.newREc)
                                                                                                                    FaIcon(
                                                                                                                      FontAwesomeIcons.solidClock,
                                                                                                                      color: Color(0xFFE7872F),
                                                                                                                      size: 20.0,
                                                                                                                    ),
                                                                                                                  if (tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.confirmed)
                                                                                                                    Icon(
                                                                                                                      Icons.check_box,
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      size: 20.0,
                                                                                                                    ),
                                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                'Услуги',
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              Builder(
                                                                                                                builder: (context) {
                                                                                                                  final servInRec = tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.services.toList() ?? [];

                                                                                                                  return ListView.separated(
                                                                                                                    padding: EdgeInsets.zero,
                                                                                                                    shrinkWrap: true,
                                                                                                                    scrollDirection: Axis.vertical,
                                                                                                                    itemCount: servInRec.length,
                                                                                                                    separatorBuilder: (_, __) => SizedBox(height: 8.0),
                                                                                                                    itemBuilder: (context, servInRecIndex) {
                                                                                                                      final servInRecItem = servInRec[servInRecIndex];
                                                                                                                      return StreamBuilder<ServicesRecord>(
                                                                                                                        stream: ServicesRecord.getDocument(servInRecItem),
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

                                                                                                                          final containerServicesRecord = snapshot.data!;

                                                                                                                          return Container(
                                                                                                                            width: 100.0,
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.newREc ? Color(0xFFFF8B1F) : (tabBarRecordsRecordList.elementAtOrNull(masterCalendarItem.recordRef)?.status == RecordStatus.confirmed ? Color(0x67679249) : Color(0xFFA5A6A8)),
                                                                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                                                                            ),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsets.all(8.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: Text(
                                                                                                                                      containerServicesRecord.title,
                                                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  if (!containerServicesRecord.fixedPrice)
                                                                                                                                    Text(
                                                                                                                                      'от',
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  Text(
                                                                                                                                    '${containerServicesRecord.price.toString()} ${FFAppConstants.currency}',
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ].divide(SizedBox(width: 4.0)),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      );
                                                                                                                    },
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ].divide(SizedBox(height: 8.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                if (FFAppState().firstTime)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Container(
                                                                                            width: 1.0,
                                                                                            height: valueOrDefault<double>(
                                                                                              functions.pinNumbers(_model.choosenDate, cabinetMastersRecord.workTime.toList(), getCurrentTimestamp)?.toDouble(),
                                                                                              2.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(),
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 10.0,
                                                                                              height: 10.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              height: 2.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            );
                                                                          } else {
                                                                            return Stack(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final planerHour = functions.createDayPlaner(cabinetMastersRecord.workTime.toList(), _model.choosenDate)?.toList() ?? [];
                                                                                      if (planerHour.isEmpty) {
                                                                                        return Center(
                                                                                          child: VacationWidget(),
                                                                                        );
                                                                                      }

                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.fromLTRB(
                                                                                          0,
                                                                                          0,
                                                                                          0,
                                                                                          12.0,
                                                                                        ),
                                                                                        primary: false,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: planerHour.length,
                                                                                        itemBuilder: (context, planerHourIndex) {
                                                                                          final planerHourItem = planerHour[planerHourIndex];
                                                                                          return Container(
                                                                                            height: valueOrDefault<double>(
                                                                                              FFAppState().hourHeight.toDouble(),
                                                                                              300.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Container(
                                                                                                  width: 40.0,
                                                                                                  height: valueOrDefault<double>(
                                                                                                    FFAppState().hourHeight.toDouble(),
                                                                                                    300.0,
                                                                                                  ),
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        dateTimeFormat(
                                                                                                          "Hm",
                                                                                                          planerHourItem,
                                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '15',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '30',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        '45',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 54.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Container(
                                                                                                    height: valueOrDefault<double>(
                                                                                                      FFAppState().hourHeight.toDouble(),
                                                                                                      300.0,
                                                                                                    ),
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 8.0)),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) {
                                                                                      final organisationCalendar = functions.organisationPlaner(tabBarRecordsRecordList.toList(), cabinetMastersRecord.workTime.toList(), _model.choosenDate)?.toList() ?? [];

                                                                                      return ListView.builder(
                                                                                        padding: EdgeInsets.zero,
                                                                                        primary: false,
                                                                                        shrinkWrap: true,
                                                                                        scrollDirection: Axis.vertical,
                                                                                        itemCount: organisationCalendar.length,
                                                                                        itemBuilder: (context, organisationCalendarIndex) {
                                                                                          final organisationCalendarItem = organisationCalendar[organisationCalendarIndex];
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  context.pushNamed(
                                                                                                    CreateRecordWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'organisationCard': serializeParam(
                                                                                                        cabinetMastersRecord,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                      'records': serializeParam(
                                                                                                        tabBarRecordsRecordList,
                                                                                                        ParamType.Document,
                                                                                                        isList: true,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'organisationCard': cabinetMastersRecord,
                                                                                                      'records': tabBarRecordsRecordList,
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                                child: Container(
                                                                                                  width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                                  height: valueOrDefault<double>(
                                                                                                    organisationCalendarItem.emptyHeight.toDouble(),
                                                                                                    100.0,
                                                                                                  ),
                                                                                                  decoration: BoxDecoration(),
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Container(
                                                                                                    width: 40.0,
                                                                                                    decoration: BoxDecoration(),
                                                                                                  ),
                                                                                                  Expanded(
                                                                                                    child: Container(
                                                                                                      height: valueOrDefault<double>(
                                                                                                        organisationCalendarItem.recordHeight.toDouble(),
                                                                                                        150.0,
                                                                                                      ),
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        borderRadius: BorderRadius.circular(12.0),
                                                                                                      ),
                                                                                                      child: Builder(
                                                                                                        builder: (context) {
                                                                                                          final recInTime = organisationCalendarItem.recordsRef.toList();

                                                                                                          return SingleChildScrollView(
                                                                                                            scrollDirection: Axis.horizontal,
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: List.generate(recInTime.length, (recInTimeIndex) {
                                                                                                                final recInTimeItem = recInTime[recInTimeIndex];
                                                                                                                return StreamBuilder<RecordsRecord>(
                                                                                                                  stream: RecordsRecord.getDocument(recInTimeItem),
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

                                                                                                                    final containerRecordsRecord = snapshot.data!;

                                                                                                                    return Container(
                                                                                                                      decoration: BoxDecoration(),
                                                                                                                      child: StreamBuilder<ServicesRecord>(
                                                                                                                        stream: ServicesRecord.getDocument(containerRecordsRecord.services.firstOrNull!),
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

                                                                                                                          final containerServicesRecord = snapshot.data!;

                                                                                                                          return InkWell(
                                                                                                                            splashColor: Colors.transparent,
                                                                                                                            focusColor: Colors.transparent,
                                                                                                                            hoverColor: Colors.transparent,
                                                                                                                            highlightColor: Colors.transparent,
                                                                                                                            onTap: () async {
                                                                                                                              context.pushNamed(
                                                                                                                                ReservePageWidget.routeName,
                                                                                                                                queryParameters: {
                                                                                                                                  'recordRef': serializeParam(
                                                                                                                                    recInTimeItem,
                                                                                                                                    ParamType.DocumentReference,
                                                                                                                                  ),
                                                                                                                                }.withoutNulls,
                                                                                                                              );
                                                                                                                            },
                                                                                                                            child: Container(
                                                                                                                              width: 100.0,
                                                                                                                              height: 130.0,
                                                                                                                              decoration: BoxDecoration(
                                                                                                                                color: containerRecordsRecord.status == RecordStatus.newREc ? Color(0xFFFF8B1F) : (containerRecordsRecord.status == RecordStatus.confirmed ? Color(0x67679249) : Color(0xFFA5A6A8)),
                                                                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                                                              ),
                                                                                                                              child: Padding(
                                                                                                                                padding: EdgeInsets.all(8.0),
                                                                                                                                child: StreamBuilder<MastersRecord>(
                                                                                                                                  stream: MastersRecord.getDocument(containerRecordsRecord.master!),
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

                                                                                                                                    final columnMastersRecord = snapshot.data!;

                                                                                                                                    return Column(
                                                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                      children: [
                                                                                                                                        Expanded(
                                                                                                                                          child: Text(
                                                                                                                                            containerServicesRecord.title,
                                                                                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                                                ),
                                                                                                                                            overflow: TextOverflow.fade,
                                                                                                                                          ),
                                                                                                                                        ),
                                                                                                                                        Text(
                                                                                                                                          valueOrDefault<String>(
                                                                                                                                            columnMastersRecord.title,
                                                                                                                                            'sxdfghsdfghdsfghdsfgh',
                                                                                                                                          ),
                                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                        Row(
                                                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                          children: [
                                                                                                                                            Text(
                                                                                                                                              dateTimeFormat(
                                                                                                                                                "HH:mm",
                                                                                                                                                containerRecordsRecord.date!,
                                                                                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                                                                                              ),
                                                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                            if (containerRecordsRecord.status == RecordStatus.newREc)
                                                                                                                                              FaIcon(
                                                                                                                                                FontAwesomeIcons.solidClock,
                                                                                                                                                color: Color(0xFFE7872F),
                                                                                                                                                size: 20.0,
                                                                                                                                              ),
                                                                                                                                            if (containerRecordsRecord.status == RecordStatus.confirmed)
                                                                                                                                              Icon(
                                                                                                                                                Icons.check_box,
                                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                                size: 20.0,
                                                                                                                                              ),
                                                                                                                                          ].divide(SizedBox(width: 8.0)),
                                                                                                                                        ),
                                                                                                                                      ].divide(SizedBox(height: 4.0)),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  },
                                                                                                                );
                                                                                                              }).divide(SizedBox(width: 8.0)).addToStart(SizedBox(width: 8.0)).addToEnd(SizedBox(width: 8.0)),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                if (FFAppState().firstTime)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                          child: Container(
                                                                                            width: 1.0,
                                                                                            height: valueOrDefault<double>(
                                                                                              functions.pinNumbers(_model.choosenDate, cabinetMastersRecord.workTime.toList(), getCurrentTimestamp)?.toDouble(),
                                                                                              2.0,
                                                                                            ),
                                                                                            decoration: BoxDecoration(),
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Container(
                                                                                              width: 10.0,
                                                                                              height: 10.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                borderRadius: BorderRadius.circular(100.0),
                                                                                              ),
                                                                                            ),
                                                                                            Container(
                                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                                              height: 2.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            );
                                                                          }
                                                                        },
                                                                      ),
                                                                    ]
                                                                        .divide(SizedBox(
                                                                            height:
                                                                                12.0))
                                                                        .addToEnd(SizedBox(
                                                                            height:
                                                                                12.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        12.0)),
                                                              ),
                                                            );
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                            CreateRecordWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'organisationCard':
                                                                  serializeParam(
                                                                cabinetMastersRecord,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                              'records':
                                                                  serializeParam(
                                                                tabBarRecordsRecordList,
                                                                ParamType
                                                                    .Document,
                                                                isList: true,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'organisationCard':
                                                                  cabinetMastersRecord,
                                                              'records':
                                                                  tabBarRecordsRecordList,
                                                            },
                                                          );
                                                        },
                                                        text:
                                                            'Добавить клиента',
                                                        icon: Icon(
                                                          Icons.add,
                                                          size: 15.0,
                                                        ),
                                                        options:
                                                            FFButtonOptions(
                                                          width: 360.0,
                                                          height: 48.0,
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          iconPadding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        'involve',
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                          elevation: 0.0,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      16.0),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) =>
                                                SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 2.0,
                                                                0.0, 2.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed:
                                                                (_model.menu ==
                                                                        null)
                                                                    ? null
                                                                    : () async {
                                                                        _model.menu =
                                                                            null;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                            text: 'Все',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 38.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed: (_model
                                                                        .menu ==
                                                                    RecordStatus
                                                                        .newREc)
                                                                ? null
                                                                : () async {
                                                                    _model.menu =
                                                                        RecordStatus
                                                                            .newREc;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: 'Новые',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 38.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed: (_model
                                                                        .menu ==
                                                                    RecordStatus
                                                                        .confirmed)
                                                                ? null
                                                                : () async {
                                                                    _model.menu =
                                                                        RecordStatus
                                                                            .confirmed;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text:
                                                                'Подтвержденные',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 38.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed: (_model
                                                                        .menu ==
                                                                    RecordStatus
                                                                        .complete)
                                                                ? null
                                                                : () async {
                                                                    _model.menu =
                                                                        RecordStatus
                                                                            .complete;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: 'Завершенные',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 38.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed: (_model
                                                                        .menu ==
                                                                    RecordStatus
                                                                        .denied)
                                                                ? null
                                                                : () async {
                                                                    _model.menu =
                                                                        RecordStatus
                                                                            .denied;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                            text: 'Отмененные',
                                                            options:
                                                                FFButtonOptions(
                                                              height: 38.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                              disabledColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                              disabledTextColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                            ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                width: 12.0))
                                                            .addToStart(
                                                                SizedBox(
                                                                    width:
                                                                        12.0))
                                                            .addToEnd(SizedBox(
                                                                width: 12.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Builder(
                                                      builder: (context) {
                                                        final tabBarVar =
                                                            tabBarRecordsRecordList
                                                                .sortedList(
                                                                    keyOf: (e) =>
                                                                        e.date!,
                                                                    desc: false)
                                                                .toList();

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              tabBarVar.length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 12.0),
                                                          itemBuilder: (context,
                                                              tabBarVarIndex) {
                                                            final tabBarVarItem =
                                                                tabBarVar[
                                                                    tabBarVarIndex];
                                                            return Visibility(
                                                              visible: _model
                                                                          .menu !=
                                                                      null
                                                                  ? (tabBarVarItem
                                                                          .status ==
                                                                      _model
                                                                          .menu)
                                                                  : true,
                                                              child: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    ReservePageWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'recordRef':
                                                                          serializeParam(
                                                                        tabBarVarItem
                                                                            .reference,
                                                                        ParamType
                                                                            .DocumentReference,
                                                                      ),
                                                                    }.withoutNulls,
                                                                  );
                                                                },
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        380.0,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          840.0,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFF5F5F5),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              16.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              12.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.start,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.center,
                                                                        children:
                                                                            [
                                                                          if (tabBarVarItem.client !=
                                                                              null)
                                                                            Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: StreamBuilder<UserRecord>(
                                                                                stream: UserRecord.getDocument(tabBarVarItem.client!),
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

                                                                                  final imageUserRecord = snapshot.data!;

                                                                                  return ClipRRect(
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                    child: Image.network(
                                                                                      imageUserRecord.photoUrl,
                                                                                      width: 85.0,
                                                                                      height: 85.0,
                                                                                      fit: BoxFit.cover,
                                                                                      errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                        'assets/images/error_image.png',
                                                                                        width: 85.0,
                                                                                        height: 85.0,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).accent2,
                                                                                        borderRadius: BorderRadius.circular(24.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(6.0),
                                                                                        child: Text(
                                                                                          dateTimeFormat(
                                                                                            "dd.MM.yy H:mm",
                                                                                            tabBarVarItem.date!,
                                                                                            locale: FFLocalizations.of(context).languageCode,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Text(
                                                                                  tabBarVarItem.title,
                                                                                  maxLines: 3,
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  tabBarVarItem.clientName,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: [
                                                                                      AutoSizeText(
                                                                                        'от',
                                                                                        maxLines: 1,
                                                                                        minFontSize: 10.0,
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                      AutoSizeText(
                                                                                        tabBarVarItem.totalCost.toString(),
                                                                                        maxLines: 1,
                                                                                        minFontSize: 10.0,
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                      AutoSizeText(
                                                                                        ' ${FFAppConstants.currency}',
                                                                                        maxLines: 1,
                                                                                        minFontSize: 10.0,
                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 4.0)),
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(height: 4.0)),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 24.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 12.0))
                                                    .addToStart(
                                                        SizedBox(height: 12.0))
                                                    .addToEnd(
                                                        SizedBox(height: 12.0)),
                                              ),
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) =>
                                                SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      child: Image.network(
                                                        cabinetMastersRecord
                                                            .banner,
                                                        width: 380.0,
                                                        height: 240.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: StreamBuilder<
                                                        UserRecord>(
                                                      stream: UserRecord
                                                          .getDocument(
                                                              cabinetMastersRecord
                                                                  .owner!),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 10.0,
                                                              height: 10.0,
                                                              child:
                                                                  SpinKitCircle(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                size: 10.0,
                                                              ),
                                                            ),
                                                          );
                                                        }

                                                        final rowUserRecord =
                                                            snapshot.data!;

                                                        return Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            wrapWithModel(
                                                              model: _model
                                                                  .avatarMiniModel1,
                                                              updateCallback: () =>
                                                                  safeSetState(
                                                                      () {}),
                                                              child:
                                                                  AvatarMiniWidget(
                                                                sizeAva: 64,
                                                                avaURL:
                                                                    rowUserRecord
                                                                        .photoUrl,
                                                              ),
                                                            ),
                                                            Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  rowUserRecord
                                                                      .displayName,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                      ),
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .star_half,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customer,
                                                                      size:
                                                                          18.0,
                                                                    ),
                                                                    Text(
                                                                      formatNumber(
                                                                        cabinetMastersRecord
                                                                            .raiting,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '#.#',
                                                                        locale:
                                                                            '',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          6.0)),
                                                                ),
                                                              ],
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: Text(
                                                        'Категория',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                  Builder(
                                                    builder: (context) {
                                                      final parent =
                                                          cabinetMastersRecord
                                                              .parentCat
                                                              .toList();

                                                      return SingleChildScrollView(
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                                  parent.length,
                                                                  (parentIndex) {
                                                            final parentItem =
                                                                parent[
                                                                    parentIndex];
                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            14.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent3,
                                                                ),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    StreamBuilder<
                                                                        CategoryRecord>(
                                                                      stream: CategoryRecord
                                                                          .getDocument(
                                                                              parentItem),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 10.0,
                                                                              height: 10.0,
                                                                              child: SpinKitCircle(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                size: 10.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }

                                                                        final textCategoryRecord =
                                                                            snapshot.data!;

                                                                        return Text(
                                                                          textCategoryRecord
                                                                              .title,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.mulish(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Text(
                                                                      ':',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.mulish(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                18.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                    ),
                                                                    StreamBuilder<
                                                                        List<
                                                                            CategoryRecord>>(
                                                                      stream:
                                                                          queryCategoryRecord(
                                                                        queryBuilder: (categoryRecord) => categoryRecord
                                                                            .where(
                                                                              'parentCat',
                                                                              isEqualTo: parentItem,
                                                                            )
                                                                            .where(
                                                                              'masters',
                                                                              arrayContains: cabinetMastersRecord.reference,
                                                                            ),
                                                                        singleRecord:
                                                                            true,
                                                                      ),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 10.0,
                                                                              height: 10.0,
                                                                              child: SpinKitCircle(
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                size: 10.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        List<CategoryRecord>
                                                                            textCategoryRecordList =
                                                                            snapshot.data!;
                                                                        // Return an empty Container when the item does not exist.
                                                                        if (snapshot
                                                                            .data!
                                                                            .isEmpty) {
                                                                          return Container();
                                                                        }
                                                                        final textCategoryRecord = textCategoryRecordList.isNotEmpty
                                                                            ? textCategoryRecordList.first
                                                                            : null;

                                                                        return Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            textCategoryRecord?.title,
                                                                            'noTitle',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.mulish(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 18.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            );
                                                          })
                                                              .divide(SizedBox(
                                                                  width: 12.0))
                                                              .addToStart(
                                                                  SizedBox(
                                                                      width:
                                                                          12.0))
                                                              .addToEnd(SizedBox(
                                                                  width: 12.0)),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            'Телефон',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            cabinetMastersRecord
                                                                .phone,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            'Локация',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            cabinetMastersRecord
                                                                .adres
                                                                .placeTitle,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            'Выезд',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            cabinetMastersRecord
                                                                        .remoteAdres !=
                                                                    null
                                                                ? 'Осуществляется'
                                                                : 'Не осуществляется',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            'График работы',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            'Смотреть',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12.0,
                                                                0.0,
                                                                12.0,
                                                                0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            'Стаж ( в годах)',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      FlutterFlowTheme.of(context)
                                                                          .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          child: Text(
                                                            cabinetMastersRecord
                                                                .years
                                                                .toString(),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelMedium
                                                                .override(
                                                                  fontFamily:
                                                                      FlutterFlowTheme.of(context)
                                                                          .labelMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(context)
                                                                          .labelMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (cabinetMastersRecord
                                                              .description !=
                                                          '')
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Об исполнителе',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (cabinetMastersRecord
                                                              .description !=
                                                          '')
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          cabinetMastersRecord
                                                              .description,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMediumFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (cabinetMastersRecord
                                                      .docs.isNotEmpty)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Text(
                                                          'Документы',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .titleMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                useGoogleFonts:
                                                                    !FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMediumIsCustom,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  if (cabinetMastersRecord
                                                      .docs.isNotEmpty)
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, -1.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final loadDocs =
                                                              cabinetMastersRecord
                                                                  .docs
                                                                  .toList();

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: List.generate(
                                                                      loadDocs
                                                                          .length,
                                                                      (loadDocsIndex) {
                                                                final loadDocsItem =
                                                                    loadDocs[
                                                                        loadDocsIndex];
                                                                return InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    await downloadFile(
                                                                      filename:
                                                                          loadDocsItem,
                                                                      url:
                                                                          loadDocsItem,
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        189.0,
                                                                    height:
                                                                        65.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFE0E0E0),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              14.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                2.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            icon:
                                                                                Icon(
                                                                              FFIcons.kdocument2,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
                                                                          ),
                                                                          Text(
                                                                            loadDocsItem.maybeHandleOverflow(
                                                                              maxChars: 10,
                                                                              replacement: '…',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 4.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              })
                                                                  .divide(SizedBox(
                                                                      width:
                                                                          12.0))
                                                                  .addToStart(
                                                                      SizedBox(
                                                                          width:
                                                                              12.0)),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Text(
                                                            'Услуги',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMediumIsCustom,
                                                                ),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: FFButtonWidget(
                                                          onPressed: () async {
                                                            context.pushNamed(
                                                              MasterAddServiceWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'masterRef':
                                                                    serializeParam(
                                                                  cabinetMastersRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'masterRef':
                                                                    cabinetMastersRecord,
                                                              },
                                                            );
                                                          },
                                                          text: 'Добавить',
                                                          icon: Icon(
                                                            Icons.add,
                                                            size: 15.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 121.0,
                                                            height: 32.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            elevation: 0.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    decoration: BoxDecoration(),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  12.0,
                                                                  0.0),
                                                      child: StreamBuilder<
                                                          List<CategoryRecord>>(
                                                        stream:
                                                            queryCategoryRecord(
                                                          queryBuilder:
                                                              (categoryRecord) =>
                                                                  categoryRecord
                                                                      .where(
                                                                        'isParent',
                                                                        isEqualTo:
                                                                            true,
                                                                      )
                                                                      .where(
                                                                        'masters',
                                                                        arrayContains:
                                                                            cabinetMastersRecord.reference,
                                                                      ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 10.0,
                                                                height: 10.0,
                                                                child:
                                                                    SpinKitCircle(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  size: 10.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<CategoryRecord>
                                                              listViewCategoryRecordList =
                                                              snapshot.data!;

                                                          return ListView
                                                              .separated(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                listViewCategoryRecordList
                                                                    .length,
                                                            separatorBuilder: (_,
                                                                    __) =>
                                                                SizedBox(
                                                                    height:
                                                                        12.0),
                                                            itemBuilder: (context,
                                                                listViewIndex) {
                                                              final listViewCategoryRecord =
                                                                  listViewCategoryRecordList[
                                                                      listViewIndex];
                                                              return Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              16.0),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      color: Color(
                                                                          0x00000000),
                                                                      child:
                                                                          ExpandableNotifier(
                                                                        initialExpanded:
                                                                            false,
                                                                        child:
                                                                            ExpandablePanel(
                                                                          header:
                                                                              Text(
                                                                            listViewCategoryRecord.title,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.mulish(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                                  fontSize: 18.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                          ),
                                                                          collapsed:
                                                                              Container(),
                                                                          expanded:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                12.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                StreamBuilder<List<CategoryRecord>>(
                                                                              stream: queryCategoryRecord(
                                                                                queryBuilder: (categoryRecord) => categoryRecord
                                                                                    .where(
                                                                                      'parentCat',
                                                                                      isEqualTo: listViewCategoryRecord.reference,
                                                                                    )
                                                                                    .where(
                                                                                      'masters',
                                                                                      arrayContains: cabinetMastersRecord.reference,
                                                                                    ),
                                                                              ),
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
                                                                                List<CategoryRecord> listViewCategoryRecordList = snapshot.data!;

                                                                                return ListView.separated(
                                                                                  padding: EdgeInsets.zero,
                                                                                  primary: false,
                                                                                  shrinkWrap: true,
                                                                                  scrollDirection: Axis.vertical,
                                                                                  itemCount: listViewCategoryRecordList.length,
                                                                                  separatorBuilder: (_, __) => SizedBox(height: 12.0),
                                                                                  itemBuilder: (context, listViewIndex) {
                                                                                    final listViewCategoryRecord = listViewCategoryRecordList[listViewIndex];
                                                                                    return Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(16.0),
                                                                                      ),
                                                                                      child: Container(
                                                                                        width: double.infinity,
                                                                                        color: Color(0x00000000),
                                                                                        child: ExpandableNotifier(
                                                                                          initialExpanded: false,
                                                                                          child: ExpandablePanel(
                                                                                            header: Text(
                                                                                              listViewCategoryRecord.title,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.mulish(
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                            collapsed: Container(),
                                                                                            expanded: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                              child: StreamBuilder<List<CategoryRecord>>(
                                                                                                stream: queryCategoryRecord(
                                                                                                  queryBuilder: (categoryRecord) => categoryRecord
                                                                                                      .where(
                                                                                                        'parentCat',
                                                                                                        isEqualTo: listViewCategoryRecord.reference,
                                                                                                      )
                                                                                                      .where(
                                                                                                        'masters',
                                                                                                        arrayContains: cabinetMastersRecord.reference,
                                                                                                      ),
                                                                                                ),
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
                                                                                                  List<CategoryRecord> listViewCategoryRecordList = snapshot.data!;

                                                                                                  return ListView.separated(
                                                                                                    padding: EdgeInsets.zero,
                                                                                                    primary: false,
                                                                                                    shrinkWrap: true,
                                                                                                    scrollDirection: Axis.vertical,
                                                                                                    itemCount: listViewCategoryRecordList.length,
                                                                                                    separatorBuilder: (_, __) => SizedBox(height: 12.0),
                                                                                                    itemBuilder: (context, listViewIndex) {
                                                                                                      final listViewCategoryRecord = listViewCategoryRecordList[listViewIndex];
                                                                                                      return Container(
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(16.0),
                                                                                                        ),
                                                                                                        child: Container(
                                                                                                          width: double.infinity,
                                                                                                          color: Color(0x00000000),
                                                                                                          child: ExpandableNotifier(
                                                                                                            initialExpanded: false,
                                                                                                            child: ExpandablePanel(
                                                                                                              header: Text(
                                                                                                                listViewCategoryRecord.title,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      font: GoogleFonts.mulish(
                                                                                                                        fontWeight: FontWeight.w600,
                                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                      ),
                                                                                                                      fontSize: 18.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              collapsed: Container(),
                                                                                                              expanded: Container(
                                                                                                                decoration: BoxDecoration(),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                                                  child: StreamBuilder<List<ServicesRecord>>(
                                                                                                                    stream: queryServicesRecord(
                                                                                                                      queryBuilder: (servicesRecord) => servicesRecord
                                                                                                                          .where(
                                                                                                                            'category',
                                                                                                                            arrayContains: listViewCategoryRecord.reference,
                                                                                                                          )
                                                                                                                          .where(
                                                                                                                            'organisation',
                                                                                                                            isEqualTo: cabinetMastersRecord.reference,
                                                                                                                          ),
                                                                                                                    ),
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
                                                                                                                      List<ServicesRecord> listViewServicesRecordList = snapshot.data!;

                                                                                                                      return ListView.separated(
                                                                                                                        padding: EdgeInsets.zero,
                                                                                                                        primary: false,
                                                                                                                        shrinkWrap: true,
                                                                                                                        scrollDirection: Axis.vertical,
                                                                                                                        itemCount: listViewServicesRecordList.length,
                                                                                                                        separatorBuilder: (_, __) => SizedBox(height: 12.0),
                                                                                                                        itemBuilder: (context, listViewIndex) {
                                                                                                                          final listViewServicesRecord = listViewServicesRecordList[listViewIndex];
                                                                                                                          return Container(
                                                                                                                            decoration: BoxDecoration(
                                                                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                              borderRadius: BorderRadius.circular(16.0),
                                                                                                                            ),
                                                                                                                            child: Padding(
                                                                                                                              padding: EdgeInsets.all(12.0),
                                                                                                                              child: Row(
                                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                                                children: [
                                                                                                                                  Expanded(
                                                                                                                                    child: Text(
                                                                                                                                      listViewServicesRecord.title,
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            font: GoogleFonts.mulish(
                                                                                                                                              fontWeight: FontWeight.w600,
                                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                            ),
                                                                                                                                            fontSize: 18.0,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                            fontWeight: FontWeight.w600,
                                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                  if (!listViewServicesRecord.fixedPrice)
                                                                                                                                    Text(
                                                                                                                                      'от',
                                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                            font: GoogleFonts.mulish(
                                                                                                                                              fontWeight: FontWeight.normal,
                                                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                            ),
                                                                                                                                            fontSize: 18.0,
                                                                                                                                            letterSpacing: 0.0,
                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                          ),
                                                                                                                                    ),
                                                                                                                                  Text(
                                                                                                                                    listViewServicesRecord.price.toString(),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          font: GoogleFonts.mulish(
                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                          ),
                                                                                                                                          fontSize: 18.0,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                  Text(
                                                                                                                                    FFAppConstants.currency,
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          font: GoogleFonts.mulish(
                                                                                                                                            fontWeight: FontWeight.normal,
                                                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                          ),
                                                                                                                                          fontSize: 18.0,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                          fontWeight: FontWeight.normal,
                                                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                  Builder(
                                                                                                                                    builder: (context) => InkWell(
                                                                                                                                      splashColor: Colors.transparent,
                                                                                                                                      focusColor: Colors.transparent,
                                                                                                                                      hoverColor: Colors.transparent,
                                                                                                                                      highlightColor: Colors.transparent,
                                                                                                                                      onTap: () async {
                                                                                                                                        await showDialog(
                                                                                                                                          context: context,
                                                                                                                                          builder: (dialogContext) {
                                                                                                                                            return Dialog(
                                                                                                                                              elevation: 0,
                                                                                                                                              insetPadding: EdgeInsets.zero,
                                                                                                                                              backgroundColor: Colors.transparent,
                                                                                                                                              alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                              child: GestureDetector(
                                                                                                                                                onTap: () {
                                                                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                                },
                                                                                                                                                child: CabenetMasterDelServWidget(
                                                                                                                                                  servREf: listViewServicesRecord.reference,
                                                                                                                                                ),
                                                                                                                                              ),
                                                                                                                                            );
                                                                                                                                          },
                                                                                                                                        );
                                                                                                                                      },
                                                                                                                                      child: Icon(
                                                                                                                                        Icons.close,
                                                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                        size: 24.0,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ].divide(SizedBox(width: 8.0)),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              theme: ExpandableThemeData(
                                                                                                                tapHeaderToExpand: true,
                                                                                                                tapBodyToExpand: false,
                                                                                                                tapBodyToCollapse: false,
                                                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                                                hasIcon: true,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            theme: ExpandableThemeData(
                                                                                              tapHeaderToExpand: true,
                                                                                              tapBodyToExpand: false,
                                                                                              tapBodyToCollapse: false,
                                                                                              headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                              hasIcon: true,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                );
                                                                              },
                                                                            ),
                                                                          ),
                                                                          theme:
                                                                              ExpandableThemeData(
                                                                            tapHeaderToExpand:
                                                                                true,
                                                                            tapBodyToExpand:
                                                                                false,
                                                                            tapBodyToCollapse:
                                                                                false,
                                                                            headerAlignment:
                                                                                ExpandablePanelHeaderAlignment.center,
                                                                            hasIcon:
                                                                                true,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Expanded(
                                                              child: Builder(
                                                                builder:
                                                                    (context) =>
                                                                        FFButtonWidget(
                                                                  onPressed:
                                                                      () async {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (dialogContext) {
                                                                        return Dialog(
                                                                          elevation:
                                                                              0,
                                                                          insetPadding:
                                                                              EdgeInsets.zero,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          alignment:
                                                                              AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                          child:
                                                                              GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              FocusScope.of(dialogContext).unfocus();
                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                            },
                                                                            child:
                                                                                CabenetMasterDeletePROFILEWidget(
                                                                              organisation: cabinetMastersRecord,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  text:
                                                                      'Удалить',
                                                                  options:
                                                                      FFButtonOptions(
                                                                    height:
                                                                        48.0,
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            16.0,
                                                                            0.0,
                                                                            16.0,
                                                                            0.0),
                                                                    iconPadding:
                                                                        EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    textStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelLarge
                                                                        .override(
                                                                          fontFamily:
                                                                              'involve',
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                        ),
                                                                    elevation:
                                                                        0.0,
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryText,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            16.0),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child:
                                                                  FFButtonWidget(
                                                                onPressed:
                                                                    () async {
                                                                  context
                                                                      .pushNamed(
                                                                    CcabinetMasterEDITWidget
                                                                        .routeName,
                                                                    queryParameters:
                                                                        {
                                                                      'masterDOCC':
                                                                          serializeParam(
                                                                        cabinetMastersRecord,
                                                                        ParamType
                                                                            .Document,
                                                                      ),
                                                                    }.withoutNulls,
                                                                    extra: <String,
                                                                        dynamic>{
                                                                      'masterDOCC':
                                                                          cabinetMastersRecord,
                                                                    },
                                                                  );
                                                                },
                                                                text:
                                                                    'Редактировать',
                                                                options:
                                                                    FFButtonOptions(
                                                                  height: 48.0,
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  iconPadding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'involve',
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                                  elevation:
                                                                      0.0,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 12.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ]
                                                    .divide(
                                                        SizedBox(height: 12.0))
                                                    .addToStart(
                                                        SizedBox(height: 40.0))
                                                    .addToEnd(
                                                        SizedBox(height: 12.0)),
                                              ),
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => StreamBuilder<
                                                List<ReviewsRecord>>(
                                              stream: queryReviewsRecord(
                                                queryBuilder: (reviewsRecord) =>
                                                    reviewsRecord
                                                        .where(
                                                          'master',
                                                          isEqualTo:
                                                              cabinetMastersRecord
                                                                  .reference,
                                                        )
                                                        .orderBy('date',
                                                            descending: true),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      child: SpinKitCircle(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 10.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<ReviewsRecord>
                                                    containerReviewsRecordList =
                                                    snapshot.data!;

                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: SingleChildScrollView(
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      formatNumber(
                                                                        cabinetMastersRecord
                                                                            .raiting,
                                                                        formatType:
                                                                            FormatType.custom,
                                                                        format:
                                                                            '#.#',
                                                                        locale:
                                                                            '',
                                                                      ),
                                                                      '0.0',
                                                                    ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.geologica(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                          ),
                                                                          fontSize:
                                                                              40.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .fontStyle,
                                                                        ),
                                                                  ),
                                                                  RatingBarIndicator(
                                                                    itemBuilder:
                                                                        (context,
                                                                                index) =>
                                                                            Icon(
                                                                      Icons
                                                                          .star_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customer,
                                                                    ),
                                                                    direction: Axis
                                                                        .horizontal,
                                                                    rating: cabinetMastersRecord
                                                                        .raiting,
                                                                    unratedColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .accent2,
                                                                    itemCount:
                                                                        5,
                                                                    itemSize:
                                                                        20.0,
                                                                  ),
                                                                  Text(
                                                                    '(${valueOrDefault<String>(
                                                                      containerReviewsRecordList
                                                                          .length
                                                                          .toString(),
                                                                      '0',
                                                                    )})',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                              Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '5',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      LinearPercentIndicator(
                                                                        percent:
                                                                            containerReviewsRecordList.where((e) => e.star == 5.0).toList().length /
                                                                                containerReviewsRecordList.length,
                                                                        width: () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return true;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return false;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return false;
                                                                          } else {
                                                                            return false;
                                                                          }
                                                                        }()
                                                                            ? 172.0
                                                                            : 550.0,
                                                                        lineHeight:
                                                                            6.0,
                                                                        animation:
                                                                            false,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).accent4,
                                                                        barRadius:
                                                                            Radius.circular(100.0),
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '4',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      LinearPercentIndicator(
                                                                        percent:
                                                                            containerReviewsRecordList.where((e) => e.star == 4.0).toList().length /
                                                                                containerReviewsRecordList.length,
                                                                        width: () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return true;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return false;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return false;
                                                                          } else {
                                                                            return false;
                                                                          }
                                                                        }()
                                                                            ? 172.0
                                                                            : 550.0,
                                                                        lineHeight:
                                                                            6.0,
                                                                        animation:
                                                                            false,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).accent4,
                                                                        barRadius:
                                                                            Radius.circular(100.0),
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '3',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      LinearPercentIndicator(
                                                                        percent:
                                                                            containerReviewsRecordList.where((e) => e.star == 3.0).toList().length /
                                                                                containerReviewsRecordList.length,
                                                                        width: () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return true;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return false;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return false;
                                                                          } else {
                                                                            return false;
                                                                          }
                                                                        }()
                                                                            ? 172.0
                                                                            : 550.0,
                                                                        lineHeight:
                                                                            6.0,
                                                                        animation:
                                                                            false,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).accent4,
                                                                        barRadius:
                                                                            Radius.circular(100.0),
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '2',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      LinearPercentIndicator(
                                                                        percent:
                                                                            containerReviewsRecordList.where((e) => e.star == 2.0).toList().length /
                                                                                containerReviewsRecordList.length,
                                                                        width: () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return true;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return false;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return false;
                                                                          } else {
                                                                            return false;
                                                                          }
                                                                        }()
                                                                            ? 172.0
                                                                            : 550.0,
                                                                        lineHeight:
                                                                            6.0,
                                                                        animation:
                                                                            false,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).accent4,
                                                                        barRadius:
                                                                            Radius.circular(100.0),
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        '1',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              fontSize: 12.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      LinearPercentIndicator(
                                                                        percent:
                                                                            containerReviewsRecordList.where((e) => e.star == 1.0).toList().length /
                                                                                containerReviewsRecordList.length,
                                                                        width: () {
                                                                          if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointSmall) {
                                                                            return true;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointMedium) {
                                                                            return false;
                                                                          } else if (MediaQuery.sizeOf(context).width <
                                                                              kBreakpointLarge) {
                                                                            return false;
                                                                          } else {
                                                                            return false;
                                                                          }
                                                                        }()
                                                                            ? 172.0
                                                                            : 550.0,
                                                                        lineHeight:
                                                                            6.0,
                                                                        animation:
                                                                            false,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            FlutterFlowTheme.of(context).primary,
                                                                        backgroundColor:
                                                                            FlutterFlowTheme.of(context).accent4,
                                                                        barRadius:
                                                                            Radius.circular(100.0),
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            8.0)),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        6.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 12.0)),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final loadREviews =
                                                                  containerReviewsRecordList
                                                                      .toList();
                                                              if (loadREviews
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child:
                                                                      EmptyREviewsWidget(),
                                                                );
                                                              }

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    loadREviews
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        loadREviewsIndex) {
                                                                  final loadREviewsItem =
                                                                      loadREviews[
                                                                          loadREviewsIndex];
                                                                  return Container(
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children:
                                                                          [
                                                                        StreamBuilder<
                                                                            UserRecord>(
                                                                          stream:
                                                                              UserRecord.getDocument(loadREviewsItem.author!),
                                                                          builder:
                                                                              (context, snapshot) {
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

                                                                            final rowUserRecord =
                                                                                snapshot.data!;

                                                                            return Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                AvatarMiniWidget(
                                                                                  key: Key('Keyq6y_${loadREviewsIndex}_of_${loadREviews.length}'),
                                                                                  sizeAva: 54,
                                                                                  avaURL: rowUserRecord.photoUrl,
                                                                                ),
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Text(
                                                                                      rowUserRecord.displayName,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Text(
                                                                                      dateTimeFormat(
                                                                                        "dd/MM/yyyy",
                                                                                        loadREviewsItem.date!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: RatingBarIndicator(
                                                                                        itemBuilder: (context, index) => Icon(
                                                                                          Icons.star_rounded,
                                                                                          color: FlutterFlowTheme.of(context).warning,
                                                                                        ),
                                                                                        direction: Axis.horizontal,
                                                                                        rating: loadREviewsItem.star,
                                                                                        unratedColor: FlutterFlowTheme.of(context).accent2,
                                                                                        itemCount: 5,
                                                                                        itemSize: 24.0,
                                                                                      ),
                                                                                    ),
                                                                                    StreamBuilder<MastersRecord>(
                                                                                      stream: MastersRecord.getDocument(loadREviewsItem.master!),
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

                                                                                        final containerMastersRecord = snapshot.data!;

                                                                                        return Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(100.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsets.all(6.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Исполнитель: ',
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    containerMastersRecord.title,
                                                                                                    'asdfasdfasdfasdfasdf',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ].divide(SizedBox(height: 12.0)),
                                                                                ),
                                                                              ].divide(SizedBox(width: 12.0)),
                                                                            );
                                                                          },
                                                                        ),
                                                                        if (loadREviewsItem
                                                                            .photos
                                                                            .isNotEmpty)
                                                                          Builder(
                                                                            builder:
                                                                                (context) {
                                                                              final photos = loadREviewsItem.photos.toList().take(3).toList();

                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: List.generate(photos.length, (photosIndex) {
                                                                                  final photosItem = photos[photosIndex];
                                                                                  return InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      await Navigator.push(
                                                                                        context,
                                                                                        PageTransition(
                                                                                          type: PageTransitionType.fade,
                                                                                          child: FlutterFlowExpandedImageView(
                                                                                            image: Image.network(
                                                                                              photosItem,
                                                                                              fit: BoxFit.contain,
                                                                                            ),
                                                                                            allowRotation: false,
                                                                                            tag: photosItem,
                                                                                            useHeroAnimation: true,
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                    child: Hero(
                                                                                      tag: photosItem,
                                                                                      transitionOnUserGestures: true,
                                                                                      child: ClipRRect(
                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                        child: Image.network(
                                                                                          photosItem,
                                                                                          width: 96.0,
                                                                                          height: 96.0,
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }).divide(SizedBox(width: 12.0)),
                                                                              );
                                                                            },
                                                                          ),
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.circle,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 8.0,
                                                                                    ),
                                                                                    Text(
                                                                                      'Пунктуальность',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      loadREviewsItem.punctuality.toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.circle,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 8.0,
                                                                                    ),
                                                                                    Text(
                                                                                      'Клиентоориентированность',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      loadREviewsItem.clientCind.toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.circle,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 8.0,
                                                                                    ),
                                                                                    Text(
                                                                                      'Вежливость',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      loadREviewsItem.politeness.toString(),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      size: 18.0,
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ].divide(SizedBox(height: 12.0)),
                                                                        ),
                                                                        if (loadREviewsItem.comment !=
                                                                                '')
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, 0.0),
                                                                            child:
                                                                                Text(
                                                                              loadREviewsItem.comment,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                      ].divide(SizedBox(
                                                                              height: 12.0)),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 12.0)),
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          KeepAliveWidgetWrapper(
                                            builder: (context) => Builder(
                                              builder: (context) {
                                                if (currentUserDocument
                                                        ?.essence ==
                                                    UserStatus.manager) {
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        'Необходимо создать карточку организации',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .displayMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .geologica(
                                                                    fontWeight: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displayMedium
                                                                        .fontWeight,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .displayMedium
                                                                        .fontStyle,
                                                                  ),
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displayMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .displayMedium
                                                                      .fontStyle,
                                                                ),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(12.0, 0.0,
                                                                12.0, 0.0),
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Builder(
                                                            builder: (context) {
                                                              final workers =
                                                                  cabinetMastersRecord
                                                                      .worker
                                                                      .toList();
                                                              if (workers
                                                                  .isEmpty) {
                                                                return Center(
                                                                  child:
                                                                      EmptyWidjetWidget(),
                                                                );
                                                              }

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                primary: false,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    workers
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        workersIndex) {
                                                                  final workersItem =
                                                                      workers[
                                                                          workersIndex];
                                                                  return StreamBuilder<
                                                                      MastersRecord>(
                                                                    stream: MastersRecord
                                                                        .getDocument(
                                                                            workersItem),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                10.0,
                                                                            height:
                                                                                10.0,
                                                                            child:
                                                                                SpinKitCircle(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              size: 10.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      final containerMastersRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          boxShadow: [
                                                                            BoxShadow(
                                                                              blurRadius: 4.0,
                                                                              color: Color(0x33000000),
                                                                              offset: Offset(
                                                                                0.0,
                                                                                2.0,
                                                                              ),
                                                                            )
                                                                          ],
                                                                          borderRadius:
                                                                              BorderRadius.circular(16.0),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(8.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                  child: Image.network(
                                                                                    containerMastersRecord.banner,
                                                                                    width: 85.0,
                                                                                    height: 85.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    containerMastersRecord.title,
                                                                                    style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Icon(
                                                                                        Icons.star_half,
                                                                                        color: FlutterFlowTheme.of(context).warning,
                                                                                        size: 18.0,
                                                                                      ),
                                                                                      Text(
                                                                                        cabinetMastersRecord.raiting.toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ].addToStart(SizedBox(width: 4.0)),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 12.0)),
                                                                              ),
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) => Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                      child: InkWell(
                                                                                        splashColor: Colors.transparent,
                                                                                        focusColor: Colors.transparent,
                                                                                        hoverColor: Colors.transparent,
                                                                                        highlightColor: Colors.transparent,
                                                                                        onTap: () async {
                                                                                          await showDialog(
                                                                                            context: context,
                                                                                            builder: (dialogContext) {
                                                                                              return Dialog(
                                                                                                elevation: 0,
                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                backgroundColor: Colors.transparent,
                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                child: GestureDetector(
                                                                                                  onTap: () {
                                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                  },
                                                                                                  child: CabenetMasterDeleteWidget(
                                                                                                    master: containerMastersRecord,
                                                                                                    organisation: cabinetMastersRecord.reference,
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                        child: FaIcon(
                                                                                          FontAwesomeIcons.trash,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          size: 18.0,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 12.0)),
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              context.pushNamed(
                                                                  MasterSearchWidget
                                                                      .routeName);
                                                            },
                                                            text: 'Добавить',
                                                            icon: Icon(
                                                              Icons.add,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 360.0,
                                                              height: 48.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            'involve',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                          ),
                                                        ]
                                                            .divide(SizedBox(
                                                                height: 12.0))
                                                            .addToStart(
                                                                SizedBox(
                                                                    height:
                                                                        12.0))
                                                            .addToEnd(SizedBox(
                                                                height: 12.0)),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 12.0))
                            .addToStart(SizedBox(height: 40.0))
                            .addToEnd(SizedBox(height: 100.0)),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        desktop: false,
                      ))
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: wrapWithModel(
                            model: _model.menuModel,
                            updateCallback: () => safeSetState(() {}),
                            child: MenuWidget(
                              currentPage: CurrentPage.work,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
