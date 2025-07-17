import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/compound_c/cubit/compound_cubit.dart';
import '../widgets/compund_card_w.dart';

class CompundListView extends StatelessWidget {
  const CompundListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chemical Compounds'), centerTitle: true),
      body: BlocBuilder<CompoundCubit, CompoundState>(
        builder: (context, state) {
          if (state is CompoundLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CompoundLoadedState) {
            if (state.compounds.isEmpty) {
              return const Center(child: Text('No compounds available.'));
            }

            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.builder(
                itemCount: state.compounds.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return CompoundCard(
                    compound: state.compounds[index],
                    onTap: () {
                      // TODO: Implement navigation to detail page
                    },
                  );
                },
              ),
            );
          }

          if (state is CompoundErrorState) {
            return Center(child: Text(state.errorMessage));
          }

          return const Center(child: Text('Unexpected state.'));
        },
      ),
    );
  }
}
