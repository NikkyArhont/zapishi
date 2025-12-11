import 'dart:async';

import 'serialization_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';


final _handledMessageIds = <String?>{};

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key? key, required this.child})
      : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    if (_handledMessageIds.contains(message.messageId)) {
      return;
    }
    _handledMessageIds.add(message.messageId);

    safeSetState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final parametersBuilder = parametersBuilderMap[initialPageName];
      if (parametersBuilder != null) {
        final parameterData = await parametersBuilder(initialParameterData);
        if (mounted) {
          context.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        } else {
          appNavigatorKey.currentContext?.pushNamed(
            initialPageName,
            pathParameters: parameterData.pathParameters,
            extra: parameterData.extra,
          );
        }
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      safeSetState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      handleOpenedPushNotification();
    });
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: FlutterFlowTheme.of(context).secondary,
          child: Center(
            child: Image.asset(
              'assets/images/Frame_1851040970.png',
              width: 250.0,
              height: 250.0,
              fit: BoxFit.contain,
            ),
          ),
        )
      : widget.child;
}

class ParameterData {
  const ParameterData(
      {this.requiredParams = const {}, this.allParams = const {}});
  final Map<String, String?> requiredParams;
  final Map<String, dynamic> allParams;

  Map<String, String> get pathParameters => Map.fromEntries(
        requiredParams.entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
  Map<String, dynamic> get extra => Map.fromEntries(
        allParams.entries.where((e) => e.value != null),
      );

  static Future<ParameterData> Function(Map<String, dynamic>) none() =>
      (data) async => ParameterData();
}

final parametersBuilderMap =
    <String, Future<ParameterData> Function(Map<String, dynamic>)>{
  'startpage': ParameterData.none(),
  'onboarding': ParameterData.none(),
  'enterPhone': ParameterData.none(),
  'smsverification': (data) async => ParameterData(
        allParams: {
          'phone': getParameter<String>(data, 'phone'),
          'test': getParameter<bool>(data, 'test'),
        },
      ),
  'enterEditProfile': ParameterData.none(),
  'main': ParameterData.none(),
  'MapFilter': ParameterData.none(),
  'SearchResult': ParameterData.none(),
  'allFilter': ParameterData.none(),
  'myProfile': ParameterData.none(),
  'EditProfile': ParameterData.none(),
  'adminPageLogin': ParameterData.none(),
  'createRecord': (data) async => ParameterData(
        allParams: {
          'organisationCard': await getDocumentParameter<MastersRecord>(
              data, 'organisationCard', MastersRecord.fromSnapshot),
          'initialServ': await getDocumentParameter<ServicesRecord>(
              data, 'initialServ', ServicesRecord.fromSnapshot),
        },
      ),
  'adminMainProfile': ParameterData.none(),
  'adminPageRegistration': ParameterData.none(),
  'adminCategory': ParameterData.none(),
  'masterPage': (data) async => ParameterData(
        allParams: {
          'master': getParameter<DocumentReference>(data, 'master'),
        },
      ),
  'createDebate': (data) async => ParameterData(
        allParams: {
          'recordDOc': await getDocumentParameter<RecordsRecord>(
              data, 'recordDOc', RecordsRecord.fromSnapshot),
          'servDoc': await getDocumentParameter<ServicesRecord>(
              data, 'servDoc', ServicesRecord.fromSnapshot),
          'masrterDoc': await getDocumentParameter<MastersRecord>(
              data, 'masrterDoc', MastersRecord.fromSnapshot),
        },
      ),
  'servicePageZ': (data) async => ParameterData(
        allParams: {
          'servRef': getParameter<DocumentReference>(data, 'servRef'),
        },
      ),
  'masterCreate': ParameterData.none(),
  'myRecords': ParameterData.none(),
  'recordPage': (data) async => ParameterData(
        allParams: {
          'recordRef': getParameter<DocumentReference>(data, 'recordRef'),
        },
      ),
  'adminServiceList': (data) async => ParameterData(
        allParams: {
          'catDoc': await getDocumentParameter<CategoryRecord>(
              data, 'catDoc', CategoryRecord.fromSnapshot),
        },
      ),
  'adminPacketList': (data) async => ParameterData(
        allParams: {
          'catDoc': await getDocumentParameter<CategoryRecord>(
              data, 'catDoc', CategoryRecord.fromSnapshot),
        },
      ),
  'masterCreateService': (data) async => ParameterData(
        allParams: <String, dynamic>{},
      ),
  'masterWorkSchedule': ParameterData.none(),
  'masterChooseCat': ParameterData.none(),
  'cabinet': ParameterData.none(),
  'reservePage': (data) async => ParameterData(
        allParams: {
          'recordRef': getParameter<DocumentReference>(data, 'recordRef'),
        },
      ),
  'masterAddService': (data) async => ParameterData(
        allParams: {
          'masterRef': await getDocumentParameter<MastersRecord>(
              data, 'masterRef', MastersRecord.fromSnapshot),
        },
      ),
  'masterChooseCatAddServ': (data) async => ParameterData(
        allParams: {
          'masterRef': await getDocumentParameter<MastersRecord>(
              data, 'masterRef', MastersRecord.fromSnapshot),
        },
      ),
  'myChats': ParameterData.none(),
  'cchatWindow': (data) async => ParameterData(
        allParams: {
          'chatDocument': await getDocumentParameter<ChatRecord>(
              data, 'chatDocument', ChatRecord.fromSnapshot),
        },
      ),
  'reviews': ParameterData.none(),
  'createReview': (data) async => ParameterData(
        allParams: {
          'record': await getDocumentParameter<RecordsRecord>(
              data, 'record', RecordsRecord.fromSnapshot),
        },
      ),
  'masterSearch': ParameterData.none(),
  'masterPageOffer': (data) async => ParameterData(
        allParams: {
          'master': getParameter<DocumentReference>(data, 'master'),
        },
      ),
  'favoriteMasters': ParameterData.none(),
  'masterOfferOrganisation': (data) async => ParameterData(
        allParams: {
          'organisation': await getDocumentParameter<MastersRecord>(
              data, 'organisation', MastersRecord.fromSnapshot),
        },
      ),
  'masterOfferSetServ': (data) async => ParameterData(
        allParams: {
          'organisation': await getDocumentParameter<MastersRecord>(
              data, 'organisation', MastersRecord.fromSnapshot),
        },
      ),
  'subbscribes': ParameterData.none(),
  'chooseSubbscribes': (data) async => ParameterData(
        allParams: {
          'master': await getDocumentParameter<MastersRecord>(
              data, 'master', MastersRecord.fromSnapshot),
          'tarif': await getDocumentParameter<TarifRecord>(
              data, 'tarif', TarifRecord.fromSnapshot),
        },
      ),
  'adminOrders': ParameterData.none(),
  'adminServicePage': (data) async => ParameterData(
        allParams: {
          'serviceRef': getParameter<DocumentReference>(data, 'serviceRef'),
        },
      ),
  'politic': ParameterData.none(),
  'userAgreevment': ParameterData.none(),
  'adminMoney': ParameterData.none(),
  'adminCChats': ParameterData.none(),
  'ccabinetMasterEDIT': (data) async => ParameterData(
        allParams: {
          'masterDOCC': await getDocumentParameter<MastersRecord>(
              data, 'masterDOCC', MastersRecord.fromSnapshot),
        },
      ),
  'masterWorkScheduleEDIT': (data) async => ParameterData(
        allParams: {
          'masterDoc': await getDocumentParameter<MastersRecord>(
              data, 'masterDoc', MastersRecord.fromSnapshot),
        },
      ),
};

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
