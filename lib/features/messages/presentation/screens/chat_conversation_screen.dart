import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/core/utils/token_utils.dart';
import 'package:zheeta/features/messages/data/models/chat_recipients_model.dart';
import 'package:zheeta/features/messages/domain/usecases/delete_chat.dart';
import 'package:zheeta/features/messages/presentation/cubits/chat_delete_cubit/chat_delete_cubit.dart';
import 'package:zheeta/features/messages/presentation/cubits/chat_recipients_cubit/chat_recipients_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/search_field.dart';
import 'package:zheeta/router/app_router.gr.dart';

@RoutePage()
class ChatConversationScreen extends StatefulWidget {
  const ChatConversationScreen({super.key});

  @override
  State<ChatConversationScreen> createState() => _ChatConversationScreenState();
}

class _ChatConversationScreenState extends State<ChatConversationScreen> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;
  List<Recipient> filteredRecipients = [];
  List<Recipient> allRecipients = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), _filterRecipients);
  }

  void _filterRecipients() {
    final query = _searchController.text.toLowerCase();

    setState(() {
      if (query.isEmpty) {
        filteredRecipients = allRecipients;
      } else {
        filteredRecipients = allRecipients
            .where((recipient) =>
                recipient.userProfile.firstName.toLowerCase().contains(query) ||
                recipient.userProfile.lastName.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: Column(
        children: [
          SearchField(
            searchController: _searchController,
            containerColor: AppColors.white,
            iconColor: AppColors.black,
            textColor: Colors.blueGrey,
          ),
          Expanded(
            child: BlocBuilder<ChatRecipientsCubit, PaginationState<Recipient>>(
              builder: (context, state) {
                if (state.isLoading && state.items.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.error != null) {
                  return Center(child: Text('Error: ${state.error}'));
                }

                if (allRecipients.isEmpty && state.items.isNotEmpty) {
                  // keep a copy of all recipients for filtering
                  allRecipients = state.items;
                  filteredRecipients = state.items;
                }

                if (filteredRecipients.isEmpty) {
                  return const Center(
                    child: Text(
                      'No chat recipients found.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryDark,
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  itemCount: filteredRecipients.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    final recipient = filteredRecipients[index];
                    final profile = recipient.userProfile;

                    return Dismissible(
                      key: ValueKey(recipient.userProfile.id),
                      // ensure unique ID from your data model
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        padding: const EdgeInsets.only(right: 20),
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      onDismissed: (_) async {
                        final userId = await TokenUtil.getUserId();

                        if (!context.mounted) return;
                        // Call deleteChatHistory from cubit
                        context.read<ChatDeleteCubit>().deleteChatHistory(
                              ChatParam(
                                  recipientId: recipient.userProfile.id,
                                  senderId: userId ?? ''),
                            );

                        // Optionally remove immediately for UI smoothness
                        setState(() {
                          filteredRecipients.removeAt(index);
                          allRecipients.removeWhere((r) =>
                              r.userProfile.id == recipient.userProfile.id);
                        });
                      },
                      child: ListTile(
                        leading: Stack(
                          children: [
                            CircleAvatar(
                              radius: 28,
                              backgroundImage:
                                  NetworkImage(profile.profilePhotoURL),
                            ),
                            if (profile.isOnline)
                              Positioned(
                                top: 0,
                                right: 1,
                                child: CircleAvatar(
                                  radius: 6,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 4,
                                    backgroundColor: AppColors.primaryDark,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        title: Text(
                          '${profile.firstName} ${profile.lastName}',
                          style: const TextStyle(
                            color: AppColors.grayscale,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                          softWrap: false,
                        ),
                        subtitle: Text(
                          recipient.lastUnreadMessage,
                          style: const TextStyle(
                            color: AppColors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              timeago.format(
                                locale: 'en_short',
                                recipient.lastUnreadMessageTime,
                              ),
                              style: const TextStyle(
                                color: AppColors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            if (recipient.unreadMessageCount > 0)
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.primaryDark,
                                ),
                                child: Text(
                                  recipient.unreadMessageCount.toString(),
                                  style: const TextStyle(
                                    color: AppColors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                          ],
                        ),
                        onTap: () {
                          context.router.push(
                            ChatMessagesRoute(recipient: recipient),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
