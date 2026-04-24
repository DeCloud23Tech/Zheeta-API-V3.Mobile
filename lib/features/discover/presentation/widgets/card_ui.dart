import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/features/discover/data/models/match_model.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/gender_age.dart';
import 'package:zheeta/shared/widgets/gender_indicator.dart';
import 'package:zheeta/shared/widgets/network_image.dart';

class ExampleCard extends StatefulWidget {
  final MatchModel match;
  final AppinioSwiperController controller;
  final bool isActiveCard;
  final double swipeDx;
  final double swipeProgress;

  const ExampleCard({
    super.key,
    required this.controller,
    required this.match,
    this.isActiveCard = false,
    this.swipeDx = 0,
    this.swipeProgress = 0,
  });

  @override
  State<ExampleCard> createState() => _ExampleCardState();
}

class _ExampleCardState extends State<ExampleCard> {
  _SwipeDirection? _tapSwipeDirection;

  Future<void> _triggerButtonSwipe(_SwipeDirection direction) async {
    if (_tapSwipeDirection != null) return;

    setState(() {
      _tapSwipeDirection = direction;
    });

    await Future<void>.delayed(const Duration(milliseconds: 170));

    if (!mounted) return;

    switch (direction) {
      case _SwipeDirection.left:
        await widget.controller.swipeLeft();
        break;
      case _SwipeDirection.right:
        await widget.controller.swipeRight();
        break;
    }

    if (!mounted) return;
    setState(() {
      _tapSwipeDirection = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.isActiveCard) {
      return _DiscoverStackCard(match: widget.match);
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxHeight;
        final detailsHeight = 112.0;
        final imageHeight = cardHeight - detailsHeight;
        final effectiveSwipeDx = _tapSwipeDirection == _SwipeDirection.right
            ? 1.0
            : _tapSwipeDirection == _SwipeDirection.left
                ? -1.0
                : widget.swipeDx;
        final effectiveSwipeProgress =
            _tapSwipeDirection != null ? 1.0 : widget.swipeProgress;
        final showRightSwipe =
            effectiveSwipeDx > 0 && effectiveSwipeProgress > 0;
        final showLeftSwipe =
            effectiveSwipeDx < 0 && effectiveSwipeProgress > 0;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: CupertinoColors.white,
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.systemGrey.withValues(alpha: 0.18),
                spreadRadius: 2,
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: CustomNetworkImage(
                          height: imageHeight,
                          width: double.infinity,
                          imageUrl: widget.match.profilePhotoURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 24,
                        left: 20,
                        child: _SwipeBadge(
                          asset: 'assets/images/icons/close.svg',
                          tintColor: const Color(0xFFBFC1CF),
                          isVisible: showLeftSwipe,
                          alignment: Alignment.centerLeft,
                          progress: effectiveSwipeProgress,
                        ),
                      ),
                      Positioned(
                        top: 24,
                        right: 20,
                        child: _SwipeBadge(
                          asset: 'assets/images/icons/heart.svg',
                          tintColor: AppColors.primaryDark,
                          isVisible: showRightSwipe,
                          alignment: Alignment.centerRight,
                          progress: effectiveSwipeProgress,
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () => router
                        .push(ProfileViewRoute(profileId: widget.match.id)),
                    child: Container(
                      height: detailsHeight,
                      width: double.infinity,
                      padding: const EdgeInsets.fromLTRB(16, 42, 16, 14),
                      decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/icons/user.svg',
                                width: 18,
                                colorFilter: const ColorFilter.mode(
                                  AppColors.primaryDark,
                                  BlendMode.srcIn,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Flexible(
                                child: Text(
                                  '@${widget.match.username.toLowerCase()}',
                                  style: const TextStyle(
                                    color: AppColors.darkText,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(width: 8),
                              GenderAgeWidget(
                                gender: widget.match.gender
                                    .toString()
                                    .getFirstLetter,
                                age: widget.match.age,
                              ),
                              const SizedBox(width: 6),
                              GenderIndicator(
                                gender: widget.match.gender
                                    .toString()
                                    .getFirstLetter,
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${widget.match.location} (${widget.match.distance.toString().roundToInt}km away)',
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: detailsHeight - 34,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(
                      asset: 'assets/images/icons/close.svg',
                      onPressed: () =>
                          _triggerButtonSwipe(_SwipeDirection.left),
                    ),
                    const SizedBox(width: 18),
                    _buildActionButton(
                      asset: 'assets/images/icons/favorite.svg',
                      onPressed: widget.controller.swipeUp,
                    ),
                    const SizedBox(width: 18),
                    _buildActionButton(
                      asset: 'assets/images/icons/heart.svg',
                      onPressed: () =>
                          _triggerButtonSwipe(_SwipeDirection.right),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildActionButton({
    required String asset,
    required VoidCallback onPressed,
  }) {
    return SizedBox(
      height: 70,
      width: 70,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          overlayColor: WidgetStateProperty.all<Color>(AppColors.white),
          shadowColor: WidgetStateProperty.all<Color>(
              AppColors.black.withValues(alpha: 0.28)),
          elevation: WidgetStateProperty.all(8),
          backgroundColor: WidgetStateProperty.all<Color>(AppColors.white),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        child: Transform.scale(
          scale: 1.7,
          child: SvgPicture.asset(asset),
        ),
      ),
    );
  }
}

enum _SwipeDirection { left, right }

class _DiscoverStackCard extends StatelessWidget {
  final MatchModel match;

  const _DiscoverStackCard({required this.match});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final cardHeight = constraints.maxHeight;
        final detailsHeight = 112.0;
        final imageHeight = cardHeight - detailsHeight;

        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: CupertinoColors.white,
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.systemGrey.withValues(alpha: 0.18),
                spreadRadius: 2,
                blurRadius: 14,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            children: [
              CustomNetworkImage(
                height: imageHeight,
                width: double.infinity,
                imageUrl: match.profilePhotoURL,
                fit: BoxFit.cover,
              ),
              Container(
                height: detailsHeight,
                width: double.infinity,
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
                color: AppColors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/images/icons/user.svg',
                          width: 18,
                          colorFilter: const ColorFilter.mode(
                            AppColors.primaryDark,
                            BlendMode.srcIn,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            '@${match.username.toLowerCase()}',
                            style: const TextStyle(
                              color: AppColors.darkText,
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 8),
                        GenderAgeWidget(
                          gender: match.gender.toString().getFirstLetter,
                          age: match.age,
                        ),
                        const SizedBox(width: 6),
                        GenderIndicator(
                          gender: match.gender.toString().getFirstLetter,
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${match.location} (${match.distance.toString().roundToInt}km away)',
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SwipeBadge extends StatelessWidget {
  final String asset;
  final Color tintColor;
  final bool isVisible;
  final Alignment alignment;
  final double progress;

  const _SwipeBadge({
    required this.asset,
    required this.tintColor,
    required this.isVisible,
    required this.alignment,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    final normalizedProgress = progress.clamp(0.0, 1.0);

    return IgnorePointer(
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 80),
        opacity: isVisible ? (0.35 + (normalizedProgress * 0.65)) : 0,
        child: Transform.scale(
          scale: 0.82 + (normalizedProgress * 0.32),
          child: Container(
            height: 74,
            width: 74,
            decoration: BoxDecoration(
              color: AppColors.white.withValues(alpha: 0.92),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.12),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            alignment: alignment,
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: SvgPicture.asset(
                asset,
                colorFilter: ColorFilter.mode(
                  tintColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
