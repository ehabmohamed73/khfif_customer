import 'package:khafif/core/constants/image_assets.dart';
import 'package:khafif/data/models/onboradingMogel.dart';

List<onBordingModel> bordingModleList = [
  onBordingModel(
    title: "خدمة توصيل بخفّة وسرعة",
    body:
        "أهلاً بك في خفيف!نوصّل طلباتك داخل المدينة بسهولة واهتمام، وبسرعة تشعرك بالخفة.",
    image: imagesAssets.khafifimage1,
  ),
  onBordingModel(
    title: "من الباب للباب",
    body:
        "سواء كنت ترسل أو تستقبل، خفيف يوصّلها لك من الباب للباب بكل أمان ومرونة.",
    image: imagesAssets.khafifimage2,
  ),
  onBordingModel(
    title: "اطلب بثواني... وتابع لحظة بلحظة",
    body:
        "اطلب التوصيل في خطوات بسيطة، وتتبع طلبك من البداية وحتى التسليم — كل شيء بين يديك.",
    image: imagesAssets.khafifimage3,
  ),
];
final addresses = [
  {
    "type": "مبنى",
    "location": "العليا, الرياض",
    "phone": "554881035",
    "country": "الرياض, المملكة العربية السعودية",
  },
  {
    "type": "مبنى",
    "location": "العليا, الرياض",
    "phone": "554881035",
    "country": "الرياض, المملكة العربية السعودية",
  },
];
List<String> months = [
  "يناير",
  "فبراير",
  "مارس",
  "أبريل",
  "مايو",
  "يونيو",
  "يوليو",
  "أغسطس",
  "سبتمبر",
  "أكتوبر",
  "نوفمبر",
  "ديسمبر",
];
List<Map<String, dynamic>> shipmentSize = [
  {"length": 20, "width": 20, "height": 15, "wight": 2},
  {"length": 30, "width": 35, "height": 30, "wight": 30},
  {"length": 120, "width": 120, "height": 120, "wight": 50},
];
