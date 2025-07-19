import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:moleculist/presentation/blocs/compound_c/cubit/compound_cubit.dart';
import 'package:moleculist/presentation/blocs/favorite_c/favorite_cubit.dart';
import 'package:moleculist/presentation/views/compunds/views/compund_list_v.dart';
import 'package:moleculist/presentation/views/dashboard/models/bottom_navbar_m.dart';
import 'package:moleculist/presentation/views/dashboard/widgets/bottom_navbar_w.dart';
import 'package:moleculist/presentation/views/favorite/views/favorite_v.dart';
import 'package:moleculist/presentation/views/search/search_v.dart';

import '../../../common/resources/dimentions/app_sizes.dart';
import '../../../common/services/feature_flagger/feature_flagger_s.dart';
import '../../../common/utilities/logger.dart';
import '../../blocs/dashboard_b/dashboard_bloc.dart';
import '../socials/views/socials_v.dart';
import 'models/dashboard_page_m.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => DashboardViewState();
}

class DashboardViewState extends State<DashboardView> {
  List<DashboardPageM> dashboardPages = [];

  @override
  void initState() {
    super.initState();
    setupDashboardPages();
    loadData();
  }

  void setupDashboardPages() {
    dashboardPages = [
      DashboardPageM(
        isActive: true,
        pageId: AppFeatures.compoundListFeature,
        page: CompundListView(),
        bottomNavbar: BottomNavbarM(title: "Compounds", icon: HugeIcons.strokeRoundedChemistry01),
      ),
      DashboardPageM(
        isActive: true,
        pageId: AppFeatures.searchFeature,
        page: SearchView(),
        bottomNavbar: BottomNavbarM(title: "Search", icon: Icons.search),
      ),
      DashboardPageM(
        isActive: true,
        pageId: AppFeatures.favoriteFeature,
        page: FavoriteView(),
        bottomNavbar: BottomNavbarM(title: "Favorites", icon: HugeIcons.strokeRoundedListView),
      ),
      DashboardPageM(
        isActive: true,
        pageId: AppFeatures.socialsFeature,
        page: SocialsView(),
        bottomNavbar: BottomNavbarM(title: "Socials", icon: HugeIcons.strokeRoundedAstronaut01),
      ),
    ];
    for (var element in dashboardPages) {
      element.isActive = FeatureFlaggerService().isFeatureEnabled(element.pageId);
    }
  }

  void loadData() {
    compoundCubit.loadCompoundList();
    favoriteCubitInstance.loadFavorites();
  }

  DashboardBloc get dashboardBloc => context.read<DashboardBloc>();
  CompoundCubit get compoundCubit => context.read<CompoundCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavbarW(bottomNavbarItems: dashboardPages.where((e) => e.isActive).toList().map((e) => e.bottomNavbar).toList()),
      body: SizedBox(
        height: getHeight(context),
        width: getWidth(context),
        child: PageView.builder(
          controller: dashboardBloc.state.pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dashboardPages.where((e) => e.isActive).toList().length,
          itemBuilder: (context, index) {
            return dashboardPages.where((e) => e.isActive).toList()[index].page;
          },
          onPageChanged: (value) {
            logger.debug("Dashboard page changed to $value");
          },
        ),
      ),
    );
  }
}
