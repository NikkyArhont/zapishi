// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class WeeklyWorkStruct extends FFFirebaseStruct {
  WeeklyWorkStruct({
    String? day,
    bool? work,
    DateTime? start,
    DateTime? end,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _day = day,
        _work = work,
        _start = start,
        _end = end,
        super(firestoreUtilData);

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  set day(String? val) => _day = val;

  bool hasDay() => _day != null;

  // "work" field.
  bool? _work;
  bool get work => _work ?? false;
  set work(bool? val) => _work = val;

  bool hasWork() => _work != null;

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

  static WeeklyWorkStruct fromMap(Map<String, dynamic> data) =>
      WeeklyWorkStruct(
        day: data['day'] as String?,
        work: data['work'] as bool?,
        start: data['start'] as DateTime?,
        end: data['end'] as DateTime?,
      );

  static WeeklyWorkStruct? maybeFromMap(dynamic data) => data is Map
      ? WeeklyWorkStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'day': _day,
        'work': _work,
        'start': _start,
        'end': _end,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'day': serializeParam(
          _day,
          ParamType.String,
        ),
        'work': serializeParam(
          _work,
          ParamType.bool,
        ),
        'start': serializeParam(
          _start,
          ParamType.DateTime,
        ),
        'end': serializeParam(
          _end,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static WeeklyWorkStruct fromSerializableMap(Map<String, dynamic> data) =>
      WeeklyWorkStruct(
        day: deserializeParam(
          data['day'],
          ParamType.String,
          false,
        ),
        work: deserializeParam(
          data['work'],
          ParamType.bool,
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
      );

  @override
  String toString() => 'WeeklyWorkStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is WeeklyWorkStruct &&
        day == other.day &&
        work == other.work &&
        start == other.start &&
        end == other.end;
  }

  @override
  int get hashCode => const ListEquality().hash([day, work, start, end]);
}

WeeklyWorkStruct createWeeklyWorkStruct({
  String? day,
  bool? work,
  DateTime? start,
  DateTime? end,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    WeeklyWorkStruct(
      day: day,
      work: work,
      start: start,
      end: end,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

WeeklyWorkStruct? updateWeeklyWorkStruct(
  WeeklyWorkStruct? weeklyWork, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    weeklyWork
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addWeeklyWorkStructData(
  Map<String, dynamic> firestoreData,
  WeeklyWorkStruct? weeklyWork,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (weeklyWork == null) {
    return;
  }
  if (weeklyWork.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && weeklyWork.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final weeklyWorkData = getWeeklyWorkFirestoreData(weeklyWork, forFieldValue);
  final nestedData = weeklyWorkData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = weeklyWork.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getWeeklyWorkFirestoreData(
  WeeklyWorkStruct? weeklyWork, [
  bool forFieldValue = false,
]) {
  if (weeklyWork == null) {
    return {};
  }
  final firestoreData = mapToFirestore(weeklyWork.toMap());

  // Add any Firestore field values
  weeklyWork.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getWeeklyWorkListFirestoreData(
  List<WeeklyWorkStruct>? weeklyWorks,
) =>
    weeklyWorks?.map((e) => getWeeklyWorkFirestoreData(e, true)).toList() ?? [];
