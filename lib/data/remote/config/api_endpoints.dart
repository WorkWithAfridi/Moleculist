class ApiEndPoints {
  static const String baseUrl = "";
  static String getCompoundByName(String name) => 'https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/name/$name/JSON';

  static String getCompoundImage(int cid) => 'https://pubchem.ncbi.nlm.nih.gov/rest/pug/compound/cid/$cid/PNG';
}
