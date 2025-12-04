// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      data: json['data'] == null
          ? null
          : UserProfileDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_UserProfileDataModel _$UserProfileDataModelFromJson(
        Map<String, dynamic> json) =>
    _UserProfileDataModel(
      user: json['user'] == null
          ? null
          : UserModel.fromJson(json['user'] as Map<String, dynamic>),
      userSubscription: json['userSubscription'] == null
          ? null
          : SubscriptionModel.fromJson(
              json['userSubscription'] as Map<String, dynamic>),
      profile: json['profile'] == null
          ? null
          : ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
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
      userDownlines: (json['userDownlines'] as List<dynamic>?)
          ?.map((e) => UserDownlines.fromJson(e as Map<String, dynamic>))
          .toList(),
      userCarousels: (json['userCarousels'] as List<dynamic>?)
          ?.map((e) => UserCarousels.fromJson(e as Map<String, dynamic>))
          .toList(),
      matchCriteria: json['matchCriteria'] == null
          ? null
          : MatchCriteriaModel.fromJson(
              json['matchCriteria'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileDataModelToJson(
        _UserProfileDataModel instance) =>
    <String, dynamic>{
      'user': instance.user,
      'userSubscription': instance.userSubscription,
      'profile': instance.profile,
      'profileCounters': instance.profileCounters,
      'referralInfo': instance.referralInfo,
      'interests': instance.interests,
      'userDownlines': instance.userDownlines,
      'userCarousels': instance.userCarousels,
      'matchCriteria': instance.matchCriteria,
    };

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
      userId: json['userId'] as String?,
      isFullyVerified: json['isFullyVerified'] as bool?,
      userName: json['userName'] as String?,
      rolesCSV: json['rolesCSV'] as String?,
      createdDate: parseCustomDate(json['createdDate'] as String?),
      lastSeenDate: parseCustomDate(json['lastSeenDate'] as String?),
      normalizedEmail: json['normalizedEmail'] as String?,
      emailConfirmed: json['emailConfirmed'] as bool?,
      phoneCountryCode: json['phoneCountryCode'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      phoneNumberConfirmed: json['phoneNumberConfirmed'] as bool?,
      isPromoter: json['isPromoter'] as bool?,
    );

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'isFullyVerified': instance.isFullyVerified,
      'userName': instance.userName,
      'rolesCSV': instance.rolesCSV,
      'createdDate': instance.createdDate?.toIso8601String(),
      'lastSeenDate': instance.lastSeenDate?.toIso8601String(),
      'normalizedEmail': instance.normalizedEmail,
      'emailConfirmed': instance.emailConfirmed,
      'phoneCountryCode': instance.phoneCountryCode,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberConfirmed': instance.phoneNumberConfirmed,
      'isPromoter': instance.isPromoter,
    };

_SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    _SubscriptionModel(
      subscriptionId: (json['subscriptionId'] as num?)?.toInt(),
      name: json['name'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      startDate: parseCustomDate(json['startdate'] as String?),
      endDate: parseCustomDate(json['enddate'] as String?),
      status: (json['status'] as num?)?.toInt(),
      paymentMethod: json['paymentmethod'] as String?,
      subscription: json['subscription'] == null
          ? null
          : SubscriptionDetail.fromJson(
              json['subscription'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SubscriptionModelToJson(_SubscriptionModel instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'name': instance.name,
      'amount': instance.amount,
      'startdate': instance.startDate?.toIso8601String(),
      'enddate': instance.endDate?.toIso8601String(),
      'status': instance.status,
      'paymentmethod': instance.paymentMethod,
      'subscription': instance.subscription,
    };

_SubscriptionDetail _$SubscriptionDetailFromJson(Map<String, dynamic> json) =>
    _SubscriptionDetail(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      fee: (json['fee'] as num?)?.toDouble(),
      allowMessaging: json['allowMessaging'] as bool?,
      allowWithdrawal: json['allowWithdrawal'] as bool?,
      accessPeopleNearby: json['accessPeopleNearby'] as bool?,
      noMatchesPerDay: (json['noMatchesPerDay'] as num?)?.toInt(),
      noOfBuddyEventPerWeek: (json['noOfBuddyEventPerWeek'] as num?)?.toInt(),
      noNearbyPerWeek: (json['noNearbyPerWeek'] as num?)?.toInt(),
      noOfChatMessagePerWeek: (json['noOfChatMessagePerWeek'] as num?)?.toInt(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SubscriptionDetailToJson(_SubscriptionDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'fee': instance.fee,
      'allowMessaging': instance.allowMessaging,
      'allowWithdrawal': instance.allowWithdrawal,
      'accessPeopleNearby': instance.accessPeopleNearby,
      'noMatchesPerDay': instance.noMatchesPerDay,
      'noOfBuddyEventPerWeek': instance.noOfBuddyEventPerWeek,
      'noNearbyPerWeek': instance.noNearbyPerWeek,
      'noOfChatMessagePerWeek': instance.noOfChatMessagePerWeek,
      'features': instance.features,
    };

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      dateOfBirth: json['dateOfBirth'] as String?,
      age: (json['age'] as num?)?.toInt(),
      gender: (json['gender'] as num?)?.toInt(),
      languageCSV: json['languageCSV'] as String?,
      aboutMe: json['aboutMe'] as String?,
      bodyType: json['bodyType'] as String?,
      complexion: json['complexion'] as String?,
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      occupation: json['occupation'] as String?,
      religion: json['religion'] as String?,
      tagline: json['tagline'] as String?,
      maritalStatus: (json['maritalStatus'] as num?)?.toInt(),
      profilePhotoURL: json['profilePhotoURL'] as String?,
      profileStatus: (json['profileStatus'] as num?)?.toInt(),
      lastSeenTime: parseCustomDate(json['lastSeenTime'] as String?),
      isOnline: json['isOnline'] as bool?,
      lastModifiedDate: parseCustomDate(json['lastModifiedDate'] as String?),
      createdDate: parseCustomDate(json['createdDate'] as String?),
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
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
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
      'lastSeenTime': instance.lastSeenTime?.toIso8601String(),
      'isOnline': instance.isOnline,
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'createdDate': instance.createdDate?.toIso8601String(),
      'residentialAddress': instance.residentialAddress,
      'originAddress': instance.originAddress,
      'location': instance.location,
    };

_ResidentialAddressModel _$ResidentialAddressModelFromJson(
        Map<String, dynamic> json) =>
    _ResidentialAddressModel(
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
    );

Map<String, dynamic> _$ResidentialAddressModelToJson(
        _ResidentialAddressModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
    };

_OriginAddressModel _$OriginAddressModelFromJson(Map<String, dynamic> json) =>
    _OriginAddressModel(
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      zipCode: json['zipCode'] as String?,
    );

Map<String, dynamic> _$OriginAddressModelToJson(_OriginAddressModel instance) =>
    <String, dynamic>{
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
    };

_LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    _LocationModel(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationModelToJson(_LocationModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };

_ProfileCounterModel _$ProfileCounterModelFromJson(Map<String, dynamic> json) =>
    _ProfileCounterModel(
      friendsCount: (json['friendsCount'] as num?)?.toInt(),
      downlinesCount: (json['downlinesCount'] as num?)?.toInt(),
      successfulEventCount: (json['successfulEventCount'] as num?)?.toInt(),
      totalDownlinesCount: (json['totalDownlinesCount'] as num?)?.toInt(),
      indirectDownlinesCount: (json['indirectDownlinesCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProfileCounterModelToJson(
        _ProfileCounterModel instance) =>
    <String, dynamic>{
      'friendsCount': instance.friendsCount,
      'downlinesCount': instance.downlinesCount,
      'successfulEventCount': instance.successfulEventCount,
      'totalDownlinesCount': instance.totalDownlinesCount,
      'indirectDownlinesCount': instance.indirectDownlinesCount,
    };

_ReferralInfoModel _$ReferralInfoModelFromJson(Map<String, dynamic> json) =>
    _ReferralInfoModel(
      referralCode: json['referralCode'] as String?,
      referralLink: json['referralLink'] as String?,
    );

Map<String, dynamic> _$ReferralInfoModelToJson(_ReferralInfoModel instance) =>
    <String, dynamic>{
      'referralCode': instance.referralCode,
      'referralLink': instance.referralLink,
    };

_InterestModel _$InterestModelFromJson(Map<String, dynamic> json) =>
    _InterestModel(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
    );

Map<String, dynamic> _$InterestModelToJson(_InterestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_UserDownlines _$UserDownlinesFromJson(Map<String, dynamic> json) =>
    _UserDownlines(
      id: json['id'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['userName'] as String?,
      profilePhotoURL: json['profilePhotoURL'] as String?,
      createdDate: parseCustomDate(json['createdDate'] as String?),
    );

Map<String, dynamic> _$UserDownlinesToJson(_UserDownlines instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'profilePhotoURL': instance.profilePhotoURL,
      'createdDate': instance.createdDate?.toIso8601String(),
    };

_UserCarousels _$UserCarouselsFromJson(Map<String, dynamic> json) =>
    _UserCarousels(
      id: json['id'] as String?,
      carouselPhotoUrl: json['carouselPhotoUrl'] as String?,
    );

Map<String, dynamic> _$UserCarouselsToJson(_UserCarousels instance) =>
    <String, dynamic>{
      'id': instance.id,
      'carouselPhotoUrl': instance.carouselPhotoUrl,
    };

_MatchCriteriaModel _$MatchCriteriaModelFromJson(Map<String, dynamic> json) =>
    _MatchCriteriaModel(
      gender: json['gender'] as String?,
      minAge: (json['minAge'] as num?)?.toInt(),
      maxAge: (json['maxAge'] as num?)?.toInt(),
      distance: (json['distance'] as num?)?.toDouble(),
      country: json['country'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$MatchCriteriaModelToJson(_MatchCriteriaModel instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'distance': instance.distance,
      'country': instance.country,
      'city': instance.city,
    };
