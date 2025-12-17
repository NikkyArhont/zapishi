import '/aaazapishi/admin/admin_chats/admin_complete_debate/admin_complete_debate_widget.dart';
import '/aaazapishi/admin/admin_menu/admin_menu_widget.dart';
import '/aaazapishi/admin/admin_top/admin_top_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/backend/schema/enums/enums.dart';
import '/chats/empty_chats/empty_chats_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'admin_c_chats_model.dart';
export 'admin_c_chats_model.dart';

class AdminCChatsWidget extends StatefulWidget {
  const AdminCChatsWidget({super.key});

  static String routeName = 'adminCChats';
  static String routePath = '/adminCChats';

  @override
  State<AdminCChatsWidget> createState() => _AdminCChatsWidgetState();
}

class _AdminCChatsWidgetState extends State<AdminCChatsWidget> {
  late AdminCChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AdminCChatsModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        body: SafeArea(
          top: true,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: wrapWithModel(
                  model: _model.adminMenuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: AdminMenuWidget(
                    currentAdminPage: AdminMenu.category,
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        wrapWithModel(
                          model: _model.adminTopModel,
                          updateCallback: () => safeSetState(() {}),
                          child: AdminTopWidget(
                            title: 'Чаты',
                            main: false,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 24.0, 0.0, 0.0),
                          child: StreamBuilder<List<ChatRecord>>(
                            stream: queryChatRecord(
                              queryBuilder: (chatRecord) => chatRecord.where(
                                'members',
                                arrayContains: currentUserReference,
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
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      size: 10.0,
                                    ),
                                  ),
                                );
                              }
                              List<ChatRecord> containerChatRecordList =
                                  snapshot.data!;

                              return Container(
                                height: 700.0,
                                constraints: BoxConstraints(
                                  maxWidth: 1440.0,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 300.0,
                                      constraints: BoxConstraints(
                                        maxWidth: 400.0,
                                      ),
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(24.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Builder(
                                                builder: (context) {
                                                  final loadChats =
                                                      containerChatRecordList
                                                          .toList();
                                                  if (loadChats.isEmpty) {
                                                    return EmptyChatsWidget();
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount: loadChats.length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 12.0),
                                                    itemBuilder: (context,
                                                        loadChatsIndex) {
                                                      final loadChatsItem =
                                                          loadChats[
                                                              loadChatsIndex];
                                                      return Builder(
                                                        builder: (context) {
                                                          if (loadChatsItem
                                                                  .record !=
                                                              null) {
                                                            return StreamBuilder<
                                                                RecordsRecord>(
                                                              stream: RecordsRecord
                                                                  .getDocument(
                                                                      loadChatsItem
                                                                          .record!),
                                                              builder: (context,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final containerRecordsRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: 74.0,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: StreamBuilder<
                                                                      UserRecord>(
                                                                    stream: UserRecord.getDocument(
                                                                        containerRecordsRecord
                                                                            .client!),
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

                                                                      final containerUserRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return Container(
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child: StreamBuilder<
                                                                            MastersRecord>(
                                                                          stream:
                                                                              MastersRecord.getDocument(containerRecordsRecord.organisation!),
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

                                                                            final containerMastersRecord =
                                                                                snapshot.data!;

                                                                            return Container(
                                                                              decoration: BoxDecoration(),
                                                                              child: InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  _model.choosenChat = loadChatsItem;
                                                                                  safeSetState(() {});
                                                                                  _model.readRecord = await RecordsRecord.getDocumentOnce(loadChatsItem.record!);
                                                                                  _model.loadRecord = _model.readRecord;
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 60.0,
                                                                                      height: 60.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        currentUserReference == containerRecordsRecord.client ? containerMastersRecord.banner : containerUserRecord.photoUrl,
                                                                                        fit: BoxFit.cover,
                                                                                        errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                          'assets/images/error_image.png',
                                                                                          fit: BoxFit.cover,
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Flexible(
                                                                                      child: Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              currentUserReference == containerRecordsRecord.client
                                                                                                  ? containerMastersRecord.title
                                                                                                  : containerUserRecord.displayName.maybeHandleOverflow(
                                                                                                      maxChars: 30,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              containerRecordsRecord.title,
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              loadChatsItem.lastMessageText.maybeHandleOverflow(
                                                                                                maxChars: 40,
                                                                                                replacement: '…',
                                                                                              ),
                                                                                              maxLines: 1,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                              overflow: TextOverflow.ellipsis,
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 4.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Text(
                                                                                          dateTimeFormat(
                                                                                                    "yMd",
                                                                                                    loadChatsItem.lastMessageTime,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  ) ==
                                                                                                  dateTimeFormat(
                                                                                                    "yMd",
                                                                                                    getCurrentTimestamp,
                                                                                                    locale: FFLocalizations.of(context).languageCode,
                                                                                                  )
                                                                                              ? dateTimeFormat(
                                                                                                  "Hm",
                                                                                                  loadChatsItem.lastMessageTime!,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                )
                                                                                              : dateTimeFormat(
                                                                                                  "dd.MM.yy",
                                                                                                  loadChatsItem.lastMessageTime!,
                                                                                                  locale: FFLocalizations.of(context).languageCode,
                                                                                                ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        if (!loadChatsItem.lastMessageSeenBy.contains(currentUserReference))
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Container(
                                                                                              width: 25.0,
                                                                                              height: 25.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                shape: BoxShape.circle,
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 8.0)),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          } else {
                                                            return StreamBuilder<
                                                                UserRecord>(
                                                              stream: UserRecord
                                                                  .getDocument(loadChatsItem
                                                                      .members
                                                                      .where((e) =>
                                                                          e !=
                                                                          currentUserReference)
                                                                      .toList()
                                                                      .firstOrNull!),
                                                              builder: (context,
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        size:
                                                                            10.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }

                                                                final containerUserRecord =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(),
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
                                                                        _model.choosenChat =
                                                                            loadChatsItem;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children:
                                                                            [
                                                                          Container(
                                                                            width:
                                                                                60.0,
                                                                            height:
                                                                                60.0,
                                                                            clipBehavior:
                                                                                Clip.antiAlias,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.circle,
                                                                            ),
                                                                            child:
                                                                                Image.network(
                                                                              containerUserRecord.photoUrl,
                                                                              fit: BoxFit.cover,
                                                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                                                'assets/images/error_image.png',
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Flexible(
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(-1.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    containerUserRecord.displayName.maybeHandleOverflow(
                                                                                      maxChars: 30,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.bold,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    'Обращение в поддержку',
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    loadChatsItem.lastMessageText.maybeHandleOverflow(
                                                                                      maxChars: 40,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    maxLines: 1,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 16.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                  ),
                                                                                ].divide(SizedBox(height: 4.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children: [
                                                                              Text(
                                                                                dateTimeFormat(
                                                                                          "yMd",
                                                                                          loadChatsItem.lastMessageTime,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        ) ==
                                                                                        dateTimeFormat(
                                                                                          "yMd",
                                                                                          getCurrentTimestamp,
                                                                                          locale: FFLocalizations.of(context).languageCode,
                                                                                        )
                                                                                    ? dateTimeFormat(
                                                                                        "Hm",
                                                                                        loadChatsItem.lastMessageTime!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      )
                                                                                    : dateTimeFormat(
                                                                                        "dd.MM.yy",
                                                                                        loadChatsItem.lastMessageTime!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                              if (!loadChatsItem.lastMessageSeenBy.contains(currentUserReference))
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: 25.0,
                                                                                    height: 25.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).tertiary,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                            ],
                                                                          ),
                                                                        ].divide(SizedBox(width: 8.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          }
                                                        },
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ].divide(SizedBox(height: 12.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                    if (_model.choosenChat != null)
                                      Flexible(
                                        flex: 10,
                                        child:
                                            StreamBuilder<List<MessagesRecord>>(
                                          stream: queryMessagesRecord(
                                            queryBuilder: (messagesRecord) =>
                                                messagesRecord.where(
                                              'chat',
                                              isEqualTo:
                                                  _model.choosenChat?.reference,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 10.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<MessagesRecord>
                                                containerMessagesRecordList =
                                                snapshot.data!;

                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .stretch,
                                                  children: [
                                                    Builder(
                                                      builder: (context) {
                                                        if (_model.choosenChat
                                                                ?.record !=
                                                            null) {
                                                          return StreamBuilder<
                                                              MastersRecord>(
                                                            stream: MastersRecord
                                                                .getDocument(_model
                                                                    .loadRecord!
                                                                    .organisation!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        SpinKitCircle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      size:
                                                                          10.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final headMastersRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              24.0),
                                                                  child: StreamBuilder<
                                                                      UserRecord>(
                                                                    stream: UserRecord.getDocument(_model
                                                                        .loadRecord!
                                                                        .client!),
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

                                                                      final columnUserRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            valueOrDefault<String>(
                                                                              _model.loadRecord?.title,
                                                                              'Чат',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                ),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children:
                                                                                [
                                                                              Text(
                                                                                columnUserRecord.displayName,
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                              SizedBox(
                                                                                height: 20.0,
                                                                                child: VerticalDivider(
                                                                                  thickness: 2.0,
                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                headMastersRecord.title,
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                              if (_model.loadRecord?.report.status != ReportStatus.open)
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(8.0),
                                                                                      child: Text(
                                                                                        'Закрыт спор',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              if (_model.loadRecord?.report.status == ReportStatus.open)
                                                                                Container(
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0x32F75555),
                                                                                    borderRadius: BorderRadius.circular(16.0),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(8.0),
                                                                                      child: Text(
                                                                                        'Открыт спор',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).error,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              Expanded(
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(1.0, 0.0),
                                                                                  child: Builder(
                                                                                    builder: (context) => FFButtonWidget(
                                                                                      onPressed: () async {
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
                                                                                                child: AdminCompleteDebateWidget(
                                                                                                  record: _model.loadRecord!.reference,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        );
                                                                                      },
                                                                                      text: 'Решить спор',
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
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 12.0)),
                                                                          ),
                                                                        ].divide(SizedBox(height: 12.0)),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        } else {
                                                          return StreamBuilder<
                                                              UserRecord>(
                                                            stream: UserRecord
                                                                .getDocument(_model
                                                                    .choosenChat!
                                                                    .members
                                                                    .where((e) =>
                                                                        e !=
                                                                        currentUserReference)
                                                                    .toList()
                                                                    .firstOrNull!),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        SpinKitCircle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      size:
                                                                          10.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }

                                                              final headUserRecord =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    1.0,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              24.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        headUserRecord
                                                                            .displayName,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }
                                                      },
                                                    ),
                                                    Flexible(
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
                                                          child: StreamBuilder<
                                                              List<
                                                                  MessagesRecord>>(
                                                            stream:
                                                                queryMessagesRecord(
                                                              queryBuilder: (messagesRecord) =>
                                                                  messagesRecord
                                                                      .where(
                                                                        'chat',
                                                                        isEqualTo: _model
                                                                            .choosenChat
                                                                            ?.reference,
                                                                      )
                                                                      .orderBy(
                                                                          'dateTime',
                                                                          descending:
                                                                              true),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 10.0,
                                                                    height:
                                                                        10.0,
                                                                    child:
                                                                        SpinKitCircle(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      size:
                                                                          10.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<MessagesRecord>
                                                                  listViewMessagesRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return ListView
                                                                  .separated(
                                                                padding:
                                                                    EdgeInsets
                                                                        .fromLTRB(
                                                                  0,
                                                                  12.0,
                                                                  0,
                                                                  12.0,
                                                                ),
                                                                reverse: true,
                                                                shrinkWrap:
                                                                    true,
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                itemCount:
                                                                    listViewMessagesRecordList
                                                                        .length,
                                                                separatorBuilder: (_,
                                                                        __) =>
                                                                    SizedBox(
                                                                        height:
                                                                            12.0),
                                                                itemBuilder:
                                                                    (context,
                                                                        listViewIndex) {
                                                                  final listViewMessagesRecord =
                                                                      listViewMessagesRecordList[
                                                                          listViewIndex];
                                                                  return Builder(
                                                                    builder:
                                                                        (context) {
                                                                      if (listViewMessagesRecord
                                                                              .sender !=
                                                                          currentUserReference) {
                                                                        return Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 250.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).accent4,
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
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(16.0),
                                                                                bottomRight: Radius.circular(16.0),
                                                                                topLeft: Radius.circular(0.0),
                                                                                topRight: Radius.circular(16.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(12.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    listViewMessagesRecord.text,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  if (listViewMessagesRecord.document != '')
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        FlutterFlowIconButton(
                                                                                          borderRadius: 100.0,
                                                                                          buttonSize: 48.0,
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                          icon: Icon(
                                                                                            FFIcons.kdocument2,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            await downloadFile(
                                                                                              filename: listViewMessagesRecord.document,
                                                                                              url: listViewMessagesRecord.document,
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                        Text(
                                                                                          listViewMessagesRecord.document.maybeHandleOverflow(
                                                                                            maxChars: 30,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 12.0)),
                                                                                    ),
                                                                                  if (listViewMessagesRecord.images.isNotEmpty)
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final mediaInMessage = listViewMessagesRecord.images.toList();

                                                                                        return Wrap(
                                                                                          spacing: 12.0,
                                                                                          runSpacing: 12.0,
                                                                                          alignment: WrapAlignment.start,
                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                          direction: Axis.horizontal,
                                                                                          runAlignment: WrapAlignment.start,
                                                                                          verticalDirection: VerticalDirection.down,
                                                                                          clipBehavior: Clip.none,
                                                                                          children: List.generate(mediaInMessage.length, (mediaInMessageIndex) {
                                                                                            final mediaInMessageItem = mediaInMessage[mediaInMessageIndex];
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
                                                                                                        mediaInMessageItem,
                                                                                                        fit: BoxFit.contain,
                                                                                                      ),
                                                                                                      allowRotation: false,
                                                                                                      tag: mediaInMessageItem,
                                                                                                      useHeroAnimation: true,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                              child: Hero(
                                                                                                tag: mediaInMessageItem,
                                                                                                transitionOnUserGestures: true,
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  child: Image.network(
                                                                                                    mediaInMessageItem,
                                                                                                    width: 100.0,
                                                                                                    height: 100.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  Align(
                                                                                    alignment: AlignmentDirectional(1.0, 0.0),
                                                                                    child: Text(
                                                                                      dateTimeFormat(
                                                                                        "dd.MM.yy H:mm",
                                                                                        listViewMessagesRecord.dateTime!,
                                                                                        locale: FFLocalizations.of(context).languageCode,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).accent1,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 8.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      } else {
                                                                        return Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 250.0,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).tertiary,
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
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(16.0),
                                                                                bottomRight: Radius.circular(16.0),
                                                                                topLeft: Radius.circular(16.0),
                                                                                topRight: Radius.circular(0.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsets.all(12.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                crossAxisAlignment: CrossAxisAlignment.end,
                                                                                children: [
                                                                                  Text(
                                                                                    listViewMessagesRecord.text,
                                                                                    textAlign: TextAlign.start,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 18.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  if (listViewMessagesRecord.document != '')
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        FlutterFlowIconButton(
                                                                                          borderRadius: 100.0,
                                                                                          buttonSize: 48.0,
                                                                                          fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          icon: Icon(
                                                                                            FFIcons.kdocument2,
                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                            size: 24.0,
                                                                                          ),
                                                                                          onPressed: () async {
                                                                                            await downloadFile(
                                                                                              filename: listViewMessagesRecord.document,
                                                                                              url: listViewMessagesRecord.document,
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                        Text(
                                                                                          listViewMessagesRecord.document.maybeHandleOverflow(
                                                                                            maxChars: 30,
                                                                                            replacement: '…',
                                                                                          ),
                                                                                          maxLines: 2,
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.bold,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 12.0)),
                                                                                    ),
                                                                                  if (listViewMessagesRecord.images.isNotEmpty)
                                                                                    Builder(
                                                                                      builder: (context) {
                                                                                        final mediaInMessage = listViewMessagesRecord.images.toList();

                                                                                        return Wrap(
                                                                                          spacing: 12.0,
                                                                                          runSpacing: 12.0,
                                                                                          alignment: WrapAlignment.start,
                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                          direction: Axis.horizontal,
                                                                                          runAlignment: WrapAlignment.start,
                                                                                          verticalDirection: VerticalDirection.down,
                                                                                          clipBehavior: Clip.none,
                                                                                          children: List.generate(mediaInMessage.length, (mediaInMessageIndex) {
                                                                                            final mediaInMessageItem = mediaInMessage[mediaInMessageIndex];
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
                                                                                                        mediaInMessageItem,
                                                                                                        fit: BoxFit.contain,
                                                                                                      ),
                                                                                                      allowRotation: false,
                                                                                                      tag: mediaInMessageItem,
                                                                                                      useHeroAnimation: true,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                              child: Hero(
                                                                                                tag: mediaInMessageItem,
                                                                                                transitionOnUserGestures: true,
                                                                                                child: ClipRRect(
                                                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                                                  child: Image.network(
                                                                                                    mediaInMessageItem,
                                                                                                    width: 100.0,
                                                                                                    height: 100.0,
                                                                                                    fit: BoxFit.cover,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  Text(
                                                                                    dateTimeFormat(
                                                                                      "dd.MM.yy H:mm",
                                                                                      listViewMessagesRecord.dateTime!,
                                                                                      locale: FFLocalizations.of(context).languageCode,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          fontSize: 12.0,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w500,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 8.0)),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                    },
                                                                  );
                                                                },
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    if (_model.uploadedPhoto
                                                        .isNotEmpty)
                                                      Container(
                                                        constraints:
                                                            BoxConstraints(
                                                          minWidth: 600.0,
                                                          maxHeight: 300.0,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              blurRadius: 4.0,
                                                              color: Color(
                                                                  0x33000000),
                                                              offset: Offset(
                                                                0.0,
                                                                -2.0,
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      12.0,
                                                                      0.0,
                                                                      12.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final uploadCard =
                                                                  _model
                                                                      .uploadedPhoto
                                                                      .toList()
                                                                      .take(5)
                                                                      .toList();

                                                              return SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: List.generate(
                                                                          uploadCard
                                                                              .length,
                                                                          (uploadCardIndex) {
                                                                    final uploadCardItem =
                                                                        uploadCard[
                                                                            uploadCardIndex];
                                                                    return Container(
                                                                      width:
                                                                          86.0,
                                                                      height:
                                                                          86.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8.0),
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.memory(
                                                                              uploadCardItem.bytes ?? Uint8List.fromList([]),
                                                                              width: 200.0,
                                                                              height: 200.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                FlutterFlowIconButton(
                                                                              borderRadius: 8.0,
                                                                              buttonSize: 30.0,
                                                                              fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                              icon: Icon(
                                                                                Icons.close,
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                size: 14.0,
                                                                              ),
                                                                              onPressed: () async {
                                                                                _model.removeFromUploadedPhoto(uploadCardItem);
                                                                                safeSetState(() {});
                                                                              },
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    );
                                                                  })
                                                                      .divide(SizedBox(
                                                                          width:
                                                                              12.0))
                                                                      .addToStart(SizedBox(
                                                                          width:
                                                                              12.0))
                                                                      .addToEnd(SizedBox(
                                                                          width:
                                                                              12.0)),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    if (_model.showMenu)
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      6.0,
                                                                      0.0,
                                                                      6.0),
                                                          child: Material(
                                                            color: Colors
                                                                .transparent,
                                                            elevation: 6.0,
                                                            shape:
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          16.0),
                                                            ),
                                                            child: Container(
                                                              width: 240.0,
                                                              height: 140.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            16.0),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            12.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        FlutterFlowIconButton(
                                                                          borderRadius:
                                                                              100.0,
                                                                          buttonSize:
                                                                              72.0,
                                                                          fillColor:
                                                                              Color(0x33A7C4FE),
                                                                          icon:
                                                                              Icon(
                                                                            FFIcons.kdocument2,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                32.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
                                                                            final selectedFiles =
                                                                                await selectFiles(
                                                                              multiFile: false,
                                                                            );
                                                                            if (selectedFiles !=
                                                                                null) {
                                                                              safeSetState(() => _model.isDataUploading_uploadDataDOCWebWeb = true);
                                                                              var selectedUploadedFiles = <FFUploadedFile>[];

                                                                              var downloadUrls = <String>[];
                                                                              try {
                                                                                selectedUploadedFiles = selectedFiles
                                                                                    .map((m) => FFUploadedFile(
                                                                                          name: m.storagePath.split('/').last,
                                                                                          bytes: m.bytes,
                                                                                          originalFilename: m.originalFilename,
                                                                                        ))
                                                                                    .toList();

                                                                                downloadUrls = (await Future.wait(
                                                                                  selectedFiles.map(
                                                                                    (f) async => await uploadData(f.storagePath, f.bytes),
                                                                                  ),
                                                                                ))
                                                                                    .where((u) => u != null)
                                                                                    .map((u) => u!)
                                                                                    .toList();
                                                                              } finally {
                                                                                _model.isDataUploading_uploadDataDOCWebWeb = false;
                                                                              }
                                                                              if (selectedUploadedFiles.length == selectedFiles.length && downloadUrls.length == selectedFiles.length) {
                                                                                safeSetState(() {
                                                                                  _model.uploadedLocalFile_uploadDataDOCWebWeb = selectedUploadedFiles.first;
                                                                                  _model.uploadedFileUrl_uploadDataDOCWebWeb = downloadUrls.first;
                                                                                });
                                                                              } else {
                                                                                safeSetState(() {});
                                                                                return;
                                                                              }
                                                                            }

                                                                            var messagesRecordReference =
                                                                                MessagesRecord.collection.doc();
                                                                            await messagesRecordReference.set(createMessagesRecordData(
                                                                              chat: _model.choosenChat?.reference,
                                                                              document: _model.uploadedFileUrl_uploadDataDOCWebWeb,
                                                                              sender: currentUserReference,
                                                                              dateTime: getCurrentTimestamp,
                                                                              text: _model.textController.text != '' ? _model.textController.text : 'Документ',
                                                                            ));
                                                                            _model.newMessDoc = MessagesRecord.getDocumentFromData(
                                                                                createMessagesRecordData(
                                                                                  chat: _model.choosenChat?.reference,
                                                                                  document: _model.uploadedFileUrl_uploadDataDOCWebWeb,
                                                                                  sender: currentUserReference,
                                                                                  dateTime: getCurrentTimestamp,
                                                                                  text: _model.textController.text != '' ? _model.textController.text : 'Документ',
                                                                                ),
                                                                                messagesRecordReference);

                                                                            await _model.choosenChat!.reference.update({
                                                                              ...createChatRecordData(
                                                                                lastMessageTime: getCurrentTimestamp,
                                                                                lastMessage: _model.newMessDoc?.reference,
                                                                                lastMessageSender: currentUserReference,
                                                                                lastMessageText: _model.newMessDoc?.text,
                                                                              ),
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'messages': FieldValue.arrayUnion([
                                                                                    _model.newMessDoc?.reference
                                                                                  ]),
                                                                                  'lastMessageSeenBy': FieldValue.delete(),
                                                                                },
                                                                              ),
                                                                            });

                                                                            await _model.choosenChat!.reference.update({
                                                                              ...mapToFirestore(
                                                                                {
                                                                                  'lastMessageSeenBy': FieldValue.arrayUnion([
                                                                                    currentUserReference
                                                                                  ]),
                                                                                },
                                                                              ),
                                                                            });
                                                                            safeSetState(() {
                                                                              _model.isDataUploading_uploadDataDOCWebWeb = false;
                                                                              _model.uploadedLocalFile_uploadDataDOCWebWeb = FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
                                                                              _model.uploadedFileUrl_uploadDataDOCWebWeb = '';
                                                                            });

                                                                            safeSetState(() {});
                                                                          },
                                                                        ),
                                                                        Text(
                                                                          'Документ',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 12.0)),
                                                                    ),
                                                                    Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        FlutterFlowIconButton(
                                                                          borderRadius:
                                                                              100.0,
                                                                          buttonSize:
                                                                              72.0,
                                                                          fillColor:
                                                                              Color(0x33A7C4FE),
                                                                          icon:
                                                                              Icon(
                                                                            Icons.image_rounded,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                32.0,
                                                                          ),
                                                                          onPressed: (_model.uploadedPhoto.length >= 5)
                                                                              ? null
                                                                              : () async {
                                                                                  final selectedMedia = await selectMedia(
                                                                                    maxWidth: 1920.00,
                                                                                    maxHeight: 1920.00,
                                                                                    mediaSource: MediaSource.photoGallery,
                                                                                    multiImage: false,
                                                                                  );
                                                                                  if (selectedMedia != null && selectedMedia.every((m) => validateFileFormat(m.storagePath, context))) {
                                                                                    safeSetState(() => _model.isDataUploading_uploadDataGalleryWeb = true);
                                                                                    var selectedUploadedFiles = <FFUploadedFile>[];

                                                                                    try {
                                                                                      selectedUploadedFiles = selectedMedia
                                                                                          .map((m) => FFUploadedFile(
                                                                                                name: m.storagePath.split('/').last,
                                                                                                bytes: m.bytes,
                                                                                                height: m.dimensions?.height,
                                                                                                width: m.dimensions?.width,
                                                                                                blurHash: m.blurHash,
                                                                                                originalFilename: m.originalFilename,
                                                                                              ))
                                                                                          .toList();
                                                                                    } finally {
                                                                                      _model.isDataUploading_uploadDataGalleryWeb = false;
                                                                                    }
                                                                                    if (selectedUploadedFiles.length == selectedMedia.length) {
                                                                                      safeSetState(() {
                                                                                        _model.uploadedLocalFile_uploadDataGalleryWeb = selectedUploadedFiles.first;
                                                                                      });
                                                                                    } else {
                                                                                      safeSetState(() {});
                                                                                      return;
                                                                                    }
                                                                                  }

                                                                                  _model.addToUploadedPhoto(_model.uploadedLocalFile_uploadDataGalleryWeb);
                                                                                  safeSetState(() {});
                                                                                  safeSetState(() {
                                                                                    _model.isDataUploading_uploadDataGalleryWeb = false;
                                                                                    _model.uploadedLocalFile_uploadDataGalleryWeb = FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
                                                                                  });

                                                                                  safeSetState(() {
                                                                                    _model.textController?.clear();
                                                                                  });
                                                                                },
                                                                        ),
                                                                        Text(
                                                                          'Галерея',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              height: 12.0)),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          24.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    Container(
                                                      width: MediaQuery.sizeOf(
                                                                  context)
                                                              .width *
                                                          1.0,
                                                      constraints:
                                                          BoxConstraints(
                                                        maxHeight: 300.0,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent4,
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            24.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            if (!_model
                                                                .showMenu)
                                                              InkWell(
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
                                                                  _model.showMenu =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .paperclip,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            if (_model.showMenu)
                                                              InkWell(
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
                                                                  _model.showMenu =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .paperclip,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            Expanded(
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController,
                                                                focusNode: _model
                                                                    .textFieldFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  hintText:
                                                                      'Напишите...',
                                                                  hintStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .accent4,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          16.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .start,
                                                                maxLines: 5,
                                                                minLines: 1,
                                                                maxLength: 600,
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
                                                                    .textControllerValidator
                                                                    .asValidator(
                                                                        context),
                                                              ),
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderRadius:
                                                                  100.0,
                                                              buttonSize: 48.0,
                                                              disabledIconColor:
                                                                  Color(
                                                                      0x9A616161),
                                                              icon: Icon(
                                                                FFIcons.ksend,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                size: 24.0,
                                                              ),
                                                              onPressed: ((_model.textController.text ==
                                                                              '') &&
                                                                      !(_model
                                                                          .uploadedPhoto
                                                                          .isNotEmpty))
                                                                  ? null
                                                                  : () async {
                                                                      {
                                                                        safeSetState(() =>
                                                                            _model.isDataUploading_uploadPhotoMessInFirebaseWeb =
                                                                                true);
                                                                        var selectedUploadedFiles =
                                                                            <FFUploadedFile>[];
                                                                        var selectedMedia =
                                                                            <SelectedFile>[];
                                                                        var downloadUrls =
                                                                            <String>[];
                                                                        try {
                                                                          selectedUploadedFiles =
                                                                              _model.uploadedPhoto;
                                                                          selectedMedia =
                                                                              selectedFilesFromUploadedFiles(
                                                                            selectedUploadedFiles,
                                                                            isMultiData:
                                                                                true,
                                                                          );
                                                                          downloadUrls = (await Future.wait(
                                                                            selectedMedia.map(
                                                                              (m) async => await uploadData(m.storagePath, m.bytes),
                                                                            ),
                                                                          ))
                                                                              .where((u) => u != null)
                                                                              .map((u) => u!)
                                                                              .toList();
                                                                        } finally {
                                                                          _model.isDataUploading_uploadPhotoMessInFirebaseWeb =
                                                                              false;
                                                                        }
                                                                        if (selectedUploadedFiles.length == selectedMedia.length &&
                                                                            downloadUrls.length ==
                                                                                selectedMedia.length) {
                                                                          safeSetState(
                                                                              () {
                                                                            _model.uploadedLocalFiles_uploadPhotoMessInFirebaseWeb =
                                                                                selectedUploadedFiles;
                                                                            _model.uploadedFileUrls_uploadPhotoMessInFirebaseWeb =
                                                                                downloadUrls;
                                                                          });
                                                                        } else {
                                                                          safeSetState(
                                                                              () {});
                                                                          return;
                                                                        }
                                                                      }

                                                                      var messagesRecordReference = MessagesRecord
                                                                          .collection
                                                                          .doc();
                                                                      await messagesRecordReference
                                                                          .set({
                                                                        ...createMessagesRecordData(
                                                                          chat: _model
                                                                              .choosenChat
                                                                              ?.reference,
                                                                          text: _model.textController.text != ''
                                                                              ? _model.textController.text
                                                                              : 'Сообщение',
                                                                          sender:
                                                                              currentUserReference,
                                                                          dateTime:
                                                                              getCurrentTimestamp,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'images':
                                                                                _model.uploadedFileUrls_uploadPhotoMessInFirebaseWeb,
                                                                          },
                                                                        ),
                                                                      });
                                                                      _model.newMessTextOrPhoto =
                                                                          MessagesRecord
                                                                              .getDocumentFromData({
                                                                        ...createMessagesRecordData(
                                                                          chat: _model
                                                                              .choosenChat
                                                                              ?.reference,
                                                                          text: _model.textController.text != ''
                                                                              ? _model.textController.text
                                                                              : 'Сообщение',
                                                                          sender:
                                                                              currentUserReference,
                                                                          dateTime:
                                                                              getCurrentTimestamp,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'images':
                                                                                _model.uploadedFileUrls_uploadPhotoMessInFirebaseWeb,
                                                                          },
                                                                        ),
                                                                      }, messagesRecordReference);

                                                                      await _model
                                                                          .choosenChat!
                                                                          .reference
                                                                          .update({
                                                                        ...createChatRecordData(
                                                                          lastMessageTime:
                                                                              getCurrentTimestamp,
                                                                          lastMessage: _model
                                                                              .newMessTextOrPhoto
                                                                              ?.reference,
                                                                          lastMessageSender:
                                                                              currentUserReference,
                                                                          lastMessageText: _model
                                                                              .newMessTextOrPhoto
                                                                              ?.text,
                                                                        ),
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'messages':
                                                                                FieldValue.arrayUnion([
                                                                              _model.newMessTextOrPhoto?.reference
                                                                            ]),
                                                                            'lastMessageSeenBy':
                                                                                FieldValue.delete(),
                                                                          },
                                                                        ),
                                                                      });

                                                                      await _model
                                                                          .choosenChat!
                                                                          .reference
                                                                          .update({
                                                                        ...mapToFirestore(
                                                                          {
                                                                            'lastMessageSeenBy':
                                                                                FieldValue.arrayUnion([
                                                                              currentUserReference
                                                                            ]),
                                                                          },
                                                                        ),
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model
                                                                            .textController
                                                                            ?.clear();
                                                                      });
                                                                      safeSetState(
                                                                          () {
                                                                        _model.isDataUploading_uploadPhotoMessInFirebaseWeb =
                                                                            false;
                                                                        _model.uploadedLocalFiles_uploadPhotoMessInFirebaseWeb =
                                                                            [];
                                                                        _model.uploadedFileUrls_uploadPhotoMessInFirebaseWeb =
                                                                            [];
                                                                      });

                                                                      _model.uploadedPhoto =
                                                                          [];
                                                                      _model.showMenu =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                  ].divide(SizedBox(width: 24.0)),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
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
