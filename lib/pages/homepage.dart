import 'package:flutter/material.dart';
import 'package:rumahkuehany/helper/secure_storage_helper.dart';
import 'package:rumahkuehany/models/category.dart';
import 'package:rumahkuehany/models/user.dart';
import 'package:rumahkuehany/pages/productpage.dart';
import 'package:rumahkuehany/services/category_service.dart';
import 'package:rumahkuehany/utils/constant.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  User? user;
  bool isLoading = true;
  List<Category> categories = [];

  @override
  void initState() {
    SecureStorageHelper.getUser().then((value) {
      setState(() {
        user = value;
      });
    });
    CategoryService.getCategory().then((value) {
      setState(() {
        categories = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40, left: 15),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              text: 'Hello ',
                              style: cakeCardText.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                              children: [
                                TextSpan(
                                  text: user?.fullname ?? '',
                                  style: navigationText.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          hintText: 'Search cakes e.g.Risoles',
                          suffixIcon: IconButton(
                            onPressed: () => _searchController.clear(),
                            icon: const Icon(Icons.clear),
                          ),
                          prefixIcon: IconButton(
                            icon: const Icon(Icons.search),
                            onPressed: () {
                              // Logic goes here...
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          text: 'Cake ',
                          style: navigationText.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(
                              text: 'Categories',
                              style: cakeCardText.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: ListView.separated(
                          itemCount: categories.length,
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 10,
                            );
                          },
                          itemBuilder: (context, index) {
                            final category = categories.elementAt(index);
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ProductPage(
                                     category: category,
                                    ),
                                  ),
                                );
                              },
                              child: Card(
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        category.image,
                                        height: 200,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Text(
                                      category.name,
                                      style: cakeCardText.copyWith(
                                        fontWeight: semiBold,
                                        fontSize: 16,
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
            ),
    );
  }
}
