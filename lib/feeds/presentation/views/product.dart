import 'package:flutter/material.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/widgets/primary_button.dart';

class ProductDetails extends StatefulWidget {
  final product;
  const ProductDetails({super.key, this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  var quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryLight,
      appBar: AppBar(
        backgroundColor: secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(padding: EdgeInsets.all(5), height: 30, width: 30, decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(100)), child: Icon(Icons.arrow_back_ios_new, color: grey)),
            )),
        title: Text(
          widget.product,
          style: TextStyle(color: grayscale, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(color: white, borderRadius: BorderRadius.circular(16)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      "assets/images/product.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text("\$126", style: TextStyle(color: primaryDark, fontSize: 14, fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                Text("Plain black t-shirt", style: TextStyle(color: grayscale, fontSize: 20, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var i = 0; i < 5; i++)
                        GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(
                                "assets/images/detail.png",
                                height: 62,
                                width: 62,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text("Colour", style: TextStyle(color: grayscale, fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Row(
                  children: [
                    colourSelector(black),
                    colourSelector(red),
                    colourSelector(green),
                    colourSelector(white),
                    colourSelector(primaryDark),
                  ],
                ),
                SizedBox(height: 10),
                Text("Size", style: TextStyle(color: grayscale, fontSize: 16, fontWeight: FontWeight.w600)),
                SizedBox(height: 10),
                Row(
                  children: [
                    sizeSelector('S'),
                    sizeSelector('M'),
                    sizeSelector('L'),
                    sizeSelector('XL'),
                    sizeSelector('XXL'),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
          Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.only(left: 20, right: 20),
                width: MediaQuery.of(context).size.width,
                height: 95,
                color: white,
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (quantity != 1) quantity--;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(width: 1, color: grey)),
                            child: Center(child: Text("-", style: TextStyle(color: primaryDark, fontWeight: FontWeight.bold))),
                          ),
                        ),
                      ),
                      Text("$quantity", style: TextStyle(color: grayscale, fontSize: 16, fontWeight: FontWeight.w500)),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(width: 1, color: grey)),
                            child: Center(child: Text("+", style: TextStyle(color: primaryDark, fontWeight: FontWeight.bold))),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.63, child: PrimaryButton(title: 'Send E-mail to seller', action: () {}))
                ]),
              ))
        ],
      ),
    );
  }

  GestureDetector colourSelector(color) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(100)),
        ),
      ),
    );
  }

  GestureDetector sizeSelector(size) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: EdgeInsets.only(right: 20),
        child: Container(
          width: 48,
          height: 32,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(width: 1, color: grey)),
          child: Center(child: Text(size)),
        ),
      ),
    );
  }
}
