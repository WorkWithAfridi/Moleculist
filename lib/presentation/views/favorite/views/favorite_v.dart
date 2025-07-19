import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moleculist/common/resources/color/app_colors.dart';
import 'package:moleculist/common/utilities/extensions/on_build_context.dart';
import 'package:moleculist/presentation/views/global/widgets/custom_loader.dart';
import 'package:moleculist/presentation/views/global/widgets/search_compund_w.dart';

import '../../../blocs/favorite_c/favorite_cubit.dart';
import '../../../blocs/favorite_c/favorite_state.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  @override
  void initState() {
    super.initState();
    context.read<FavoriteCubit>().loadFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorites'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<FavoriteCubit, FavoriteState>(
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return Center(child: CustomLoader(color: AppColors().pastelViolet));
            } else if (state is FavoriteLoaded) {
              if (state.favorites.isEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite_border, color: AppColors().primary, size: 60),
                    const Gap(12),
                    Text(
                      "No favorite compounds yet.",
                      style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              }

              return ListView.separated(
                itemCount: state.favorites.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final compound = state.favorites[index];
                  return SearchCompundWidget(compound: compound);
                },
              );
            } else if (state is FavoriteError) {
              return Center(
                child: Text(state.message, style: const TextStyle(color: Colors.red)),
              );
            }

            return const Center(child: Text('Unexpected state.'));
          },
        ),
      ),
    );
  }
}
