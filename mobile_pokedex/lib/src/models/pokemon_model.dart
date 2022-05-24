import 'dart:convert';

class Pokemon {
  String? id;
  String? name;
  String? url;
  bool? isCatch;

  Pokemon({
    required this.id,
    required this.name,
    required this.isCatch,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'isCatch': isCatch,
    };
  }

  factory Pokemon.fromMap(Map<String, dynamic> map) {
    return Pokemon(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      url: map['url'] ?? '',
      isCatch: map['isCatch'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());
}
