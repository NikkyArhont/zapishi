import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/aaazapishi/components/empty_widjet/empty_widjet_widget.dart';
import '/aaazapishi/components/menu/menu_widget.dart';
import '/aaazapishi/components/my_job_status/my_job_status_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_records_model.dart';
export 'my_records_model.dart';

class MyRecordsWidget extends StatefulWidget {
  const MyRecordsWidget({super.key});

  static String routeName = 'myRecords';
  static String routePath = '/myRecords';

  @override
  State<MyRecordsWidget> createState() => _MyRecordsWidgetState();
}

class _MyRecordsWidgetState extends State<MyRecordsWidget> {
  late MyRecordsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyRecordsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child: Stack(
            children: [
              StreamBuilder<List<RecordsRecord>>(
                stream: queryRecordsRecord(
                  queryBuilder: (recordsRecord) => recordsRecord.where(
                    'client',
                    isEqualTo: currentUserReference,
                  ),
                ),
                builder: (context, snapshot) {
                  // Customize what your widget looks like when it's loading.
                  if (!snapshot.hasData) {
                    return Center(
                      child: SizedBox(
                        width: 50.0,
                        height: 50.0,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            FlutterFlowTheme.of(context).primary,
                          ),
                        ),
                      ),
                    );
                  }
                  List<RecordsRecord> containerRecordsRecordList =
                      snapshot.data!;

                  return Container(
                    decoration: BoxDecoration(),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                wrapWithModel(
                                  model: _model.backbuttonModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: BackbuttonWidget(),
                                ),
                                Text(
                                  'Записи',
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
                                        letterSpacing: 0.0,
                                        fontWeight: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontWeight,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .displayMedium
                                            .fontStyle,
                                      ),
                                ),
                                Icon(
                                  Icons.arrow_back,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  size: 24.0,
                                ),
                              ],
                            ),
                          ),
                          Text(
                            'Предстоящие записи',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.geologica(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final futureRecord = containerRecordsRecordList
                                    .where(
                                        (e) => e.date! >= getCurrentTimestamp)
                                    .toList();
                                if (futureRecord.isEmpty) {
                                  return EmptyWidjetWidget();
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: futureRecord.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, futureRecordIndex) {
                                    final futureRecordItem =
                                        futureRecord[futureRecordIndex];
                                    return StreamBuilder<ServicesRecord>(
                                      stream: ServicesRecord.getDocument(
                                          futureRecordItem
                                              .services.firstOrNull!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final containerServicesRecord =
                                            snapshot.data!;

                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              RecordPageWidget.routeName,
                                              queryParameters: {
                                                'recordRef': serializeParam(
                                                  futureRecordItem.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Container(
                                              width: 380.0,
                                              constraints: BoxConstraints(
                                                maxWidth: 840.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      child: Image.network(
                                                        containerServicesRecord
                                                            .photo.firstOrNull!,
                                                        width: 85.0,
                                                        height: 85.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              6.0),
                                                                      child:
                                                                          Text(
                                                                        dateTimeFormat(
                                                                          "dd.MM.yy HH:mm",
                                                                          futureRecordItem
                                                                              .date!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                              MyJobStatusWidget(
                                                                key: Key(
                                                                    'Keyekl_${futureRecordIndex}_of_${futureRecord.length}'),
                                                                jobStatus:
                                                                    futureRecordItem
                                                                        .status!,
                                                              ),
                                                              Text(
                                                                futureRecordItem
                                                                    .title,
                                                                maxLines: 3,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleMediumIsCustom,
                                                                    ),
                                                              ),
                                                              StreamBuilder<
                                                                  MastersRecord>(
                                                                stream: MastersRecord
                                                                    .getDocument(
                                                                        futureRecordItem
                                                                            .master!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  final rowMastersRecord =
                                                                      snapshot
                                                                          .data!;

                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        rowMastersRecord
                                                                            .manager,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Icon(
                                                                        FFIcons
                                                                            .kstar2,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customer,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          formatNumber(
                                                                            rowMastersRecord.raiting,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '#.#',
                                                                            locale:
                                                                                '',
                                                                          ),
                                                                          '0.0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            6.0)),
                                                                  );
                                                                },
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  AutoSizeText(
                                                                    'от',
                                                                    maxLines: 1,
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  AutoSizeText(
                                                                    futureRecordItem
                                                                        .totalCost
                                                                        .toString(),
                                                                    maxLines: 1,
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  AutoSizeText(
                                                                    ' ${FFAppConstants.currency}',
                                                                    maxLines: 1,
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 24.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          Text(
                            'Состоявшиеся записи',
                            style: FlutterFlowTheme.of(context)
                                .headlineLarge
                                .override(
                                  font: GoogleFonts.geologica(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .headlineLarge
                                        .fontStyle,
                                  ),
                                  fontSize: 20.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .headlineLarge
                                      .fontStyle,
                                ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Builder(
                              builder: (context) {
                                final pastRecord = containerRecordsRecordList
                                    .where(
                                        (e) => e.date! <= getCurrentTimestamp)
                                    .toList();
                                if (pastRecord.isEmpty) {
                                  return EmptyWidjetWidget();
                                }

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  primary: false,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: pastRecord.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 12.0),
                                  itemBuilder: (context, pastRecordIndex) {
                                    final pastRecordItem =
                                        pastRecord[pastRecordIndex];
                                    return StreamBuilder<ServicesRecord>(
                                      stream: ServicesRecord.getDocument(
                                          pastRecordItem.services.firstOrNull!),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        final containerServicesRecord =
                                            snapshot.data!;

                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            context.pushNamed(
                                              RecordPageWidget.routeName,
                                              queryParameters: {
                                                'recordRef': serializeParam(
                                                  pastRecordItem.reference,
                                                  ParamType.DocumentReference,
                                                ),
                                              }.withoutNulls,
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(16.0),
                                            child: Container(
                                              width: 380.0,
                                              constraints: BoxConstraints(
                                                maxWidth: 840.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF5F5F5),
                                                borderRadius:
                                                    BorderRadius.circular(16.0),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(12.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                      child: Image.network(
                                                        containerServicesRecord
                                                            .photo.firstOrNull!,
                                                        width: 85.0,
                                                        height: 85.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .accent2,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              24.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              6.0),
                                                                      child:
                                                                          Text(
                                                                        dateTimeFormat(
                                                                          "dd.MM.yy HH:mm",
                                                                          pastRecordItem
                                                                              .date!,
                                                                          locale:
                                                                              FFLocalizations.of(context).languageCode,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  if (pastRecordItem
                                                                          .revievs !=
                                                                      null)
                                                                    StreamBuilder<
                                                                        ReviewsRecord>(
                                                                      stream: ReviewsRecord.getDocument(
                                                                          pastRecordItem
                                                                              .revievs!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: CircularProgressIndicator(
                                                                                valueColor: AlwaysStoppedAnimation<Color>(
                                                                                  FlutterFlowTheme.of(context).primary,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }

                                                                        final ratingBarReviewsRecord =
                                                                            snapshot.data!;

                                                                        return RatingBarIndicator(
                                                                          itemBuilder: (context, index) =>
                                                                              Icon(
                                                                            Icons.star_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).warning,
                                                                          ),
                                                                          direction:
                                                                              Axis.horizontal,
                                                                          rating:
                                                                              ratingBarReviewsRecord.star,
                                                                          unratedColor:
                                                                              FlutterFlowTheme.of(context).accent3,
                                                                          itemCount:
                                                                              5,
                                                                          itemSize:
                                                                              18.0,
                                                                        );
                                                                      },
                                                                    ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        12.0)),
                                                              ),
                                                              Text(
                                                                pastRecordItem
                                                                    .title,
                                                                maxLines: 3,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleMediumIsCustom,
                                                                    ),
                                                              ),
                                                              StreamBuilder<
                                                                  MastersRecord>(
                                                                stream: MastersRecord
                                                                    .getDocument(
                                                                        pastRecordItem
                                                                            .master!),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          valueColor:
                                                                              AlwaysStoppedAnimation<Color>(
                                                                            FlutterFlowTheme.of(context).primary,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }

                                                                  final rowMastersRecord =
                                                                      snapshot
                                                                          .data!;

                                                                  return Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Text(
                                                                        rowMastersRecord
                                                                            .manager,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Icon(
                                                                        FFIcons
                                                                            .kstar2,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customer,
                                                                        size:
                                                                            18.0,
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          formatNumber(
                                                                            rowMastersRecord.raiting,
                                                                            formatType:
                                                                                FormatType.custom,
                                                                            format:
                                                                                '#.#',
                                                                            locale:
                                                                                '',
                                                                          ),
                                                                          '0.0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            6.0)),
                                                                  );
                                                                },
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  AutoSizeText(
                                                                    'от',
                                                                    maxLines: 1,
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  AutoSizeText(
                                                                    pastRecordItem
                                                                        .totalCost
                                                                        .toString(),
                                                                    maxLines: 1,
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  AutoSizeText(
                                                                    ' ${FFAppConstants.currency}',
                                                                    maxLines: 1,
                                                                    minFontSize:
                                                                        10.0,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    width:
                                                                        4.0)),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 4.0)),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 24.0)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ]
                            .divide(SizedBox(height: 12.0))
                            .addToStart(SizedBox(height: 40.0))
                            .addToEnd(SizedBox(height: 120.0)),
                      ),
                    ),
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.menuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MenuWidget(
                    currentPage: CurrentPage.records,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
