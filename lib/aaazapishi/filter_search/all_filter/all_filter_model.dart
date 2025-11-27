import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_filter_widget.dart' show AllFilterWidget;
import 'package:flutter/material.dart';

class AllFilterModel extends FlutterFlowModel<AllFilterWidget> {
  ///  Local state fields for this page.

  List<DocumentReference> choosenCats = [];
  void addToChoosenCats(DocumentReference item) => choosenCats.add(item);
  void removeFromChoosenCats(DocumentReference item) =>
      choosenCats.remove(item);
  void removeAtIndexFromChoosenCats(int index) => choosenCats.removeAt(index);
  void insertAtIndexInChoosenCats(int index, DocumentReference item) =>
      choosenCats.insert(index, item);
  void updateChoosenCatsAtIndex(
          int index, Function(DocumentReference) updateFn) =>
      choosenCats[index] = updateFn(choosenCats[index]);

  SearchPlaceStruct? place;
  void updatePlaceStruct(Function(SearchPlaceStruct) updateFn) {
    updateFn(place ??= SearchPlaceStruct());
  }

  bool radius = false;

  LatLng? userLoc;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Bottom Sheet - enterLocationFilter] action in Container widget.
  SearchPlaceStruct? setLoc;
  // State field(s) for userLoc widget.
  bool? userLocValue;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for date widget.
  final dateKey = GlobalKey();
  FocusNode? dateFocusNode;
  TextEditingController? dateTextController;
  String? dateSelectedOption;
  String? Function(BuildContext, String?)? dateTextControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Backend Call - API (getPlaceLatLng)] action in Button widget.
  ApiCallResponse? apiResultPlaceLatLon;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    dateFocusNode?.dispose();
  }
}
