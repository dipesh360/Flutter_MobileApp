import 'package:flutter/material.dart';
import '../model/mobile.dart';

class MobileCard extends StatelessWidget {
  final Mobile mobile;

  const MobileCard({Key? key, required this.mobile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 15,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 24, horizontal: 10),
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
            Text(
              "${mobile.description}",
              style: TextStyle(
                  fontSize: 15, color: Colors.grey, fontFamily: 'poppins'),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            )
          ],
        ),
      ),
    );
  }
}
