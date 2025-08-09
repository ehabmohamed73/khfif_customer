import 'package:flutter/material.dart';
import 'package:khafif/data/models/address_model.dart';

class AddressCard extends StatelessWidget {
  final AddressModel addressModel;

  const AddressCard({super.key, required this.addressModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
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
            style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
          ),
          Text(
            addressModel.addressName!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 4),
          GestureDetector(
            onTap: () {
              // افتح رابط الخرائط
            },
            child: Text(
              addressModel.addressLink!,
              style: TextStyle(
                color: Colors.blue,
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
