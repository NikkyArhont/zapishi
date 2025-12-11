import '/aaazapishi/admin/admin_menu/admin_menu_widget.dart';
import '/aaazapishi/admin/admin_top/admin_top_widget.dart';
import '/aaazapishi/components/empty_widjet/empty_widjet_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'admin_orders_model.dart';
export 'admin_orders_model.dart';

class AdminOrdersWidget extends StatefulWidget {
  const AdminOrdersWidget({super.key});

  static String routeName = 'adminOrders';
  static String routePath = '/adminOrders';

  @override
  State<AdminOrdersWidget> createState() => _AdminOrdersWidgetState();
}

class _AdminOrdersWidgetState extends State<AdminOrdersWidget> {
  late AdminOrdersModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminOrdersModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.hidden = false;
      _model.filter = [];
      _model.setFilter = false;
      safeSetState(() {});
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 2,
                child: wrapWithModel(
                  model: _model.adminMenuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AdminMenuWidget(
                    currentAdminPage: AdminMenu.orders,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: StreamBuilder<List<ServicesRecord>>(
                  stream: queryServicesRecord(
                    queryBuilder: (servicesRecord) =>
                        servicesRecord.orderBy('whenCreate', descending: true),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 10.0,
                          height: 10.0,
                          child: SpinKitCircle(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            size: 10.0,
                          ),
                        ),
                      );
                    }
                    List<ServicesRecord> containerServicesRecordList =
                        snapshot.data!;

                    return Container(
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            wrapWithModel(
                              model: _model.adminTopModel,
                              updateCallback: () => safeSetState(() {}),
                              child: AdminTopWidget(
                                title: 'Объявления',
                                main: true,
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.hidden = false;
                                          safeSetState(() {});
                                        },
                                        child: Text(
                                          'Опубликованы',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color: !_model.hidden!
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .labelLargeIsCustom,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width: 120.0,
                                        height: 4.0,
                                        decoration: BoxDecoration(
                                          color: !_model.hidden!
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.hidden = true;
                                          safeSetState(() {});
                                        },
                                        child: Text(
                                          'Архив',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color: _model.hidden!
                                                    ? FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText
                                                    : FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .labelLargeIsCustom,
                                              ),
                                        ),
                                      ),
                                      Container(
                                        width: 60.0,
                                        height: 4.0,
                                        decoration: BoxDecoration(
                                          color: _model.hidden!
                                              ? FlutterFlowTheme.of(context)
                                                  .primaryText
                                              : FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 12.0)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                            Expanded(
                              child: Builder(
                                builder: (context) {
                                  if (!_model.setFilter) {
                                    return Builder(
                                      builder: (context) {
                                        if (!_model.hidden!) {
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24.0),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                maxWidth: 1440.0,
                                                maxHeight: 900.0,
                                              ),
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                ),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
                                                                  12.0,
                                                                  24.0,
                                                                  12.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: 400.0,
                                                            child:
                                                                TextFormField(
                                                              controller: _model
                                                                  .textController1,
                                                              focusNode: _model
                                                                  .textFieldFocusNode1,
                                                              onChanged: (_) =>
                                                                  EasyDebounce
                                                                      .debounce(
                                                                '_model.textController1',
                                                                Duration(
                                                                    milliseconds:
                                                                        100),
                                                                () async {
                                                                  safeSetState(
                                                                      () {
                                                                    _model.simpleSearchResults1 =
                                                                        TextSearch(
                                                                      containerServicesRecordList
                                                                          .where((e) =>
                                                                              e.status ==
                                                                              ServiceStatus.show)
                                                                          .toList()
                                                                          .map(
                                                                            (record) =>
                                                                                TextSearchItem.fromTerms(record, [
                                                                              record.title
                                                                            ]),
                                                                          )
                                                                          .toList(),
                                                                    )
                                                                            .search(_model
                                                                                .textController1.text)
                                                                            .map((r) =>
                                                                                r.object)
                                                                            .toList();
                                                                    ;
                                                                  });
                                                                },
                                                              ),
                                                              autofocus: false,
                                                              obscureText:
                                                                  false,
                                                              decoration:
                                                                  InputDecoration(
                                                                isDense: false,
                                                                labelStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                                hintText:
                                                                    'Поиск',
                                                                hintStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      color: Color(
                                                                          0xFFBDBDBD),
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                                enabledBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                focusedBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: Color(
                                                                        0x00000000),
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                errorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                focusedErrorBorder:
                                                                    OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .error,
                                                                    width: 1.0,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              16.0),
                                                                ),
                                                                filled: true,
                                                                fillColor: (_model
                                                                            .textFieldFocusNode1?.hasFocus ??
                                                                        false)
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .accent4,
                                                                prefixIcon:
                                                                    Icon(
                                                                  Icons.search,
                                                                  size: 20.0,
                                                                ),
                                                              ),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    fontSize:
                                                                        16.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                              maxLength: 40,
                                                              buildCounter: (context,
                                                                      {required currentLength,
                                                                      required isFocused,
                                                                      maxLength}) =>
                                                                  null,
                                                              cursorColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                              validator: _model
                                                                  .textController1Validator
                                                                  .asValidator(
                                                                      context),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderRadius: 16.0,
                                                            buttonSize: 48.0,
                                                            fillColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .tertiary,
                                                            icon: Icon(
                                                              FFIcons.kfilter2,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryText,
                                                              size: 16.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              _model.setFilter =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 24.0)),
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  24.0,
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
                                                          Container(
                                                            width: 200.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Дата публикации',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 200.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Категория',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 200.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Подкатегория',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 200.0,
                                                            height: 30.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Text(
                                                                'Название услуги',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelSmallIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 24.0,
                                                            height: 24.0,
                                                            decoration:
                                                                BoxDecoration(),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      thickness: 2.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                    ),
                                                    if (_model.textController1
                                                                .text ==
                                                            '')
                                                      Builder(
                                                        builder: (context) {
                                                          final noSearchServ =
                                                              containerServicesRecordList
                                                                  .where((e) =>
                                                                      e.status ==
                                                                      ServiceStatus
                                                                          .show)
                                                                  .toList();
                                                          if (noSearchServ
                                                              .isEmpty) {
                                                            return EmptyWidjetWidget();
                                                          }

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                noSearchServ
                                                                    .length,
                                                            itemBuilder: (context,
                                                                noSearchServIndex) {
                                                              final noSearchServItem =
                                                                  noSearchServ[
                                                                      noSearchServIndex];
                                                              return Visibility(
                                                                visible: !(_model
                                                                        .filter
                                                                        .isNotEmpty) ||
                                                                    functions.checkCatFilter(
                                                                        noSearchServItem
                                                                            .category
                                                                            .toList(),
                                                                        _model
                                                                            .filter
                                                                            .toList())!,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            AdminServicePageWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'serviceRef': serializeParam(
                                                                                noSearchServItem.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              width: 200.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Text(
                                                                                dateTimeFormat(
                                                                                  "HH:mm dd.MM.yy",
                                                                                  noSearchServItem.whenCreate!,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            StreamBuilder<CategoryRecord>(
                                                                              stream: CategoryRecord.getDocument(noSearchServItem.category.firstOrNull!),
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

                                                                                final containerCategoryRecord = snapshot.data!;

                                                                                return Container(
                                                                                  width: 200.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    containerCategoryRecord.title,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            StreamBuilder<CategoryRecord>(
                                                                              stream: CategoryRecord.getDocument(noSearchServItem.category.elementAtOrNull(1)!),
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

                                                                                final containerCategoryRecord = snapshot.data!;

                                                                                return Container(
                                                                                  width: 200.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    containerCategoryRecord.title,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            StreamBuilder<CategoryRecord>(
                                                                              stream: CategoryRecord.getDocument(noSearchServItem.category.elementAtOrNull(2)!),
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

                                                                                final containerCategoryRecord = snapshot.data!;

                                                                                return Container(
                                                                                  width: 200.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    containerCategoryRecord.title,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 40.0,
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.arrowRight,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () {
                                                                                print('IconButton pressed ...');
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          2.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    if (_model.textController1
                                                                .text !=
                                                            '')
                                                      Builder(
                                                        builder: (context) {
                                                          final searchServ = _model
                                                              .simpleSearchResults1
                                                              .toList();
                                                          if (searchServ
                                                              .isEmpty) {
                                                            return EmptyWidjetWidget();
                                                          }

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            primary: false,
                                                            shrinkWrap: true,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                searchServ
                                                                    .length,
                                                            itemBuilder: (context,
                                                                searchServIndex) {
                                                              final searchServItem =
                                                                  searchServ[
                                                                      searchServIndex];
                                                              return Visibility(
                                                                visible: !(_model
                                                                        .filter
                                                                        .isNotEmpty) ||
                                                                    functions.checkCatFilter(
                                                                        searchServItem
                                                                            .category
                                                                            .toList(),
                                                                        _model
                                                                            .filter
                                                                            .toList())!,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            AdminServicePageWidget.routeName,
                                                                            queryParameters:
                                                                                {
                                                                              'serviceRef': serializeParam(
                                                                                searchServItem.reference,
                                                                                ParamType.DocumentReference,
                                                                              ),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Container(
                                                                              width: 200.0,
                                                                              decoration: BoxDecoration(),
                                                                              child: Text(
                                                                                dateTimeFormat(
                                                                                  "HH:mm dd.MM.yy",
                                                                                  searchServItem.whenCreate!,
                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            StreamBuilder<CategoryRecord>(
                                                                              stream: CategoryRecord.getDocument(searchServItem.category.firstOrNull!),
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

                                                                                final containerCategoryRecord = snapshot.data!;

                                                                                return Container(
                                                                                  width: 200.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    containerCategoryRecord.title,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            StreamBuilder<CategoryRecord>(
                                                                              stream: CategoryRecord.getDocument(searchServItem.category.elementAtOrNull(1)!),
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

                                                                                final containerCategoryRecord = snapshot.data!;

                                                                                return Container(
                                                                                  width: 200.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    containerCategoryRecord.title,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            StreamBuilder<CategoryRecord>(
                                                                              stream: CategoryRecord.getDocument(searchServItem.category.elementAtOrNull(2)!),
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

                                                                                final containerCategoryRecord = snapshot.data!;

                                                                                return Container(
                                                                                  width: 200.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Text(
                                                                                    containerCategoryRecord.title,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                            FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 40.0,
                                                                              icon: FaIcon(
                                                                                FontAwesomeIcons.arrowRight,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              onPressed: () {
                                                                                print('IconButton pressed ...');
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Divider(
                                                                      thickness:
                                                                          2.0,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return Container(
                                            constraints: BoxConstraints(
                                              maxWidth: 1440.0,
                                              maxHeight: 900.0,
                                            ),
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(24.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .alternate,
                                              ),
                                            ),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                24.0,
                                                                12.0,
                                                                24.0,
                                                                12.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 400.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController2,
                                                            focusNode: _model
                                                                .textFieldFocusNode2,
                                                            onChanged: (_) =>
                                                                EasyDebounce
                                                                    .debounce(
                                                              '_model.textController2',
                                                              Duration(
                                                                  milliseconds:
                                                                      100),
                                                              () async {
                                                                safeSetState(
                                                                    () {
                                                                  _model.simpleSearchResults2 =
                                                                      TextSearch(
                                                                    containerServicesRecordList
                                                                        .where((e) =>
                                                                            e.status ==
                                                                            ServiceStatus.hide)
                                                                        .toList()
                                                                        .map(
                                                                          (record) => TextSearchItem.fromTerms(
                                                                              record,
                                                                              [
                                                                                record.title
                                                                              ]),
                                                                        )
                                                                        .toList(),
                                                                  )
                                                                          .search(_model
                                                                              .textController2
                                                                              .text)
                                                                          .map((r) =>
                                                                              r.object)
                                                                          .toList();
                                                                  ;
                                                                });
                                                              },
                                                            ),
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: false,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                              hintText: 'Поиск',
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        color: Color(
                                                                            0xFFBDBDBD),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: (_model
                                                                          .textFieldFocusNode2
                                                                          ?.hasFocus ??
                                                                      false)
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                              prefixIcon: Icon(
                                                                Icons.search,
                                                                size: 20.0,
                                                              ),
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                            maxLength: 40,
                                                            buildCounter: (context,
                                                                    {required currentLength,
                                                                    required isFocused,
                                                                    maxLength}) =>
                                                                null,
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textController2Validator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderRadius: 16.0,
                                                          buttonSize: 46.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .tertiary,
                                                          icon: Icon(
                                                            FFIcons.kfilter2,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            size: 16.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model.setFilter =
                                                                true;
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 24.0)),
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(24.0, 0.0,
                                                                12.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: 200.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              'Дата публикации',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelSmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 200.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              'Категория',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelSmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 200.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              'Подкатегория',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelSmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 200.0,
                                                          height: 30.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Text(
                                                              'Название услуги',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .labelSmallIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 24.0,
                                                          height: 24.0,
                                                          decoration:
                                                              BoxDecoration(),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Divider(
                                                    thickness: 2.0,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .alternate,
                                                  ),
                                                  if (_model.textController2
                                                              .text ==
                                                          '')
                                                    Builder(
                                                      builder: (context) {
                                                        final noSearchServ =
                                                            containerServicesRecordList
                                                                .where((e) =>
                                                                    e.status ==
                                                                    ServiceStatus
                                                                        .hide)
                                                                .toList();
                                                        if (noSearchServ
                                                            .isEmpty) {
                                                          return EmptyWidjetWidget();
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              noSearchServ
                                                                  .length,
                                                          itemBuilder: (context,
                                                              noSearchServIndex) {
                                                            final noSearchServItem =
                                                                noSearchServ[
                                                                    noSearchServIndex];
                                                            return Visibility(
                                                              visible: !(_model
                                                                      .filter
                                                                      .isNotEmpty) ||
                                                                  functions.checkCatFilter(
                                                                      noSearchServItem
                                                                          .category
                                                                          .toList(),
                                                                      _model
                                                                          .filter
                                                                          .toList())!,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          AdminServicePageWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'serviceRef':
                                                                                serializeParam(
                                                                              noSearchServItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                200.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              dateTimeFormat(
                                                                                "HH:mm dd.MM.yy",
                                                                                noSearchServItem.whenCreate!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          StreamBuilder<
                                                                              CategoryRecord>(
                                                                            stream:
                                                                                CategoryRecord.getDocument(noSearchServItem.category.firstOrNull!),
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

                                                                              final containerCategoryRecord = snapshot.data!;

                                                                              return Container(
                                                                                width: 200.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  containerCategoryRecord.title,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          StreamBuilder<
                                                                              CategoryRecord>(
                                                                            stream:
                                                                                CategoryRecord.getDocument(noSearchServItem.category.elementAtOrNull(1)!),
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

                                                                              final containerCategoryRecord = snapshot.data!;

                                                                              return Container(
                                                                                width: 200.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  containerCategoryRecord.title,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          StreamBuilder<
                                                                              CategoryRecord>(
                                                                            stream:
                                                                                CategoryRecord.getDocument(noSearchServItem.category.elementAtOrNull(2)!),
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

                                                                              final containerCategoryRecord = snapshot.data!;

                                                                              return Container(
                                                                                width: 200.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  containerCategoryRecord.title,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.arrowRight,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        2.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  if (_model.textController2
                                                              .text !=
                                                          '')
                                                    Builder(
                                                      builder: (context) {
                                                        final searchServ = _model
                                                            .simpleSearchResults2
                                                            .toList();
                                                        if (searchServ
                                                            .isEmpty) {
                                                          return EmptyWidjetWidget();
                                                        }

                                                        return ListView.builder(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          primary: false,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              searchServ.length,
                                                          itemBuilder: (context,
                                                              searchServIndex) {
                                                            final searchServItem =
                                                                searchServ[
                                                                    searchServIndex];
                                                            return Visibility(
                                                              visible: !(_model
                                                                      .filter
                                                                      .isNotEmpty) ||
                                                                  functions.checkCatFilter(
                                                                      searchServItem
                                                                          .category
                                                                          .toList(),
                                                                      _model
                                                                          .filter
                                                                          .toList())!,
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            24.0,
                                                                            0.0,
                                                                            12.0,
                                                                            0.0),
                                                                    child:
                                                                        InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          AdminServicePageWidget
                                                                              .routeName,
                                                                          queryParameters:
                                                                              {
                                                                            'serviceRef':
                                                                                serializeParam(
                                                                              searchServItem.reference,
                                                                              ParamType.DocumentReference,
                                                                            ),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                200.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Text(
                                                                              dateTimeFormat(
                                                                                "HH:mm dd.MM.yy",
                                                                                searchServItem.whenCreate!,
                                                                                locale: FFLocalizations.of(context).languageCode,
                                                                              ),
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          StreamBuilder<
                                                                              CategoryRecord>(
                                                                            stream:
                                                                                CategoryRecord.getDocument(searchServItem.category.firstOrNull!),
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

                                                                              final containerCategoryRecord = snapshot.data!;

                                                                              return Container(
                                                                                width: 200.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  containerCategoryRecord.title,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          StreamBuilder<
                                                                              CategoryRecord>(
                                                                            stream:
                                                                                CategoryRecord.getDocument(searchServItem.category.elementAtOrNull(1)!),
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

                                                                              final containerCategoryRecord = snapshot.data!;

                                                                              return Container(
                                                                                width: 200.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  containerCategoryRecord.title,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          StreamBuilder<
                                                                              CategoryRecord>(
                                                                            stream:
                                                                                CategoryRecord.getDocument(searchServItem.category.elementAtOrNull(2)!),
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

                                                                              final containerCategoryRecord = snapshot.data!;

                                                                              return Container(
                                                                                width: 200.0,
                                                                                decoration: BoxDecoration(),
                                                                                child: Text(
                                                                                  containerCategoryRecord.title,
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 16.0,
                                                                                        letterSpacing: 0.0,
                                                                                        fontWeight: FontWeight.w600,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            icon:
                                                                                FaIcon(
                                                                              FontAwesomeIcons.arrowRight,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            onPressed:
                                                                                () {
                                                                              print('IconButton pressed ...');
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Divider(
                                                                    thickness:
                                                                        2.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                    ),
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  } else {
                                    return Container(
                                      constraints: BoxConstraints(
                                        maxWidth: 1440.0,
                                        maxHeight: 900.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                      ),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(24.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    splashColor:
                                                        Colors.transparent,
                                                    focusColor:
                                                        Colors.transparent,
                                                    hoverColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    onTap: () async {
                                                      _model.setFilter = false;
                                                      safeSetState(() {});
                                                    },
                                                    child: Icon(
                                                      Icons.close,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      size: 24.0,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Text(
                                                      'Фильтр',
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
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.filter = [];
                                                      _model.setFilter = false;
                                                      safeSetState(() {});
                                                    },
                                                    text: 'Сбросить',
                                                    options: FFButtonOptions(
                                                      width: 120.0,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiary,
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily:
                                                                    'involve',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0.0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      _model.setFilter = false;
                                                      safeSetState(() {});
                                                    },
                                                    text: 'Применить',
                                                    options: FFButtonOptions(
                                                      width: 120.0,
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
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
                                                          BorderRadius.circular(
                                                              16.0),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(width: 24.0)),
                                              ),
                                            ),
                                            Divider(
                                              thickness: 2.0,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .alternate,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      12.0, 0.0, 12.0, 0.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 12.0, 0.0),
                                                  child: StreamBuilder<
                                                      List<CategoryRecord>>(
                                                    stream: queryCategoryRecord(
                                                      queryBuilder:
                                                          (categoryRecord) =>
                                                              categoryRecord
                                                                  .where(
                                                        'isParent',
                                                        isEqualTo: true,
                                                      ),
                                                    ),
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              size: 10.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<CategoryRecord>
                                                          firstCategoryRecordList =
                                                          snapshot.data!;
                                                      if (firstCategoryRecordList
                                                          .isEmpty) {
                                                        return EmptyWidjetWidget();
                                                      }

                                                      return ListView.builder(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        shrinkWrap: true,
                                                        scrollDirection:
                                                            Axis.vertical,
                                                        itemCount:
                                                            firstCategoryRecordList
                                                                .length,
                                                        itemBuilder: (context,
                                                            firstIndex) {
                                                          final firstCategoryRecord =
                                                              firstCategoryRecordList[
                                                                  firstIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    12.0),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Container(
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
                                                                      firstCategoryRecord
                                                                          .title,
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
                                                                    collapsed:
                                                                        Container(),
                                                                    expanded:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              CategoryRecord>>(
                                                                        stream:
                                                                            queryCategoryRecord(
                                                                          queryBuilder: (categoryRecord) =>
                                                                              categoryRecord.where(
                                                                            'parentCat',
                                                                            isEqualTo:
                                                                                firstCategoryRecord.reference,
                                                                          ),
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<CategoryRecord>
                                                                              secondCategoryRecordList =
                                                                              snapshot.data!;

                                                                          return ListView
                                                                              .builder(
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                            primary:
                                                                                false,
                                                                            shrinkWrap:
                                                                                true,
                                                                            scrollDirection:
                                                                                Axis.vertical,
                                                                            itemCount:
                                                                                secondCategoryRecordList.length,
                                                                            itemBuilder:
                                                                                (context, secondIndex) {
                                                                              final secondCategoryRecord = secondCategoryRecordList[secondIndex];
                                                                              return Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  color: Color(0x00000000),
                                                                                  child: ExpandableNotifier(
                                                                                    initialExpanded: false,
                                                                                    child: ExpandablePanel(
                                                                                      header: Text(
                                                                                        secondCategoryRecord.title,
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
                                                                                      expanded: StreamBuilder<List<CategoryRecord>>(
                                                                                        stream: queryCategoryRecord(
                                                                                          queryBuilder: (categoryRecord) => categoryRecord.where(
                                                                                            'parentCat',
                                                                                            isEqualTo: secondCategoryRecord.reference,
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
                                                                                          List<CategoryRecord> thirdCategoryRecordList = snapshot.data!;

                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: thirdCategoryRecordList.length,
                                                                                            separatorBuilder: (_, __) => SizedBox(height: 12.0),
                                                                                            itemBuilder: (context, thirdIndex) {
                                                                                              final thirdCategoryRecord = thirdCategoryRecordList[thirdIndex];
                                                                                              return InkWell(
                                                                                                splashColor: Colors.transparent,
                                                                                                focusColor: Colors.transparent,
                                                                                                hoverColor: Colors.transparent,
                                                                                                highlightColor: Colors.transparent,
                                                                                                onTap: () async {
                                                                                                  if (_model.filter.contains(thirdCategoryRecord.reference)) {
                                                                                                    _model.removeFromFilter(thirdCategoryRecord.reference);
                                                                                                    safeSetState(() {});
                                                                                                  } else {
                                                                                                    _model.addToFilter(thirdCategoryRecord.reference);
                                                                                                    safeSetState(() {});
                                                                                                  }
                                                                                                },
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    if (_model.filter.contains(thirdCategoryRecord.reference))
                                                                                                      Icon(
                                                                                                        Icons.circle_outlined,
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                    if (!_model.filter.contains(thirdCategoryRecord.reference))
                                                                                                      Icon(
                                                                                                        Icons.circle_rounded,
                                                                                                        color: Color(0xFFD3D3D3),
                                                                                                        size: 24.0,
                                                                                                      ),
                                                                                                    Text(
                                                                                                      thirdCategoryRecord.title,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.mulish(
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                            ),
                                                                                                            color: _model.filter.contains(thirdCategoryRecord.reference) ? FlutterFlowTheme.of(context).primaryText : FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 18.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                      theme: ExpandableThemeData(
                                                                                        tapHeaderToExpand: true,
                                                                                        tapBodyToExpand: false,
                                                                                        tapBodyToCollapse: false,
                                                                                        headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                        hasIcon: true,
                                                                                        expandIcon: FFIcons.karrowDown2,
                                                                                        collapseIcon: FFIcons.karrowUp2,
                                                                                        iconSize: 24.0,
                                                                                        iconColor: FlutterFlowTheme.of(context).primaryText,
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
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                      expandIcon:
                                                                          FFIcons
                                                                              .karrowDown2,
                                                                      collapseIcon:
                                                                          FFIcons
                                                                              .karrowUp2,
                                                                      iconSize:
                                                                          24.0,
                                                                      iconColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .primaryText,
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
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 24.0)),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
