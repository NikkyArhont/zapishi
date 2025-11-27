import '/aaazapishi/components/map_button/map_button_widget.dart';
import '/aaazapishi/components/menu/menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'main_widget.dart' show MainWidget;
import 'package:flutter/material.dart';

class MainModel extends FlutterFlowModel<MainWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> choosenCat = [];
  void addToChoosenCat(DocumentReference item) => choosenCat.add(item);
  void removeFromChoosenCat(DocumentReference item) => choosenCat.remove(item);
  void removeAtIndexFromChoosenCat(int index) => choosenCat.removeAt(index);
  void insertAtIndexInChoosenCat(int index, DocumentReference item) =>
      choosenCat.insert(index, item);
  void updateChoosenCatAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      choosenCat[index] = updateFn(choosenCat[index]);

  bool searchActive = false;

  String? placeID;

  LatLng? searchLatLon;

  int? cardCountNotSearch;

  bool showMap = false;

  String? mainsort = '1';

  ///  State fields for stateful widgets in this page.

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Model for mapButton component.
  late MapButtonModel mapButtonModel;
  // Model for menu component.
  late MenuModel menuModel;

  @override
  void initState(BuildContext context) {
    mapButtonModel = createModel(context, () => MapButtonModel());
    menuModel = createModel(context, () => MenuModel());
  }

  @override
  void dispose() {
    mapButtonModel.dispose();
    menuModel.dispose();
  }
}
