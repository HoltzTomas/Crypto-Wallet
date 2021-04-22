class Coin {
  final String name;
  final String abreviation;
  final dynamic price;
  final double dayPriceVariety;
  final double howMuchUserOwns;
  final String imageUrl;

  Coin(
      {this.dayPriceVariety,
      this.name,
      this.price,
      this.howMuchUserOwns,
      this.abreviation,
      this.imageUrl});
}
