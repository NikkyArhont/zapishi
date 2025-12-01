import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/aaazapishi/components/menu/menu_widget.dart';
import '/components/avatar_mini_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_profile_widget.dart' show MyProfileWidget;
import 'package:flutter/material.dart';

class MyProfileModel extends FlutterFlowModel<MyProfileWidget> {
  ///  Local state fields for this page.

  bool notificationAllowed = false;

  bool showInvoice = true;

  ///  State fields for stateful widgets in this page.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;
  // Model for avatarMini component.
  late AvatarMiniModel avatarMiniModel;
  // Model for menu component.
  late MenuModel menuModel;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
    avatarMiniModel = createModel(context, () => AvatarMiniModel());
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
    avatarMiniModel.dispose();
    menuModel.dispose();
  }
}
