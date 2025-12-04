// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:zheeta/core/common/cubit/maintenance_mode_cubit/maintenance_mode_cubit.dart'
    as _i998;
import 'package:zheeta/core/network/api.dart' as _i850;
import 'package:zheeta/core/services/agreement_service.dart' as _i387;
import 'package:zheeta/core/services/deep_link_service.dart' as _i918;
import 'package:zheeta/core/services/inapp_purchase_service.dart' as _i387;
import 'package:zheeta/core/services/push_notification_service.dart' as _i16;
import 'package:zheeta/core/storage/storage/i_storage.dart' as _i424;
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart'
    as _i464;
import 'package:zheeta/core/storage/user_storage/i_user_storage.dart' as _i443;
import 'package:zheeta/di/di.dart' as _i428;
import 'package:zheeta/features/app/presentation/cubits/app_cubit/app_cubit.dart'
    as _i970;
import 'package:zheeta/features/app/presentation/cubits/bottom_nav_cubit/bottom_nav_cubit.dart'
    as _i448;
import 'package:zheeta/features/authentication/data/datasources/i_user_auth_datasource.dart'
    as _i172;
import 'package:zheeta/features/authentication/data/datasources/i_user_country_datasource.dart'
    as _i743;
import 'package:zheeta/features/authentication/data/datasources/i_user_otp_datasource.dart'
    as _i777;
import 'package:zheeta/features/authentication/data/datasources/user_auth_datasource_impl.dart'
    as _i1000;
import 'package:zheeta/features/authentication/data/datasources/user_country_datasource_impl.dart'
    as _i1006;
import 'package:zheeta/features/authentication/data/datasources/user_otp_datasource_impl.dart'
    as _i569;
import 'package:zheeta/features/authentication/data/repositories/user_auth_repository_impl.dart'
    as _i669;
import 'package:zheeta/features/authentication/data/repositories/user_country_repository_impl.dart'
    as _i646;
import 'package:zheeta/features/authentication/data/repositories/user_otp_repository_impl.dart'
    as _i431;
import 'package:zheeta/features/authentication/domain/repositories/user_auth_repository.dart'
    as _i669;
import 'package:zheeta/features/authentication/domain/repositories/user_country_repository.dart'
    as _i603;
import 'package:zheeta/features/authentication/domain/repositories/user_otp_repository.dart'
    as _i126;
import 'package:zheeta/features/authentication/domain/usecases/user_auth/user_auth_usecases.dart'
    as _i643;
import 'package:zheeta/features/authentication/domain/usecases/user_country/user_country_usecases.dart'
    as _i184;
import 'package:zheeta/features/authentication/domain/usecases/user_otp/user_otp_usecases.dart'
    as _i860;
import 'package:zheeta/features/authentication/presentation/cubits/authenticate_country_cubit/authenticate_country_cubit.dart'
    as _i379;
import 'package:zheeta/features/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart'
    as _i720;
import 'package:zheeta/features/buddy_events/data/datasources/event_datasource_impl.dart'
    as _i758;
import 'package:zheeta/features/buddy_events/data/datasources/event_member_datasource_impl.dart'
    as _i88;
import 'package:zheeta/features/buddy_events/data/datasources/event_message_datasource_impl.dart'
    as _i170;
import 'package:zheeta/features/buddy_events/data/datasources/event_search_datasource_impl.dart'
    as _i334;
import 'package:zheeta/features/buddy_events/data/datasources/event_verification_datasource_impl.dart'
    as _i840;
import 'package:zheeta/features/buddy_events/data/datasources/i_event_datasource.dart'
    as _i801;
import 'package:zheeta/features/buddy_events/data/datasources/i_event_member_datasource.dart'
    as _i126;
import 'package:zheeta/features/buddy_events/data/datasources/i_event_message_datasource.dart'
    as _i233;
import 'package:zheeta/features/buddy_events/data/datasources/i_event_search_datasource.dart'
    as _i968;
import 'package:zheeta/features/buddy_events/data/datasources/i_event_verification_datasource.dart'
    as _i816;
import 'package:zheeta/features/buddy_events/data/repositories/event_member_repository_impl.dart'
    as _i901;
import 'package:zheeta/features/buddy_events/data/repositories/event_message_repository_impl.dart'
    as _i519;
import 'package:zheeta/features/buddy_events/data/repositories/event_repository_impl.dart'
    as _i687;
import 'package:zheeta/features/buddy_events/data/repositories/event_search_repository_impl.dart'
    as _i346;
import 'package:zheeta/features/buddy_events/data/repositories/event_verification_repository_impl.dart'
    as _i1028;
import 'package:zheeta/features/buddy_events/domain/repositories/event_member_repository.dart'
    as _i644;
import 'package:zheeta/features/buddy_events/domain/repositories/event_message_repository.dart'
    as _i486;
import 'package:zheeta/features/buddy_events/domain/repositories/event_repository.dart'
    as _i376;
import 'package:zheeta/features/buddy_events/domain/repositories/event_search_repository.dart'
    as _i1029;
import 'package:zheeta/features/buddy_events/domain/repositories/event_verification_repository.dart'
    as _i721;
import 'package:zheeta/features/buddy_events/domain/usecases/buddy_event_verification/get_event_verification_usecase.dart'
    as _i873;
import 'package:zheeta/features/buddy_events/domain/usecases/create_event_usecase.dart'
    as _i656;
import 'package:zheeta/features/buddy_events/domain/usecases/created_event_usecase.dart'
    as _i1030;
import 'package:zheeta/features/buddy_events/domain/usecases/delete_event_usecase.dart'
    as _i202;
import 'package:zheeta/features/buddy_events/domain/usecases/get_event_details_usecase.dart'
    as _i1001;
import 'package:zheeta/features/buddy_events/domain/usecases/get_event_feed_usecase.dart'
    as _i348;
import 'package:zheeta/features/buddy_events/domain/usecases/get_event_member_usecase.dart'
    as _i874;
import 'package:zheeta/features/buddy_events/domain/usecases/get_join_request_usecase.dart'
    as _i345;
import 'package:zheeta/features/buddy_events/domain/usecases/joined_event_usecase.dart'
    as _i432;
import 'package:zheeta/features/buddy_events/domain/usecases/process_join_request_usecase.dart'
    as _i674;
import 'package:zheeta/features/buddy_events/domain/usecases/remove_event_feed_usecase.dart'
    as _i616;
import 'package:zheeta/features/buddy_events/domain/usecases/search_event_usecase.dart'
    as _i827;
import 'package:zheeta/features/buddy_events/domain/usecases/send_join_request_usecase.dart'
    as _i569;
import 'package:zheeta/features/buddy_events/domain/usecases/share_event_usecase.dart'
    as _i779;
import 'package:zheeta/features/buddy_events/domain/usecases/update_event_usecase.dart'
    as _i627;
