

Map<String, dynamic> getSelectedCategoryDetails(
    List<Map<String, dynamic>> cartList, String selectedCategory) {
  Map<String, dynamic> result;
  int index = cartList.indexWhere((smp) {
    return smp.containsKey(selectedCategory);
  });

  if (index >= 0) result = cartList[index];

  return result;
}
