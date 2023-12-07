import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kermani/core/constants/container_x.dart';
import 'package:kermani/core/data/model/view_model_state.dart';
import 'package:kermani/core/utils/context_extension.dart';
import 'package:kermani/features/profile/presentation/bloc/remote/profile_list_bloc.dart';
import 'package:kermani/features/profile/presentation/widgets/items/sliver_app_bar_profile.dart';
import 'package:kermani/features/profile/presentation/widgets/items/sliver_body.dart';
import 'package:kermani/features/profile/presentation/widgets/items/sliver_profile_bar.dart';
import 'package:kermani/generated/l10n.dart';

/// This is the [ProfileScreen] widget that represents the profile screen in the application.
/// It is a stateful widget that manages the selected index for the bottom navigation bar.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

/// This is the private state class for the [ProfileScreen] widget.
/// It manages the selected index for the bottom navigation bar.
class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = 4;

  @override
  Widget build(BuildContext context) {
    /// Builds the profile screen widget.
    ///
    /// This widget is responsible for displaying the profile screen, including the profile information,
    /// contact details, and a loading indicator when the data is being fetched.
    ///
    /// The profile screen is wrapped in a [BlocProvider] to provide the [ProfileListCubit] to its descendants.
    /// The [ProfileListCubit] is responsible for fetching the profile data.
    ///
    /// The widget hierarchy is as follows:
    /// - [SafeArea]
    ///   - [Scaffold]
    ///     - [bottomNavigationBar]
    ///     - [BlocBuilder]
    ///       - [CustomScrollView]
    ///         - [SliverAppBarProfile]
    ///         - [SliverProfileBar]
    ///         - [SliverBody]
    ///     - [ContainerX] (when data is loading)
    ///       - [Center]
    ///         - [CircularProgressIndicator]
    ///
    /// Example usage:
    /// ```dart
    /// return BlocProvider<ProfileListCubit>(
    ///   create: (context) => ProfileListCubit()..getProfileList(),
    ///   child: Builder(builder: (context) {
    ///     return ProfileScreen();
    ///   }),
    /// );
    /// ```
    return BlocProvider<ProfileListCubit>(
      create: (context) => ProfileListCubit()..getProfileList(),
      child: Builder(builder: (context) {
        return SafeArea(
          child: Scaffold(
            bottomNavigationBar: bottomNavigationBar(context),
            body: BlocBuilder<ProfileListCubit, ProfileListState>(
              buildWhen: (previous, current) {
                return previous.dataState != current.dataState;
              },
              builder: (context, state) {
                if (state.dataState == ViewModelState.loaded) {
                  return CustomScrollView(
                    slivers: [
                      const SliverAppBarProfile(),
                      SliverProfileBar(
                        profileName: state.data.firstName ?? '',
                        profileLastName: state.data.lastName ?? '',
                      ),
                      SliverBody(
                        callNumber: state.data.callNumber,
                        mobileNumber: state.data.mobile,
                        whatsAppNumber: state.data.socialMedia
                            ?.firstWhere((element) => element.name == 'WHATS_APP')
                            .pivot!
                            .userId
                            .toString(),
                        skypeId: state.data.socialMedia
                            ?.firstWhere((element) => element.name == 'SKYPE')
                            .pivot!
                            .userId
                            .toString(),
                      ),
                    ],
                  );
                } else {
                  return ContainerX(
                    color: Colors.white,
                    height: context.height,
                    width: context.width,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          ),
        );
      }),
    );
  }

  /// Returns the [BottomNavigationBar] widget with the specified configuration.
  BottomNavigationBar bottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      type: BottomNavigationBarType.fixed,
      elevation: 1.5,
      selectedItemColor: Colors.red,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      onTap: (value) => setState(() {
        selectedIndex = value;
      }),
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
      selectedIconTheme: const IconThemeData(size: 30, color: Colors.red),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.stairs_outlined),
          label: S.of(context).state,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.store_outlined),
          label: S.of(context).learning,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.food_bank_outlined),
          label: S.of(context).daiet,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.support_agent_rounded),
          label: S.of(context).support,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.person),
          label: S.of(context).profile,
        ),
      ],
    );
  }
}