import 'package:zheeta/features/buddy_events/presentation/cubits/event_create_cubit/event_create_cubit.dart'
    as _i390;
import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/buddy_events_feed_cubit.dart'
    as _i1018;
import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/created_events_cubit.dart'
    as _i365;
import 'package:zheeta/features/buddy_events/presentation/cubits/event_cubit/joined_events_cubit.dart'
    as _i443;
import 'package:zheeta/features/buddy_events/presentation/cubits/event_details_cubit/event_details_cubit.dart'
    as _i409;
import 'package:zheeta/features/buddy_events/presentation/cubits/event_search_cubit/search_event_buddy_cubit.dart'
    as _i136;
import 'package:zheeta/features/buddy_events/presentation/cubits/event_verification_cubit/event_verification_cubit.dart'
    as _i233;
import 'package:zheeta/features/buddy_events/presentation/cubits/sponsored_boost_cubit/sponsored_boost_cubit.dart'
    as _i1044;
import 'package:zheeta/features/connections/data/datasources/downline_datasource_impl.dart'
    as _i146;
import 'package:zheeta/features/connections/data/datasources/friends_datasource_impl.dart'
    as _i567;
import 'package:zheeta/features/connections/data/datasources/i_downline_datasource.dart'
    as _i352;
import 'package:zheeta/features/connections/data/datasources/i_friends_datasource.dart'
    as _i505;
import 'package:zheeta/features/connections/data/repositories/friends_repository_impl.dart'
    as _i962;
import 'package:zheeta/features/connections/data/repositories/user_downlines_repository_impl.dart'
    as _i981;
import 'package:zheeta/features/connections/domain/repositories/friends_repository.dart'
    as _i686;
import 'package:zheeta/features/connections/domain/repositories/user_downline_repository.dart'
    as _i305;
import 'package:zheeta/features/connections/domain/usecases/get_all_friends_usecase.dart'
    as _i1070;
import 'package:zheeta/features/connections/domain/usecases/get_pending_friends_usecase.dart'
    as _i292;
import 'package:zheeta/features/connections/domain/usecases/process_friend_request_usecase.dart'
    as _i956;
import 'package:zheeta/features/connections/domain/usecases/send_bulk_friend_request_usecases.dart'
    as _i382;
import 'package:zheeta/features/connections/domain/usecases/send_friend_request_usecases.dart'
    as _i771;
import 'package:zheeta/features/connections/domain/usecases/user_downlines_usecase.dart'
    as _i407;
import 'package:zheeta/features/connections/presentation/cubits/all_friends_cubit/all_friends_cubit.dart'
    as _i276;
import 'package:zheeta/features/connections/presentation/cubits/block_account_cubit/block_account_cubit.dart'
    as _i327;
import 'package:zheeta/features/connections/presentation/cubits/blocked_users_cubit/blocked_users_cubit.dart'
    as _i956;
import 'package:zheeta/features/connections/presentation/cubits/downline_cubit/user_downline_cubit.dart'
    as _i817;
import 'package:zheeta/features/connections/presentation/cubits/friends_cubit/friends_cubit.dart'
    as _i790;
import 'package:zheeta/features/connections/presentation/cubits/pending_friends_cubit/pending_friends_cubit.dart'
    as _i121;
import 'package:zheeta/features/discover/data/datasources/i_match_criteria_datasource.dart'
    as _i247;
import 'package:zheeta/features/discover/data/datasources/i_nearby_datasource.dart'
    as _i589;
import 'package:zheeta/features/discover/data/datasources/match_criteria_datasource_impl.dart'
    as _i721;
import 'package:zheeta/features/discover/data/datasources/nearby_datasource_impl.dart'
    as _i907;
import 'package:zheeta/features/discover/data/repositories/match_criteria_repository_impl.dart'
    as _i387;
import 'package:zheeta/features/discover/data/repositories/nearby_profile_repository_impl.dart'
    as _i1062;
import 'package:zheeta/features/discover/domain/repositories/match_criteria_repository.dart'
    as _i689;
import 'package:zheeta/features/discover/domain/repositories/nearby_repository.dart'
    as _i371;
import 'package:zheeta/features/discover/domain/usecases/match_criteria_usecases.dart'
    as _i650;
import 'package:zheeta/features/discover/domain/usecases/nearby_profiles_usecase.dart'
    as _i938;
import 'package:zheeta/features/discover/domain/usecases/nearby_settings_usecase.dart'
    as _i763;
import 'package:zheeta/features/discover/domain/usecases/nearby_update_usecase.dart'
    as _i7;
import 'package:zheeta/features/discover/presentation/cubits/match_criteria_cubit/match_criteria_cubit.dart'
    as _i769;
import 'package:zheeta/features/discover/presentation/cubits/matches_cubit/matches_cubit.dart'
    as _i899;
import 'package:zheeta/features/discover/presentation/cubits/nearby_profiles_cubit/nearby_profile_cubit.dart'
    as _i445;
import 'package:zheeta/features/discover/presentation/cubits/nearby_settings_cubit/nearby_settings_cubit.dart'
    as _i485;
import 'package:zheeta/features/gifts/data/datasources/gift_datasource_impl.dart'
    as _i536;
import 'package:zheeta/features/gifts/data/datasources/i_gift_datasource.dart'
    as _i504;
import 'package:zheeta/features/gifts/data/repositories/gift_repository_impl.dart'
    as _i479;
import 'package:zheeta/features/gifts/domain/repositories/gift_repository.dart'
    as _i761;
import 'package:zheeta/features/gifts/domain/usecases/deliver_gift_usecase.dart'
    as _i79;
import 'package:zheeta/features/gifts/domain/usecases/get_gifts_usecase.dart'
    as _i258;
import 'package:zheeta/features/gifts/domain/usecases/received_gift_usecase.dart'
    as _i950;
import 'package:zheeta/features/gifts/domain/usecases/redeem_gift_usecase.dart'
    as _i693;
import 'package:zheeta/features/gifts/domain/usecases/send_gift_usecase.dart'
    as _i143;
import 'package:zheeta/features/gifts/domain/usecases/sent_gift_usecase.dart'
    as _i925;
import 'package:zheeta/features/gifts/presentation/cubits/all_gifts_cubit/all_gifts_cubit.dart'
    as _i937;
import 'package:zheeta/features/gifts/presentation/cubits/gift_cubit/gift_cubit.dart'
    as _i9;
import 'package:zheeta/features/gifts/presentation/cubits/received_gifts_cubit/received_gifts_cubit.dart'
    as _i263;
import 'package:zheeta/features/gifts/presentation/cubits/sent_gifts_cubit/sent_gifts_cubit.dart'
    as _i927;
import 'package:zheeta/features/messages/data/datasources/chat_datasource_impl.dart'
    as _i5;
