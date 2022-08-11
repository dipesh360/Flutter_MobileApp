import 'package:flutter/material.dart';
import 'package:mobile_app/model/mobile.dart';

class SingleMobile extends StatelessWidget {
  const SingleMobile({Key? key, required this.mobile}) : super(key: key);
  final Mobile mobile;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Mobile detail"),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  child: Image.network("${mobile.mobile_image}"),
                  borderRadius: BorderRadius.circular(8),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Name: ${mobile.name}",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'poppins'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Brand: ${mobile.company}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins')),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Price: ₹${mobile.price?.toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins')),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text("Model: ${mobile.mobile_detail?.model}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins')),
                    SizedBox(
                      width: 20,
                    ),
                    Text("Location: ${mobile.mobile_detail?.location}",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'poppins')),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "${mobile.description}",
                  style: TextStyle(
                      fontSize: 15, color: Colors.grey, fontFamily: 'poppins'),
                )
              ],
            ),
          ),
        ));
  }
}
