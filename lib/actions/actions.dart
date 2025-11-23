import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';

Future createService(BuildContext context) async {}

Future terminateKYC(BuildContext context) async {
  while ((currentUserDocument?.myServices.toList() ?? []).isNotEmpty) {
    await (currentUserDocument?.myServices.toList() ?? [])
        .lastOrNull!
        .delete();
  }

  context.goNamed(MainWidget.routeName);
}

Future createOrder(BuildContext context) async {}

Future pushNewMassage(BuildContext context) async {}

Future newMessPush(BuildContext context) async {}
