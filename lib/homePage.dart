import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterui_fragrance/models/note.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Note> noteList = [
    Note(
        name: 'Strelitzia',
        imageUrl: 'assets/images/flower1.png',
        bgColor: Colors.green[500],
        counts: '240'),
    Note(
        name: 'Dahlia',
        imageUrl: 'assets/images/flower2.png',
        bgColor: Colors.purple[500],
        counts: '230'),
    Note(
        name: 'SunFlower',
        imageUrl: 'assets/images/flower3.png',
        bgColor: Colors.amberAccent,
        counts: '430')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Search',
                  textScaleFactor: 1.0,
                  style: GoogleFonts.lato(
                      fontSize: 30,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w900)),
              Text('for perfume',
                  textScaleFactor: 1.0,
                  style: GoogleFonts.lato(
                      fontSize: 30,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          focusColor: Colors.white,
                          hintText: 'Find your scent',
                          hintStyle: GoogleFonts.lato(color: Colors.black),
                          prefixIcon: Icon(
                            Icons.search_rounded,
                            color: Colors.black,
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white))),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.import_export_outlined,
                      color: Colors.black,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Icon(
                      Icons.filter_center_focus_rounded,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text('By Notes',
                  textScaleFactor: 1.0,
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (Note note in noteList)
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          color: note.bgColor,
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width:
                                    MediaQuery.of(context).size.height * 0.16,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(note.imageUrl)),
                                ),
                              ),
                              Text(
                                note.name,
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                '${note.counts} Perfumes',
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        )
                    ],
                  )),
              SizedBox(
                height: 30,
              ),
              Text('By Group',
                  textScaleFactor: 1.0,
                  style: GoogleFonts.lato(
                      fontSize: 18,
                      letterSpacing: 1.0,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard('assets/images/category1.jpeg', 'Aromatic'),
                      _buildCard('assets/images/category2.jpeg', 'Floral')
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCard('assets/images/category3.jpeg', 'Citrus'),
                      _buildCard('assets/images/category4.jpeg', 'Wooden')
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.dashboard_outlined,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search_rounded,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
                color: Colors.black,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: '')
        ],
        currentIndex: 1,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  Widget _buildCard(String imagePath, String name) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage(imagePath))),
            ),
            Text(
              name,
              style: GoogleFonts.aBeeZee(
                  color: Colors.black,
                  letterSpacing: 1.0,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
