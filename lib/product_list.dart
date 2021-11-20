import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:plant_shop/data.dart';
import 'package:plant_shop/detail_product.dart';

class ProductList extends StatefulWidget {
  ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                _iconBar(),
                SizedBox(height: 14),
                _TapBarState(),
                SizedBox(height: 16.5),
                _gridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _gridView() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: StaggeredGridView.countBuilder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 16,
          itemCount: destinations.length,
          itemBuilder: (context, i) {
            return GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailProduct(
                          destination: destinations[i],
                        )));
              },
              child: Container(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Color(0xffF5F7FA),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 16),
                            Text(
                              destinations[i].name,
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              destinations[i].places,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 14),
                            Text(
                              destinations[i].prices,
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff51B1A6),
                              ),
                            ),
                            SizedBox(height: 14),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          staggeredTileBuilder: (i) {
            return StaggeredTile.count(1, i.isEven ? 1.2 : 1.8);
          }),
    );
  }

  Widget _iconBar() {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 30),
      child: Row(
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
          SizedBox(width: 29),
          Text(
            "Houseplant",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  Widget _TapBarState() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14),
      child: Container(
        height: 36,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            SizedBox(width: 12),
            ButtonTheme(
              child: ElevatedButton(
                child: Text("Most Relevant"),
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
                child: Text("Highest Price"),
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
                child: Text("Lowest Price"),
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
      ),
    );
  }
}
