import 'package:get/get.dart';

class ShipmentsController extends GetxController {
  var selectedTab = 0.obs; // 0 = الواردة, 1 = المرسلة

  final List<Map<String, dynamic>> incomingShipments = [
    {
      "number": "123456",
      "status": "قيد التوصيل",
      "sender": "مكتبة جرير",
      "type": "قابل للكسر",
      "weight": "4.5",
    },
    {
      "number": "654321",
      "status": "تم التوصيل",
      "sender": "نون",
      "type": "إلكترونيات",
      "weight": "2.0",
    },
  ];

  final List<Map<String, dynamic>> outgoingShipments = [
    {
      "number": "999888",
      "status": "في الطريق",
      "sender": "خالد",
      "type": "ملابس",
      "weight": "3.0",
    },
  ];

  void switchTab(int index) {
    selectedTab.value = index;
  }
}
