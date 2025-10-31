// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

///TAG LENGTH VALUE: String with substrings <tag><length><value>
class TLV {
  final int tag;
  final int length;
  final String value;

  TLV({
    required this.tag,
    required this.length,
    required this.value,
  });


  TLV copyWith({
    int? tag,
    int? length,
    String? value,
  }) {
    return TLV(
      tag: tag ?? this.tag,
      length: length ?? this.length,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tag': tag,
      'length': length,
      'value': value,
    };
  }

  factory TLV.fromMap(Map<String, dynamic> map) {
    return TLV(
      tag: map['tag'] as int,
      length: map['length'] as int,
      value: map['value'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TLV.empty() => TLV(tag: 9999999999, length: 9999999999, value: '');

  @override
  String toString() => 'TLV(tag: $tag, length: $length, value: $value)';

  @override
  bool operator ==(covariant TLV other) {
    if (identical(this, other)) return true;
  
    return 
      other.tag == tag &&
      other.length == length &&
      other.value == value;
  }

  @override
  int get hashCode => tag.hashCode ^ length.hashCode ^ value.hashCode;
}
