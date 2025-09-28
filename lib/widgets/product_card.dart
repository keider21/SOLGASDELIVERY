import 'package:flutter/material.dart';
import '../theme.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String description;
  final double price;
  final String image;
  final VoidCallback onPressed;

  const ProductCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.image,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.green[700],
                        ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "S/ ${price.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text("Pedir"),
            ),
          ],
        ),
      ),
    );
  }
}
