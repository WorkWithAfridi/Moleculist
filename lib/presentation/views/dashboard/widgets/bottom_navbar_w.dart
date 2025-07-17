import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../common/resources/color/app_colors.dart';
import '../../../../common/resources/dimentions/app_sizes.dart';
import '../../../../common/utilities/logger.dart';
import '../../../blocs/dashboard_b/dashboard_bloc.dart';
import '../models/bottom_navbar_m.dart';

/// A widget that represents the bottom navigation bar for the dashboard.
class BottomNavbarW extends StatefulWidget {
  /// List of items to display in the bottom navigation bar.
  final List<BottomNavbarM> bottomNavbarItems;

  /// Constructor to initialize the bottom navigation bar with its items.
  const BottomNavbarW({super.key, required this.bottomNavbarItems});

  @override
  State<BottomNavbarW> createState() => _BottomNavbarWState();
}

class _BottomNavbarWState extends State<BottomNavbarW> {
  @override
  void initState() {
    super.initState();
  }

  /// Retrieves the instance of [DashboardBloc] from the context.
  DashboardBloc get dashboardBloc => context.read<DashboardBloc>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kBottomNavigationBarHeight + 20, // Adjusted height for the navbar.
      width: getWidth(context), // Adjust width based on the context.
      child: Row(
        // Dynamically generate navigation icons based on the items provided.
        children: [
          for (int i = 0; i < widget.bottomNavbarItems.length; i++)
            _BottomNavbarIcon(
              // Pass each item with its index to the icon widget.
              bottomNavbarItem: widget.bottomNavbarItems[i].copyWith(index: i),
            ),
        ],
      ),
    );
  }
}

/// A widget that represents an individual icon in the bottom navigation bar.
class _BottomNavbarIcon extends StatelessWidget {
  /// The data model representing the bottom navigation bar item.
  final BottomNavbarM bottomNavbarItem;

  /// Constructor to initialize the bottom navigation icon with its data.
  const _BottomNavbarIcon({required this.bottomNavbarItem});

  @override
  Widget build(BuildContext context) {
    // Retrieve the DashboardBloc instance.
    DashboardBloc dashboardBloc = context.read<DashboardBloc>();

    return Flexible(
      flex: 1, // Equal distribution of space for each icon.
      child: GestureDetector(
        onTap: () {
          // Log the tap event for the navbar item.
          logger.debug("Bottom navbar item pressed ${bottomNavbarItem.title}");

          // Trigger the optional callback if provided.
          if (bottomNavbarItem.optionalOnTap != null) {
            bottomNavbarItem.optionalOnTap!();
          }

          // Dispatch a page change event to the bloc.
          dashboardBloc.add(DashboardPageChangedEvent(pageIndex: bottomNavbarItem.index ?? 0));
        },
        child: BlocBuilder<DashboardBloc, DashboardState>(
          // Rebuild the UI when the selected page index changes.
          builder: (context, state) {
            bool isSelected = state.selectedPageIndex == bottomNavbarItem.index;

            return AnimatedContainer(
              duration: const Duration(milliseconds: 200), // Smooth animation for transitions.
              color: Colors.white, // Background color for the container.
              padding: const EdgeInsets.only(bottom: 10),
              width: double.maxFinite,
              child: FadeIn(
                // Fade-in animation for the icon and text.
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: isSelected ? 0 : 1),
                      child: Container(
                        height: isSelected ? 1.5 : 0.5, // Highlight thickness for the selected state.
                        width: double.maxFinite,
                        color: isSelected
                            ? AppColors()
                                  .pastelViolet // Primary color for selected state.
                            : Colors.black.withOpacity(0.2), // Faint color for non-selected state.
                      ),
                    ),
                    const Gap(10), // Space between the highlight and the icon.
                    HugeIcon(
                      icon: bottomNavbarItem.iconFilled == null
                          ? bottomNavbarItem.icon
                          : isSelected
                          ? bottomNavbarItem.iconFilled!
                          : bottomNavbarItem.icon, // Use the filled icon for the selected state.
                      color: isSelected
                          ? AppColors()
                                .pastelViolet // Icon color for the selected state.
                          : Colors.black.withOpacity(0.35), // Icon color for non-selected state.
                      size: 21, // Icon size.
                    ),
                    const SizedBox(height: 4), // Space between the icon and the label.
                    Text(
                      bottomNavbarItem.title, // Display the title of the navbar item.
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        fontWeight: FontWeight.w500, // Medium font weight.
                        fontSize: 11, // Small font size for the label.
                        color: isSelected
                            ? AppColors()
                                  .pastelViolet // Text color for selected state.
                            : Colors.black.withOpacity(0.35), // Text color for non-selected state.
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
