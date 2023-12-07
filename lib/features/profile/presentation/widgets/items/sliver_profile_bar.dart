import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:kermani/config/theme/styles/app_images.dart';
import 'package:kermani/config/theme/styles/app_size.dart';
import 'package:kermani/core/constants/container_x.dart';
import 'package:kermani/core/utils/context_extension.dart';

class SliverProfileBar extends StatelessWidget {
  final String profileName;
  final String profileLastName;
  const SliverProfileBar({super.key, required this.profileName, required this.profileLastName});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      pinned: true,
      bottom: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SizedBox(),
      ),
      // shape:  const RoundedRectangleBorder(
      //   borderRadius: BorderRadius.vertical(
      //     bottom: Radius.circular(30),
      //   ),
      // ),
      flexibleSpace: ProfileItems(
        profileName: profileName,
        profileLastName: profileLastName,
      ),
    );
  }
}

class ProfileItems extends StatelessWidget {
  final String profileName;
  final String profileLastName;
  const ProfileItems({
    super.key,
    required this.profileName,
    required this.profileLastName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            ContainerX(
              radius: const [20],
              height: context.height * .1,
              width: context.width * .2,
              shadowColor: Colors.white,
              blurRadius: 10,
              shadowOffset: const Offset(0, 0),
              alignment: Alignment.center,
              padding: const [15],
              child: AppImages.maleAvatar(),
            ),
            Gap(padding10),
            RichText(
              text: TextSpan(
                  text: profileName,
                  style: context.style.copyWith(color: Colors.white, fontSize: largeSize),
                  children: [
                    TextSpan(
                      text: ' $profileLastName',
                      style: context.style.copyWith(color: Colors.white, fontSize: largeSize),
                    ),
                  ]),
            ),
          ],
        ),
        ContainerX(
          radius: const [7],
          color: Colors.white.withOpacity(.4),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),
        )
      ]),
    );
  }
}
