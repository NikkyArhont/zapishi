// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FilterDataStruct extends FFFirebaseStruct {
  FilterDataStruct({
    LatLng? userPoint,
    int? minPrice,
    int? maxPrice,
    double? locationRadius,
    DocumentReference? childCategory,
    DocumentReference? parentCategory,
    SearchPlaceStruct? placeServ,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userPoint = userPoint,
        _minPrice = minPrice,
        _maxPrice = maxPrice,
        _locationRadius = locationRadius,
        _childCategory = childCategory,
        _parentCategory = parentCategory,
        _placeServ = placeServ,
        super(firestoreUtilData);

  // "userPoint" field.
  LatLng? _userPoint;
  LatLng? get userPoint => _userPoint;
  set userPoint(LatLng? val) => _userPoint = val;

  bool hasUserPoint() => _userPoint != null;

  // "minPrice" field.
  int? _minPrice;
  int get minPrice => _minPrice ?? 0;
  set minPrice(int? val) => _minPrice = val;

  void incrementMinPrice(int amount) => minPrice = minPrice + amount;

  bool hasMinPrice() => _minPrice != null;

  // "maxPrice" field.
  int? _maxPrice;
  int get maxPrice => _maxPrice ?? 1000000;
  set maxPrice(int? val) => _maxPrice = val;

  void incrementMaxPrice(int amount) => maxPrice = maxPrice + amount;

  bool hasMaxPrice() => _maxPrice != null;

  // "locationRadius" field.
  double? _locationRadius;
  double get locationRadius => _locationRadius ?? 0.0;
  set locationRadius(double? val) => _locationRadius = val;

  void incrementLocationRadius(double amount) =>
      locationRadius = locationRadius + amount;

  bool hasLocationRadius() => _locationRadius != null;

  // "childCategory" field.
  DocumentReference? _childCategory;
  DocumentReference? get childCategory => _childCategory;
  set childCategory(DocumentReference? val) => _childCategory = val;

  bool hasChildCategory() => _childCategory != null;

  // "parentCategory" field.
  DocumentReference? _parentCategory;
  DocumentReference? get parentCategory => _parentCategory;
  set parentCategory(DocumentReference? val) => _parentCategory = val;

  bool hasParentCategory() => _parentCategory != null;

  // "placeServ" field.
  SearchPlaceStruct? _placeServ;
  SearchPlaceStruct get placeServ => _placeServ ?? SearchPlaceStruct();
  set placeServ(SearchPlaceStruct? val) => _placeServ = val;

  void updatePlaceServ(Function(SearchPlaceStruct) updateFn) {
    updateFn(_placeServ ??= SearchPlaceStruct());
  }

  bool hasPlaceServ() => _placeServ != null;

  static FilterDataStruct fromMap(Map<String, dynamic> data) =>
      FilterDataStruct(
        userPoint: data['userPoint'] as LatLng?,
        minPrice: castToType<int>(data['minPrice']),
        maxPrice: castToType<int>(data['maxPrice']),
        locationRadius: castToType<double>(data['locationRadius']),
        childCategory: data['childCategory'] as DocumentReference?,
        parentCategory: data['parentCategory'] as DocumentReference?,
        placeServ: data['placeServ'] is SearchPlaceStruct
            ? data['placeServ']
            : SearchPlaceStruct.maybeFromMap(data['placeServ']),
      );

  static FilterDataStruct? maybeFromMap(dynamic data) => data is Map
      ? FilterDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userPoint': _userPoint,
        'minPrice': _minPrice,
        'maxPrice': _maxPrice,
        'locationRadius': _locationRadius,
        'childCategory': _childCategory,
        'parentCategory': _parentCategory,
        'placeServ': _placeServ?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userPoint': serializeParam(
          _userPoint,
          ParamType.LatLng,
        ),
        'minPrice': serializeParam(
          _minPrice,
          ParamType.int,
        ),
        'maxPrice': serializeParam(
          _maxPrice,
          ParamType.int,
        ),
        'locationRadius': serializeParam(
          _locationRadius,
          ParamType.double,
        ),
        'childCategory': serializeParam(
          _childCategory,
          ParamType.DocumentReference,
        ),
        'parentCategory': serializeParam(
          _parentCategory,
          ParamType.DocumentReference,
        ),
        'placeServ': serializeParam(
          _placeServ,
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
        minPrice: deserializeParam(
          data['minPrice'],
          ParamType.int,
          false,
        ),
        maxPrice: deserializeParam(
          data['maxPrice'],
          ParamType.int,
          false,
        ),
        locationRadius: deserializeParam(
          data['locationRadius'],
          ParamType.double,
          false,
        ),
        childCategory: deserializeParam(
          data['childCategory'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['category'],
        ),
        parentCategory: deserializeParam(
          data['parentCategory'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['category'],
        ),
        placeServ: deserializeStructParam(
          data['placeServ'],
          ParamType.DataStruct,
          false,
          structBuilder: SearchPlaceStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'FilterDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is FilterDataStruct &&
        userPoint == other.userPoint &&
        minPrice == other.minPrice &&
        maxPrice == other.maxPrice &&
        locationRadius == other.locationRadius &&
        childCategory == other.childCategory &&
        parentCategory == other.parentCategory &&
        placeServ == other.placeServ;
  }

  @override
  int get hashCode => const ListEquality().hash([
        userPoint,
        minPrice,
        maxPrice,
        locationRadius,
        childCategory,
        parentCategory,
        placeServ
      ]);
}

FilterDataStruct createFilterDataStruct({
  LatLng? userPoint,
  int? minPrice,
  int? maxPrice,
  double? locationRadius,
  DocumentReference? childCategory,
  DocumentReference? parentCategory,
  SearchPlaceStruct? placeServ,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    FilterDataStruct(
      userPoint: userPoint,
      minPrice: minPrice,
      maxPrice: maxPrice,
      locationRadius: locationRadius,
      childCategory: childCategory,
      parentCategory: parentCategory,
      placeServ: placeServ ?? (clearUnsetFields ? SearchPlaceStruct() : null),
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

  // Handle nested data for "placeServ" field.
  addSearchPlaceStructData(
    firestoreData,
    filterData.hasPlaceServ() ? filterData.placeServ : null,
    'placeServ',
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
