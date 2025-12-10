import '/aaazapishi/components/menu/menu_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'my_chats_widget.dart' show MyChatsWidget;
import 'package:flutter/material.dart';

class MyChatsModel extends FlutterFlowModel<MyChatsWidget> {
  ///  Local state fields for this page.

  List<UserRecord> searchAdmins = [];
  void addToSearchAdmins(UserRecord item) => searchAdmins.add(item);
  void removeFromSearchAdmins(UserRecord item) => searchAdmins.remove(item);
  void removeAtIndexFromSearchAdmins(int index) => searchAdmins.removeAt(index);
  void insertAtIndexInSearchAdmins(int index, UserRecord item) =>
      searchAdmins.insert(index, item);
  void updateSearchAdminsAtIndex(int index, Function(UserRecord) updateFn) =>
      searchAdmins[index] = updateFn(searchAdmins[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  ChatRecord? createChat;
  // Stores action output result for [Backend Call - Create Document] action in Row widget.
  MessagesRecord? firstMessSupport;
  // Stores action output result for [Firestore Query - Query a collection] action in Row widget.
  List<UserRecord>? searchAdmin;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  ChatRecord? createChat2;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  MessagesRecord? firstMessSupport2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<UserRecord>? searchAdmin2;
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
