import '/aaazapishi/components/menu/menu_widget.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/avatar_mini_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cabinet_widget.dart' show CabinetWidget;
import 'package:flutter/material.dart';

class CabinetModel extends FlutterFlowModel<CabinetWidget> {
  ///  Local state fields for this page.

  RecordStatus? menu;

  DateTime? choosenDate;

  DocumentReference? choosenMaster;

  int? pin;

  MastersRecord? master;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Bottom Sheet - chooseRecordDate] action in IconButton widget.
  DateTime? setDate;
  // Model for avatarMini component.
  late AvatarMiniModel avatarMiniModel1;
  // Model for menu component.
  late MenuModel menuModel;

  @override
  void initState(BuildContext context) {
    avatarMiniModel1 = createModel(context, () => AvatarMiniModel());
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    avatarMiniModel1.dispose();
    menuModel.dispose();
  }
}
