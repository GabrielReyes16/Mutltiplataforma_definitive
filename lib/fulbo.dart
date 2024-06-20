class FulboFields{
  static const List <String> values =[
    'id',
    'name',
    'foundingYear',
    'lastchampionshipDate'
  ];
  static const String tableName = 'fulbos';
  static const String idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static const String textType = 'TEXT NOT NULL';
  static const String intType = 'INTEGER NOT NULL';
  static const String dateType = 'DATE NOT NULL';

  //campos
  static const String id = '_id';
  static const String name = 'name';
  static const String foundingYear = 'foundingYear';
  static const String lastchampionshipDate = 'lastchampionshipDate';
}

class FulboModel {
  int? id;
  final String name;
  final int foundingYear;
  final DateTime? lastchampionshipDate; // Cambiado a DateTime nullable

  FulboModel({
    this.id,
    required this.name,
    required this.foundingYear,
    this.lastchampionshipDate, // Nullable DateTime
  });

  Map<String, Object?> toJson() => {
        FulboFields.id: id,
        FulboFields.name: name,
        FulboFields.foundingYear: foundingYear,
        FulboFields.lastchampionshipDate: lastchampionshipDate?.toIso8601String(), // Handling nullable DateTime
      };

  factory FulboModel.fromJson(Map<String, Object?> json) {
    return FulboModel(
      id: json[FulboFields.id] as int?,
      name: json[FulboFields.name] as String,
      foundingYear: json[FulboFields.foundingYear] as int,
      lastchampionshipDate: json[FulboFields.lastchampionshipDate] != null
          ? DateTime.tryParse(json[FulboFields.lastchampionshipDate] as String)
          : null, // Parsing nullable DateTime
    );
  }

  FulboModel copy({
    int? id,
    String? name,
    int? foundingYear,
    DateTime? lastchampionshipDate,
  }) =>
      FulboModel(
        id: id ?? this.id,
        name: name ?? this.name,
        foundingYear: foundingYear ?? this.foundingYear,
        lastchampionshipDate: lastchampionshipDate ?? this.lastchampionshipDate,
      );
}
