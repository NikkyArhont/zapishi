import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TarifRecord extends FirestoreRecord {
  TarifRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "forWho" field.
  UserStatus? _forWho;
  UserStatus? get forWho => _forWho;
  bool hasForWho() => _forWho != null;

  // "cost" field.
  int? _cost;
  int get cost => _cost ?? 0;
  bool hasCost() => _cost != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "whoUsed" field.
  List<DocumentReference>? _whoUsed;
  List<DocumentReference> get whoUsed => _whoUsed ?? const [];
  bool hasWhoUsed() => _whoUsed != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  bool hasDuration() => _duration != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _forWho = snapshotData['forWho'] is UserStatus
        ? snapshotData['forWho']
        : deserializeEnum<UserStatus>(snapshotData['forWho']);
    _cost = castToType<int>(snapshotData['cost']);
    _description = snapshotData['description'] as String?;
    _whoUsed = getDataList(snapshotData['whoUsed']);
    _duration = castToType<int>(snapshotData['duration']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tarif');

  static Stream<TarifRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TarifRecord.fromSnapshot(s));

  static Future<TarifRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TarifRecord.fromSnapshot(s));

  static TarifRecord fromSnapshot(DocumentSnapshot snapshot) => TarifRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TarifRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TarifRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TarifRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TarifRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTarifRecordData({
  String? title,
  UserStatus? forWho,
  int? cost,
  String? description,
  int? duration,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'forWho': forWho,
      'cost': cost,
      'description': description,
      'duration': duration,
    }.withoutNulls,
  );

  return firestoreData;
}

class TarifRecordDocumentEquality implements Equality<TarifRecord> {
  const TarifRecordDocumentEquality();

  @override
  bool equals(TarifRecord? e1, TarifRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.forWho == e2?.forWho &&
        e1?.cost == e2?.cost &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.whoUsed, e2?.whoUsed) &&
        e1?.duration == e2?.duration;
  }

  @override
  int hash(TarifRecord? e) => const ListEquality().hash(
      [e?.title, e?.forWho, e?.cost, e?.description, e?.whoUsed, e?.duration]);

  @override
  bool isValidKey(Object? o) => o is TarifRecord;
}