import 'package:zheeta/features/messages/data/datasources/i_chat_datasource.dart'
    as _i615;
import 'package:zheeta/features/messages/data/repositories/chat_repository_impl.dart'
    as _i407;
import 'package:zheeta/features/messages/domain/repositories/chat_repository.dart'
    as _i161;
import 'package:zheeta/features/messages/domain/usecases/create_chat.dart'
    as _i199;
import 'package:zheeta/features/messages/domain/usecases/delete_chat.dart'
    as _i885;
import 'package:zheeta/features/messages/domain/usecases/get_chat_history.dart'
    as _i976;
import 'package:zheeta/features/messages/domain/usecases/get_chat_recipient.dart'
    as _i929;
import 'package:zheeta/features/messages/presentation/cubits/chat_action_cubit/chat_action_cubit.dart'
    as _i709;
import 'package:zheeta/features/messages/presentation/cubits/chat_delete_cubit/chat_delete_cubit.dart'
    as _i755;
import 'package:zheeta/features/messages/presentation/cubits/chat_history_cubit/chat_history_cubit.dart'
    as _i355;
import 'package:zheeta/features/messages/presentation/cubits/chat_recipients_cubit/chat_recipients_cubit.dart'
    as _i189;
import 'package:zheeta/features/notification/data/datasources/i_notification_datasource.dart'
    as _i403;
import 'package:zheeta/features/notification/data/datasources/notification_datasource_impl.dart'
    as _i304;
import 'package:zheeta/features/notification/data/repositories/notification_repository_impl.dart'
    as _i631;
import 'package:zheeta/features/notification/domain/repositories/notification_repository.dart'
    as _i750;
import 'package:zheeta/features/notification/domain/usecases/notification_usecase.dart'
    as _i589;
import 'package:zheeta/features/notification/presentation/cubits/notification_action_cubit/notification_action_cubit.dart'
    as _i873;
import 'package:zheeta/features/notification/presentation/cubits/notification_cubit/notification_cubit.dart'
    as _i141;
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/i_payment_datasource.dart'
    as _i350;
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/i_payout_account_datasource.dart'
    as _i424;
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/i_subscription_datasource.dart'
    as _i987;
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/payment_datasource_impl.dart'
    as _i798;
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/payout_account_datasource_impl.dart'
    as _i235;
import 'package:zheeta/features/payment_and_subscriptions/data/datasources/subscription_datasource_impl.dart'
    as _i674;
import 'package:zheeta/features/payment_and_subscriptions/data/repositories/payment_repository_impl.dart'
    as _i601;
import 'package:zheeta/features/payment_and_subscriptions/data/repositories/payout_account_repository_impl.dart'
    as _i603;
import 'package:zheeta/features/payment_and_subscriptions/data/repositories/subscription_repository_impl.dart'
    as _i690;
import 'package:zheeta/features/payment_and_subscriptions/domain/repositories/payment_repository.dart'
    as _i121;
import 'package:zheeta/features/payment_and_subscriptions/domain/repositories/payout_account_repository.dart'
    as _i26;
import 'package:zheeta/features/payment_and_subscriptions/domain/repositories/subscription_repository.dart'
    as _i776;
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/get_charges_usecase.dart'
    as _i314;
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/get_payment_link_usecase.dart'
    as _i689;
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/get_payment_types_usecase.dart'
    as _i334;
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/get_subscriptions_usecase.dart'
    as _i1060;
import 'package:zheeta/features/payment_and_subscriptions/domain/usecases/payout_usecase.dart'
    as _i675;
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/charges_cubit/charges_cubit.dart'
    as _i168;
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/payment_cubit/payment_cubit.dart'
    as _i435;
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/payout_cubit/payout_cubit.dart'
    as _i465;
import 'package:zheeta/features/payment_and_subscriptions/presentation/cubits/subscription_cubit/subscription_cubit.dart'
    as _i410;
import 'package:zheeta/features/profile/data/datasources/i_location_datasource.dart'
    as _i205;
import 'package:zheeta/features/profile/data/datasources/i_user_interest_datasource.dart'
    as _i679;
import 'package:zheeta/features/profile/data/datasources/i_user_profile_access_datasource.dart'
    as _i419;
import 'package:zheeta/features/profile/data/datasources/i_user_profile_boost_datasource.dart'
    as _i398;
import 'package:zheeta/features/profile/data/datasources/i_user_profile_datasource.dart'
    as _i145;
import 'package:zheeta/features/profile/data/datasources/i_user_search_datasource.dart'
    as _i160;
import 'package:zheeta/features/profile/data/datasources/location_datasource_impl.dart'
    as _i802;
import 'package:zheeta/features/profile/data/datasources/user_interest_datasource_impl.dart'
    as _i966;
import 'package:zheeta/features/profile/data/datasources/user_profile_access_datasource_impl.dart'
    as _i754;
import 'package:zheeta/features/profile/data/datasources/user_profile_boost_datasource_impl.dart'
    as _i346;
import 'package:zheeta/features/profile/data/datasources/user_profile_datasource_impl.dart'
    as _i83;
import 'package:zheeta/features/profile/data/datasources/user_search_datasource_impl.dart'
    as _i387;
import 'package:zheeta/features/profile/data/repositories/location_repository_impl.dart'
    as _i382;
import 'package:zheeta/features/profile/data/repositories/user_interest_repository_impl.dart'
    as _i804;
import 'package:zheeta/features/profile/data/repositories/user_profile_access_repository_impl.dart'
    as _i1003;
import 'package:zheeta/features/profile/data/repositories/user_profile_boost_repository_impl.dart'
    as _i552;
import 'package:zheeta/features/profile/data/repositories/user_profile_repository_impl.dart'
    as _i502;
import 'package:zheeta/features/profile/data/repositories/user_search_repository_impl.dart'
    as _i1062;
import 'package:zheeta/features/profile/domain/repositories/location_repository.dart'
    as _i46;
import 'package:zheeta/features/profile/domain/repositories/user_interest_repository.dart'
    as _i809;
import 'package:zheeta/features/profile/domain/repositories/user_profile_access_repository.dart'
    as _i354;
import 'package:zheeta/features/profile/domain/repositories/user_profile_boost_repository.dart'
    as _i1041;
import 'package:zheeta/features/profile/domain/repositories/user_profile_repository.dart'
    as _i171;
import 'package:zheeta/features/profile/domain/repositories/user_search_repository.dart'
    as _i933;
import 'package:zheeta/features/profile/domain/usecases/location_usecases.dart'
    as _i1002;
import 'package:zheeta/features/profile/domain/usecases/user_interest_usecases.dart'
    as _i582;
import 'package:zheeta/features/profile/domain/usecases/user_profile_access_usecases.dart'
    as _i588;
import 'package:zheeta/features/profile/domain/usecases/user_profile_boost_usecases.dart'
    as _i896;
