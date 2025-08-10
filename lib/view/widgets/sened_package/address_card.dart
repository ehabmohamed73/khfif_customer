import 'package:flutter/material.dart';

import 'package:khafif/data/models/address_model.dart';

class AddressCard extends StatelessWidget {
  final Color bgColor;
  final Color txtColor; // You can change this to any color you want
  final AddressModel addressModel;

  const AddressCard({
    super.key,
    required this.addressModel,
    required this.bgColor,
    required this.txtColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            addressModel.mainAddress!,
            style: TextStyle(color: txtColor, fontWeight: FontWeight.bold),
          ),
          Text(
            addressModel.addressName!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: txtColor,
            ),
          ),
          SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              // افتح رابط الخرائط
            },
            child: Text(
              addressModel.addressLink!,
              style: TextStyle(
                color: Colors.black,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Text(addressModel.addressCity!),
        ],
      ),
    );
  }
}
