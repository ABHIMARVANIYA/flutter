import 'dart:convert';

import 'package:clippy_flutter/arc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import '../widgets/ItemAppBar.dart';
import '../widgets/ItemBottomNavBar.dart';

class ItemPage extends StatelessWidget {
  List<Color> Clrs = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.orange,
  ];
  String? imagepath;
  String? imagename;
  String? imageprice;

  ItemPage({Key? key, this.imagepath,this.imagename,this.imageprice}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: callproductapi(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot != null) {
            return Scaffold(
              backgroundColor: Color(0xFFEDECF2),
              body: ListView(


                children: [
                  ItemAppBar(),
                  Padding(
                      padding: EdgeInsets.all(16),
                      child:Image.network('$imagepath')),



                  Arc(
                    edge: Edge.TOP,
                    arcType: ArcType.CONVEY,
                    height: 30,
                    child: Container(
                      width: double.infinity,
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 48,
                                bottom: 15,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '$imagename',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Color(0xFF4C53A5),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 10),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  RatingBar.builder(
                                    initialRating: 4,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    itemCount: 5,
                                    itemSize: 20,
                                    itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.favorite,
                                      color: Color(0xFF4C53A5),
                                    ),
                                    onRatingUpdate: (index) {},
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.grey.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          CupertinoIcons.minus,
                                          size: 18,
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                          "01",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFF4C53A5),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                              Colors.grey.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 10,
                                              offset: Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Icon(CupertinoIcons.plus,
                                            size: 18, color: Color(0xFF4C53A5)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Text(
                                "This is more detailes description of the product. you can write here more about the product. this is lengthy description.",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Color(0xFF4C53A5),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "Size:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF4C53A5),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      for (int i = 5; i < 10; i++)
                                        Container(
                                          height: 30,
                                          width: 30,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 8,
                                              ),
                                            ],
                                          ),
                                          child: Text(
                                            i.toString(),
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFF4C53A5),
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "Color:",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF4C53A5),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Row(
                                    children: [
                                      for (int i = 0; i < 5; i++)
                                        Container(
                                          height: 30,
                                          width: 30,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                            color: Clrs[i],
                                            borderRadius:
                                            BorderRadius.circular(30),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 8,
                                              ),
                                            ],
                                          ),
                                        ),

                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: ItemBottomNavBar(),
            );
          } else {
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
