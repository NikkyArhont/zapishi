import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'enter_location_start_widget.dart' show EnterLocationStartWidget;
import 'package:flutter/material.dart';

class EnterLocationStartModel
    extends FlutterFlowModel<EnterLocationStartWidget> {
  ///  Local state fields for this component.

  List<SearchPlaceStruct> searchList = [];
  void addToSearchList(SearchPlaceStruct item) => searchList.add(item);
  void removeFromSearchList(SearchPlaceStruct item) => searchList.remove(item);
  void removeAtIndexFromSearchList(int index) => searchList.removeAt(index);
  void insertAtIndexInSearchList(int index, SearchPlaceStruct item) =>
      searchList.insert(index, item);
  void updateSearchListAtIndex(
          int index, Function(SearchPlaceStruct) updateFn) =>
      searchList[index] = updateFn(searchList[index]);

  SearchPlaceStruct? choosenPlace;
  void updateChoosenPlaceStruct(Function(SearchPlaceStruct) updateFn) {
    updateFn(choosenPlace ??= SearchPlaceStruct());
  }

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (address)] action in TextField widget.
  ApiCallResponse? apiResultCity;
  // Stores action output result for [Backend Call - API (getPlaceLatLng)] action in Button widget.
  ApiCallResponse? apiResultLatLon;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
