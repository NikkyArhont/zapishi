import '/aaazapishi/records/create_debate_commplete/create_debate_commplete_widget.dart';
import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'create_debate_model.dart';
export 'create_debate_model.dart';

class CreateDebateWidget extends StatefulWidget {
  const CreateDebateWidget({
    super.key,
    required this.recordDOc,
    required this.servDoc,
    required this.masrterDoc,
  });

  final RecordsRecord? recordDOc;
  final ServicesRecord? servDoc;
  final MastersRecord? masrterDoc;

  static String routeName = 'createDebate';
  static String routePath = '/createDebate';

  @override
  State<CreateDebateWidget> createState() => _CreateDebateWidgetState();
}

class _CreateDebateWidgetState extends State<CreateDebateWidget> {
  late CreateDebateModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CreateDebateModel());

    _model.noteTextController ??= TextEditingController();
    _model.noteFocusNode ??= FocusNode();

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
      child: PopScope(
        canPop: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          body: SafeArea(
            top: true,
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 40.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .primaryBackground,
                              icon: Icon(
                                Icons.arrow_back,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24.0,
                              ),
                              onPressed: () async {
                                context.safePop();
                              },
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                'Открыть спор',
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
                            ),
                          ].divide(SizedBox(width: 8.0)),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(16.0),
                          child: Container(
                            width: 380.0,
                            constraints: BoxConstraints(
                              maxWidth: 840.0,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFF2F2F2),
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16.0),
                                    child: Image.network(
                                      widget.servDoc!.photo.firstOrNull!,
                                      width: 85.0,
                                      height: 85.0,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              Image.asset(
                                        'assets/images/error_image.png',
                                        width: 85.0,
                                        height: 85.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          valueOrDefault<String>(
                                            widget.servDoc?.title,
                                            'noTitle',
                                          ),
                                          maxLines: 3,
                                          style: FlutterFlowTheme.of(context)
                                              .titleMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleMediumIsCustom,
                                              ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              valueOrDefault<String>(
                                                widget.masrterDoc?.title,
                                                'NoTitle',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                            ),
                                            Icon(
                                              FFIcons.kstar2,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customer,
                                              size: 18.0,
                                            ),
                                            Text(
                                              formatNumber(
                                                widget.masrterDoc!.raiting,
                                                formatType: FormatType.custom,
                                                format: '#.#',
                                                locale: '',
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 6.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            if (!widget.servDoc!.fixedPrice)
                                              AutoSizeText(
                                                'от',
                                                maxLines: 1,
                                                minFontSize: 10.0,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .titleMedium
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryText,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .titleMediumIsCustom,
                                                    ),
                                              ),
                                            AutoSizeText(
                                              valueOrDefault<String>(
                                                widget.recordDOc?.totalCost
                                                    .toString(),
                                                'noCost',
                                              ),
                                              maxLines: 1,
                                              minFontSize: 10.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumIsCustom,
                                                  ),
                                            ),
                                            AutoSizeText(
                                              ' ${FFAppConstants.currency}',
                                              maxLines: 1,
                                              minFontSize: 10.0,
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .titleMedium
                                                  .override(
                                                    fontFamily:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumFamily,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryText,
                                                    letterSpacing: 0.0,
                                                    fontWeight: FontWeight.w600,
                                                    useGoogleFonts:
                                                        !FlutterFlowTheme.of(
                                                                context)
                                                            .titleMediumIsCustom,
                                                  ),
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            StreamBuilder<CategoryRecord>(
                                              stream:
                                                  CategoryRecord.getDocument(
                                                      widget.servDoc!.category
                                                          .firstOrNull!),
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

                                                final textCategoryRecord =
                                                    snapshot.data!;

                                                return Text(
                                                  textCategoryRecord.title,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                );
                                              },
                                            ),
                                            Text(
                                              '-',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMediumIsCustom,
                                                      ),
                                            ),
                                            StreamBuilder<CategoryRecord>(
                                              stream:
                                                  CategoryRecord.getDocument(
                                                      widget.servDoc!.category
                                                          .elementAtOrNull(1)!),
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

                                                final textCategoryRecord =
                                                    snapshot.data!;

                                                return Text(
                                                  textCategoryRecord.title,
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            fontSize: 10.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                );
                                              },
                                            ),
                                          ].divide(SizedBox(width: 4.0)),
                                        ),
                                      ].divide(SizedBox(height: 4.0)),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 24.0)),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Text(
                            'Комментарий',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                          ),
                        ),
                        Container(
                          width: 360.0,
                          child: TextFormField(
                            controller: _model.noteTextController,
                            focusNode: _model.noteFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.noteTextController',
                              Duration(milliseconds: 1000),
                              () => safeSetState(() {}),
                            ),
                            autofocus: false,
                            obscureText: false,
                            decoration: InputDecoration(
                              isDense: true,
                              hintText: 'Введите',
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .labelMediumFamily,
                                    color: Color(0xFF9E9E9E),
                                    fontSize: 16.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.normal,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .labelMediumIsCustom,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsets.all(18.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyMediumFamily,
                                  fontSize: 16.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .bodyMediumIsCustom,
                                ),
                            maxLines: 6,
                            maxLength: 120,
                            maxLengthEnforcement: MaxLengthEnforcement.none,
                            buildCounter: (context,
                                    {required currentLength,
                                    required isFocused,
                                    maxLength}) =>
                                null,
                            cursorColor:
                                FlutterFlowTheme.of(context).primaryText,
                            validator: _model.noteTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  FFIcons.kinfoSquare,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  size: 24.0,
                                ),
                                Text(
                                  'Спор будет доступен в чате с исполнителем',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        font: GoogleFonts.mulish(
                                          fontWeight: FontWeight.w500,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 10.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.safePop();
                                    },
                                    text: 'Отменить',
                                    options: FFButtonOptions(
                                      width: 170.0,
                                      height: 48.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily: 'involve',
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 0.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                      ),
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Builder(
                                    builder: (context) => FFButtonWidget(
                                      onPressed: ((_model.noteTextController
                                                          .text ==
                                                      '') ||
                                              (_model.uploadedMedia.isNotEmpty))
                                          ? null
                                          : () async {
                                              _model.readChat = await ChatRecord
                                                  .getDocumentOnce(widget
                                                      .recordDOc!.chatRecord!);
                                              _model.findAdmin =
                                                  await queryUserRecordOnce(
                                                queryBuilder: (userRecord) =>
                                                    userRecord.where(
                                                  'essence',
                                                  isEqualTo: UserStatus.admin
                                                      .serialize(),
                                                ),
                                                singleRecord: true,
                                              ).then((s) => s.firstOrNull);

                                              var messagesRecordReference =
                                                  MessagesRecord.collection
                                                      .doc();
                                              await messagesRecordReference
                                                  .set(createMessagesRecordData(
                                                chat: widget
                                                    .recordDOc?.chatRecord,
                                                sender: currentUserReference,
                                                text:
                                                    'Открыт спор! ${widget.recordDOc?.title} Причина: ${_model.noteTextController.text}',
                                                dateTime: getCurrentTimestamp,
                                              ));
                                              _model.reportMessage = MessagesRecord
                                                  .getDocumentFromData(
                                                      createMessagesRecordData(
                                                        chat: widget.recordDOc
                                                            ?.chatRecord,
                                                        sender:
                                                            currentUserReference,
                                                        text:
                                                            'Открыт спор! ${widget.recordDOc?.title} Причина: ${_model.noteTextController.text}',
                                                        dateTime:
                                                            getCurrentTimestamp,
                                                      ),
                                                      messagesRecordReference);

                                              await widget.recordDOc!.reference
                                                  .update(
                                                      createRecordsRecordData(
                                                report: updateReportStruct(
                                                  ReportStruct(
                                                    status: ReportStatus.open,
                                                    reason: _model.reportMessage
                                                        ?.reference,
                                                  ),
                                                  clearUnsetFields: false,
                                                ),
                                              ));

                                              await _model.readChat!.reference
                                                  .update({
                                                ...createChatRecordData(
                                                  lastMessage: _model
                                                      .reportMessage?.reference,
                                                  lastMessageTime: _model
                                                      .reportMessage?.dateTime,
                                                  lastMessageText: _model
                                                      .reportMessage?.text,
                                                  lastMessageSender: _model
                                                      .reportMessage?.sender,
                                                ),
                                                ...mapToFirestore(
                                                  {
                                                    'messages':
                                                        FieldValue.arrayUnion([
                                                      _model.reportMessage
                                                          ?.reference
                                                    ]),
                                                    'members':
                                                        FieldValue.arrayUnion([
                                                      _model
                                                          .findAdmin?.reference
                                                    ]),
                                                    'lastMessageSeenBy':
                                                        FieldValue.arrayUnion([
                                                      currentUserReference
                                                    ]),
                                                  },
                                                ),
                                              });
                                              triggerPushNotification(
                                                notificationTitle:
                                                    'Открыт спор',
                                                notificationText: _model
                                                    .noteTextController.text,
                                                userRefs: [
                                                  widget.masrterDoc!.owner!
                                                ],
                                                initialPageName: 'cchatWindow',
                                                parameterData: {
                                                  'chatDocument':
                                                      _model.readChat,
                                                },
                                              );
                                              await showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        FocusScope.of(
                                                                dialogContext)
                                                            .unfocus();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child:
                                                          CreateDebateCommpleteWidget(
                                                        chat: _model.readChat!,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              safeSetState(() {});
                                            },
                                      text: 'Отправить',
                                      options: FFButtonOptions(
                                        width: 170.0,
                                        height: 48.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 16.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'involve',
                                              letterSpacing: 0.0,
                                            ),
                                        elevation: 0.0,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        disabledColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(SizedBox(width: 12.0)),
                            ),
                          ),
                        ),
                      ].divide(SizedBox(height: 18.0)),
                    ),
                  ),
                ].divide(SizedBox(height: 12.0)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
