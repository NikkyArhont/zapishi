// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterDataStruct extends FFFirebaseStruct {
  FilterDataStruct({
    LatLng? userPoint,
    double? locationRadius,
    List<DocumentReference>? category,
    bool? atHome,
    DateTime? dateServ,
    bool? onRadius,
    SearchPlaceStruct? place,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userPoint = userPoint,
        _locationRadius = locationRadius,
        _category = category,
        _atHome = atHome,
        _dateServ = dateServ,
        _onRadius = onRadius,
        _place = place,
        super(firestoreUtilData);

  // "userPoint" field.
  LatLng? _userPoint;
  LatLng? get userPoint => _userPoint;
  set userPoint(LatLng? val) => _userPoint = val;

  bool hasUserPoint() => _userPoint != null;

  // "locationRadius" field.
  double? _locationRadius;
  double get locationRadius => _locationRadius ?? 0.0;
  set locationRadius(double? val) => _locationRadius = val;

  void incrementLocationRadius(double amount) =>
      locationRadius = locationRadius + amount;

  bool hasLocationRadius() => _locationRadius != null;

  // "Category" field.
  List<DocumentReference>? _category;
  List<DocumentReference> get category => _category ?? const [];
  set category(List<DocumentReference>? val) => _category = val;

  void updateCategory(Function(List<DocumentReference>) updateFn) {
    updateFn(_category ??= []);
  }

  bool hasCategory() => _category != null;

  // "atHome" field.
  bool? _atHome;
  bool get atHome => _atHome ?? false;
  set atHome(bool? val) => _atHome = val;

  bool hasAtHome() => _atHome != null;

  // "dateServ" field.
  DateTime? _dateServ;
  DateTime? get dateServ => _dateServ;
  set dateServ(DateTime? val) => _dateServ = val;

  bool hasDateServ() => _dateServ != null;

  // "onRadius" field.
  bool? _onRadius;
  bool get onRadius => _onRadius ?? false;
  set onRadius(bool? val) => _onRadius = val;

  bool hasOnRadius() => _onRadius != null;

  // "place" field.
  SearchPlaceStruct? _place;
  SearchPlaceStruct get place => _place ?? SearchPlaceStruct();
  set place(SearchPlaceStruct? val) => _place = val;

  void updatePlace(Function(SearchPlaceStruct) updateFn) {
    updateFn(_place ??= SearchPlaceStruct());
  }

  bool hasPlace() => _place != null;

  static FilterDataStruct fromMap(Map<String, dynamic> data) =>
      FilterDataStruct(
        userPoint: data['userPoint'] as LatLng?,
        locationRadius: castToType<double>(data['locationRadius']),
        category: getDataList(data['Category']),
        atHome: data['atHome'] as bool?,
        dateServ: data['dateServ'] as DateTime?,
        onRadius: data['onRadius'] as bool?,
        place: data['place'] is SearchPlaceStruct
            ? data['place']
            : SearchPlaceStruct.maybeFromMap(data['place']),
      );

  static FilterDataStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userPoint': _userPoint,
        'locationRadius': _locationRadius,
        'Category': _category,
        'atHome': _atHome,
        'dateServ': _dateServ,
        'onRadius': _onRadius,
        'place': _place?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userPoint': serializeParam(
          _userPoint,
          ParamType.LatLng,
        ),
        'locationRadius': serializeParam(
          _locationRadius,
          ParamType.double,
        ),
        'Category': serializeParam(
          _category,
          ParamType.DocumentReference,
          isList: true,
        ),
        'atHome': serializeParam(
          _atHome,
          ParamType.bool,
        ),
        'dateServ': serializeParam(
          _dateServ,
          ParamType.DateTime,
        ),
        'onRadius': serializeParam(
          _onRadius,
          ParamType.bool,
        ),
        'place': serializeParam(
          _place,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static FilterDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      FilterDataStruct(
        userPoint: deserializeParam(
          data['userPoint'],
          ParamType.LatLng,
          false,
        ),
        locationRadius: deserializeParam(
          data['locationRadius'],
          ParamType.double,
          false,
        ),
        category: deserializeParam<DocumentReference>(
          data['Category'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['category'],
        ),
        atHome: deserializeParam(
          data['atHome'],
          ParamType.bool,
          false,
        ),
        dateServ: deserializeParam(
          data['dateServ'],
          ParamType.DateTime,
          false,
        ),
        onRadius: deserializeParam(
          data['onRadius'],
          ParamType.bool,
          false,
        ),
        place: deserializeStructParam(
          data['place'],
          ParamType.DataStruct,
          false,
          structBuilder: SearchPlaceStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FilterDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is FilterDataStruct &&
        userPoint == other.userPoint &&
        locationRadius == other.locationRadius &&
        listEquality.equals(category, other.category) &&
        atHome == other.atHome &&
        dateServ == other.dateServ &&
        onRadius == other.onRadius &&
        place == other.place;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [userPoint, locationRadius, category, atHome, dateServ, onRadius, place]);
}

FilterDataStruct createFilterDataStruct({
  LatLng? userPoint,
  double? locationRadius,
  bool? atHome,
  DateTime? dateServ,
  bool? onRadius,
  SearchPlaceStruct? place,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilterDataStruct(
      userPoint: userPoint,
      locationRadius: locationRadius,
      atHome: atHome,
      dateServ: dateServ,
      onRadius: onRadius,
      place: place ?? (clearUnsetFields ? SearchPlaceStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

FilterDataStruct? updateFilterDataStruct(
  FilterDataStruct? filterData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    filterData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addFilterDataStructData(
  Map<String, dynamic> firestoreData,
  FilterDataStruct? filterData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (filterData == null) {
    return;
  }
  if (filterData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && filterData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final filterDataData = getFilterDataFirestoreData(filterData, forFieldValue);
  final nestedData = filterDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = filterData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getFilterDataFirestoreData(
  FilterDataStruct? filterData, [
  bool forFieldValue = false,
]) {
  if (filterData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(filterData.toMap());

  // Handle nested data for "place" field.
  addSearchPlaceStructData(
    firestoreData,
    filterData.hasPlace() ? filterData.place : null,
    'place',
    forFieldValue,
  );

  // Add any Firestore field values
  filterData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getFilterDataListFirestoreData(
  List<FilterDataStruct>? filterDatas,
) =>
    filterDatas?.map((e) => getFilterDataFirestoreData(e, true)).toList() ?? [];
