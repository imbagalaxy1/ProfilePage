class FAQS{
  String imageUrl;
  String name;

  FAQS({
    required this.imageUrl,
    required this.name,
  });
}

List<FAQS> faqs = [
  FAQS(
    imageUrl: 'assets/images/Restaurant.jpg',
    name: 'Restaurant',
  ),
  FAQS(
    imageUrl: 'assets/images/Hotel.jpg',
    name: 'Hotel',
  ),
  FAQS(
    imageUrl: 'assets/images/Transport.jpg',
    name: 'Transport',
  ),
];