import 'package:zheeta/features/profile/domain/usecases/user_profile_usecases.dart'
    as _i739;
import 'package:zheeta/features/profile/domain/usecases/user_profile_view_usecase.dart'
    as _i436;
import 'package:zheeta/features/profile/domain/usecases/user_search_usecases.dart'
    as _i359;
import 'package:zheeta/features/profile/presentation/cubits/profile_boost_cubit/profile_boost_cubit.dart'
    as _i752;
import 'package:zheeta/features/profile/presentation/cubits/profile_create_cubit/profile_create_cubit.dart'
    as _i253;
import 'package:zheeta/features/profile/presentation/cubits/profile_created_events_cubit/profile_created_events_cubit.dart'
    as _i201;
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart'
    as _i315;
import 'package:zheeta/features/profile/presentation/cubits/profile_edit_cubit/profile_edit_cubit.dart'
    as _i592;
import 'package:zheeta/features/profile/presentation/cubits/profile_interest_cubit/profile_interest_cubit.dart'
    as _i359;
import 'package:zheeta/features/profile/presentation/cubits/profile_location_cubit/profile_location_cubit.dart'
    as _i849;
import 'package:zheeta/features/profile/presentation/cubits/profile_search_cubit/profile_search_cubit.dart'
    as _i979;
import 'package:zheeta/features/profile/presentation/cubits/profile_view_cubit/profile_view_cubit.dart'
    as _i822;
import 'package:zheeta/features/wallet_and_transactions/data/datasources/i_transaction_datasource.dart'
    as _i641;
import 'package:zheeta/features/wallet_and_transactions/data/datasources/i_wallet_datasource.dart'
    as _i141;
import 'package:zheeta/features/wallet_and_transactions/data/datasources/i_withdrawal_datasource.dart'
    as _i1025;
import 'package:zheeta/features/wallet_and_transactions/data/datasources/transaction_datasource_impl.dart'
    as _i249;
import 'package:zheeta/features/wallet_and_transactions/data/datasources/wallet_datasource_impl.dart'
    as _i898;
import 'package:zheeta/features/wallet_and_transactions/data/datasources/withdrawal_datasource_impl.dart'
    as _i28;
import 'package:zheeta/features/wallet_and_transactions/data/repositories/transaction_repository_impl.dart'
    as _i529;
import 'package:zheeta/features/wallet_and_transactions/data/repositories/wallet_repository_impl.dart'
    as _i363;
import 'package:zheeta/features/wallet_and_transactions/data/repositories/withdrawal_repository_impl.dart'
    as _i887;
import 'package:zheeta/features/wallet_and_transactions/domain/repositories/transaction_repository.dart'
    as _i375;
import 'package:zheeta/features/wallet_and_transactions/domain/repositories/wallet_repository.dart'
    as _i989;
import 'package:zheeta/features/wallet_and_transactions/domain/repositories/withdrawal_repository.dart'
    as _i529;
import 'package:zheeta/features/wallet_and_transactions/domain/usecases/transaction_usecase/get_transactions_usecase.dart'
    as _i251;
import 'package:zheeta/features/wallet_and_transactions/domain/usecases/wallet_usecase/get_wallet_counters.dart'
    as _i815;
import 'package:zheeta/features/wallet_and_transactions/domain/usecases/wallet_usecase/transfer_to_user_wallet_balance.dart'
    as _i500;
import 'package:zheeta/features/wallet_and_transactions/domain/usecases/withdrawal_usecase/get_rate_by_country_usecase.dart'
    as _i887;
import 'package:zheeta/features/wallet_and_transactions/domain/usecases/withdrawal_usecase/process_payout_usecase.dart'
    as _i634;
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/transaction_cubit/transaction_cubit.dart'
    as _i60;
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/transactions_cubit/transactions_cubit.dart'
    as _i808;
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/wallet_cubit/wallet_cubit.dart'
    as _i741;
import 'package:zheeta/features/wallet_and_transactions/presentation/cubits/withdrawal_cubit/withdrawal_cubit.dart'
    as _i91;
import 'package:zheeta/router/app_router.dart' as _i634;

