import 'package:flutter/material.dart';
import 'package:plant_shop/data.dart';
import 'package:plant_shop/explore_screen.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 18,
                left: 14,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 12, right: 12, top: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discover",
                          style: TextStyle(
                              fontSize: 31, fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.notifications_outlined,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  _searchBox(),
                  SizedBox(height: 16),
                  _TapBarState(),
                  SizedBox(height: 30),
                  Container(
                    height: 400,
                    child: PageView.builder(
                        itemCount: destinations.length,
                        controller: PageController(viewportFraction: 0.8),
                        onPageChanged: (int index) =>
                            setState(() => _index = index),
                        itemBuilder: (context, i) {
                          return Transform.scale(
                            scale: i == _index ? 1.0 : 0.9,
                            child: GestureDetector(
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 400,
                                    decoration: BoxDecoration(
                                      color: Color(0xffE1E5EB),
                                      borderRadius: BorderRadius.circular(15),
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: AssetImage(
                                          destinations[i].image,
                                        ),
                                      ),
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 170,
                                          width: double.infinity,
                                          padding: EdgeInsets.all(15),
                                          margin: EdgeInsets.only(
                                              bottom: 10, right: 10, left: 10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.white),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                destinations[i].name,
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                destinations[i].places,
                                                style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                destinations[i].description,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Icon(
                                                    Icons.favorite_outline,
                                                    size: 15,
                                                    color: Colors.black,
                                                  ),
                                                  Text(
                                                    destinations[i].prices,
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      color: Color(0xff51B1A6),
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
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          buildNavigationItem(Icons.home, 0),
          buildNavigationItem(Icons.shopping_bag_outlined, 1),
          buildNavigationItem(Icons.person_outlined, 2),
        ],
      ),
    );
  }

  Widget _searchBox() {
    return Padding(
      padding: const EdgeInsets.only(right: 24, left: 12),
      child: Container(
        height: 52,
        decoration: BoxDecoration(
            color: Color(0xffE1E5EB), borderRadius: BorderRadius.circular(15)),
        child: TextFormField(
          decoration: InputDecoration(
            hintText: "Search Plant",
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            prefixIcon: IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => ExploreScreen()));
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _TapBarState() {
    return Container(
      height: 36,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          SizedBox(width: 12),
          ButtonTheme(
            child: ElevatedButton(
              child: Text("Top Plant"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                primary: Color(0xff51B1A6),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 5),
          ButtonTheme(
            child: ElevatedButton(
              child: Text("Indoor"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                primary: Color(0xff51B1A6),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 5),
          ButtonTheme(
            child: ElevatedButton(
              child: Text("Garden"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                primary: Color(0xff51B1A6),
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 5),
          ButtonTheme(
            child: ElevatedButton(
              child: Text("Succlent"),
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                primary: Color(0xff51B1A6),
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavigationItem(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        child: Icon(
          icon,
          size: 30,
          color: index == _selectedIndex ? Color(0xff51B1A6) : Colors.grey,
        ),
        height: 70,
        width: MediaQuery.of(context).size.width / 3,
        decoration: index == _selectedIndex
            ? BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              )
            : BoxDecoration(),
      ),
    );
  }
}
