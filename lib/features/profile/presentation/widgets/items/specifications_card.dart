import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kermani/config/theme/styles/app_size.dart';
import 'package:kermani/core/constants/container_x.dart';
import 'package:kermani/core/utils/context_extension.dart';
import 'package:kermani/generated/l10n.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

/// This file contains the [SpecificationsCard] widget, which is a card that displays specifications information.
/// It also includes the [EditButton], [SpecificationsCardItems], and [PhoneCardIcon] widgets used within the [SpecificationsCard].
///
/// The [SpecificationsCard] widget is a stateless widget that takes no parameters.
/// It builds a [SizedBox] with a specified height and a [Stack] as its child.
/// The [Stack] contains a [ContainerX] widget and a [PhoneCardIcon] widget positioned at the top.
/// The [ContainerX] widget represents the main content of the card and contains a [Column] with multiple [SpecificationsCardItems] widgets separated by [Divider] widgets.
/// The [EditButton] widget is also included at the bottom of the [Column].
///
/// The [EditButton] widget is a stateless widget that takes no parameters.
/// It builds a [Row] with an [ElevatedButton] as its child.
/// The [ElevatedButton] is styled with a specific background color and foreground color.
///
/// The [SpecificationsCardItems] widget is a stateless widget that takes two required parameters: [title] and [item].
/// It builds a [Row] with two [Text] widgets, one for the [title] and one for the [item].
///
/// The [PhoneCardIcon] widget is a stateless widget that takes no parameters.
/// It builds a [ContainerX] widget with a circular shape and a [ContainerX] child.
/// The child [ContainerX] has a circular shape and contains an [Icon] widget representing a phone icon.
///
/// This file is located at /E:/kermani/lib/features/profile/presentation/widgets/items/specifications_card.dart.
class SpecificationsCard extends StatelessWidget {
  final String? callNumber;
  final String? mobileNumber;
  final String? whatsAppNumber;
  final String? skypeId;
  const SpecificationsCard({
    super.key,
    this.callNumber,
    this.mobileNumber,
    this.whatsAppNumber,
    this.skypeId,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.33,
      child: Stack(
        children: [
          Positioned(
            top: context.height * .04,
            left: 0,
            right: 0,
            child: ContainerX(
              height: context.height * .4,
              width: context.width,
              radius: const [25],
              alignment: Alignment.center,
              shape: BoxShape.rectangle,
              color: Colors.white,
              padding: [padding12, 0],
              child: Column(
                children: [
                  Gap(padding16),
                  SpecificationsCardItems(
                    title: S.of(context).phoneNumber,
                    item: mobileNumber ?? S.of(context).notRegistered,
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.5),
                    thickness: 1,
                  ),
                  SpecificationsCardItems(
                    title: S.of(context).phoneNumberTwo,
                    item: callNumber ?? S.of(context).notRegistered,
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.5),
                    thickness: 1,
                  ),
                  SpecificationsCardItems(
                    title: S.of(context).phoneWhatsApp,
                    item: whatsAppNumber ?? S.of(context).notRegistered,
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.5),
                    thickness: 1,
                  ),
                  SpecificationsCardItems(
                    title: S.of(context).idSkype,
                    item: skypeId ?? S.of(context).notRegistered,
                  ),
                  Divider(
                    color: Colors.grey.withOpacity(.5),
                    thickness: 1,
                  ),
                  const EditButton(),
                ],
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: PhoneCardIcon(),
          ),
        ],
      ),
    );
  }
}

class EditButton extends StatelessWidget {
  const EditButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffE5ECE2),
              foregroundColor: const Color(0xffE5ECE2),
            ),
            onPressed: () {},
            child: Text(
              S.of(context).buttonEdit,
              style: context.style.copyWith(color: Colors.red, fontSize: largeSize, fontWeight: FontWeight.bold),
            )),
      ],
    );
  }
}

class SpecificationsCardItems extends StatelessWidget {
  final String title;
  final String item;
  const SpecificationsCardItems({
    super.key,
    required this.title,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.style.copyWith(
            fontSize: largeSize,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          item.toPersianDigit(),
          style: context.style.copyWith(
            fontSize: largeSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class PhoneCardIcon extends StatelessWidget {
  const PhoneCardIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerX(
      alignment: Alignment.center,
      shape: BoxShape.circle,
      color: Colors.white,
      padding: [padding6],
      child: ContainerX(
        alignment: Alignment.center,
        shape: BoxShape.circle,
        color: Colors.grey.withOpacity(.2),
        padding: [padding6],
        child: Icon(
          Icons.phone,
          color: Colors.grey,
          size: icon32,
        ),
      ),
    );
  }
}
