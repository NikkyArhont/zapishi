import '/aaazapishi/components/menu/menu_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/chats/empty_chats/empty_chats_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import '/index.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'my_chats_model.dart';
export 'my_chats_model.dart';

class MyChatsWidget extends StatefulWidget {
  const MyChatsWidget({super.key});

  static String routeName = 'myChats';
  static String routePath = '/myChats';

  @override
  State<MyChatsWidget> createState() => _MyChatsWidgetState();
}

class _MyChatsWidgetState extends State<MyChatsWidget> {
  late MyChatsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyChatsModel());

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
              Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Чаты',
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
                                color: FlutterFlowTheme.of(context).primaryText,
                                letterSpacing: 0.0,
                                fontWeight: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .fontWeight,
                                fontStyle: FlutterFlowTheme.of(context)
                                    .displayMedium
                                    .fontStyle,
                              ),
                    ),
                    Container(
                      height: 48.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            32.0, 0.0, 32.0, 0.0),
                        child: InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            var chatRecordReference =
                                ChatRecord.collection.doc();
                            await chatRecordReference.set({
                              ...mapToFirestore(
                                {
                                  'members': [currentUserReference],
                                },
                              ),
                            });
                            _model.createChat = ChatRecord.getDocumentFromData({
                              ...mapToFirestore(
                                {
                                  'members': [currentUserReference],
                                },
                              ),
                            }, chatRecordReference);

                            var messagesRecordReference =
                                MessagesRecord.collection.doc();
                            await messagesRecordReference
                                .set(createMessagesRecordData(
                              chat: _model.createChat?.reference,
                              sender: currentUserReference,
                              text: 'Новый чат с поддержкой',
                              dateTime: getCurrentTimestamp,
                            ));
                            _model.firstMessSupport =
                                MessagesRecord.getDocumentFromData(
                                    createMessagesRecordData(
                                      chat: _model.createChat?.reference,
                                      sender: currentUserReference,
                                      text: 'Новый чат с поддержкой',
                                      dateTime: getCurrentTimestamp,
                                    ),
                                    messagesRecordReference);
                            _model.searchAdmin = await queryUserRecordOnce(
                              queryBuilder: (userRecord) => userRecord.where(
                                'essence',
                                isEqualTo: UserStatus.admin.serialize(),
                              ),
                            );
                            _model.searchAdmins =
                                _model.searchAdmin!.toList().cast<UserRecord>();
                            safeSetState(() {});

                            await _model.createChat!.reference.update({
                              ...createChatRecordData(
                                lastMessage: _model.firstMessSupport?.reference,
                                lastMessageTime:
                                    _model.firstMessSupport?.dateTime,
                                lastMessageText: _model.firstMessSupport?.text,
                                lastMessageSender:
                                    _model.firstMessSupport?.sender,
                              ),
                              ...mapToFirestore(
                                {
                                  'messages': FieldValue.arrayUnion(
                                      [_model.firstMessSupport?.reference]),
                                  'lastMessageSeenBy': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                  'members': FieldValue.arrayUnion([
                                    _model.searchAdmins
                                        .elementAtOrNull(
                                            random_data.randomInteger(
                                                0, _model.searchAdmins.length))
                                        ?.reference
                                  ]),
                                },
                              ),
                            });

                            context.pushNamed(
                              CchatWindowWidget.routeName,
                              queryParameters: {
                                'chatDocument': serializeParam(
                                  _model.createChat,
                                  ParamType.Document,
                                ),
                              }.withoutNulls,
                              extra: <String, dynamic>{
                                'chatDocument': _model.createChat,
                              },
                            );

                            safeSetState(() {});
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Служба поддержки',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .bodyMediumFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts:
                                          !FlutterFlowTheme.of(context)
                                              .bodyMediumIsCustom,
                                    ),
                              ),
                              FFButtonWidget(
                                onPressed: () async {
                                  var chatRecordReference =
                                      ChatRecord.collection.doc();
                                  await chatRecordReference.set({
                                    ...mapToFirestore(
                                      {
                                        'members': [currentUserReference],
                                      },
                                    ),
                                  });
                                  _model.createChat2 =
                                      ChatRecord.getDocumentFromData({
                                    ...mapToFirestore(
                                      {
                                        'members': [currentUserReference],
                                      },
                                    ),
                                  }, chatRecordReference);

                                  var messagesRecordReference =
                                      MessagesRecord.collection.doc();
                                  await messagesRecordReference
                                      .set(createMessagesRecordData(
                                    chat: _model.createChat?.reference,
                                    sender: currentUserReference,
                                    text: 'Новый чат с поддержкой',
                                    dateTime: getCurrentTimestamp,
                                  ));
                                  _model.firstMessSupport2 =
                                      MessagesRecord.getDocumentFromData(
                                          createMessagesRecordData(
                                            chat: _model.createChat?.reference,
                                            sender: currentUserReference,
                                            text: 'Новый чат с поддержкой',
                                            dateTime: getCurrentTimestamp,
                                          ),
                                          messagesRecordReference);
                                  _model.searchAdmin2 =
                                      await queryUserRecordOnce(
                                    queryBuilder: (userRecord) =>
                                        userRecord.where(
                                      'essence',
                                      isEqualTo: UserStatus.admin.serialize(),
                                    ),
                                  );
                                  _model.searchAdmins = _model.searchAdmin!
                                      .toList()
                                      .cast<UserRecord>();
                                  safeSetState(() {});

                                  await _model.createChat!.reference.update({
                                    ...createChatRecordData(
                                      lastMessage:
                                          _model.firstMessSupport?.reference,
                                      lastMessageTime:
                                          _model.firstMessSupport?.dateTime,
                                      lastMessageText:
                                          _model.firstMessSupport?.text,
                                      lastMessageSender:
                                          _model.firstMessSupport?.sender,
                                    ),
                                    ...mapToFirestore(
                                      {
                                        'messages': FieldValue.arrayUnion([
                                          _model.firstMessSupport?.reference
                                        ]),
                                        'lastMessageSeenBy':
                                            FieldValue.arrayUnion(
                                                [currentUserReference]),
                                        'members': FieldValue.arrayUnion([
                                          _model.searchAdmins
                                              .elementAtOrNull(
                                                  random_data.randomInteger(
                                                      0,
                                                      _model
                                                          .searchAdmins.length))
                                              ?.reference
                                        ]),
                                      },
                                    ),
                                  });

                                  context.pushNamed(
                                    CchatWindowWidget.routeName,
                                    queryParameters: {
                                      'chatDocument': serializeParam(
                                        _model.createChat,
                                        ParamType.Document,
                                      ),
                                    }.withoutNulls,
                                    extra: <String, dynamic>{
                                      'chatDocument': _model.createChat,
                                    },
                                  );

                                  safeSetState(() {});
                                },
                                text: 'Написать',
                                options: FFButtonOptions(
                                  height: 38.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      16.0, 0.0, 16.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 0.0,
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            24.0, 0.0, 24.0, 0.0),
                        child: StreamBuilder<List<ChatRecord>>(
                          stream: queryChatRecord(
                            queryBuilder: (chatRecord) => chatRecord
                                .where(
                                  'members',
                                  arrayContains: currentUserReference,
                                )
                                .orderBy('last_message_time', descending: true),
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
                            List<ChatRecord> listViewChatRecordList =
                                snapshot.data!;
                            if (listViewChatRecordList.isEmpty) {
                              return Center(
                                child: EmptyChatsWidget(),
                              );
                            }

                            return ListView.separated(
                              padding: EdgeInsets.fromLTRB(
                                0,
                                0,
                                0,
                                80.0,
                              ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: listViewChatRecordList.length,
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 12.0),
                              itemBuilder: (context, listViewIndex) {
                                final listViewChatRecord =
                                    listViewChatRecordList[listViewIndex];
                                return Builder(
                                  builder: (context) {
                                    if (listViewChatRecord.record != null) {
                                      return StreamBuilder<RecordsRecord>(
                                        stream: RecordsRecord.getDocument(
                                            listViewChatRecord.record!),
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

                                          final containerRecordsRecord =
                                              snapshot.data!;

                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: 84.0,
                                            decoration: BoxDecoration(),
                                            child: StreamBuilder<UserRecord>(
                                              stream: UserRecord.getDocument(
                                                  containerRecordsRecord
                                                      .client!),
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

                                                final containerUserRecord =
                                                    snapshot.data!;

                                                return Container(
                                                  decoration: BoxDecoration(),
                                                  child: StreamBuilder<
                                                      MastersRecord>(
                                                    stream: MastersRecord
                                                        .getDocument(
                                                            containerRecordsRecord
                                                                .organisation!),
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

                                                      final containerMastersRecord =
                                                          snapshot.data!;

                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              CchatWindowWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'chatDocument':
                                                                    serializeParam(
                                                                  listViewChatRecord,
                                                                  ParamType
                                                                      .Document,
                                                                ),
                                                              }.withoutNulls,
                                                              extra: <String,
                                                                  dynamic>{
                                                                'chatDocument':
                                                                    listViewChatRecord,
                                                              },
                                                            );
                                                          },
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Container(
                                                                width: 60.0,
                                                                height: 60.0,
                                                                clipBehavior: Clip
                                                                    .antiAlias,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  currentUserReference ==
                                                                          containerRecordsRecord
                                                                              .client
                                                                      ? containerMastersRecord
                                                                          .banner
                                                                      : containerUserRecord
                                                                          .photoUrl,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  errorBuilder: (context,
                                                                          error,
                                                                          stackTrace) =>
                                                                      Image
                                                                          .asset(
                                                                    'assets/images/error_image.png',
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              Flexible(
                                                                child: Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          0.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        currentUserReference ==
                                                                                containerRecordsRecord.client
                                                                            ? containerMastersRecord.title
                                                                            : containerUserRecord.displayName.maybeHandleOverflow(
                                                                                maxChars: 30,
                                                                                replacement: '…',
                                                                              ),
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.bold,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        containerRecordsRecord
                                                                            .title,
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        listViewChatRecord
                                                                            .lastMessageText
                                                                            .maybeHandleOverflow(
                                                                          maxChars:
                                                                              40,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                        maxLines:
                                                                            1,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontSize: 16.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w500,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
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
                                                                        .end,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                              "yMd",
                                                                              listViewChatRecord.lastMessageTime,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            ) ==
                                                                            dateTimeFormat(
                                                                              "yMd",
                                                                              getCurrentTimestamp,
                                                                              locale: FFLocalizations.of(context).languageCode,
                                                                            )
                                                                        ? dateTimeFormat(
                                                                            "Hm",
                                                                            listViewChatRecord.lastMessageTime!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )
                                                                        : dateTimeFormat(
                                                                            "dd.MM.yy",
                                                                            listViewChatRecord.lastMessageTime!,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryText,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  if (!listViewChatRecord
                                                                      .lastMessageSeenBy
                                                                      .contains(
                                                                          currentUserReference))
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            25.0,
                                                                        height:
                                                                            25.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                ],
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 8.0)),
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
                                      return Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                1.0,
                                        height: 84.0,
                                        decoration: BoxDecoration(),
                                        child: Container(
                                          decoration: BoxDecoration(),
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  CchatWindowWidget.routeName,
                                                  queryParameters: {
                                                    'chatDocument':
                                                        serializeParam(
                                                      listViewChatRecord,
                                                      ParamType.Document,
                                                    ),
                                                  }.withoutNulls,
                                                  extra: <String, dynamic>{
                                                    'chatDocument':
                                                        listViewChatRecord,
                                                  },
                                                );
                                              },
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    width: 60.0,
                                                    height: 60.0,
                                                    clipBehavior:
                                                        Clip.antiAlias,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Image.asset(
                                                      'assets/images/Logo.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Flexible(
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            'Чат с поддержкой',
                                                            maxLines: 1,
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
                                                          Text(
                                                            listViewChatRecord
                                                                .lastMessageText
                                                                .maybeHandleOverflow(
                                                              maxChars: 40,
                                                              replacement: '…',
                                                            ),
                                                            maxLines: 1,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 4.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat(
                                                                  "yMd",
                                                                  listViewChatRecord
                                                                      .lastMessageTime,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                ) ==
                                                                dateTimeFormat(
                                                                  "yMd",
                                                                  getCurrentTimestamp,
                                                                  locale: FFLocalizations.of(
                                                                          context)
                                                                      .languageCode,
                                                                )
                                                            ? dateTimeFormat(
                                                                "Hm",
                                                                listViewChatRecord
                                                                    .lastMessageTime!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              )
                                                            : dateTimeFormat(
                                                                "dd.MM.yy",
                                                                listViewChatRecord
                                                                    .lastMessageTime!,
                                                                locale: FFLocalizations.of(
                                                                        context)
                                                                    .languageCode,
                                                              ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMediumFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMediumIsCustom,
                                                                ),
                                                      ),
                                                      if (!listViewChatRecord
                                                          .lastMessageSeenBy
                                                          .contains(
                                                              currentUserReference))
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: 25.0,
                                                            height: 25.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                          ),
                                                        ),
                                                    ],
                                                  ),
                                                ].divide(SizedBox(width: 8.0)),
                                              ),
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
                  ]
                      .divide(SizedBox(height: 16.0))
                      .addToStart(SizedBox(height: 23.0)),
                ),
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: wrapWithModel(
                  model: _model.menuModel,
                  updateCallback: () => safeSetState(() {}),
                  child: MenuWidget(
                    currentPage: CurrentPage.chats,
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
