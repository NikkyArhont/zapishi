import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'all_filter_widget.dart' show AllFilterWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

class AllFilterModel extends FlutterFlowModel<AllFilterWidget> {
  ///  Local state fields for this page.

  DocumentReference? choosenCats;

  LatLng? searchLatLng;

  String? placeID;

  List<CategoryRecord> loadCats = [];
  void addToLoadCats(CategoryRecord item) => loadCats.add(item);
  void removeFromLoadCats(CategoryRecord item) => loadCats.remove(item);
  void removeAtIndexFromLoadCats(int index) => loadCats.removeAt(index);
  void insertAtIndexInLoadCats(int index, CategoryRecord item) =>
      loadCats.insert(index, item);
  void updateLoadCatsAtIndex(int index, Function(CategoryRecord) updateFn) =>
      loadCats[index] = updateFn(loadCats[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in allFilter widget.
  List<CategoryRecord>? loadcat;
  // State field(s) for location widget.
  final locationKey1 = GlobalKey();
  FocusNode? locationFocusNode1;
  TextEditingController? locationTextController1;
  String? locationSelectedOption1;
  String? Function(BuildContext, String?)? locationTextController1Validator;
  // Stores action output result for [Backend Call - API (address)] action in location widget.
  ApiCallResponse? apiResultFilterCity;
  // State field(s) for Switch widget.
  bool? switchValue;
  // State field(s) for Slider widget.
  double? sliderValue;
  // State field(s) for location widget.
  final locationKey2 = GlobalKey();
  FocusNode? locationFocusNode2;
  TextEditingController? locationTextController2;
  String? locationSelectedOption2;
  String? Function(BuildContext, String?)? locationTextController2Validator;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController;

  // Stores action output result for [Backend Call - API (getPlaceLatLng)] action in Button widget.
  ApiCallResponse? apiResultPlaceLatLon;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    locationFocusNode1?.dispose();

    locationFocusNode2?.dispose();

    expandableExpandableController.dispose();
  }
}
