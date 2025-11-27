import '/aaazapishi/components/menu/menu_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_chats_widget.dart' show MyChatsWidget;
import 'package:flutter/material.dart';

class MyChatsModel extends FlutterFlowModel<MyChatsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  ChatRecord? createChat;
  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  MessagesRecord? firstMessSupport;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  UserRecord? searchAdmin;
  // Model for menu component.
  late MenuModel menuModel;

  @override
  void initState(BuildContext context) {
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    menuModel.dispose();
  }
}
