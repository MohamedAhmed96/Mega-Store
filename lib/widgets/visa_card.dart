import 'package:flutter/material.dart';

class VisaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 350,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 40,
                width: 60,
                child: ClipRRect(
                  child: Image.asset(
                    'lib/assets/images/visaLogo.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
          Text(
            '**** **** **** 4546',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
          ),
          Container(
            height: 35,
            width: 45,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Card Holder Name',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    'Jennyfer Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Expiry Date',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '11/22',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
