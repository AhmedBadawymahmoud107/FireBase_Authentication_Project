import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_firebase_project/details.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _MyAppState();
}

class _MyAppState extends State<home> {
  int selectedindex = 0;

  List catigoris = [
    {"iconname": Icons.laptop, "title": "laptop"},
    {"iconname": Icons.phone_android_outlined, "title": "mobile"},
    {"iconname": Icons.electric_bike, "title": "bike"},
    {"iconname": Icons.card_giftcard, "title": "gifts"},
    {"iconname": Icons.electric_car, "title": "car"},
  ];

  List products = [
    {
      "image": 'images/1.jpg',
      "name": "Vip Perfium For Men's",
      "description": "Most often by citrus in perfumery  ",
      "price": "200\$"
    },
    {
      "image": 'images/2.jpeg',
      "name": "makeup",
      "description": "makeup for woman",
      "price": "500\$"
    },
    {
      "image": 'images/3.jpeg',
      "name": "oil",
      "description": "description",
      "price": "350\$"
    },
    {
      "image": 'images/4.jpg',
      "name": "body splash",
      "description": "description",
      "price": "700\$"
    },
  ];

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedindex,
          onTap: (val) {
            setState(() {
              selectedindex = val;
            });
          },
          iconSize: 40,
          selectedItemColor: Colors.orange,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_outlined), label: ""),
          ]),
      endDrawer: Drawer(
          child: Container(
        width: 220,
        height: 800,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFF0A071E)),
        child: Stack(
          children: [
            InkWell(
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.only(top: 47, left: 32),
                child: Image.asset(
                  "images/Vector.png",
                  height: 13.41,
                  width: 13.41,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 97,
              child: Text(
                'Series',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
            Positioned(
              left: 33,
              top: 149,
              child: Text(
                'Películas',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
            Positioned(
              left: 33,
              top: 201,
              child: Text(
                'Originales',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
            Positioned(
              left: 33,
              top: 253,
              child: Text(
                'Recién Añadidos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
            Positioned(
              left: 33,
              top: 305,
              child: Text(
                'Ultimos Días',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
            Positioned(
              left: 33,
              top: 357,
              child: Text(
                'Próximamente',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 415,
              child: Text(
                'Géneros',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  height: 1.0,
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 398,
              child: Container(
                width: 220,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.30,
                      style: BorderStyle.solid,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 445,
              child: Container(
                width: 220,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 0.30,
                      style: BorderStyle.solid,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 197,
              top: 430,
              child: Transform.rotate(
                angle: 3.14,
                child: Container(
                  height: 15,
                  padding: const EdgeInsets.only(
                    top: 1.68,
                    left: 0.43,
                    right: 8.09,
                    bottom: 1.68,
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 15,
              top: 479,
              child: Container(
                width: 189,
                height: 171,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/img.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "Search",
                        prefixIcon: Icon(Icons.search),
                        border: InputBorder.none,
                        fillColor: Colors.grey[200],
                        filled: true),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: InkWell(
                      onTap: () {
                        scaffoldkey.currentState!.openEndDrawer();
                      },
                      child: Icon(Icons.menu, size: 40)),
                )
              ],
            ),
            Container(
              height: 30,
            ),
            Text(
              "Categories",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Container(
              height: 20,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catigoris.length,
                itemBuilder: (context, i) {
                  return Container(
                      margin: EdgeInsets.only(right: 25),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(100)),
                            child: Icon(
                              catigoris[i]['iconname'],
                              size: 40,
                            ),
                          ),
                          Text(
                            catigoris[i]['title'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[800]),
                          ),
                        ],
                      ));
                },
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Best selling",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 230),
              itemCount: products.length,
              itemBuilder: (context, i) {
                return InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => details(
                          dataitems: products[i],
                        ),
                      ));
                    },
                    child: Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(20),
                            width: 300,
                            color: Colors.grey[200],
                            child: Image.asset(
                              products[i]['image'],
                              height: 100,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Text(
                            products[i]['name'],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            products[i]['description'],
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Container(
                            height: 10,
                          ),
                          Text(
                            products[i]['price'],
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.orange,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
