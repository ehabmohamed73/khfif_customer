class AddressModel {
  String? mainAddress;
  String? addressName;
  String? addressLink;
  String? addressCity;
  AddressModel({
    this.mainAddress,
    this.addressName,
    this.addressLink,
    this.addressCity,
  });
  AddressModel.fromJson(Map<String, dynamic> json) {
    mainAddress = json['mainAddress'];
    addressName = json['addressName'];
    addressLink = json['addressLink'];
    addressCity = json['addressCity'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['mainAddress'] = mainAddress;
    data['addressName'] = addressName;
    data['addressLink'] = addressLink;
    data['addressCity'] = addressCity;
    return data;
  }
}
