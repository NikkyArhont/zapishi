// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportStruct extends FFFirebaseStruct {
  ReportStruct({
    ReportStatus? status,
    DocumentReference? reason,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _reason = reason,
        super(firestoreUtilData);

  // "status" field.
  ReportStatus? _status;
  ReportStatus? get status => _status;
  set status(ReportStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  // "reason" field.
  DocumentReference? _reason;
  DocumentReference? get reason => _reason;
  set reason(DocumentReference? val) => _reason = val;

  bool hasReason() => _reason != null;

  static ReportStruct fromMap(Map<String, dynamic> data) => ReportStruct(
        status: data['status'] is ReportStatus
            ? data['status']
            : deserializeEnum<ReportStatus>(data['status']),
        reason: data['reason'] as DocumentReference?,
      );

  static ReportStruct? maybeFromMap(dynamic data) =>
      data is Map ? ReportStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'status': _status?.serialize(),
        'reason': _reason,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
        'reason': serializeParam(
          _reason,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ReportStruct fromSerializableMap(Map<String, dynamic> data) =>
      ReportStruct(
        status: deserializeParam<ReportStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
        reason: deserializeParam(
          data['reason'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['messages'],
        ),
      );

  @override
  String toString() => 'ReportStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ReportStruct &&
        status == other.status &&
        reason == other.reason;
  }

  @override
  int get hashCode => const ListEquality().hash([status, reason]);
}

ReportStruct createReportStruct({
  ReportStatus? status,
  DocumentReference? reason,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ReportStruct(
      status: status,
      reason: reason,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ReportStruct? updateReportStruct(
  ReportStruct? report, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    report
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addReportStructData(
  Map<String, dynamic> firestoreData,
  ReportStruct? report,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (report == null) {
    return;
  }
  if (report.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && report.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final reportData = getReportFirestoreData(report, forFieldValue);
  final nestedData = reportData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = report.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getReportFirestoreData(
  ReportStruct? report, [
  bool forFieldValue = false,
]) {
  if (report == null) {
    return {};
  }
  final firestoreData = mapToFirestore(report.toMap());

  // Add any Firestore field values
  report.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getReportListFirestoreData(
  List<ReportStruct>? reports,
) =>
    reports?.map((e) => getReportFirestoreData(e, true)).toList() ?? [];
