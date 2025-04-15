class SuraModels{
  int index;
  String suraNameAr;
  String suraNameEn;
  String verses;
  SuraModels({required this.suraNameAr,required this.suraNameEn,required this.verses,required this.index});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SuraModels &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          suraNameAr == other.suraNameAr &&
          suraNameEn == other.suraNameEn &&
          verses == other.verses;

  @override
  int get hashCode =>
      index.hashCode ^
      suraNameAr.hashCode ^
      suraNameEn.hashCode ^
      verses.hashCode;
}