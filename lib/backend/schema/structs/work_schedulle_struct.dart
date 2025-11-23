// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class WorkSchedulleStruct extends FFFirebaseStruct {
  WorkSchedulleStruct({
    DateTime? data,
    DateTime? start,
    DateTime? end,
    bool? hasRecord,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        _start = start,
        _end = end,
        _hasRecord = hasRecord,
        super(firestoreUtilData);

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;

  bool hasData() => _data != null;

  // "start" field.
  DateTime? _start;
  DateTime? get start => _start;
  set start(DateTime? val) => _start = val;

  bool hasStart() => _start != null;

  // "end" field.
  DateTime? _end;
  DateTime? get end => _end;
  set end(DateTime? val) => _end = val;

  bool hasEnd() => _end != null;

  // "hasRecord" field.
  bool? _hasRecord;
  bool get hasRecord => _hasRecord ?? false;
  set hasRecord(bool? val) => _hasRecord = val;

  bool hasHasRecord() => _hasRecord != null;

  static WorkSchedulleStruct fromMap(Map<String, dynamic> data) =>
      WorkSchedulleStruct(
        data: data['data'] as DateTime?,
        start: data['start'] as DateTime?,
        end: data['end'] as DateTime?,
        hasRecord: data['hasRecord'] as bool?,
      );

  static WorkSchedulleStruct? maybeFromMap(dynamic data) => data is Map
      ? WorkSchedulleStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'data': _data,
        'start': _start,
        'end': _end,
        'hasRecord': _hasRecord,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
        'start': serializeParam(
          _start,
          ParamType.DateTime,
        ),
        'end': serializeParam(
          _end,
          ParamType.DateTime,
        ),
        'hasRecord': serializeParam(
          _hasRecord,
          ParamType.bool,
        ),
      }.withoutNulls;

  static WorkSchedulleStruct fromSerializableMap(Map<String, dynamic> data) =>
      WorkSchedulleStruct(
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
        start: deserializeParam(
          data['start'],
          ParamType.DateTime,
          false,
        ),
        end: deserializeParam(
          data['end'],
          ParamType.DateTime,
          false,
        ),
        hasRecord: deserializeParam(
          data['hasRecord'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'WorkSchedulleStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WorkSchedulleStruct &&
        data == other.data &&
        start == other.start &&
        end == other.end &&
        hasRecord == other.hasRecord;
  }

  @override
  int get hashCode => const ListEquality().hash([data, start, end, hasRecord]);
}

WorkSchedulleStruct createWorkSchedulleStruct({
  DateTime? data,
  DateTime? start,
  DateTime? end,
  bool? hasRecord,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WorkSchedulleStruct(
      data: data,
      start: start,
      end: end,
      hasRecord: hasRecord,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WorkSchedulleStruct? updateWorkSchedulleStruct(
  WorkSchedulleStruct? workSchedulle, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    workSchedulle
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWorkSchedulleStructData(
  Map<String, dynamic> firestoreData,
  WorkSchedulleStruct? workSchedulle,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (workSchedulle == null) {
    return;
  }
  if (workSchedulle.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && workSchedulle.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final workSchedulleData =
      getWorkSchedulleFirestoreData(workSchedulle, forFieldValue);
  final nestedData =
      workSchedulleData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = workSchedulle.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWorkSchedulleFirestoreData(
  WorkSchedulleStruct? workSchedulle, [
  bool forFieldValue = false,
]) {
  if (workSchedulle == null) {
    return {};
  }
  final firestoreData = mapToFirestore(workSchedulle.toMap());

  // Add any Firestore field values
  workSchedulle.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWorkSchedulleListFirestoreData(
  List<WorkSchedulleStruct>? workSchedulles,
) =>
    workSchedulles
        ?.map((e) => getWorkSchedulleFirestoreData(e, true))
        .toList() ??
    [];
