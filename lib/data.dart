class Destination {
  String image;
  String name;
  String places;
  String description;
  String prices;

  Destination({
    required this.image,
    required this.description,
    required this.name,
    required this.places,
    required this.prices,
  });
}

final List<Destination> destinations = [
  Destination(
      prices: "IDR 22.000",
      name: 'Indoor',
      places: "Peace Lily",
      image: 'assets/11.png',
      description:
          "The peace lily plant is well known for its air-purifying abilities as a houseplant "),
  Destination(
      prices: "IDR 25.000",
      name: 'Indoor',
      places: "Calathea",
      image: 'assets/33.png',
      description:
          "Calathea is a species of perennial plant in the family known as the pra..."),
  Destination(
      prices: "IDR 225.000",
      name: 'Indoor',
      places: "Peace Lily",
      image: 'assets/3.png',
      description:
          "The peace lily plant is well known for its air-purifying abilities as a houseplant "),
  Destination(
      prices: "IDR 262.000",
      name: 'Indoor',
      places: "Calathea",
      image: 'assets/4.png',
      description:
          "Calathea is a species of perennial plant in the family known as the pra..."),
  Destination(
      prices: "IDR 122.000",
      name: 'Indoor',
      places: "Peace Lily",
      image: 'assets/5.png',
      description:
          "The peace lily plant is well known for its air-purifying abilities as a houseplant "),
  Destination(
      prices: "IDR 120.000",
      name: 'Indoor',
      places: "Calathea",
      image: 'assets/6.png',
      description:
          "Calathea is a species of perennial plant in the family known as the pra..."),
  Destination(
      prices: "IDR 262.000",
      name: 'Indoor',
      places: "Calathea",
      image: 'assets/plant0.png',
      description:
          "Calathea is a species of perennial plant in the family known as the pra..."),
  Destination(
      prices: "IDR 122.000",
      name: 'Indoor',
      places: "Peace Lily",
      image: 'assets/plant1.png',
      description:
          "The peace lily plant is well known for its air-purifying abilities as a houseplant "),
  Destination(
      prices: "IDR 120.000",
      name: 'Indoor',
      places: "Calathea",
      image: 'assets/plant2.png',
      description:
          "Calathea is a species of perennial plant in the family known as the pra..."),
];
