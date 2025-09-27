class Order {
  final String id;
  final String product;
  final int quantity;

  Order({required this.id, required this.product, required this.quantity});

  Map<String, dynamic> toJson() =>
      {'id': id, 'product': product, 'quantity': quantity};

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        id: json['id'],
        product: json['product'],
        quantity: json['quantity'],
      );
}