const String _prod = 'prod';

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final storageModule = _$StorageModule();
    final serviceModule = _$ServiceModule();
    await gh.factoryAsync<_i424.IStorage>(
      () => storageModule.storageService,
      preResolve: true,
    );
    await gh.factoryAsync<_i464.ITokenStorage>(
      () => storageModule.tokenStorage,
      preResolve: true,
    );
    await gh.factoryAsync<_i443.IUserStorage>(
      () => storageModule.userStorage,
      preResolve: true,
    );
    await gh.factoryAsync<_i387.AgreementService>(
      () => storageModule.agreementService,
      preResolve: true,
    );
    await gh.factoryAsync<_i918.DeepLinkService>(
      () => serviceModule.deepLinkService,
      preResolve: true,
    );
    await gh.factoryAsync<_i16.PushNotificationService>(
      () => serviceModule.pushNotificationService,
      preResolve: true,
    );
    gh.factory<_i634.AppRouter>(() => _i634.AppRouter());
    gh.singleton<_i998.MaintenanceModeCubit>(
      () => _i998.MaintenanceModeCubit(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i850.Api>(
      () => _i850.Api(),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i387.InAppPurchaseService>(
      () => _i387.InAppPurchaseService(),
      registerFor: {_prod},
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i448.BottomNavCubit>(
      () => _i448.BottomNavCubit(),
      registerFor: {_prod},
    );
    gh.singleton<_i398.IUserProfileBoostDataSource>(
      () => _i346.UserProfileBoostDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i504.IGiftDataSource>(
      () => _i536.GiftDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i352.IUserDownlineDataSource>(
      () => _i146.UserDownlineDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i816.IEventVerificationDataSource>(
      () => _i840.EventVerificationDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i247.IMatchCriteriaDataSource>(
      () => _i721.MatchCriteriaDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i743.IUserCountryDataSource>(
      () => _i1006.CountryDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i589.INearbyDataSource>(
      () => _i907.NearbyDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i689.IMatchCriteriaRepository>(
      () => _i387.MatchCriteriaRepositoryImpl(
          gh<_i247.IMatchCriteriaDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i761.IGiftRepository>(
      () => _i479.GiftDataRepositoryImpl(gh<_i504.IGiftDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i615.IChatDataSource>(
      () => _i5.ChatDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i160.IUserSearchDataSource>(
      () => _i387.UserSearchDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i172.IUserAuthDataSource>(
      () => _i1000.UserAuthDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i145.IUserProfileDataSource>(
      () => _i83.UserProfileDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i205.ILocationDataSource>(
      () => _i802.LocationDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i603.IUserCountryRepository>(
      () => _i646.UserCountryRepositoryImpl(gh<_i743.IUserCountryDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i143.SendGiftUseCase>(
      () => _i143.SendGiftUseCase(gh<_i761.IGiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i950.GetAllReceivedGifts>(
      () => _i950.GetAllReceivedGifts(gh<_i761.IGiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i693.RedeemGift>(
      () => _i693.RedeemGift(gh<_i761.IGiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i258.GetAllGifts>(
      () => _i258.GetAllGifts(gh<_i761.IGiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i925.GetAllSentGifts>(
      () => _i925.GetAllSentGifts(gh<_i761.IGiftRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i79.DeliverGift>(
      () => _i79.DeliverGift(gh<_i761.IGiftRepository>()),
      registerFor: {_prod},
    );
    gh.singleton<_i987.ISubscriptionDataSource>(
      () => _i674.SubscriptionDatasourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i233.IEventMessageDataSource>(
      () => _i170.EventMessageDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i305.IUserDownlineRepository>(
      () =>
          _i981.UserDownlineRepositoryImpl(gh<_i352.IUserDownlineDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i161.IChatRepository>(
      () => _i407.ChatRepositoryImpl(gh<_i615.IChatDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i424.IPayoutAccountDataSource>(
      () => _i235.PayoutAccountRepositoryImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i679.IUserInterestDataSource>(
      () => _i966.UserInterestDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i419.IUserProfileAccessDataSource>(
      () => _i754.UserProfileAccessDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i141.IWalletDataSource>(
      () => _i898.WalletDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i641.ITransactionDataSource>(
      () => _i249.TransactionSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i1025.IWithdrawalDataSource>(
      () => _i28.WithdrawalDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i505.IFriendsDataSource>(
      () => _i567.FriendsDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i486.IEventMessageRepository>(
      () =>
          _i519.EventMessageRepositoryImpl(gh<_i233.IEventMessageDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i26.IPayoutAccountRepository>(
      () => _i603.PayoutAccountRepositoryImpl(
          gh<_i424.IPayoutAccountDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i9.GiftCubit>(
      () => _i9.GiftCubit(
        getAllGifts: gh<_i258.GetAllGifts>(),
        getAllReceivedGifts: gh<_i950.GetAllReceivedGifts>(),
        redeemGift: gh<_i693.RedeemGift>(),
        deliverGift: gh<_i79.DeliverGift>(),
        sendGiftUseCase: gh<_i143.SendGiftUseCase>(),
        getAllSentGifts: gh<_i925.GetAllSentGifts>(),
      ),
      registerFor: {_prod},
    );
    gh.singleton<_i126.IEventMemberDataSource>(
      () => _i88.EventMemberDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i777.IUserOtpDataSource>(
      () => _i569.UserOtpDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i350.IPaymentDataSource>(
      () => _i798.PaymentDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i968.IEventSearchDataSource>(
      () => _i334.EventSearchDatasourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i989.IWalletRepository>(
      () => _i363.WalletRepositoryImpl(gh<_i141.IWalletDataSource>()),
      registerFor: {_prod},
    );
    gh.singleton<_i403.INotificationDataSource>(
      () => _i304.NotificationDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.singleton<_i801.IEventDataSource>(
      () => _i758.EventDataSourceImpl(gh<_i850.Api>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i121.IPaymentRepository>(
      () => _i601.PaymentRepositoryImpl(gh<_i350.IPaymentDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i750.INotificationRepository>(
      () =>
          _i631.NotificationRepositoryImpl(gh<_i403.INotificationDataSource>()),
      registerFor: {_prod},
    );
    gh.factory<_i927.SentGiftsCubit>(
      () => _i927.SentGiftsCubit(getAllSentGifts: gh<_i925.GetAllSentGifts>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i199.CreateChat>(
      () => _i199.CreateChat(gh<_i161.IChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i199.SendMediaFile>(
      () => _i199.SendMediaFile(gh<_i161.IChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i976.GetChatHistory>(
      () => _i976.GetChatHistory(gh<_i161.IChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i929.GetChatRecipients>(
      () => _i929.GetChatRecipients(gh<_i161.IChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i885.DeleteChatHistory>(
      () => _i885.DeleteChatHistory(gh<_i161.IChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i885.DeleteChatMessage>(
      () => _i885.DeleteChatMessage(gh<_i161.IChatRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i376.IEventRepository>(
      () => _i687.EventDataRepositoryImpl(gh<_i801.IEventDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i776.ISubscriptionRepository>(
      () =>
          _i690.SubscriptionRepositoryImpl(gh<_i987.ISubscriptionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i407.GetUserDownlines>(
      () => _i407.GetUserDownlines(gh<_i305.IUserDownlineRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i644.IEventMemberRepository>(
      () => _i901.EventMemberRepositoryImpl(gh<_i126.IEventMemberDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i334.GetAllPaymentTypes>(
      () => _i334.GetAllPaymentTypes(gh<_i121.IPaymentRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i689.GetPaymentLink>(
      () => _i689.GetPaymentLink(gh<_i121.IPaymentRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i933.IUserSearchRepository>(
      () => _i1062.UserSearchRepositoryImpl(gh<_i160.IUserSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i529.IWithdrawalRepository>(
      () => _i887.WithdrawalRepositoryImpl(gh<_i1025.IWithdrawalDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i634.ProcessPayout>(
      () => _i634.ProcessPayout(gh<_i529.IWithdrawalRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i887.GetRateByCountry>(
      () => _i887.GetRateByCountry(gh<_i529.IWithdrawalRepository>()),
      registerFor: {_prod},
    );
    gh.factory<_i755.ChatDeleteCubit>(
      () => _i755.ChatDeleteCubit(
        deleteChatHistory: gh<_i885.DeleteChatHistory>(),
        deleteChatMessage: gh<_i885.DeleteChatMessage>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i721.IEventVerificationRepository>(
      () => _i1028.EventVerificationRepositoryImpl(
          gh<_i816.IEventVerificationDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i91.WithdrawalCubit>(
      () => _i91.WithdrawalCubit(
        getRateByCountry: gh<_i887.GetRateByCountry>(),
        processPayout: gh<_i634.ProcessPayout>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1041.IUserProfileBoostRepository>(
      () => _i552.UserProfileBoostRepositoryImpl(
          gh<_i398.IUserProfileBoostDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i314.GetAllCharges>(
      () => _i314.GetAllCharges(gh<_i776.ISubscriptionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1060.GetAllSubscriptions>(
      () => _i1060.GetAllSubscriptions(gh<_i776.ISubscriptionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i686.IFriendsRepository>(
      () => _i962.FriendsRepositoryImpl(gh<_i505.IFriendsDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i435.PaymentCubit>(
      () => _i435.PaymentCubit(
        getAllPaymentTypes: gh<_i334.GetAllPaymentTypes>(),
        getPaymentLink: gh<_i689.GetPaymentLink>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i371.INearbyDataRepository>(
      () => _i1062.NearbyDataRepositoryImpl(gh<_i589.INearbyDataSource>()),
      registerFor: {_prod},
    );
    gh.factory<_i263.ReceivedGiftsCubit>(
      () => _i263.ReceivedGiftsCubit(
          getAllReceivedGifts: gh<_i950.GetAllReceivedGifts>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i171.IUserProfileRepository>(
      () => _i502.UserProfileRepositoryImpl(gh<_i145.IUserProfileDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i739.GetSingleUserProfile>(
      () => _i739.GetSingleUserProfile(gh<_i171.IUserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i739.CreateProfile>(
      () => _i739.CreateProfile(gh<_i171.IUserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i739.UpdateUserProfilePicture>(
      () => _i739.UpdateUserProfilePicture(gh<_i171.IUserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i739.UpdateUserProfileCarousels>(
      () =>
          _i739.UpdateUserProfileCarousels(gh<_i171.IUserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i739.UpdateUserProfile>(
      () => _i739.UpdateUserProfile(gh<_i171.IUserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i436.VisitUserProfile>(
      () => _i436.VisitUserProfile(gh<_i171.IUserProfileRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i410.SubscriptionCubit>(
      () => _i410.SubscriptionCubit(
          getAllSubscriptions: gh<_i1060.GetAllSubscriptions>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i375.ITransactionRepository>(
      () => _i529.TransactionRepositoryImpl(gh<_i641.ITransactionDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i359.SearchUser>(
      () => _i359.SearchUser(gh<_i933.IUserSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i669.IUserAuthRepository>(
      () => _i669.UserAuthRepositoryImpl(
        gh<_i172.IUserAuthDataSource>(),
        gh<_i443.IUserStorage>(),
        gh<_i464.ITokenStorage>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i896.CreateProfileBoost>(
      () => _i896.CreateProfileBoost(gh<_i1041.IUserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i896.GetProfileBoost>(
      () => _i896.GetProfileBoost(gh<_i1041.IUserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i896.GetProfileBoostInsight>(
      () => _i896.GetProfileBoostInsight(
          gh<_i1041.IUserProfileBoostRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i168.ChargesCubit>(
      () => _i168.ChargesCubit(getAllCharges: gh<_i314.GetAllCharges>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i251.GetAllTransactions>(
      () => _i251.GetAllTransactions(gh<_i375.ITransactionRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i650.GetMatchCriteria>(
      () => _i650.GetMatchCriteria(gh<_i689.IMatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i650.PopulateMatches>(
      () => _i650.PopulateMatches(gh<_i689.IMatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i650.GetMatches>(
      () => _i650.GetMatches(gh<_i689.IMatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i650.UpdateMatchCriteria>(
      () => _i650.UpdateMatchCriteria(gh<_i689.IMatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i650.IgnoreBulkMatches>(
      () => _i650.IgnoreBulkMatches(gh<_i689.IMatchCriteriaRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i592.ProfileEditCubit>(
      () => _i592.ProfileEditCubit(
        userProfileCarousels: gh<_i739.UpdateUserProfileCarousels>(),
        updateUserProfile: gh<_i739.UpdateUserProfile>(),
        updateUserProfilePicture: gh<_i739.UpdateUserProfilePicture>(),
      ),
      registerFor: {_prod},
    );
    gh.factory<_i355.ChatHistoryCubit>(
      () => _i355.ChatHistoryCubit(getChatHistory: gh<_i976.GetChatHistory>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i763.GetNearbySettings>(
      () => _i763.GetNearbySettings(gh<_i371.INearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i938.GetNearbyProfiles>(
      () => _i938.GetNearbyProfiles(gh<_i371.INearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i7.UpdateNearbySettings>(
      () => _i7.UpdateNearbySettings(gh<_i371.INearbyDataRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i979.ProfileSearchCubit>(
      () => _i979.ProfileSearchCubit(searchUser: gh<_i359.SearchUser>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i432.GetAllJoinedEvents>(
      () => _i432.GetAllJoinedEvents(gh<_i376.IEventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1001.GetBuddyEventDetails>(
      () => _i1001.GetBuddyEventDetails(gh<_i376.IEventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i627.UpdateBuddyEvent>(
      () => _i627.UpdateBuddyEvent(gh<_i376.IEventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i779.ShareBuddyEvent>(
      () => _i779.ShareBuddyEvent(gh<_i376.IEventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i348.GetBuddyEventsFeed>(
      () => _i348.GetBuddyEventsFeed(gh<_i376.IEventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i202.DeleteBuddyEvent>(
      () => _i202.DeleteBuddyEvent(gh<_i376.IEventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i656.CreateBuddyEvent>(
      () => _i656.CreateBuddyEvent(gh<_i376.IEventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1030.GetAllCreatedEvents>(
      () => _i1030.GetAllCreatedEvents(gh<_i376.IEventRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i809.IUserInterestRepository>(
      () =>
          _i804.UserInterestRepositoryImpl(gh<_i679.IUserInterestDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i390.EventCreateCubit>(
      () => _i390.EventCreateCubit(
          createBuddyEvent: gh<_i656.CreateBuddyEvent>()),
      registerFor: {_prod},
    );
    gh.factory<_i365.CreatedEventsCubit>(
      () => _i365.CreatedEventsCubit(
          getAllCreatedEvents: gh<_i1030.GetAllCreatedEvents>()),
      registerFor: {_prod},
    );
    gh.factory<_i189.ChatRecipientsCubit>(
      () => _i189.ChatRecipientsCubit(
          getChatRecipients: gh<_i929.GetChatRecipients>()),
      registerFor: {_prod},
    );
    gh.factory<_i443.JoinedEventsCubit>(
      () => _i443.JoinedEventsCubit(
          getAllJoinedEvents: gh<_i432.GetAllJoinedEvents>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i354.IUserProfileAccessRepository>(
      () => _i1003.UserProfileAccessRepositoryImpl(
          gh<_i419.IUserProfileAccessDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i46.ILocationRepository>(
      () => _i382.LocationRepositoryImpl(gh<_i205.ILocationDataSource>()),
      registerFor: {_prod},
    );
    gh.factory<_i937.AllGiftsCubit>(
      () => _i937.AllGiftsCubit(getAllGifts: gh<_i258.GetAllGifts>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i184.GetAllCountries>(
      () => _i184.GetAllCountries(gh<_i603.IUserCountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i184.GetCountryDetails>(
      () => _i184.GetCountryDetails(gh<_i603.IUserCountryRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1029.IEventSearchRepository>(
      () => _i346.EventSearchRepositoryImpl(gh<_i968.IEventSearchDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i589.GetAllNotifications>(
      () => _i589.GetAllNotifications(gh<_i750.INotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i589.DeleteNotification>(
      () => _i589.DeleteNotification(gh<_i750.INotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i589.MarkAllNotificationsRead>(
      () => _i589.MarkAllNotificationsRead(gh<_i750.INotificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i589.MarkNotificationRead>(
      () => _i589.MarkNotificationRead(gh<_i750.INotificationRepository>()),
      registerFor: {_prod},
    );
    gh.factory<_i1018.BuddyEventsFeedCubit>(
      () => _i1018.BuddyEventsFeedCubit(
          getBuddyEventsFeed: gh<_i348.GetBuddyEventsFeed>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i815.GetWalletCounters>(
      () => _i815.GetWalletCounters(gh<_i989.IWalletRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i500.TransferToUserWallet>(
      () => _i500.TransferToUserWallet(gh<_i989.IWalletRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i382.SendBulkFriendRequest>(
      () => _i382.SendBulkFriendRequest(gh<_i686.IFriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i771.SendFriendRequest>(
      () => _i771.SendFriendRequest(gh<_i686.IFriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i292.GetPendingFriends>(
      () => _i292.GetPendingFriends(gh<_i686.IFriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1070.GetAllFriends>(
      () => _i1070.GetAllFriends(gh<_i686.IFriendsRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i956.ProcessFriendRequest>(
      () => _i956.ProcessFriendRequest(gh<_i686.IFriendsRepository>()),
      registerFor: {_prod},
    );
    gh.factory<_i817.UserDownlinesCubit>(
      () => _i817.UserDownlinesCubit(
          getUserDownlines: gh<_i407.GetUserDownlines>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i675.AddBankAccount>(
      () => _i675.AddBankAccount(gh<_i26.IPayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i675.AddMobileMoneyAccount>(
      () => _i675.AddMobileMoneyAccount(gh<_i26.IPayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i675.AddPaypalAccount>(
      () => _i675.AddPaypalAccount(gh<_i26.IPayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i675.AddCryptoAccount>(
      () => _i675.AddCryptoAccount(gh<_i26.IPayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i675.GetAllAccounts>(
      () => _i675.GetAllAccounts(gh<_i26.IPayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i675.GetAccountById>(
      () => _i675.GetAccountById(gh<_i26.IPayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i675.DeleteAccountById>(
      () => _i675.DeleteAccountById(gh<_i26.IPayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i675.GetPayoutCountries>(
      () => _i675.GetPayoutCountries(gh<_i26.IPayoutAccountRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i126.IUserOtpRepository>(
      () => _i431.UserOtpRepositoryImpl(gh<_i777.IUserOtpDataSource>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i873.NotificationActionCubit>(
      () => _i873.NotificationActionCubit(
        gh<_i589.DeleteNotification>(),
        gh<_i589.MarkAllNotificationsRead>(),
        gh<_i589.MarkNotificationRead>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1002.GetAddressFromLocationCoordinate>(
      () => _i1002.GetAddressFromLocationCoordinate(
          gh<_i46.ILocationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i1002.GetLocationCoordinateFromAddress>(
      () => _i1002.GetLocationCoordinateFromAddress(
          gh<_i46.ILocationRepository>()),
      registerFor: {_prod},
    );
    gh.factory<_i709.ChatActionCubit>(
      () => _i709.ChatActionCubit(
        createChat: gh<_i199.CreateChat>(),
        sendMediaFile: gh<_i199.SendMediaFile>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i769.MatchCriteriaCubit>(
      () => _i769.MatchCriteriaCubit(
        getMatchCriteria: gh<_i650.GetMatchCriteria>(),
        updateMatchCriteria: gh<_i650.UpdateMatchCriteria>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i588.BlockAccount>(
      () => _i588.BlockAccount(gh<_i354.IUserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i588.GetBlockedUsers>(
      () => _i588.GetBlockedUsers(gh<_i354.IUserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i588.UnBlockAccount>(
      () => _i588.UnBlockAccount(gh<_i354.IUserProfileAccessRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i345.GetJoinRequests>(
      () => _i345.GetJoinRequests(gh<_i644.IEventMemberRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i569.SendJoinRequest>(
      () => _i569.SendJoinRequest(gh<_i644.IEventMemberRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i616.RemoveBuddyEventMember>(
      () => _i616.RemoveBuddyEventMember(gh<_i644.IEventMemberRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i874.GetBuddyEventMembers>(
      () => _i874.GetBuddyEventMembers(gh<_i644.IEventMemberRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i674.ProcessJoinEventRequest>(
      () => _i674.ProcessJoinEventRequest(gh<_i644.IEventMemberRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i315.ProfileCubit>(
      () => _i315.ProfileCubit(
          getSingleUserProfile: gh<_i739.GetSingleUserProfile>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i873.GetBuddyEventVerificationById>(
      () => _i873.GetBuddyEventVerificationById(
          gh<_i721.IEventVerificationRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i822.ProfileViewCubit>(
      () => _i822.ProfileViewCubit(
          visitUserProfile: gh<_i436.VisitUserProfile>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i643.RegisterUser>(
      () => _i643.RegisterUser(gh<_i669.IUserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i643.LoginUser>(
      () => _i643.LoginUser(gh<_i669.IUserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i643.RegisterStaff>(
      () => _i643.RegisterStaff(gh<_i669.IUserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i643.ChangePassword>(
      () => _i643.ChangePassword(gh<_i669.IUserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i643.ResetPassword>(
      () => _i643.ResetPassword(gh<_i669.IUserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i643.LoginOAuth>(
      () => _i643.LoginOAuth(gh<_i669.IUserAuthRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i379.AuthenticateCountryCubit>(
      () => _i379.AuthenticateCountryCubit(
        getAllCountries: gh<_i184.GetAllCountries>(),
        getCountryDetails: gh<_i184.GetCountryDetails>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i141.NotificationCubit>(
      () => _i141.NotificationCubit(gh<_i589.GetAllNotifications>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i752.ProfileBoostCubit>(
      () => _i752.ProfileBoostCubit(
        createProfileBoost: gh<_i896.CreateProfileBoost>(),
        getProfileBoostInsight: gh<_i896.GetProfileBoostInsight>(),
      ),
      registerFor: {_prod},
    );
    gh.factory<_i485.NearbySettingsCubit>(
      () => _i485.NearbySettingsCubit(
        gh<_i763.GetNearbySettings>(),
        gh<_i7.UpdateNearbySettings>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i465.PayoutCubit>(
      () => _i465.PayoutCubit(
        addBankAccount: gh<_i675.AddBankAccount>(),
        addMobileMoneyAccount: gh<_i675.AddMobileMoneyAccount>(),
        addPaypalAccount: gh<_i675.AddPaypalAccount>(),
        addCryptoAccount: gh<_i675.AddCryptoAccount>(),
        getAllAccounts: gh<_i675.GetAllAccounts>(),
        getAccountById: gh<_i675.GetAccountById>(),
        deleteAccountById: gh<_i675.DeleteAccountById>(),
        getPayoutCountries: gh<_i675.GetPayoutCountries>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i849.ProfileLocationCubit>(
      () => _i849.ProfileLocationCubit(
        getAddressFromLocationCoordinate:
            gh<_i1002.GetAddressFromLocationCoordinate>(),
        getLocationCoordinateFromAddress:
            gh<_i1002.GetLocationCoordinateFromAddress>(),
      ),
      registerFor: {_prod},
    );
    gh.factory<_i327.BlockAccountCubit>(() => _i327.BlockAccountCubit(
          blockAccount: gh<_i588.BlockAccount>(),
          unBlockAccount: gh<_i588.UnBlockAccount>(),
        ));
    gh.factory<_i445.NearbyProfilesCubit>(
      () => _i445.NearbyProfilesCubit(
          getNearbyProfiles: gh<_i938.GetNearbyProfiles>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i60.TransactionCubit>(
      () => _i60.TransactionCubit(
          getAllTransactions: gh<_i251.GetAllTransactions>()),
      registerFor: {_prod},
    );
    gh.factory<_i808.TransactionsCubit>(
      () => _i808.TransactionsCubit(
          getAllTransactions: gh<_i251.GetAllTransactions>()),
      registerFor: {_prod},
    );
    gh.factory<_i1044.SponsoredBoostCubit>(
      () => _i1044.SponsoredBoostCubit(
          getProfileBoost: gh<_i896.GetProfileBoost>()),
      registerFor: {_prod},
    );
    gh.factoryParam<_i201.ProfileCreatedEventsCubit, String?, dynamic>(
      (
        userId,
        _,
      ) =>
          _i201.ProfileCreatedEventsCubit(
        getAllProfileCreatedEvents: gh<_i1030.GetAllCreatedEvents>(),
        userId: userId,
      ),
      registerFor: {_prod},
    );
    gh.factory<_i409.EventDetailsCubit>(
      () => _i409.EventDetailsCubit(
          getBuddyEventDetails: gh<_i1001.GetBuddyEventDetails>()),
      registerFor: {_prod},
    );
    gh.factory<_i956.BlockedUsersCubit>(
      () =>
          _i956.BlockedUsersCubit(getBlockedUsers: gh<_i588.GetBlockedUsers>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i741.WalletCubit>(
      () => _i741.WalletCubit(
        getWalletCounters: gh<_i815.GetWalletCounters>(),
        transferToUserWallet: gh<_i500.TransferToUserWallet>(),
      ),
      registerFor: {_prod},
    );
    gh.factory<_i121.PendingFriendsCubit>(
      () => _i121.PendingFriendsCubit(
          getPendingFriends: gh<_i292.GetPendingFriends>()),
      registerFor: {_prod},
    );
    gh.factory<_i276.AllFriendsCubit>(
      () => _i276.AllFriendsCubit(getAllFriends: gh<_i1070.GetAllFriends>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i582.GetInterests>(
      () => _i582.GetInterests(gh<_i809.IUserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i582.UpdateUserInterest>(
      () => _i582.UpdateUserInterest(gh<_i809.IUserInterestRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i860.SendEmailVerifyOtp>(
      () => _i860.SendEmailVerifyOtp(gh<_i126.IUserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i860.SendPhoneVerifyOtp>(
      () => _i860.SendPhoneVerifyOtp(gh<_i126.IUserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i860.SendPasswordResetOtp>(
      () => _i860.SendPasswordResetOtp(gh<_i126.IUserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i860.VerifyPhoneOtp>(
      () => _i860.VerifyPhoneOtp(gh<_i126.IUserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i860.VerifyEmailOtp>(
      () => _i860.VerifyEmailOtp(gh<_i126.IUserOtpRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i827.SearchBuddyEvent>(
      () => _i827.SearchBuddyEvent(gh<_i1029.IEventSearchRepository>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i790.FriendsCubit>(
      () => _i790.FriendsCubit(
        processFriendRequest: gh<_i956.ProcessFriendRequest>(),
        sendFriendRequest: gh<_i771.SendFriendRequest>(),
        sendBulkFriendRequest: gh<_i382.SendBulkFriendRequest>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i359.ProfileInterestCubit>(
      () => _i359.ProfileInterestCubit(
        getInterests: gh<_i582.GetInterests>(),
        updateUserInterest: gh<_i582.UpdateUserInterest>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i720.AuthenticationCubit>(
      () => _i720.AuthenticationCubit(
        registerUser: gh<_i643.RegisterUser>(),
        loginUser: gh<_i643.LoginUser>(),
        changePassword: gh<_i643.ChangePassword>(),
        resetPassword: gh<_i643.ResetPassword>(),
        sendPasswordResetOtp: gh<_i860.SendPasswordResetOtp>(),
        sendEmailVerifyOtp: gh<_i860.SendEmailVerifyOtp>(),
        sendPhoneVerifyOtp: gh<_i860.SendPhoneVerifyOtp>(),
        verifyPhoneOtp: gh<_i860.VerifyPhoneOtp>(),
        verifyEmailOtp: gh<_i860.VerifyEmailOtp>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i899.MatchesCubit>(
      () => _i899.MatchesCubit(
        getMatches: gh<_i650.GetMatches>(),
        populateMatches: gh<_i650.PopulateMatches>(),
        ignoreBulkMatches: gh<_i650.IgnoreBulkMatches>(),
        friendsCubit: gh<_i790.FriendsCubit>(),
      ),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i253.ProfileCreateCubit>(
      () => _i253.ProfileCreateCubit(
        createProfile: gh<_i739.CreateProfile>(),
        userProfileCarousels: gh<_i739.UpdateUserProfileCarousels>(),
        updateUserProfilePicture: gh<_i739.UpdateUserProfilePicture>(),
        profileInterestCubit: gh<_i359.ProfileInterestCubit>(),
      ),
      registerFor: {_prod},
    );
    gh.factory<_i136.SearchBuddyEventCubit>(
      () => _i136.SearchBuddyEventCubit(
          searchBuddyEvent: gh<_i827.SearchBuddyEvent>()),
      registerFor: {_prod},
    );
    gh.factory<_i233.EventVerificationCubit>(
      () => _i233.EventVerificationCubit(
          getVerification: gh<_i873.GetBuddyEventVerificationById>()),
      registerFor: {_prod},
    );
    gh.lazySingleton<_i970.AppCubit>(
      () => _i970.AppCubit(
        profileCubit: gh<_i315.ProfileCubit>(),
        matchesCubit: gh<_i899.MatchesCubit>(),
        eventVerificationCubit: gh<_i233.EventVerificationCubit>(),
        subscriptionCubit: gh<_i410.SubscriptionCubit>(),
      ),
      registerFor: {_prod},
    );
    return this;
  }
}

class _$StorageModule extends _i428.StorageModule {}

class _$ServiceModule extends _i428.ServiceModule {}
