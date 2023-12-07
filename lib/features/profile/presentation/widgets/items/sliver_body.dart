import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:kermani/config/theme/styles/app_size.dart';
import 'package:kermani/core/constants/container_x.dart';
import 'package:kermani/core/utils/context_extension.dart';
import 'package:kermani/features/profile/presentation/widgets/items/specifications_card.dart';
import 'package:kermani/generated/l10n.dart';

class SliverBody extends StatelessWidget {
  final String? callNumber;
  final String? mobileNumber;
  final String? whatsAppNumber;
  final String? skypeId;
  const SliverBody({
    super.key,
    this.callNumber,
    this.mobileNumber,
    this.whatsAppNumber,
    this.skypeId,
  });

  @override
  Widget build(BuildContext context) {
    /// Builds a sliver body widget for the profile feature.
    ///
    /// This widget represents the main content of the profile screen.
    /// It includes a container with rounded corners, containing various UI elements such as payment information,
    /// buttons for making payments, viewing payment history, and a specifications card.
    ///
    /// The [SliverToBoxAdapter] widget is used to convert the container into a sliver that can be used in a [CustomScrollView].
    /// The [ContainerX] widget is a custom widget that provides additional styling options for the container.
    /// The [Padding] widget is used to add padding around the column of UI elements.
    /// The [Column] widget is used to arrange the UI elements vertically.
    /// The [Row] widget is used to arrange the payment message and payment button horizontally.
    /// The [Icon] widget is used to display the payment icon.
    /// The [Text] widget is used to display the payment message and button text.
    /// The [ElevatedButton] widget is used to create the payment button and history button.
    /// The [ElevatedButton.icon] widget is used to create the history button with an icon.
    /// The [SpecificationsCard] widget is a custom widget that displays specifications related to the profile.
    ///
    /// Example usage:
    ///
    /// ```dart
    /// return SliverToBoxAdapter(
    ///   child: ContainerX(
    ///     radius: const [35, 0, 0, 35],
    ///     height: context.height * .9,
    ///     color: const Color(0xffF5F5F5),
    ///     child: Padding(
    ///       padding: EdgeInsets.symmetric(horizontal: padding16),
    ///       child: Column(
    ///         children: [
    ///           // UI elements here
    ///         ],
    ///       ),
    ///     ),
    ///   ),
    /// );
    /// ```
    return SliverToBoxAdapter(
      child: ContainerX(
        radius: const [35, 0, 0, 35],
        height: context.height * .9,
        color: const Color(0xffF5F5F5),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding16),
          child: Column(
            children: [
              Column(
                children: [
                  Gap(padding36),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.payment,
                            color: Colors.black,
                            size: icon36,
                          ),
                          Gap(padding8),
                          Text(
                            S.of(context).payMessage,
                            style: context.style.copyWith(
                              fontSize: mediumSize,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          S.of(context).buttonPay,
                          style: context.style.copyWith(
                            color: Colors.white,
                            fontSize: largeSize,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gap(padding36),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.white,
                  fixedSize: Size(context.width, 50),
                ),
                onPressed: () {},
                label: Text(
                  S.of(context).historyPay,
                  style: context.style.copyWith(
                    color: Colors.grey,
                    fontSize: mediumSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                icon: Icon(
                  Icons.history,
                  color: Colors.red,
                  size: icon24,
                ),
              ),
              Gap(padding24),
              SpecificationsCard(
                mobileNumber: mobileNumber,
                callNumber: callNumber,
                whatsAppNumber: whatsAppNumber,
                skypeId: skypeId,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
