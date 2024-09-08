import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/Product.dart';
import '../../../models/cart_model.dart';

class ProductController extends GetxController {
  // Regular list of products and cartItems (non-reactive)
  List<Product> products = [];
  List<CartItem> cartItems = [];

  @override
  void onInit() {
    super.onInit();
    // Initial Product List
    products = [
      Product(
        name: 'Product 1',
        description: 'This is product 1 description.',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        name: 'Product 2',
        description: 'This is product 2 description.',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Product(
        name: 'Product 3',
        description: 'This is product 3 description.',
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];
    update(); // Update UI
  }

  // Add to Cart Method
  void addToCart(Product product) {
    // Check if the product is already in the cart
    int index = cartItems.indexWhere((item) => item.product == product);
    // if item is not in the cart
    if (index == -1) {
      cartItems.add(CartItem(product: product, quantity: product.quantity));
    }
    // item is in the cart
    else {
      cartItems[index].quantity += product.quantity;
    }
    update(); // Manually trigger UI update
    // Display Snackbar message
    Get.snackbar(
      'Added to Cart', // Title
      '${product.name} has been added to your cart.', // Message
      snackPosition: SnackPosition.BOTTOM, // Position (TOP, BOTTOM)
      backgroundColor: Colors.green, // Optional: Background color
      colorText: Colors.white, // Optional: Text color
      duration: Duration(seconds: 2), // Optional: Duration
    );
  }

  // Remove item from cart
  void removeFromCart(int index) {
    cartItems.removeAt(index);
    update(); // Manually trigger UI update
  }

  // Clear the entire cart
  void clearCart() {
    cartItems.clear();
    update(); // Manually trigger UI update
  }

  // Get total quantity
  int get totalQuantity =>
      cartItems.fold(0, (sum, item) => sum + item.quantity);
}
