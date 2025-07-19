// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:moleculist/data/remote/config/api_endpoints.dart';

class CompoundModel {
  final String name;
  final int cid;
  final String formula;
  final String weight;
  final String imageUrl;
  final String hazard;

  CompoundModel({required this.name, required this.cid, required this.formula, required this.weight, required this.imageUrl, required this.hazard});

  factory CompoundModel.fromPubChemJson(Map<String, dynamic> data, [String? fallbackName]) {
    final compound = data['PC_Compounds'][0];
    final props = compound['props'] as List;
    final cid = compound['id']['id']['cid'];

    String getPropValue(String label, [String? name]) {
      final prop = props.firstWhere((p) => p['urn']['label'] == label && (name == null || p['urn']['name'] == name), orElse: () => {});
      return prop['value']?['sval']?.toString() ?? prop['value']?['fval']?.toString() ?? 'N/A';
    }

    final commonName = getPropValue('IUPAC Name', 'Preferred') != 'N/A' ? getPropValue('IUPAC Name', 'Preferred') : getPropValue('IUPAC Name', 'Traditional');

    final formula = getPropValue('Molecular Formula');
    final weight = getPropValue('Molecular Weight');

    return CompoundModel(
      name: commonName != 'N/A' ? commonName : (fallbackName ?? 'Unknown'),
      cid: cid,
      formula: formula,
      weight: weight,
      imageUrl: ApiEndPoints.getCompoundImage(cid),
      hazard: _mockHazard(commonName),
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
    return {'name': name, 'cid': cid, 'formula': formula, 'weight': weight, 'imageUrl': imageUrl, 'hazard': hazard};
  }

  factory CompoundModel.fromMap(Map<String, dynamic> map) {
    return CompoundModel(
      name: map['name'] as String,
      cid: map['cid'] as int,
      formula: map['formula'] as String,
      weight: map['weight'] as String,
      imageUrl: map['imageUrl'] as String,
      hazard: map['hazard'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompoundModel.fromJson(String source) => CompoundModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
