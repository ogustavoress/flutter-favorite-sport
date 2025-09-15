class Sport {
  final int id;
  final String name;
  final String logo;

  Sport({required this.id, required this.name, required this.logo});

  factory Sport.fromJson(Map<String, dynamic> json) =>
      Sport(
          id: json['id'] as int,
          name: json['name'] as String,
          logo: json['logo'] as String
      );

  Map<String, dynamic> toJson() => {'id' : id, 'name' : name, 'logo' : logo};
}