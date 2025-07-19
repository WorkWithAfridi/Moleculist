// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:moleculist/data/remote/config/api_endpoints.dart';

class CompoundModel {
  final String? name;
  final int? cid;
  final String? formula;
  final String? weight;
  final String? imageUrl;
  final String? hazard;

  final List<String>? iupacNames;    // all IUPAC names from props
  final String? inchi;
  final String? inchiKey;
  final String? smiles;
  final double? logP;
  final double? polarSurfaceArea;
  final int? hydrogenBondAcceptors;
  final int? hydrogenBondDonors;
  final int? rotatableBonds;
  final int? heavyAtomCount;

  CompoundModel({
    this.name,
    this.cid,
    this.formula,
    this.weight,
    this.imageUrl,
    this.hazard,
    this.iupacNames,
    this.inchi,
    this.inchiKey,
    this.smiles,
    this.logP,
    this.polarSurfaceArea,
    this.hydrogenBondAcceptors,
    this.hydrogenBondDonors,
    this.rotatableBonds,
    this.heavyAtomCount,
  });

  factory CompoundModel.fromPubChemJson(Map<String, dynamic> data, [String? fallbackName]) {
    if (data['PC_Compounds'] == null || (data['PC_Compounds'] as List).isEmpty) {
      return CompoundModel(name: fallbackName ?? 'Unknown');
    }

    final compound = data['PC_Compounds'][0];
    final props = compound['props'] as List<dynamic>? ?? [];
    final cid = compound['id']?['id']?['cid'] as int?;

    String? getPropString(String label, [String? name]) {
      try {
        final prop = props.firstWhere(
          (p) => p['urn']['label'] == label && (name == null || p['urn']['name'] == name),
          orElse: () => null,
        );
        if (prop == null) return null;
        return prop['value']?['sval']?.toString();
      } catch (_) {
        return null;
      }
    }

    double? getPropDouble(String label, [String? name]) {
      try {
        final prop = props.firstWhere(
          (p) => p['urn']['label'] == label && (name == null || p['urn']['name'] == name),
          orElse: () => null,
        );
        if (prop == null) return null;
        if (prop['value']?['fval'] != null) return (prop['value']['fval'] as num).toDouble();
        if (prop['value']?['ival'] != null) return (prop['value']['ival'] as num).toDouble();
        return null;
      } catch (_) {
        return null;
      }
    }

    int? getPropInt(String label, [String? name]) {
      try {
        final prop = props.firstWhere(
          (p) => p['urn']['label'] == label && (name == null || p['urn']['name'] == name),
          orElse: () => null,
        );
        if (prop == null) return null;
        if (prop['value']?['ival'] != null) return prop['value']['ival'] as int;
        return null;
      } catch (_) {
        return null;
      }
    }

    List<String> getAllIupacNames() {
      return props.where((p) => p['urn']['label'] == 'IUPAC Name' && p['value']?['sval'] != null).map<String>((p) => p['value']['sval'] as String).toList();
    }

    final iupacNames = getAllIupacNames();
    final commonName = iupacNames.isNotEmpty ? iupacNames.first : null;

    final formula = getPropString('Molecular Formula');
    final weight = getPropString('Molecular Weight');
    final inchi = getPropString('InChI');
    final inchiKey = getPropString('InChIKey');
    final smiles = getPropString('SMILES', 'Absolute');
    final logP = getPropDouble('Log P', 'XLogP3-AA');
    final polarSurfaceArea = getPropDouble('Topological', 'Polar Surface Area');
    final hydrogenBondAcceptors = getPropInt('Count', 'Hydrogen Bond Acceptor');
    final hydrogenBondDonors = getPropInt('Count', 'Hydrogen Bond Donor');
    final rotatableBonds = getPropInt('Count', 'Rotatable Bond');
    final heavyAtomCount = compound['count']?['heavy_atom'] as int?;

    return CompoundModel(
      name: commonName ?? fallbackName ?? 'Unknown',
      cid: cid,
      formula: formula,
      weight: weight,
      imageUrl: cid != null ? ApiEndPoints.getCompoundImage(cid) : null,
      hazard: _mockHazard(commonName ?? ''),
      iupacNames: iupacNames,
      inchi: inchi,
      inchiKey: inchiKey,
      smiles: smiles,
      logP: logP,
      polarSurfaceArea: polarSurfaceArea,
      hydrogenBondAcceptors: hydrogenBondAcceptors,
      hydrogenBondDonors: hydrogenBondDonors,
      rotatableBonds: rotatableBonds,
      heavyAtomCount: heavyAtomCount,
    );
  }

  static String _mockHazard(String name) {
    final lower = name.toLowerCase();
    if (lower.contains('benz') || lower.contains('chloro')) return 'Flammable';
    if (lower.contains('formaldehyde')) return 'Toxic';
    if (lower.contains('acid')) return 'Corrosive';
    return 'Warning';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'cid': cid,
      'formula': formula,
      'weight': weight,
      'imageUrl': imageUrl,
      'hazard': hazard,
      'iupacNames': iupacNames,
      'inchi': inchi,
      'inchiKey': inchiKey,
      'smiles': smiles,
      'logP': logP,
      'polarSurfaceArea': polarSurfaceArea,
      'hydrogenBondAcceptors': hydrogenBondAcceptors,
      'hydrogenBondDonors': hydrogenBondDonors,
      'rotatableBonds': rotatableBonds,
      'heavyAtomCount': heavyAtomCount,
    };
  }

  factory CompoundModel.fromMap(Map<String, dynamic> map) {
    return CompoundModel(
      name: map['name'] as String?,
      cid: map['cid'] as int?,
      formula: map['formula'] as String?,
      weight: map['weight'] as String?,
      imageUrl: map['imageUrl'] as String?,
      hazard: map['hazard'] as String?,
      iupacNames: (map['iupacNames'] as List<dynamic>?)?.cast<String>(),
      inchi: map['inchi'] as String?,
      inchiKey: map['inchiKey'] as String?,
      smiles: map['smiles'] as String?,
      logP: (map['logP'] as num?)?.toDouble(),
      polarSurfaceArea: (map['polarSurfaceArea'] as num?)?.toDouble(),
      hydrogenBondAcceptors: map['hydrogenBondAcceptors'] as int?,
      hydrogenBondDonors: map['hydrogenBondDonors'] as int?,
      rotatableBonds: map['rotatableBonds'] as int?,
      heavyAtomCount: map['heavyAtomCount'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompoundModel.fromJson(String source) => CompoundModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
