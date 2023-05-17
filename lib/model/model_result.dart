import 'package:market_view/model/crop_model.dart';

class CropResult {
  final List<Crop> crops;

  CropResult({
    required this.crops
  });

  static CropResult fromJson(Map<String, dynamic> json){
    final List<Crop> list = List<Crop>.empty(growable: true);

    if(json['result'] != null) {
      json['result'].forEach((c) {
        final Crop crop = Crop.fromJson(c);
        list.add(crop);
      });
    }
    return CropResult(crops: list);
  }
}