// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CreateServiceStruct extends FFFirebaseStruct {
  CreateServiceStruct({
    String? title,
    int? duration,
    int? cost,
    bool? fixed,
    String? description,
    List<String>? photo,
    List<DocumentReference>? categoryes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _duration = duration,
        _cost = cost,
        _fixed = fixed,
        _description = description,
        _photo = photo,
        _categoryes = categoryes,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  set duration(int? val) => _duration = val;

  void incrementDuration(int amount) => duration = duration + amount;

  bool hasDuration() => _duration != null;

  // "cost" field.
  int? _cost;
  int get cost => _cost ?? 0;
  set cost(int? val) => _cost = val;

  void incrementCost(int amount) => cost = cost + amount;

  bool hasCost() => _cost != null;

  // "fixed" field.
  bool? _fixed;
  bool get fixed => _fixed ?? false;
  set fixed(bool? val) => _fixed = val;

  bool hasFixed() => _fixed != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;

  bool hasDescription() => _description != null;

  // "photo" field.
  List<String>? _photo;
  List<String> get photo => _photo ?? const [];
  set photo(List<String>? val) => _photo = val;

  void updatePhoto(Function(List<String>) updateFn) {
    updateFn(_photo ??= []);
  }

  bool hasPhoto() => _photo != null;

  // "categoryes" field.
  List<DocumentReference>? _categoryes;
  List<DocumentReference> get categoryes => _categoryes ?? const [];
  set categoryes(List<DocumentReference>? val) => _categoryes = val;

  void updateCategoryes(Function(List<DocumentReference>) updateFn) {
    updateFn(_categoryes ??= []);
  }

  bool hasCategoryes() => _categoryes != null;

  static CreateServiceStruct fromMap(Map<String, dynamic> data) =>
      CreateServiceStruct(
        title: data['title'] as String?,
        duration: castToType<int>(data['duration']),
        cost: castToType<int>(data['cost']),
        fixed: data['fixed'] as bool?,
        description: data['description'] as String?,
        photo: getDataList(data['photo']),
        categoryes: getDataList(data['categoryes']),
      );

  static CreateServiceStruct? maybeFromMap(dynamic data) => data is Map
      ? CreateServiceStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'duration': _duration,
        'cost': _cost,
        'fixed': _fixed,
        'description': _description,
        'photo': _photo,
        'categoryes': _categoryes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'cost': serializeParam(
          _cost,
          ParamType.int,
        ),
        'fixed': serializeParam(
          _fixed,
          ParamType.bool,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'photo': serializeParam(
          _photo,
          ParamType.String,
          isList: true,
        ),
        'categoryes': serializeParam(
          _categoryes,
          ParamType.DocumentReference,
          isList: true,
        ),
      }.withoutNulls;

  static CreateServiceStruct fromSerializableMap(Map<String, dynamic> data) =>
      CreateServiceStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.int,
          false,
        ),
        cost: deserializeParam(
          data['cost'],
          ParamType.int,
          false,
        ),
        fixed: deserializeParam(
          data['fixed'],
          ParamType.bool,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        photo: deserializeParam<String>(
          data['photo'],
          ParamType.String,
          true,
        ),
        categoryes: deserializeParam<DocumentReference>(
          data['categoryes'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['category'],
        ),
      );

  @override
  String toString() => 'CreateServiceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CreateServiceStruct &&
        title == other.title &&
        duration == other.duration &&
        cost == other.cost &&
        fixed == other.fixed &&
        description == other.description &&
        listEquality.equals(photo, other.photo) &&
        listEquality.equals(categoryes, other.categoryes);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([title, duration, cost, fixed, description, photo, categoryes]);
}

CreateServiceStruct createCreateServiceStruct({
  String? title,
  int? duration,
  int? cost,
  bool? fixed,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CreateServiceStruct(
      title: title,
      duration: duration,
      cost: cost,
      fixed: fixed,
      description: description,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CreateServiceStruct? updateCreateServiceStruct(
  CreateServiceStruct? createService, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    createService
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCreateServiceStructData(
  Map<String, dynamic> firestoreData,
  CreateServiceStruct? createService,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (createService == null) {
    return;
  }
  if (createService.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && createService.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final createServiceData =
      getCreateServiceFirestoreData(createService, forFieldValue);
  final nestedData =
      createServiceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = createService.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCreateServiceFirestoreData(
  CreateServiceStruct? createService, [
  bool forFieldValue = false,
]) {
  if (createService == null) {
    return {};
  }
  final firestoreData = mapToFirestore(createService.toMap());

  // Add any Firestore field values
  createService.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCreateServiceListFirestoreData(
  List<CreateServiceStruct>? createServices,
) =>
    createServices
        ?.map((e) => getCreateServiceFirestoreData(e, true))
        .toList() ??
    [];
