class Food {
  final String id;
  final String name;
  final String image;
  final String description;
  final double price;
  final int portions;

  Food(
    this.id,
    this.name,
    this.description,
    this.price, {
    this.portions,
    this.image,
  });
}
