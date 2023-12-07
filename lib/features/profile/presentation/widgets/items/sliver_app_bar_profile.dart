import 'package:flutter/material.dart';
import 'package:kermani/config/theme/styles/app_size.dart';
import 'package:kermani/core/utils/context_extension.dart';
import 'package:kermani/generated/l10n.dart';

class SliverAppBarProfile extends StatelessWidget {
  const SliverAppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      stretch: true,
      expandedHeight: 30,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: Text(
          S.of(context).profile,
          style: context.style.copyWith(color: Colors.white, fontSize: xxLargeSize, fontWeight: FontWeight.bold),
        ),
        stretchModes: const [StretchMode.zoomBackground],
      ),
    );
  }
}
