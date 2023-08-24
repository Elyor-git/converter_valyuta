
class Valyuta {
  int? id;
  String? Code;
  String? Ccy;
  String? CcyNm_RU;
  String? CcyNm_UZ;
  String? CcyNm_UZC;
  String? CcyNm_EN;
  String? Nominal;
  String? Rate;
  String? Diff;
  String? Date;

  Valyuta({
    this.id,
    this.Code,
    this.Ccy,
    this.CcyNm_RU,
    this.CcyNm_UZ,
    this.CcyNm_UZC,
    this.CcyNm_EN,
    this.Nominal,
    this.Rate,
    this.Diff,
    this.Date,
  });

  Valyuta copyWith({
    int? id,
    String? Code,
    String? Ccy,
    String? CcyNm_RU,
    String? CcyNm_UZ,
    String? CcyNm_UZC,
    String? CcyNm_EN,
    String? Nominal,
    String? Rate,
    String? Diff,
    String? Date,
  }) {
    return Valyuta(
      id: id ?? this.id,
      Code: Code ?? this.Code,
      Ccy: Ccy ?? this.Ccy,
      CcyNm_RU: CcyNm_RU ?? this.CcyNm_RU,
      CcyNm_UZ: CcyNm_UZ ?? this.CcyNm_UZ,
      CcyNm_UZC: CcyNm_UZC ?? this.CcyNm_UZC,
      CcyNm_EN: CcyNm_EN ?? this.CcyNm_EN,
      Nominal: Nominal ?? this.Nominal,
      Rate: Rate ?? this.Rate,
      Diff: Diff ?? this.Diff,
      Date: Date ?? this.Date,
    );
  }

  Map<String, Object?> toJson() {
    return <String, Object?>{
      'id': id,
      'Code': Code,
      'Ccy': Ccy,
      'CcyNm_RU': CcyNm_RU,
      'CcyNm_UZ': CcyNm_UZ,
      'CcyNm_UZC': CcyNm_UZC,
      'CcyNm_EN': CcyNm_EN,
      'Nominal': Nominal,
      'Rate': Rate,
      'Diff': Diff,
      'Date': Date,
    };
  }

  factory Valyuta.fromJson(Map<String, Object?> map) {
    return Valyuta(
      id: map['id'] != null ? map['id'] as int : null,
      Code: map['Code'] != null ? map['Code'] as String : null,
      Ccy: map['Ccy'] != null ? map['Ccy'] as String : null,
      CcyNm_RU: map['CcyNm_RU'] != null ? map['CcyNm_RU'] as String : null,
      CcyNm_UZ: map['CcyNm_UZ'] != null ? map['CcyNm_UZ'] as String : null,
      CcyNm_UZC: map['CcyNm_UZC'] != null ? map['CcyNm_UZC'] as String : null,
      CcyNm_EN: map['CcyNm_EN'] != null ? map['CcyNm_EN'] as String : null,
      Nominal: map['Nominal'] != null ? map['Nominal'] as String : null,
      Rate: map['Rate'] != null ? map['Rate'] as String : null,
      Diff: map['Diff'] != null ? map['Diff'] as String : null,
      Date: map['Date'] != null ? map['Date'] as String : null,
    );
  }

  @override
  String toString() {
    return 'Valyuta(id: $id, code: $Code, ccy: $Ccy, ccynm_RU: $CcyNm_RU, ccyNm_UZ: $CcyNm_UZ, ccyNm_UZC: $CcyNm_UZC, ccyNm_EN: $CcyNm_EN, nominal: $Nominal, rate: $Rate, diff: $Diff, date: $Date)';
  }

  @override
  bool operator ==(covariant Valyuta other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.Code == Code &&
        other.Ccy == Ccy &&
        other.CcyNm_RU == CcyNm_RU &&
        other.CcyNm_UZ == CcyNm_UZ &&
        other.CcyNm_UZC == CcyNm_UZC &&
        other.CcyNm_EN == CcyNm_EN &&
        other.Nominal == Nominal &&
        other.Rate == Rate &&
        other.Diff == Diff &&
        other.Date == Date;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        Code.hashCode ^
        Ccy.hashCode ^
        CcyNm_RU.hashCode ^
        CcyNm_UZ.hashCode ^
        CcyNm_UZC.hashCode ^
        CcyNm_EN.hashCode ^
        Nominal.hashCode ^
        Rate.hashCode ^
        Diff.hashCode ^
        Date.hashCode;
  }
}
