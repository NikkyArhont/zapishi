import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "adress" field.
  LatLng? _adress;
  LatLng? get adress => _adress;
  bool hasAdress() => _adress != null;

  // "reviews" field.
  List<DocumentReference>? _reviews;
  List<DocumentReference> get reviews => _reviews ?? const [];
  bool hasReviews() => _reviews != null;

  // "last_active_time" field.
  DateTime? _lastActiveTime;
  DateTime? get lastActiveTime => _lastActiveTime;
  bool hasLastActiveTime() => _lastActiveTime != null;

  // "balance" field.
  int? _balance;
  int get balance => _balance ?? 0;
  bool hasBalance() => _balance != null;

  // "transactions" field.
  List<DocumentReference>? _transactions;
  List<DocumentReference> get transactions => _transactions ?? const [];
  bool hasTransactions() => _transactions != null;

  // "my_services" field.
  List<DocumentReference>? _myServices;
  List<DocumentReference> get myServices => _myServices ?? const [];
  bool hasMyServices() => _myServices != null;

  // "essence" field.
  UserStatus? _essence;
  UserStatus? get essence => _essence;
  bool hasEssence() => _essence != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "cityPlaceId" field.
  String? _cityPlaceId;
  String get cityPlaceId => _cityPlaceId ?? '';
  bool hasCityPlaceId() => _cityPlaceId != null;

  // "mainMaster" field.
  DocumentReference? _mainMaster;
  DocumentReference? get mainMaster => _mainMaster;
  bool hasMainMaster() => _mainMaster != null;

  // "myRecords" field.
  List<DocumentReference>? _myRecords;
  List<DocumentReference> get myRecords => _myRecords ?? const [];
  bool hasMyRecords() => _myRecords != null;

  // "favoriteMasters" field.
  List<DocumentReference>? _favoriteMasters;
  List<DocumentReference> get favoriteMasters => _favoriteMasters ?? const [];
  bool hasFavoriteMasters() => _favoriteMasters != null;

  // "jobStatus" field.
  JobStatus? _jobStatus;
  JobStatus? get jobStatus => _jobStatus;
  bool hasJobStatus() => _jobStatus != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _adress = snapshotData['adress'] as LatLng?;
    _reviews = getDataList(snapshotData['reviews']);
    _lastActiveTime = snapshotData['last_active_time'] as DateTime?;
    _balance = castToType<int>(snapshotData['balance']);
    _transactions = getDataList(snapshotData['transactions']);
    _myServices = getDataList(snapshotData['my_services']);
    _essence = snapshotData['essence'] is UserStatus
        ? snapshotData['essence']
        : deserializeEnum<UserStatus>(snapshotData['essence']);
    _city = snapshotData['city'] as String?;
    _cityPlaceId = snapshotData['cityPlaceId'] as String?;
    _mainMaster = snapshotData['mainMaster'] as DocumentReference?;
    _myRecords = getDataList(snapshotData['myRecords']);
    _favoriteMasters = getDataList(snapshotData['favoriteMasters']);
    _jobStatus = snapshotData['jobStatus'] is JobStatus
        ? snapshotData['jobStatus']
        : deserializeEnum<JobStatus>(snapshotData['jobStatus']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  LatLng? adress,
  DateTime? lastActiveTime,
  int? balance,
  UserStatus? essence,
  String? city,
  String? cityPlaceId,
  DocumentReference? mainMaster,
  JobStatus? jobStatus,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'adress': adress,
      'last_active_time': lastActiveTime,
      'balance': balance,
      'essence': essence,
      'city': city,
      'cityPlaceId': cityPlaceId,
      'mainMaster': mainMaster,
      'jobStatus': jobStatus,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserRecordDocumentEquality implements Equality<UserRecord> {
  const UserRecordDocumentEquality();

  @override
  bool equals(UserRecord? e1, UserRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.adress == e2?.adress &&
        listEquality.equals(e1?.reviews, e2?.reviews) &&
        e1?.lastActiveTime == e2?.lastActiveTime &&
        e1?.balance == e2?.balance &&
        listEquality.equals(e1?.transactions, e2?.transactions) &&
        listEquality.equals(e1?.myServices, e2?.myServices) &&
        e1?.essence == e2?.essence &&
        e1?.city == e2?.city &&
        e1?.cityPlaceId == e2?.cityPlaceId &&
        e1?.mainMaster == e2?.mainMaster &&
        listEquality.equals(e1?.myRecords, e2?.myRecords) &&
        listEquality.equals(e1?.favoriteMasters, e2?.favoriteMasters) &&
        e1?.jobStatus == e2?.jobStatus;
  }

  @override
  int hash(UserRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.adress,
        e?.reviews,
        e?.lastActiveTime,
        e?.balance,
        e?.transactions,
        e?.myServices,
        e?.essence,
        e?.city,
        e?.cityPlaceId,
        e?.mainMaster,
        e?.myRecords,
        e?.favoriteMasters,
        e?.jobStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is UserRecord;
}
