import '/aaazapishi/components/backbutton/backbutton_widget.dart';
import '/aaazapishi/components/main_search/main_search_widget.dart';
import '/aaazapishi/components/search_job/search_job_widget.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'map_filter_widget.dart' show MapFilterWidget;
import 'package:flutter/material.dart';

class MapFilterModel extends FlutterFlowModel<MapFilterWidget> {
  ///  Local state fields for this page.

  LatLng? userlocation;

  ServicesRecord? choosenServ;

  ///  State fields for stateful widgets in this page.

  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // Model for backbutton component.
  late BackbuttonModel backbuttonModel;
  // Model for mainSearch component.
  late MainSearchModel mainSearchModel;
  // Model for searchJob component.
  late SearchJobModel searchJobModel;

  @override
  void initState(BuildContext context) {
    backbuttonModel = createModel(context, () => BackbuttonModel());
    mainSearchModel = createModel(context, () => MainSearchModel());
    searchJobModel = createModel(context, () => SearchJobModel());
  }

  @override
  void dispose() {
    backbuttonModel.dispose();
    mainSearchModel.dispose();
    searchJobModel.dispose();
  }
}
