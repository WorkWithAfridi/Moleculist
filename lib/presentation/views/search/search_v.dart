import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:moleculist/common/utilities/extensions/on_build_context.dart';
import 'package:moleculist/presentation/views/global/widgets/custom_loader.dart';
import 'package:moleculist/presentation/views/global/widgets/textfield_w.dart';
import 'package:moleculist/presentation/views/search/widgets/search_compund_w.dart';

import '../../../common/resources/color/app_colors.dart';
import '../../blocs/cubit/search_cubit.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _controller = TextEditingController();

  void _onSearch() {
    final query = _controller.text.trim();
    if (query.isNotEmpty) {
      context.read<SearchCubit>().searchCompound(query);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildSearchBar(),
            Gap(12),
            Expanded(child: _buildSearchResults()),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return CustomTextField(
      controller: _controller,
      hint: "Enter compund name...",
      suffixIcon: Icons.clear,
      textInputAction: TextInputAction.search,
      onSubmitted: () {
        _onSearch();
      },
      suffixIconOnTap: () {
        _controller.clear();
        context.read<SearchCubit>().resetState();
      },
    );
  }

  Widget _buildSearchResults() {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return Center(child: CustomLoader(color: AppColors().pastelViolet));
        } else if (state is SearchResultLoaded) {
          if (state.compounds.isEmpty) {
            return Column(
              children: [
                Icon(Icons.science, color: AppColors().primary, size: 60),
                Text("No compound found.", style: TextStyle(fontSize: 16, color: Colors.grey)),
              ],
            );
          }
          return ListView.separated(
            itemCount: state.compounds.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final compound = state.compounds[index];
              return SearchCompundWidget(compound: compound);
            },
          );
        } else if (state is SearchError) {
          return Center(
            child: Text(state.message, style: const TextStyle(color: Colors.red)),
          );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.science, color: AppColors().primary, size: 60),
            const Gap(12),
            Text(
              "Search for a\nchemical compound.",
              style: context.textTheme.bodyMedium?.copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        );
      },
    );
  }
}
