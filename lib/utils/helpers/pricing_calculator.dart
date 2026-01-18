class TPricingCalculator {
  //-- Calculate price based on tax and shipping
  static double calculateTotalPrice(double productPrice, String location) {
    final taxRate = getTaxForLocation(location);
    final taxAmount = productPrice * taxRate;

    final shippingCost = getShippingCost(location);

    final totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  // ✅ Tax calculate
  static String calculateTax(double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  //---Calculate shipping coast---
  static String calculateShippingCoast(double productPrice, String location) {
    double shippingCost = getShippingCoast(location);
    return shippingCost.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    return 0.10;
  }

  static double getShippingCoast(String location) {
    return 5.00;
  }

  // ✅ These two are missing in your code, so added as wrapper (no logic change)
  static double getTaxForLocation(String location) {
    return getTaxRateForLocation(location);
  }

  static double getShippingCost(String location) {
    return getShippingCoast(location);
  }
}
