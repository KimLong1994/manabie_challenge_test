class FunctionTest {
  String updateCompleted(List<Map<String, dynamic>> testList) {
    final List<Map<String, dynamic>> list = [];
    for (var item in testList) {
      if (item["boolean"]) {
        list.add(item);
      }
    }
    return list.isNotEmpty ? "List has value" : "List Empty";
  }

  String updateIncompleted(List<Map<String, dynamic>> testList) {
    final List<Map<String, dynamic>> list = [];
    for (var item in testList) {
      if (!item["boolean"]) {
        list.add(item);
      }
    }
    return list.isNotEmpty ? "List has value" : "List Empty";
  }
}
