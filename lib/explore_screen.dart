import 'package:flutter/material.dart';
import 'package:plant_shop/data.dart';
import 'package:plant_shop/product_list.dart';

class ExploreScreen extends StatefulWidget {
  ExploreScreen({Key? key}) : super(key: key);

  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 52),
                _searchBox(),
                SizedBox(height: 24),
                TextBar("Suggestion Plant"),
                SizedBox(height: 24),
                GestureDetector(
                  child: suggestionPlant("assets/11.png", "Agave"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => ProductList()));
                  },
                ),
                SizedBox(height: 24),
                suggestionPlant("assets/22.png", "Monstera obiqua"),
                SizedBox(height: 24),
                suggestionPlant("assets/33.png", "Cereus cactus"),
                SizedBox(height: 24),
                TextBar("Categories"),
                categories(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _searchBox() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
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
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }

  Widget TextBar(String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget suggestionPlant(String image, String name) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 39,
                width: 34,
                decoration: BoxDecoration(
                  color: Color(0xffE1E5EB),
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(image),
                  ),
                ),
              ),
              SizedBox(width: 24),
              Text(
                name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget categories() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GridView.builder(
            itemCount: destinations.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, i) {
              return Card(
                elevation: 0,
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      width: 150,
                      height: 160,
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
                            width: 150,
                            height: 42,
                            decoration: BoxDecoration(
                                color: Color(0xffF5F7FA),
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  destinations[i].places,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
