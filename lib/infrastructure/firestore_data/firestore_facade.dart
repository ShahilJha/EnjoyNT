import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/firestore_data/i_firestore_data_facade.dart';

@LazySingleton(as: IFirestoreDataFacade)
class FirestoreDataFacade implements IFirestoreDataFacade {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;

  FirestoreDataFacade(this._firebaseAuth, this._firestore);

  @override
  Stream<void> getJobsData() {
    // TODO: implement getJobsData
    throw UnimplementedError();
  }
}
