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

  factory CompoundModel.fromPubChemJson(Map<String, dynamic> data, String name) {
    final compound = data['PC_Compounds'][0];
    final props = compound['props'] as List;
    final cid = compound['id']['id']['cid'];

    String formula = props.firstWhere((p) => p['urn']['label'] == 'Molecular Formula', orElse: () => {})['value']?['sval'] ?? 'N/A';

    String weight = props.firstWhere((p) => p['urn']['label'] == 'Molecular Weight', orElse: () => {})['value']?['fval']?.toString() ?? 'N/A';

    return CompoundModel(name: name, cid: cid, formula: formula, weight: weight, imageUrl: ApiEndPoints.getCompoundImage(cid), hazard: _mockHazard(name));
  }

  static String _mockHazard(String name) {
    if (name.toLowerCase().contains('benz') || name.toLowerCase().contains('chloro')) return 'Flammable';
    if (name.toLowerCase().contains('formaldehyde')) return 'Toxic';
    if (name.toLowerCase().contains('acid')) return 'Corrosive';
    return 'Warning';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'name': name, 'cid': cid, 'formula': formula, 'weight': weight, 'imageUrl': imageUrl, 'hazard': hazard};
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
