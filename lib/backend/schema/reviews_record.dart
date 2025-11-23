import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReviewsRecord extends FirestoreRecord {
  ReviewsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  bool hasDate() => _date != null;

  // "punctuality" field.
  int? _punctuality;
  int get punctuality => _punctuality ?? 0;
  bool hasPunctuality() => _punctuality != null;

  // "clientCind" field.
  int? _clientCind;
  int get clientCind => _clientCind ?? 0;
  bool hasClientCind() => _clientCind != null;

  // "Politeness" field.
  int? _politeness;
  int get politeness => _politeness ?? 0;
  bool hasPoliteness() => _politeness != null;

  // "photos" field.
  List<String>? _photos;
  List<String> get photos => _photos ?? const [];
  bool hasPhotos() => _photos != null;

  // "client" field.
  DocumentReference? _client;
  DocumentReference? get client => _client;
  bool hasClient() => _client != null;

  // "master" field.
  DocumentReference? _master;
  DocumentReference? get master => _master;
  bool hasMaster() => _master != null;

  // "service" field.
  DocumentReference? _service;
  DocumentReference? get service => _service;
  bool hasService() => _service != null;

  // "record" field.
  DocumentReference? _record;
  DocumentReference? get record => _record;
  bool hasRecord() => _record != null;

  // "star" field.
  double? _star;
  double get star => _star ?? 0.0;
  bool hasStar() => _star != null;

  // "organisation" field.
  DocumentReference? _organisation;
  DocumentReference? get organisation => _organisation;
  bool hasOrganisation() => _organisation != null;

  void _initializeFields() {
    _author = snapshotData['author'] as DocumentReference?;
    _comment = snapshotData['comment'] as String?;
    _date = snapshotData['date'] as DateTime?;
    _punctuality = castToType<int>(snapshotData['punctuality']);
    _clientCind = castToType<int>(snapshotData['clientCind']);
    _politeness = castToType<int>(snapshotData['Politeness']);
    _photos = getDataList(snapshotData['photos']);
    _client = snapshotData['client'] as DocumentReference?;
    _master = snapshotData['master'] as DocumentReference?;
    _service = snapshotData['service'] as DocumentReference?;
    _record = snapshotData['record'] as DocumentReference?;
    _star = castToType<double>(snapshotData['star']);
    _organisation = snapshotData['organisation'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reviews');

  static Stream<ReviewsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReviewsRecord.fromSnapshot(s));

  static Future<ReviewsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReviewsRecord.fromSnapshot(s));

  static ReviewsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReviewsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReviewsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReviewsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ReviewsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReviewsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReviewsRecordData({
  DocumentReference? author,
  String? comment,
  DateTime? date,
  int? punctuality,
  int? clientCind,
  int? politeness,
  DocumentReference? client,
  DocumentReference? master,
  DocumentReference? service,
  DocumentReference? record,
  double? star,
  DocumentReference? organisation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'author': author,
      'comment': comment,
      'date': date,
      'punctuality': punctuality,
      'clientCind': clientCind,
      'Politeness': politeness,
      'client': client,
      'master': master,
      'service': service,
      'record': record,
      'star': star,
      'organisation': organisation,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReviewsRecordDocumentEquality implements Equality<ReviewsRecord> {
  const ReviewsRecordDocumentEquality();

  @override
  bool equals(ReviewsRecord? e1, ReviewsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.author == e2?.author &&
        e1?.comment == e2?.comment &&
        e1?.date == e2?.date &&
        e1?.punctuality == e2?.punctuality &&
        e1?.clientCind == e2?.clientCind &&
        e1?.politeness == e2?.politeness &&
        listEquality.equals(e1?.photos, e2?.photos) &&
        e1?.client == e2?.client &&
        e1?.master == e2?.master &&
        e1?.service == e2?.service &&
        e1?.record == e2?.record &&
        e1?.star == e2?.star &&
        e1?.organisation == e2?.organisation;
  }

  @override
  int hash(ReviewsRecord? e) => const ListEquality().hash([
        e?.author,
        e?.comment,
        e?.date,
        e?.punctuality,
        e?.clientCind,
        e?.politeness,
        e?.photos,
        e?.client,
        e?.master,
        e?.service,
        e?.record,
        e?.star,
        e?.organisation
      ]);

  @override
  bool isValidKey(Object? o) => o is ReviewsRecord;
}
