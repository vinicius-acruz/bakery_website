class Item {
  String image;
  String title;
  String subtitle;
  String description;
  String price;

  Item({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.price,
  });
}

List<Item> items = [
  Item(
    image:
        'https://images.unsplash.com/photo-1610440042657-612c34d95e9f?ixlib=rb-1.2.1&ixid=MnwxMjA3FDB8MHxwaG90by1wYWd1fHx8fGVufl',
    title: 'Macho Burger',
    subtitle: 'Served with French fries + Drinks',
    description:
        'Our famous burger won\'t leave you disappointed, a must try!!',
    price: '\$56-\$45',
  ),
  Item(
    image:
        'https://images.unsplash.com/photo-1518779578993-ec3579fee39f?q=80&w=1035&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Veggie Delight',
    subtitle: 'Healthy and delicious',
    description:
        'A perfect choice for vegetarians, loaded with fresh veggies and goodness.',
    price: '\$32-\$25',
  ),
  Item(
    image:
        'https://images.unsplash.com/photo-1599655345131-6eb73b81d8d6?q=80&w=986&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Seafood Extravaganza',
    subtitle: 'Fresh catch from the ocean',
    description:
        'Indulge in a variety of seafood delicacies, expertly prepared for your delight.',
    price: '\$75-\$60',
  ),
  Item(
    image:
        'https://images.unsplash.com/photo-1593560708920-61dd98c46a4e?q=80&w=1035&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Tropical Paradise Pizza',
    subtitle: 'Taste the tropics on a pizza!',
    description:
        'A mouth-watering combination of tropical fruits and savory flavors on a crispy crust.',
    price: '\$40-\$35',
  ),
  Item(
    image:
        'https://images.unsplash.com/photo-1607920591413-4ec007e70023?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fERlY2FkZW50JTIwQ2hvY29sYXRlJTIwQ2FrZXxlbnwwfHwwfHx8MA%3D%3D',
    title: 'Decadent Chocolate Cake',
    subtitle: 'For the sweet tooth in you',
    description:
        'Indulge in layers of rich chocolate goodness with our decadent chocolate cake.',
    price: '\$18-\$15',
  ),
  Item(
    image:
        'https://images.unsplash.com/photo-1685156330898-88eb2fdd66aa?q=80&w=1169&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    title: 'Refreshing Lemonade',
    subtitle: 'Quench your thirst',
    description:
        'A zesty and refreshing lemonade to complement your meal and keep you cool.',
    price: '\$8-\$6',
  ),
];
