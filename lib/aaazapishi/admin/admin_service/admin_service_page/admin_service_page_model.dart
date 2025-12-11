import '/aaazapishi/admin/admin_menu/admin_menu_widget.dart';
import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/components/avatar_mini_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'admin_service_page_widget.dart' show AdminServicePageWidget;
import 'package:flutter/material.dart';

class AdminServicePageModel extends FlutterFlowModel<AdminServicePageWidget> {
  ///  Local state fields for this page.

  bool? hidden = false;

  List<DocumentReference> filter = [];
  void addToFilter(DocumentReference item) => filter.add(item);
  void removeFromFilter(DocumentReference item) => filter.remove(item);
  void removeAtIndexFromFilter(int index) => filter.removeAt(index);
  void insertAtIndexInFilter(int index, DocumentReference item) =>
      filter.insert(index, item);
  void updateFilterAtIndex(int index, Function(DocumentReference) updateFn) =>
      filter[index] = updateFn(filter[index]);

  bool setFilter = false;

  ///  State fields for stateful widgets in this page.

  // Model for adminMenu component.
  late AdminMenuModel adminMenuModel;
  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for avatarMini component.
  late AvatarMiniModel avatarMiniModel1;

  @override
  void initState(BuildContext context) {
    adminMenuModel = createModel(context, () => AdminMenuModel());
    backbuttonModel = createModel(context, () => BackbuttonModel());
    avatarMiniModel1 = createModel(context, () => AvatarMiniModel());
  }

  @override
  void dispose() {
    adminMenuModel.dispose();
    backbuttonModel.dispose();
    avatarMiniModel1.dispose();
  }
}
