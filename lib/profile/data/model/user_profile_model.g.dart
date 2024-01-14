// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      residentialAddress: json['residentialAddress'] == null
          ? null
          : ResidentialAddressModel.fromJson(
              json['residentialAddress'] as Map<String, dynamic>),
      originAddress: json['originAddress'] == null
          ? null
          : OriginAddressModel.fromJson(
              json['originAddress'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      profileCounters: json['profileCounters'] == null
          ? null
          : ProfileCounterModel.fromJson(
              json['profileCounters'] as Map<String, dynamic>),
      subscription: json['subscription'] == null
          ? null
          : SubscriptionModel.fromJson(
              json['subscription'] as Map<String, dynamic>),
      wallet: json['wallet'] == null
          ? null
          : WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => InterestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankAccountDetails: json['bankAccountDetails'] == null
          ? null
          : BankAccountDetailModel.fromJson(
              json['bankAccountDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
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

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
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

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
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

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
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

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
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

_$ResidentialAddressModelImpl _$$ResidentialAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ResidentialAddressModelImpl(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zipCode'],
    );

Map<String, dynamic> _$$ResidentialAddressModelImplToJson(
        _$ResidentialAddressModelImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
    };

_$OriginAddressModelImpl _$$OriginAddressModelImplFromJson(
        Map<String, dynamic> json) =>
    _$OriginAddressModelImpl(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zipCode'],
    );

Map<String, dynamic> _$$OriginAddressModelImplToJson(
        _$OriginAddressModelImpl instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
    };

_$LocationModelImpl _$$LocationModelImplFromJson(Map<String, dynamic> json) =>
    _$LocationModelImpl(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );

Map<String, dynamic> _$$LocationModelImplToJson(_$LocationModelImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_$ProfileCounterModelImpl _$$ProfileCounterModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileCounterModelImpl(
      friendsCount: json['friendsCount'],
      refereesCount: json['refereesCount'],
      postCount: json['postCount'],
    );

Map<String, dynamic> _$$ProfileCounterModelImplToJson(
        _$ProfileCounterModelImpl instance) =>
    <String, dynamic>{
      'friendsCount': instance.friendsCount,
      'refereesCount': instance.refereesCount,
      'postCount': instance.postCount,
    };

_$SubscriptionModelImpl _$$SubscriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionModelImpl(
      subscriptionId: json['subscriptionId'],
      name: json['name'],
      amount: json['amount'],
      startdate: json['startdate'],
      enddate: json['enddate'],
      status: json['status'],
      paymentmethod: json['paymentmethod'],
    );

Map<String, dynamic> _$$SubscriptionModelImplToJson(
        _$SubscriptionModelImpl instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'name': instance.name,
      'amount': instance.amount,
      'startdate': instance.startdate,
      'enddate': instance.enddate,
      'status': instance.status,
      'paymentmethod': instance.paymentmethod,
    };

_$WalletModelImpl _$$WalletModelImplFromJson(Map<String, dynamic> json) =>
    _$WalletModelImpl(
      availableBalance: json['availableBalance'],
      lastTransactionDate: json['lastTransactionDate'],
    );

Map<String, dynamic> _$$WalletModelImplToJson(_$WalletModelImpl instance) =>
    <String, dynamic>{
      'availableBalance': instance.availableBalance,
      'lastTransactionDate': instance.lastTransactionDate,
    };

_$InterestModelImpl _$$InterestModelImplFromJson(Map<String, dynamic> json) =>
    _$InterestModelImpl(
      id: json['id'],
      title: json['title'],
    );

Map<String, dynamic> _$$InterestModelImplToJson(_$InterestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_$BankAccountDetailModelImpl _$$BankAccountDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BankAccountDetailModelImpl(
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

Map<String, dynamic> _$$BankAccountDetailModelImplToJson(
        _$BankAccountDetailModelImpl instance) =>
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
