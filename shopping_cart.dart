// ignore_for_file: unused_local_variable

void main() {
  // Sample item prices
  List<double> itemPrices = [5.99, 15.49, 25.00, 9.99, 3.50];

  // Calculate the total price without tax
  double subtotal = calculateTotal(itemPrices, taxRate: 0.0);

  // Calculate factorial discount percentage
  double factorialDiscount = calculateFactorialDiscount(itemPrices.length);
  double discount(double price) => price * (1 - factorialDiscount / 100); // Applying factorial discount as percentage

  // Apply the discount to all items
  List<double> discountedPrices = applyDiscount(itemPrices, discount);

  // Calculate the final price with tax
  double finalPrice = calculateTotal(discountedPrices, taxRate: 0.07);
  print('Total Price (with tax and factorial discount): \$${finalPrice.toStringAsFixed(2)}');
}

// Standard function to calculate total price with optional tax
double calculateTotal(List<double> prices, {double taxRate = 0.0}) {
  double subtotal = prices.reduce((a, b) => a + b);
  return subtotal + (subtotal * taxRate);
}

// Higher-order function to apply a discount
List<double> applyDiscount(List<double> prices, double Function(double) discountFunction) {
  return prices.map(discountFunction).toList();
}

// Recursive function to calculate factorial for special discount
double calculateFactorialDiscount(int numItems) {
  if (numItems <= 1) {
    return 1.0;
  } else {
    return numItems * calculateFactorialDiscount(numItems - 1);
  }
}
