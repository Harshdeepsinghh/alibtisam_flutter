// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:alibtisam/features/bottomNav/model/game.dart';

class UserModel {
  final String? id;
  final num? pId;
  final String? name;
  final String? email;
  final String? role;
  final String? pic;
  final String? gender;
  final String? userName;
  final String? mobile;
  final String? dateOfBirth;
  final String? bloodGroup;
  final String? fatherName;
  final String? motherName;
  final String? city;
  final String? state;
  final String? guardianId;
  final String? idFrontImage;
  final String? idBackImage;
  final String? certificateLink;
  final num? height;
  final num? weight;
  final num? chestSize;
  final num? heartBeatingRate;
  final num? highJump;
  final num? lowJump;
  final num? normalChestSize;
  final num? pulseRate;
  final num? shoeSize;
  final String? tshirtSize;
  final num? waistSize;
  final String? address;
  final bool? isActive;
  final dynamic request;
  dynamic stage;
  final String? guardianGovId;
  final String? guardianGovIdExpiry;
  final String? relationWithPlayer;
  final String? playerGovId;
  final String? playerGovIdExpiry;
  final GameModel? gameId;
  final bool? isSubscribed;
  final String? govIdNumber;
  final String? govIdExpiration;
  final bool? isSubscriptionActive;
  final String? plan;
  final String? subscriptionStart;
  final String? subscriptionEnds;

  UserModel(
    this.id,
    this.pId,
    this.name,
    this.email,
    this.role,
    this.pic,
    this.gender,
    this.userName,
    this.mobile,
    this.dateOfBirth,
    this.bloodGroup,
    this.fatherName,
    this.motherName,
    this.city,
    this.state,
    this.guardianId,
    this.idFrontImage,
    this.idBackImage,
    this.certificateLink,
    this.height,
    this.weight,
    this.chestSize,
    this.heartBeatingRate,
    this.highJump,
    this.lowJump,
    this.normalChestSize,
    this.pulseRate,
    this.shoeSize,
    this.tshirtSize,
    this.waistSize,
    this.address,
    this.isActive,
    this.request,
    this.stage,
    this.guardianGovId,
    this.guardianGovIdExpiry,
    this.relationWithPlayer,
    this.playerGovId,
    this.playerGovIdExpiry,
    this.gameId,
    this.isSubscribed,
    this.govIdNumber,
    this.govIdExpiration,
    this.isSubscriptionActive,
    this.plan,
    this.subscriptionStart,
    this.subscriptionEnds,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'pId': pId,
      'name': name,
      'email': email,
      'role': role,
      'pic': pic,
      'gender': gender,
      'userName': userName,
      'mobile': mobile,
      'dateOfBirth': dateOfBirth,
      'bloodGroup': bloodGroup,
      'fatherName': fatherName,
      'motherName': motherName,
      'city': city,
      'state': state,
      'guardianId': guardianId,
      'idFrontImage': idFrontImage,
      'idBackImage': idBackImage,
      'certificateLink': certificateLink,
      'height': height,
      'weight': weight,
      'chestSize': chestSize,
      'heartBeatingRate': heartBeatingRate,
      'highJump': highJump,
      'lowJump': lowJump,
      'normalChestSize': normalChestSize,
      'pulseRate': pulseRate,
      'shoeSize': shoeSize,
      'tshirtSize': tshirtSize,
      'waistSize': waistSize,
      'address': address,
      'isActive': isActive,
      'request': request,
      'stage': stage,
      'guardianGovId': guardianGovId,
      'guardianGovIdExpiry': guardianGovIdExpiry,
      'relationWithPlayer': relationWithPlayer,
      'playerGovId': playerGovId,
      'playerGovIdExpiry': playerGovIdExpiry,
      'gameId': gameId?.toMap(),
      'isSubscribed': isSubscribed,
      'govIdNumber': govIdNumber,
      'govIdExpiration': govIdExpiration,
      'isSubscriptionActive': isSubscriptionActive,
      'plan': plan,
      'subscriptionStart': subscriptionStart,
      'subscriptionEnds': subscriptionEnds,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['_id'] != null ? map['_id'] : '',
      map['pId'] != null ? map['pId'] as num : null,
      map['name'] != null ? map['name'] : '',
      map['email'] != null ? map['email'] : '',
      map['role'] != null ? map['role'] : '',
      map['pic'] != null ? map['pic'] : '',
      map['gender'] != null ? map['gender'] : '',
      map['userName'] != null ? map['userName'] : '',
      map['mobile'] != null ? map['mobile'] : '',
      map['dateOfBirth'] != null ? map['dateOfBirth'] : '',
      map['bloodGroup'] != null ? map['bloodGroup'] : '',
      map['fatherName'] != null ? map['fatherName'] : '',
      map['motherName'] != null ? map['motherName'] : '',
      map['city'] != null ? map['city'] : '',
      map['state'] != null ? map['state'] : '',
      map['guardianId'] == null || map['guardianId'].runtimeType != String
          ? null
          : map['guardianId'],
      map['idFrontImage'] != null ? map['idFrontImage'] : '',
      map['idBackImage'] != null ? map['idBackImage'] : '',
      map['certificateLink'] != null ? map['certificateLink'] : '',
      map['height'] != null ? map['height'] as num : null,
      map['weight'] != null ? map['weight'] as num : null,
      map['chestSize'] != null ? map['chestSize'] as num : null,
      map['heartBeatingRate'] != null ? map['heartBeatingRate'] as num : null,
      map['highJump'] != null ? map['highJump'] as num : null,
      map['lowJump'] != null ? map['lowJump'] as num : null,
      map['normalChestSize'] != null ? map['normalChestSize'] as num : null,
      map['pulseRate'] != null ? map['pulseRate'] as num : null,
      map['shoeSize'] != null ? map['shoeSize'] as num : null,
      map['tshirtSize'] != null ? map['tshirtSize'] : '',
      map['waistSize'] != null ? map['waistSize'] as num : null,
      map['address'] != null ? map['address'] : '',
      map['isActive'] != null ? map['isActive'] as bool : null,
      map['request'] as dynamic,
      map['stage'] as dynamic,
      map['guardianGovId'] ?? '',
      map['guardianGovIdExpiry'] ?? '',
      map['relationWithPlayer'] ?? '',
      map['playerGovId'] ?? '',
      map['playerGovIdExpiry'] ?? '',
      map['gameId'] != null && map['gameId'].runtimeType != String
          ? GameModel.fromMap(map['gameId'])
          : GameModel.fromMap({}),
      map['isSubscribed'] ??false,
      map['govIdNumber'] ??'',
      map['govIdExpiration']??'',
      map['isSubscriptionActive']?? false,
      map['plan'] ?? '',
      map['subscriptionStart']??'',
      map['subscriptionEnds']??'',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
