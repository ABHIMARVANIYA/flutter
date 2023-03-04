import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(future: callproductapi(),builder: (context, snapshot) {
      if(snapshot.hasData && snapshot!=null){
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for(int i =0; i<7;i++)
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(snapshot.data![i]['avatar'],
                        width: 40,
                        height: 40,
                      ),
                      Text(
                        snapshot.data![i]['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                          color: Color(0xFF4C53A5),

                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        );
      }
      else{
        return CircularProgressIndicator();
      }

    },);
  }

  Future<List<dynamic>> callproductapi() async {
    http.Response res = await http.get(Uri.parse('https://63085b9b722029d9ddcce746.mockapi.io/products'));
    List<dynamic> resList = jsonDecode(res.body.toString());
    return resList;
  }
}