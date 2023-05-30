import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rumahkuehany/models/cake.dart';

import '../models/category.dart';
import '../services/product_service.dart';
import '../utils/constant.dart';

class ProductPage extends StatefulWidget {
  final Category category;

  ProductPage({Key? key, required this.category}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  bool isLoading = true;
  List<Cake> cakes = [];

  @override
  void initState() {
    CakeService.getCakes(widget.category.id).then((value) {
      setState(() {
        cakes = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name),
        backgroundColor: secondaryColor,
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : cakes.isEmpty
              ? Center(
                  child: Text('Data kosong'),
                )
              : ListView.separated(
                  itemBuilder: (_, index) {
                    final cake = cakes[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                cake.image,
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Text(
                              cake.name,
                              style: cakeCardText.copyWith(
                                fontWeight: semiBold,
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              NumberFormat.currency(
                                locale: 'id-ID',
                                name: 'Rp ',
                                decimalDigits: 0,
                              ).format(cake.price),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(
                    height: 10,
                  ),
                  itemCount: cakes.length,
                ),
    );
  }
}
