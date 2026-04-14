class CheckOutBody {
  const CheckOutBody({
    required this.latitude,
    required this.longitude,
    required this.photo,
  });

  final double latitude;
  final double longitude;
  final String photo;

  Map<String, dynamic> toMap() {
    return {'latitude': latitude, 'longitude': longitude, 'photo': photo};
  }
}
