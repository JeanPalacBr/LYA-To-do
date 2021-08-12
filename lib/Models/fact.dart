class Fact {
  String fact;
  int lenght;
  Fact({this.fact, this.lenght});

  factory Fact.fromJson(Map<dynamic, dynamic> json) {
    return Fact(
      fact: json['fact'],
      lenght: json['length'],
    );
  }
}
