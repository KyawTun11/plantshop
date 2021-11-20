import 'package:flutter/material.dart';
import 'package:plant_shop/data.dart';

class PreviewPage extends StatefulWidget {
  PreviewPage({Key? key}) : super(key: key);

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  int _index = 0;
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 360),
                  child: IconButton(
                    icon: Icon(Icons.cancel),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Container(
                height: 540,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xffE1E5EB),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/33.png"),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Container(
                height: 120,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destinations.length,
                    controller: PageController(viewportFraction: 0.3),
                    itemBuilder: (context, i) {
                      return Transform.scale(
                        scale: i == _index ? 0.9 : 0.9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = i;
                                });
                              },
                              child: Container(
                                width: 98,
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Color(0xffE1E5EB),
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: selectedIndex == i
                                        ? Color(0xff51B1A6)
                                        : Color(0xffE1E5EB),
                                    width: 2,
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      destinations[i].image,
                                    ),
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
          ],
        ),
      ),
    );
  }
}
