import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../domain/models/compund_m.dart';
import '../utils/hazard_color_util.dart';

class CompundDetailView extends StatelessWidget {
  final CompoundModel compound;

  const CompundDetailView({super.key, required this.compound});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    Widget infoRow(String label, String? value) {
      if (value == null || value.isEmpty) return const SizedBox.shrink();
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("$label: ", style: textStyle.bodyMedium?.copyWith(fontWeight: FontWeight.bold)),
            Expanded(child: Text(value, style: textStyle.bodyMedium)),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(compound.name ?? 'Compound Detail'),
        centerTitle: true,
        actions: [IconButton(onPressed: () {
          
        }, icon: Icon(Icons.favorite_border))],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (compound.imageUrl != null)
              CachedNetworkImage(
                imageUrl: compound.imageUrl!,
                height: 250,
                width: double.maxFinite,
                errorWidget: (_, __, ___) => const Icon(Icons.image_not_supported, size: 100),
              ),
            Center(
              child: Chip(
                label: Text(compound.hazard ?? 'Unknown Hazard'),
                backgroundColor: getHazardColor(compound.hazard ?? ""),
                labelStyle: const TextStyle(color: Colors.white),
              ),
            ),
            const Gap(16),
            infoRow("Formula", compound.formula),
            infoRow("Weight", compound.weight),
            infoRow("CID", compound.cid?.toString()),
            infoRow("IUPAC Names", compound.iupacNames?.join(", ")),
            infoRow("InChI", compound.inchi),
            infoRow("InChIKey", compound.inchiKey),
            infoRow("SMILES", compound.smiles),
            infoRow("LogP", compound.logP?.toStringAsFixed(2)),
            infoRow("Polar Surface Area", compound.polarSurfaceArea?.toStringAsFixed(2)),
            infoRow("H-Bond Acceptors", compound.hydrogenBondAcceptors?.toString()),
            infoRow("H-Bond Donors", compound.hydrogenBondDonors?.toString()),
            infoRow("Rotatable Bonds", compound.rotatableBonds?.toString()),
            infoRow("Heavy Atom Count", compound.heavyAtomCount?.toString()),
            const Gap(24),
          ],
        ),
      ),
    );
  }
}
