class Crop {
  String name;
  String city;
  int rate;
  int growth;
  bool isUp;

  Crop({
    required this.name,
    required this.city,
    required this.rate,
    required this.growth,
    required this.isUp
  });

  static fromJson(Map<String, dynamic> json) {
    return Crop(
        name: json['name'],
        city: json['city'],
        rate: json['rate'],
        growth: json['growth'],
        isUp: json['isUp']
    );
  }
}