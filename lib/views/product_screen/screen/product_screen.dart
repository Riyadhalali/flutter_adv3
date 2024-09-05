import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/Product.dart';
import '../../cart_screen/screen/cart_screen.dart';
import '../controller/product_controller.dart';

class ProductListView extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List with GetBuilder'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Navigate to CartPage
              Get.to(CartPage());
            },
          ),
        ],
      ),
      body: GetBuilder<ProductController>(
        builder: (controller) {
          return ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (context, index) {
              Product product = controller.products[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.all(10),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      // Product Image
                      Image.network(
                        product.imageUrl,
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.height * 0.1,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      // Product Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            Text(product.description),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                // Decrease Button
                                IconButton(
                                  icon: Icon(Icons.remove),
                                  onPressed: () {
                                    controller.products[index].quantity--;
                                    controller
                                        .update(); // Manually trigger UI update
                                  },
                                ),
                                // Quantity Display
                                Text(
                                  '${product.quantity}',
                                  style: TextStyle(fontSize: 18),
                                ),
                                // Increase Button
                                IconButton(
                                  icon: Icon(Icons.add),
                                  onPressed: () {
                                    controller.products[index].quantity++;
                                    controller
                                        .update(); // Manually trigger UI update
                                  },
                                ),
                                SizedBox(width: 20),
                                // Add to Cart Button
                                ElevatedButton(
                                  child: Text('Add to Cart'),
                                  onPressed: () {
                                    controller.addToCart(product);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
