class Chef {
  String image;
  String name;
  String designation;
  int index;

  Chef(
      {required this.image,
      required this.name,
      required this.designation,
      required this.index});
}

List<Chef> chefs = [
  Chef(
      image:
          'https://images.unsplash.com/photo-1543716627-839b54c40519?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
      name: 'Bob',
      designation: 'Head Chef',
      index: 1),
  Chef(
    image:
        'https://images.unsplash.com/photo-1595475038784-bbe439ff41e6?q=80&w=987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Alice',
    designation: 'Pastry Chef',
    index: 2,
  ),
  Chef(
    image:
        'https://images.unsplash.com/photo-1585358682246-23acb1561f6b?q=80&w=1062&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'Charlie',
    designation: 'Sous Chef',
    index: 3,
  ),
  Chef(
    image:
        'https://images.unsplash.com/photo-1541557435984-1c79685a082b?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    name: 'David',
    designation: 'Grill Master',
    index: 4,
  ),
];
