import 'package:flutter/material.dart';
import 'package:flutter_shopee/theme/dimensions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            title: Padding(
              padding: const EdgeInsets.only(left: kPaddingMedium),
              child: _buildProfileAvatarAndButton(context),
            ),
            actions: [
              _buildScanButton(context),
              _buildFilterButton(context),
              _buildSettingButton(context),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Text('Hello'),
              ],
            ),
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
        Expanded(
          child: _buildMyActivityButton(context)
        ),
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
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 35),
        backgroundColor: Theme.of(context).colorScheme.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        'My Activity',
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Colors.white,
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
}