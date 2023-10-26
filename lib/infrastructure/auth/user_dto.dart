// ignore_for_file: invalid_annotation_target

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:enjoy_nt/domain/auth/auth_value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/core/entities/user.dart';
import '../../domain/core/value_objects/unique_id.dart';
import 'server_timestamp_converter.dart';

part 'user_dto.freezed.dart';
part 'user_dto.g.dart';

@freezed
class UserDTO with _$UserDTO {
  const UserDTO._();

  const factory UserDTO({
    @JsonKey(ignore: true) String? id,
    required String username,
    required String emailAddress,
    @ServerTimestampConverter() required FieldValue serverTimeStamp,
  }) = _UserDTO;

  factory UserDTO.fromDomain(User user) => UserDTO(
        id: user.id.getOrCrash(),
        username: user.username.getOrCrash(),
        emailAddress: user.emailAddress.getOrCrash(),
        serverTimeStamp: FieldValue.serverTimestamp(),
      );

  User toDomain() => User(
        id: UniqueId.fromUniqueString(id!),
        username: UserName(username),
        emailAddress: EmailAddress(emailAddress),
      );

  factory UserDTO.fromJson(Map<String, dynamic> json) =>
      _$UserDTOFromJson(json);

  factory UserDTO.fromFirestore(DocumentSnapshot document) =>
      UserDTO.fromJson(document.data()! as Map<String, dynamic>).copyWith(
        id: document.id,
        username: document.get('username'),
        emailAddress: document.get('emailAddress'),
      );
}
