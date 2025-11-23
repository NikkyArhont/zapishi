import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/aaazapishi/components/menu/menu_widget.dart';
import '/components/avatar_mini_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'master_page_widget.dart' show MasterPageWidget;
import 'package:flutter/material.dart';

class MasterPageModel extends FlutterFlowModel<MasterPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;
  // Model for avatarMini component.
  late AvatarMiniModel avatarMiniModel1;
  // Model for menu component.
  late MenuModel menuModel;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
    avatarMiniModel1 = createModel(context, () => AvatarMiniModel());
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
    avatarMiniModel1.dispose();
    menuModel.dispose();
  }
}
