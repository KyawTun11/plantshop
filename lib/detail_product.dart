import 'package:flutter/material.dart';
import 'package:plant_shop/data.dart';
import 'package:plant_shop/preview.dart';

class DetailProduct extends StatefulWidget {
  final Destination destination;
  DetailProduct({Key? key, required this.destination}) : super(key: key);

  @override
  _DetailProductState createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int _index = 0;
  int _selectedIndex = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              children: [
                IconBar(),
                SizedBox(height: 14),
                ImageBox(),
                TextBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 10),
                      IconRow(Icons.home, "About"),
                      SizedBox(width: 34.3),
                      IconRow(Icons.home, "How to care"),
                      SizedBox(width: 34.3),
                      IconRow(Icons.home, "Reviews"),
                      SizedBox(width: 34.3),
                      IconRow(Icons.home, "Saved"),
                      SizedBox(width: 14),
                    ],
                  ),
                ),
                SizedBox(width: 27),
                AddButton("Add to cart"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget IconBar() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_outlined,
                  color: Colors.black,
                  size: 20,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 246),
              Icon(
                Icons.notifications_outlined,
                size: 30,
              ),
              SizedBox(width: 19),
              Icon(
                Icons.shop_outlined,
                size: 30,
              ),
              SizedBox(width: 12),
            ],
          ),
        ),
      ],
    );
  }

  Widget ImageBox() {
    return Container(
      color: Color(0xffF5F7FA),
      height: 350,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(24),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 300,
                  width: 85,
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: destinations.length,
                      controller: PageController(viewportFraction: 0.3),
                      itemBuilder: (context, i) {
                        return Transform.scale(
                          scale: i == _index ? 0.9 : 0.9,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 98,
                                height: 120,
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
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),
              SizedBox(width: 29),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PreviewPage()));
                },
                child: Container(
                  height: 342,
                  width: 192,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(widget.destination.image),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget TextBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Text(
            widget.destination.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 4),
          Text(
            widget.destination.places,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.destination.prices,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff51B1A6),
                ),
              ),
              Container(
                width: 148,
                height: 48,
                child: Card(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      width: 2,
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ("-"),
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff51B1A6),
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(
                        ("1"),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(
                        ("+"),
                        style: TextStyle(
                          fontSize: 30,
                          color: Color(0xff51B1A6),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget IconRow(IconData icon, String name) {
    return Column(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            color: Color(0xffECEFF6),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon),
        ),
        SizedBox(height: 9),
        Text(name),
      ],
    );
  }

  Widget AddButton(String name) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: GestureDetector(
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: Color(0xff51B1A6),
            borderRadius: BorderRadius.circular(56),
          ),
          child: Center(
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        onTap: () {
          scaffoldKey.currentState!.showBottomSheet(
            (context) {
              return Container(
                width: MediaQuery.of(context).size.width,
                height: 427,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 6,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 37),
                    shoppingBag(),
                    SizedBox(height: 16),
                    shoppingBox(),
                    SizedBox(height: 16),
                    shoppingBox(),
                    SizedBox(height: 21),
                    _textBox(),
                    SizedBox(height: 21),
                    AddButton("Checkout (2)"),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget shoppingBag() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "Shopping Bag",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget shoppingBox() {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: Dismissible(
        key: Key(widget.destination.description),
        background: Container(
          padding: EdgeInsets.only(left: 20, right: 24),
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          color: Colors.pink.shade100,
        ),
        child: Container(
          height: 87,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(widget.destination.image),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Text(
                          widget.destination.places,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 13),
                        child: Row(
                          children: [
                            Text(
                              widget.destination.prices,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 100),
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F7FA),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    color: Color(0xff51B1A6),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F7FA),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Center(
                                child: Text(
                                  "1",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: Color(0xffF5F7FA),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: Color(0xff51B1A6),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _textBox() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                widget.destination.prices,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
