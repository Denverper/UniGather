import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ClubsRecord extends FirestoreRecord {
  ClubsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "isAvail" field.
  bool? _isAvail;
  bool get isAvail => _isAvail ?? false;
  bool hasIsAvail() => _isAvail != null;

  // "isCreated" field.
  bool? _isCreated;
  bool get isCreated => _isCreated ?? false;
  bool hasIsCreated() => _isCreated != null;

  // "faculty" field.
  DocumentReference? _faculty;
  DocumentReference? get faculty => _faculty;
  bool hasFaculty() => _faculty != null;

  // "creator" field.
  DocumentReference? _creator;
  DocumentReference? get creator => _creator;
  bool hasCreator() => _creator != null;

  // "dateCreated" field.
  DateTime? _dateCreated;
  DateTime? get dateCreated => _dateCreated;
  bool hasDateCreated() => _dateCreated != null;

  // "pictureUrl" field.
  String? _pictureUrl;
  String get pictureUrl => _pictureUrl ?? '';
  bool hasPictureUrl() => _pictureUrl != null;

  // "postLikedBy" field.
  List<DocumentReference>? _postLikedBy;
  List<DocumentReference> get postLikedBy => _postLikedBy ?? const [];
  bool hasPostLikedBy() => _postLikedBy != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _isAvail = snapshotData['isAvail'] as bool?;
    _isCreated = snapshotData['isCreated'] as bool?;
    _faculty = snapshotData['faculty'] as DocumentReference?;
    _creator = snapshotData['creator'] as DocumentReference?;
    _dateCreated = snapshotData['dateCreated'] as DateTime?;
    _pictureUrl = snapshotData['pictureUrl'] as String?;
    _postLikedBy = getDataList(snapshotData['postLikedBy']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('clubs');

  static Stream<ClubsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ClubsRecord.fromSnapshot(s));

  static Future<ClubsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ClubsRecord.fromSnapshot(s));

  static ClubsRecord fromSnapshot(DocumentSnapshot snapshot) => ClubsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ClubsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ClubsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ClubsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ClubsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createClubsRecordData({
  String? name,
  String? description,
  bool? isAvail,
  bool? isCreated,
  DocumentReference? faculty,
  DocumentReference? creator,
  DateTime? dateCreated,
  String? pictureUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'isAvail': isAvail,
      'isCreated': isCreated,
      'faculty': faculty,
      'creator': creator,
      'dateCreated': dateCreated,
      'pictureUrl': pictureUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class ClubsRecordDocumentEquality implements Equality<ClubsRecord> {
  const ClubsRecordDocumentEquality();

  @override
  bool equals(ClubsRecord? e1, ClubsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.isAvail == e2?.isAvail &&
        e1?.isCreated == e2?.isCreated &&
        e1?.faculty == e2?.faculty &&
        e1?.creator == e2?.creator &&
        e1?.dateCreated == e2?.dateCreated &&
        e1?.pictureUrl == e2?.pictureUrl &&
        listEquality.equals(e1?.postLikedBy, e2?.postLikedBy);
  }

  @override
  int hash(ClubsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.isAvail,
        e?.isCreated,
        e?.faculty,
        e?.creator,
        e?.dateCreated,
        e?.pictureUrl,
        e?.postLikedBy
      ]);

  @override
  bool isValidKey(Object? o) => o is ClubsRecord;
}
