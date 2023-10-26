import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enjoy_nt/infrastructure/auth/user_dto.dart';
import 'package:enjoy_nt/infrastructure/dto/job_dto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';

import '../../domain/firestore_data/i_firestore_data_facade.dart';

@LazySingleton(as: IFirestoreDataFacade)
class FirestoreDataFacade implements IFirestoreDataFacade {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  FirestoreDataFacade(this._firebaseAuth, this._firestore);

  @override
  Stream<List<JobDto>> getJobsData() {
    // final snapshotData = _firestore.collection('jobs').snapshots().map(
    //     (snapshot) =>
    //         snapshot.docs.map((e) => JobDto.fromSnapShot(e)).toList());
    // return snapshotData;

    // final snapshotData = _firestore.collection('jobs').doc(docId, ).snapshots().map(
    //     (snapshot) =>
    //         snapshot.docs.map((e) => JobDto.fromSnapShot(e)).single());
    // return snapshotData;

    final snapshotData = _firestore.collection('jobs').snapshots().map(
        (snapshot) =>
            snapshot.docs.map((e) => JobDto.fromSnapShot(e)).toList());
    return snapshotData;
  }
}
