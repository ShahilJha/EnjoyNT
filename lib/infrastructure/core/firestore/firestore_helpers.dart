import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enjoy_nt/injection.dart';
import '../../../domain/core/errors/not_authenticated_error.dart';

import '../../../domain/auth/i_auth_facade.dart';

extension FirestoreX on FirebaseFirestore {
  Future<DocumentReference> userDocument() async {
    final userOption = await getIt<IAuthFacade>().getSignedInUser();
    final user = userOption.getOrElse(() => throw NotAuthenticatedError());
    return getIt<FirebaseFirestore>()
        .collection('users')
        .doc(user.id.getOrCrash());
  }
}

extension DocumentReferenceX on DocumentReference {
  CollectionReference get noteCollection => collection('notes');
}
