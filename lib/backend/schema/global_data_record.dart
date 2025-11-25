import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GlobalDataRecord extends FirestoreRecord {
  GlobalDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "taxForFree" field.
  int? _taxForFree;
  int get taxForFree => _taxForFree ?? 0;
  bool hasTaxForFree() => _taxForFree != null;

  // "taxForMasters" field.
  int? _taxForMasters;
  int get taxForMasters => _taxForMasters ?? 0;
  bool hasTaxForMasters() => _taxForMasters != null;

  // "daysForFree" field.
  int? _daysForFree;
  int get daysForFree => _daysForFree ?? 0;
  bool hasDaysForFree() => _daysForFree != null;

  void _initializeFields() {
    _taxForFree = castToType<int>(snapshotData['taxForFree']);
    _taxForMasters = castToType<int>(snapshotData['taxForMasters']);
    _daysForFree = castToType<int>(snapshotData['daysForFree']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('globalData');

  static Stream<GlobalDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GlobalDataRecord.fromSnapshot(s));

  static Future<GlobalDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GlobalDataRecord.fromSnapshot(s));

  static GlobalDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      GlobalDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GlobalDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GlobalDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GlobalDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GlobalDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGlobalDataRecordData({
  int? taxForFree,
  int? taxForMasters,
  int? daysForFree,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taxForFree': taxForFree,
      'taxForMasters': taxForMasters,
      'daysForFree': daysForFree,
    }.withoutNulls,
  );

  return firestoreData;
}

class GlobalDataRecordDocumentEquality implements Equality<GlobalDataRecord> {
  const GlobalDataRecordDocumentEquality();

  @override
  bool equals(GlobalDataRecord? e1, GlobalDataRecord? e2) {
    return e1?.taxForFree == e2?.taxForFree &&
        e1?.taxForMasters == e2?.taxForMasters &&
        e1?.daysForFree == e2?.daysForFree;
  }

  @override
  int hash(GlobalDataRecord? e) => const ListEquality()
      .hash([e?.taxForFree, e?.taxForMasters, e?.daysForFree]);

  @override
  bool isValidKey(Object? o) => o is GlobalDataRecord;
}
