import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_application/pages/itemPage.dart';
import 'package:http/http.dart' as http;

class ItemWidjet extends StatelessWidget {


  ItemWidjet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: callproductapi(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot != null) {
            return GridView.count(
              childAspectRatio: 0.68,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              shrinkWrap: true,
              children: [
                for(int i = 0; i < 7; i++)
                  Container(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                color: Color(0xFF4C53A5),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "-50%",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Icon(
                              Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return ItemPage(imagepath: snapshot.data![i]['avatar'],imagename: snapshot.data![i]['name'],);
                              },));
                          },
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Image.network('${snapshot.data![i]['avatar']}'),
                            height: 120,
                            width: 120,
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(bottom: 8),
                          alignment: Alignment.centerLeft,
                          child: Text(                            '${snapshot.data![i]['name']}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color(0xFF4C53A5),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Write description of product",
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xFF4C53A5),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${snapshot.data![i]['price']}',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                              Icon(
                                Icons.shopping_cart_checkout,
                                color: Color(0xFF4C53A5),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

              ],
            );
          }
          else {
            return CircularProgressIndicator();
          }
        });
  }


  Future<List<dynamic>> callproductapi() async {
    http.Response res = await http
        .get(Uri.parse('https://63085b9b722029d9ddcce746.mockapi.io/products'));
    List<dynamic> resList = jsonDecode(res.body.toString());
    return resList;
  }
}