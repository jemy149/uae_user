class Price {
  Price({
    this.from,
    this.to,
  });

  int? from;
  int? to;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
    from: json["from"],
    to: json["to"],
  );

  Map<String, dynamic> toJson() => {
    "from": from,
    "to": to,
  };
}