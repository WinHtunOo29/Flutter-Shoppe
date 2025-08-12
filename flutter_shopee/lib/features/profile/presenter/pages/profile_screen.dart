import 'package:flutter/material.dart';
import 'package:flutter_shopee/theme/dimensions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  final List<String> recentlyViewedList = [
    'assets/images/avatar_1.png',
    'assets/images/avatar_2.png',
    'assets/images/avatar_3.png',
    'assets/images/avatar_4.png',
    'assets/images/avatar_5.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            title: _buildProfileAvatarAndButton(context),
            actions: [
              _buildScanButton(context),
              _buildFilterButton(context),
              _buildSettingButton(context),
            ],
          ),
          SliverToBoxAdapter(
            child: _buildBody(context),
          )
        ],
      ),
    );
  }

  Widget _buildProfileAvatarAndButton(BuildContext context) {
    return Row(
      children: [
        _buildProfileAvatar(),
        SizedBox(width: kPaddingSmall),
        _buildMyActivityButton(context),
      ],
    );
  }

  Widget _buildProfileAvatar() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/avatar_user.png'),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all( Radius.circular(50.0)),
        border: Border.all(
          color: Colors.white,
          width: 4.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }

  Widget _buildMyActivityButton(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 35),
          backgroundColor: Theme.of(context).colorScheme.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: FittedBox(
          fit: BoxFit.fitWidth,
          child: Text(
            'My Activity',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,       
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScanButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kPaddingMedium),
      child: Ink(
        width: 40,
        height: 40,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1), 
          shape: CircleBorder()
        ),
        child: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/images/button_scan.png'),
        ),
      ),
    );
  }

  Widget _buildFilterButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kPaddingMedium),
      child: Stack(
        children: [
          Ink(
            width: 40,
            height: 40,
            decoration: ShapeDecoration(
              color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1), 
              shape: CircleBorder()
            ),
            child: IconButton(
              onPressed: () {},
              icon: Image.asset('assets/images/button_filter.png'),
            ),
          ),
          Positioned(
            right: 4,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: kPaddingMedium),
      child: Ink(
        width: 40,
        height: 40,
        decoration: ShapeDecoration(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1), 
          shape: CircleBorder()
        ),
        child: IconButton(
          onPressed: () {},
          icon: Image.asset('assets/images/button_setting.png'),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kPaddingLarge, horizontal: kPaddingMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildIntro(context),
          SizedBox(height: kPaddingSmall),
          _buildAnnouncementCard(context),
          SizedBox(height: kPaddingMedium),
          _buildRecentlyViewedTitle(context),
          SizedBox(height: kPaddingSmall),
          _buildRecentlyViewedUsers(),
          SizedBox(height: kPaddingXLarge),
          _buildMyOrdersTitle(context),
          SizedBox(height: kPaddingMedium),
          _buildMyOrdersButtons(context),
          SizedBox(height: kPaddingXLarge),
          _buildStoriesTitle(context),
          SizedBox(height: kPaddingMedium),
          _buildStories(),
        ],
      ),
    );
  }

  Widget _buildIntro(BuildContext context) {
    return Text(
      'Hello, Romina!',
      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildAnnouncementCard(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kWidgetBorderRadius),
        color: Theme.of(context).colorScheme.surfaceContainer,
      ),
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.all(kPaddingMedium),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Announcement',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ]
              ),
            ),
            SizedBox(width: kPaddingLarge),
            SizedBox(
              width: 30,
              height: 30,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  padding: EdgeInsets.zero,
                ),
                child: Icon(
                  Icons.arrow_forward, 
                  color: Colors.white, 
                  size: 20
                ),
              ),
            ),
          ],
        )
      )
    );
  }

  Widget _buildRecentlyViewedTitle(BuildContext context) {
    return Text(
      'Recently Viewed',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildRecentlyViewedUsers() {
    return Row(
      children: [
        ...recentlyViewedList.asMap().entries.expand((entry) {
          final index = entry.key;
          final item = entry.value;
          return [
            Expanded(
              child: AspectRatio(
                aspectRatio: 1.0,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(item),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all( Radius.circular(50.0)),
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        blurRadius: 8.0,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (index < recentlyViewedList.length - 1)
              SizedBox(width: kPaddingSmall),
          ];
        })
      ]
    );
  }

  Widget _buildMyOrdersTitle(BuildContext context) {
    return Text(
      'My Orders',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildMyOrdersButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildToPayButton(context),
        SizedBox(width: kPaddingSmall),
        Expanded(child: _buildToReceiveButton(context)),
        SizedBox(width: kPaddingSmall),
        Expanded(child: _buildToReviewButton(context)) 
      ],
    );
  }

  Widget _buildToPayButton(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kWidgetBorderRadius),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingMedium, vertical: kPaddingSmall),
        child: Text(
          'To Pay',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildToReceiveButton(BuildContext context) {
    return Stack(
      children: [
        Ink(
          width: double.infinity,
          decoration: ShapeDecoration(
            color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2), 
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kWidgetBorderRadius),
            )
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kPaddingMedium, vertical: kPaddingSmall),
            child: Text(
              'To Receive',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              color: Colors.green,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToReviewButton(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.2), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kWidgetBorderRadius),
        )
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kPaddingMedium, vertical: kPaddingSmall),
        child: Text(
          'To Review',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildStoriesTitle(BuildContext context) {
    return Text(
      'Stories',
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w600,
      ),  
    );
  }

  Widget _buildStories() {
    return SizedBox(
      height: 175,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
          itemBuilder: (context, index) {
            return SizedBox(
              width: 104,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kWidgetBorderRadius),
                child: Image.asset(
                  'assets/images/story_${index + 1}.png',
                  fit: BoxFit.cover,
                ),
              ),
            );
          },
      ),
    );
  }
}