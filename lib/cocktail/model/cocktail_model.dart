class Drinks {
  String strDrink;
  String strCategory;
  String strDrinkThumb;
  Drinks({
    required this.strDrink,
    required this.strDrinkThumb,
    required this.strCategory,
  });
  factory Drinks.fromJson(Map<String, dynamic> json) {
    return Drinks(
      strDrink: json["strDrink"],
      strDrinkThumb: json["strDrinkThumb"],
      strCategory: json['strCategory'],
    );
  }
}
