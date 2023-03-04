
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ItemBottomNavBar extends StatelessWidget {
  const ItemBottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: callproductapi(),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot != null) {
            return BottomAppBar(
              child: Container(

                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 10,
                      offset: Offset(0,3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    for (int i = 1; i < 2; i++)
                    Text(
                      '${snapshot.data![i]['price']}',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: (){
                      },
                      icon: Icon(CupertinoIcons.cart_badge_plus),
                      label: Text(
                        "Add To Cart",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Color(0xFF4C53A5)),
                        padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 13,horizontal: 15),
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),


                      ),
                    ),
                  ],
                ),

              ),

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