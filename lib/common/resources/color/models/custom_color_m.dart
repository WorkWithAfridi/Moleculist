// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomColor {
  int c950;
  int c900;
  int c800;
  int c700;
  int c600;
  int c500;
  int c400;
  int c300;
  int c200;
  int c100;
  int c50;
  CustomColor({
    required this.c950,
    required this.c900,
    required this.c800,
    required this.c700,
    required this.c600,
    required this.c500,
    required this.c400,
    required this.c300,
    required this.c200,
    required this.c100,
    required this.c50,
  });

  CustomColor copyWith({
    int? c950,
    int? c900,
    int? c800,
    int? c700,
    int? c600,
    int? c500,
    int? c400,
    int? c300,
    int? c200,
    int? c100,
    int? c50,
  }) {
    return CustomColor(
      c950: c950 ?? this.c950,
      c900: c900 ?? this.c900,
      c800: c800 ?? this.c800,
      c700: c700 ?? this.c700,
      c600: c600 ?? this.c600,
      c500: c500 ?? this.c500,
      c400: c400 ?? this.c400,
      c300: c300 ?? this.c300,
      c200: c200 ?? this.c200,
      c100: c100 ?? this.c100,
      c50: c50 ?? this.c50,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'c950': c950,
      'c900': c900,
      'c800': c800,
      'c700': c700,
      'c600': c600,
      'c500': c500,
      'c400': c400,
      'c300': c300,
      'c200': c200,
      'c100': c100,
      'c50': c50,
    };
  }

  factory CustomColor.fromMap(Map<String, dynamic> map) {
    return CustomColor(
      c950: map['c950'] as int,
      c900: map['c900'] as int,
      c800: map['c800'] as int,
      c700: map['c700'] as int,
      c600: map['c600'] as int,
      c500: map['c500'] as int,
      c400: map['c400'] as int,
      c300: map['c300'] as int,
      c200: map['c200'] as int,
      c100: map['c100'] as int,
      c50: map['c50'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomColor.fromJson(String source) => CustomColor.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CustomColor(c950: $c950, c900: $c900, c800: $c800, c700: $c700, c600: $c600, c500: $c500, c400: $c400, c300: $c300, c200: $c200, c100: $c100, c50: $c50)';
  }

  @override
  bool operator ==(covariant CustomColor other) {
    if (identical(this, other)) return true;

    return other.c950 == c950 &&
        other.c900 == c900 &&
        other.c800 == c800 &&
        other.c700 == c700 &&
        other.c600 == c600 &&
        other.c500 == c500 &&
        other.c400 == c400 &&
        other.c300 == c300 &&
        other.c200 == c200 &&
        other.c100 == c100 &&
        other.c50 == c50;
  }

  @override
  int get hashCode {
    return c950.hashCode ^
        c900.hashCode ^
        c800.hashCode ^
        c700.hashCode ^
        c600.hashCode ^
        c500.hashCode ^
        c400.hashCode ^
        c300.hashCode ^
        c200.hashCode ^
        c100.hashCode ^
        c50.hashCode;
  }
}
