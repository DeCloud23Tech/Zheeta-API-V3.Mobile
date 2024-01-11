// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileDataImpl _$$UserProfileDataImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileDataImpl(
      user: json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : ProfileData.fromJson(json['profile'] as Map<String, dynamic>),
      residentialAddress: json['residentialAddress'] == null
          ? null
          : ResidentialAddressData.fromJson(
              json['residentialAddress'] as Map<String, dynamic>),
      originAddress: json['originAddress'] == null
          ? null
          : OriginAddressData.fromJson(
              json['originAddress'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationData.fromJson(json['location'] as Map<String, dynamic>),
      profileCounters: json['profileCounters'] == null
          ? null
          : ProfileCounterData.fromJson(
              json['profileCounters'] as Map<String, dynamic>),
      subscription: json['subscription'] == null
          ? null
          : SubscriptionData.fromJson(
              json['subscription'] as Map<String, dynamic>),
      wallet: json['wallet'] == null
          ? null
          : WalletData.fromJson(json['wallet'] as Map<String, dynamic>),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => InterestData.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankAccountDetails: json['bankAccountDetails'] == null
          ? null
          : BankAccountDetailData.fromJson(
              json['bankAccountDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileDataImplToJson(
        _$UserProfileDataImpl instance) =>
    <String, dynamic>{
      'user': instance.user?.toJson(),
      'profile': instance.profile?.toJson(),
      'residentialAddress': instance.residentialAddress?.toJson(),
      'originAddress': instance.originAddress?.toJson(),
      'location': instance.location?.toJson(),
      'profileCounters': instance.profileCounters?.toJson(),
      'subscription': instance.subscription?.toJson(),
      'wallet': instance.wallet?.toJson(),
      'interests': instance.interests?.map((e) => e.toJson()).toList(),
      'bankAccountDetails': instance.bankAccountDetails?.toJson(),
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      userId: json['userId'],
      isFullyVerified: json['isFullyVerified'],
      userName: json['userName'],
      rolesCSV: json['rolesCSV'],
      createdDate: json['createdDate'],
      lastSeenDate: json['lastSeenDate'],
      normalizedEmail: json['normalizedEmail'],
      emailConfirmed: json['emailConfirmed'],
      phoneCountryCode: json['phoneCountryCode'],
      phoneNumber: json['phoneNumber'],
      phoneNumberConfirmed: json['phoneNumberConfirmed'],
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'isFullyVerified': instance.isFullyVerified,
      'userName': instance.userName,
      'rolesCSV': instance.rolesCSV,
      'createdDate': instance.createdDate,
      'lastSeenDate': instance.lastSeenDate,
      'normalizedEmail': instance.normalizedEmail,
      'emailConfirmed': instance.emailConfirmed,
      'phoneCountryCode': instance.phoneCountryCode,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberConfirmed': instance.phoneNumberConfirmed,
    };

_$ProfileDataImpl _$$ProfileDataImplFromJson(Map<String, dynamic> json) =>
    _$ProfileDataImpl(
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      gender: json['gender'],
      languageCSV: json['languageCSV'],
      aboutMe: json['aboutMe'],
      height: json['height'],
      weight: json['weight'],
      bodyType: json['bodyType'],
      complexion: json['complexion'],
      religion: json['religion'],
      tagline: json['tagline'],
      occupation: json['occupation'],
      profilePhotoURL: json['profilePhotoURL'],
      profileStatus: json['profileStatus'],
    );

Map<String, dynamic> _$$ProfileDataImplToJson(_$ProfileDataImpl instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'languageCSV': instance.languageCSV,
      'aboutMe': instance.aboutMe,
      'height': instance.height,
      'weight': instance.weight,
      'bodyType': instance.bodyType,
      'complexion': instance.complexion,
      'religion': instance.religion,
      'tagline': instance.tagline,
      'occupation': instance.occupation,
      'profilePhotoURL': instance.profilePhotoURL,
      'profileStatus': instance.profileStatus,
    };

_$ResidentialAddressDataImpl _$$ResidentialAddressDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ResidentialAddressDataImpl(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zipCode'],
    );

Map<String, dynamic> _$$ResidentialAddressDataImplToJson(
        _$ResidentialAddressDataImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
    };

_$OriginAddressDataImpl _$$OriginAddressDataImplFromJson(
        Map<String, dynamic> json) =>
    _$OriginAddressDataImpl(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zipCode'],
    );

Map<String, dynamic> _$$OriginAddressDataImplToJson(
        _$OriginAddressDataImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
    };

_$LocationDataImpl _$$LocationDataImplFromJson(Map<String, dynamic> json) =>
    _$LocationDataImpl(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );

Map<String, dynamic> _$$LocationDataImplToJson(_$LocationDataImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$ProfileCounterDataImpl _$$ProfileCounterDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileCounterDataImpl(
      friendsCount: json['friendsCount'],
      refereesCount: json['refereesCount'],
      postCount: json['postCount'],
    );

Map<String, dynamic> _$$ProfileCounterDataImplToJson(
        _$ProfileCounterDataImpl instance) =>
    <String, dynamic>{
      'friendsCount': instance.friendsCount,
      'refereesCount': instance.refereesCount,
      'postCount': instance.postCount,
    };

_$SubscriptionDataImpl _$$SubscriptionDataImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionDataImpl(
      subscriptionId: json['subscriptionId'],
      name: json['name'],
      amount: json['amount'],
      startdate: json['startdate'],
      enddate: json['enddate'],
      status: json['status'],
      paymentmethod: json['paymentmethod'],
    );

Map<String, dynamic> _$$SubscriptionDataImplToJson(
        _$SubscriptionDataImpl instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'name': instance.name,
      'amount': instance.amount,
      'startdate': instance.startdate,
      'enddate': instance.enddate,
      'status': instance.status,
      'paymentmethod': instance.paymentmethod,
    };

_$WalletDataImpl _$$WalletDataImplFromJson(Map<String, dynamic> json) =>
    _$WalletDataImpl(
      availableBalance: json['availableBalance'],
      lastTransactionDate: json['lastTransactionDate'],
    );

Map<String, dynamic> _$$WalletDataImplToJson(_$WalletDataImpl instance) =>
    <String, dynamic>{
      'availableBalance': instance.availableBalance,
      'lastTransactionDate': instance.lastTransactionDate,
    };

_$InterestDataImpl _$$InterestDataImplFromJson(Map<String, dynamic> json) =>
    _$InterestDataImpl(
      id: json['id'],
      title: json['title'],
    );

Map<String, dynamic> _$$InterestDataImplToJson(_$InterestDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_$BankAccountDetailDataImpl _$$BankAccountDetailDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BankAccountDetailDataImpl(
      userId: json['userId'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      country: json['country'],
      payOutType: json['payOutType'],
      bankId: json['bankId'],
      bankName: json['bankName'],
      bankCode: json['bankCode'],
      branchCode: json['branchCode'],
      accountNumber: json['accountNumber'],
      accountCurrency: json['accountCurrency'],
      routingNumber: json['routingNumber'],
      swiftCode: json['swiftCode'],
    );

Map<String, dynamic> _$$BankAccountDetailDataImplToJson(
        _$BankAccountDetailDataImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'country': instance.country,
      'payOutType': instance.payOutType,
      'bankId': instance.bankId,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
      'branchCode': instance.branchCode,
      'accountNumber': instance.accountNumber,
      'accountCurrency': instance.accountCurrency,
      'routingNumber': instance.routingNumber,
      'swiftCode': instance.swiftCode,
    };
