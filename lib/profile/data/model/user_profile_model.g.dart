// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserProfileModelImpl _$$UserProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileModelImpl(
      data: json['data'] == null
          ? null
          : UserProfileDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$UserProfileModelImplToJson(
        _$UserProfileModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$UserProfileDataModelImpl _$$UserProfileDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserProfileDataModelImpl(
      profile: json['profile'] == null
          ? null
          : ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      originAddress: json['originAddress'] == null
          ? null
          : OriginAddressModel.fromJson(
              json['originAddress'] as Map<String, dynamic>),
      residentialAddress: json['residentialAddress'] == null
          ? null
          : ResidentialAddressModel.fromJson(
              json['residentialAddress'] as Map<String, dynamic>),
      location: json['location'] == null
          ? null
          : LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      profileCounters: json['profileCounters'] == null
          ? null
          : ProfileCounterModel.fromJson(
              json['profileCounters'] as Map<String, dynamic>),
      referralInfo: json['referralInfo'] == null
          ? null
          : ReferralInfoModel.fromJson(
              json['referralInfo'] as Map<String, dynamic>),
      interests: (json['interests'] as List<dynamic>?)
          ?.map((e) => InterestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      bankAccountDetails: json['bankAccountDetails'] == null
          ? null
          : BankAccountDetailModel.fromJson(
              json['bankAccountDetails'] as Map<String, dynamic>),
      userDownlines: (json['userDownlines'] as List<dynamic>?)
          ?.map((e) => UserDownlines.fromJson(e as Map<String, dynamic>))
          .toList(),
      userCarousels: (json['userCarousels'] as List<dynamic>?)
          ?.map((e) => UserCarousels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserProfileDataModelImplToJson(
        _$UserProfileDataModelImpl instance) =>
    <String, dynamic>{
      'profile': instance.profile,
      'originAddress': instance.originAddress,
      'residentialAddress': instance.residentialAddress,
      'location': instance.location,
      'profileCounters': instance.profileCounters,
      'referralInfo': instance.referralInfo,
      'interests': instance.interests,
      'bankAccountDetails': instance.bankAccountDetails,
      'userDownlines': instance.userDownlines,
      'userCarousels': instance.userCarousels,
    };

_$ProfileModelImpl _$$ProfileModelImplFromJson(Map<String, dynamic> json) =>
    _$ProfileModelImpl(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      dateOfBirth: json['dateOfBirth'],
      age: json['age'],
      gender: json['gender'],
      languageCSV: json['languageCSV'],
      aboutMe: json['aboutMe'],
      bodyType: json['bodyType'],
      complexion: json['complexion'],
      height: json['height'],
      weight: json['weight'],
      occupation: json['occupation'],
      religion: json['religion'],
      tagline: json['tagline'],
      maritalStatus: json['maritalStatus'],
      profilePhotoURL: json['profilePhotoURL'],
      profileStatus: json['profileStatus'],
      lastSeenTime: json['lastSeenTime'],
      isOnline: json['isOnline'],
      residentialAddress: json['residentialAddress'] == null
          ? null
          : ResidentialAddressModel.fromJson(
              json['residentialAddress'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      userSubscription: json['userSubscription'] == null
          ? null
          : SubscriptionModel.fromJson(
              json['userSubscription'] as Map<String, dynamic>),
      wallet: json['wallet'] == null
          ? null
          : WalletModel.fromJson(json['wallet'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ProfileModelImplToJson(_$ProfileModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'age': instance.age,
      'gender': instance.gender,
      'languageCSV': instance.languageCSV,
      'aboutMe': instance.aboutMe,
      'bodyType': instance.bodyType,
      'complexion': instance.complexion,
      'height': instance.height,
      'weight': instance.weight,
      'occupation': instance.occupation,
      'religion': instance.religion,
      'tagline': instance.tagline,
      'maritalStatus': instance.maritalStatus,
      'profilePhotoURL': instance.profilePhotoURL,
      'profileStatus': instance.profileStatus,
      'lastSeenTime': instance.lastSeenTime,
      'isOnline': instance.isOnline,
      'residentialAddress': instance.residentialAddress,
      'user': instance.user,
      'userSubscription': instance.userSubscription,
      'wallet': instance.wallet,
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
      downlinesCount: json['downlinesCount'],
      successfulEventCount: json['successfulEventCount'],
    );

Map<String, dynamic> _$$ProfileCounterModelImplToJson(
        _$ProfileCounterModelImpl instance) =>
    <String, dynamic>{
      'friendsCount': instance.friendsCount,
      'downlinesCount': instance.downlinesCount,
      'successfulEventCount': instance.successfulEventCount,
    };

_$SubscriptionModelImpl _$$SubscriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionModelImpl(
      subscriptionId: $enumDecodeNullable(
          _$SubscriptionTypeEnumMap, json['subscriptionId']),
      name: json['name'],
      amount: json['amount'],
      startdate: json['startdate'],
      enddate: json['enddate'],
      status: $enumDecodeNullable(_$SubscriptionStatusEnumMap, json['status']),
      paymentmethod: json['paymentmethod'],
    );

Map<String, dynamic> _$$SubscriptionModelImplToJson(
        _$SubscriptionModelImpl instance) =>
    <String, dynamic>{
      'subscriptionId': _$SubscriptionTypeEnumMap[instance.subscriptionId],
      'name': instance.name,
      'amount': instance.amount,
      'startdate': instance.startdate,
      'enddate': instance.enddate,
      'status': _$SubscriptionStatusEnumMap[instance.status],
      'paymentmethod': instance.paymentmethod,
    };

const _$SubscriptionTypeEnumMap = {
  SubscriptionType.regular: 1,
  SubscriptionType.premium: 2,
  SubscriptionType.gold: 3,
};

const _$SubscriptionStatusEnumMap = {
  SubscriptionStatus.active: 1,
  SubscriptionStatus.inactive: 0,
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
      interestId: json['interestId'],
      title: json['title'],
    );

Map<String, dynamic> _$$InterestModelImplToJson(_$InterestModelImpl instance) =>
    <String, dynamic>{
      'interestId': instance.interestId,
      'title': instance.title,
    };

_$ReferralInfoModelImpl _$$ReferralInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReferralInfoModelImpl(
      referralCode: json['referralCode'] as String,
      referralLink: json['referralLink'] as String,
    );

Map<String, dynamic> _$$ReferralInfoModelImplToJson(
        _$ReferralInfoModelImpl instance) =>
    <String, dynamic>{
      'referralCode': instance.referralCode,
      'referralLink': instance.referralLink,
    };

_$UserDownlinesImpl _$$UserDownlinesImplFromJson(Map<String, dynamic> json) =>
    _$UserDownlinesImpl(
      json['id'],
      json['firstName'],
      json['lastName'],
      json['userName'],
      json['profilePhotoURL'],
      json['createdDate'],
    );

Map<String, dynamic> _$$UserDownlinesImplToJson(_$UserDownlinesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'profilePhotoURL': instance.profilePhotoURL,
      'createdDate': instance.createdDate,
    };

_$UserCarouselsImpl _$$UserCarouselsImplFromJson(Map<String, dynamic> json) =>
    _$UserCarouselsImpl(
      json['id'],
      json['carouselPhotoUrl'],
    );

Map<String, dynamic> _$$UserCarouselsImplToJson(_$UserCarouselsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carouselPhotoUrl': instance.carouselPhotoUrl,
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
