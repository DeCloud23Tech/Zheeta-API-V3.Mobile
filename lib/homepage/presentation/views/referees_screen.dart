import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
@RouteType.custom(transitionsBuilder: TransitionsBuilders.slideLeft)
class RefereeScreen extends StatefulWidget {
  const RefereeScreen({super.key});

  @override
  State<RefereeScreen> createState() => _RefereeScreenState();
}

class _RefereeScreenState extends State<RefereeScreen> {
  var search;
  static final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => context.router.pop(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(100)),
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
            ),
          ),
        ),
        title: Text(
          'RefereeScreen',
          style: TextStyle(color: AppColors.grayscale, fontSize: 18, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              height: 50,
              child: TextFormField(
                onFieldSubmitted: (value) {},
                onChanged: (value) {},
                style: TextStyle(color: Colors.black),
                controller: _searchController,
                keyboardType: TextInputType.text,
                cursorColor: AppColors.primaryDark,
                decoration: InputDecoration(
                  suffixIcon: Padding(
                      padding: EdgeInsets.all(10),
                      child: SvgPicture.asset(
                        'assets/images/icons/search.svg',
                        width: 10,
                        height: 10,
                      )),
                  border: OutlineInputBorder(),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: AppColors.hintText),
                ),
                // focusNode: _focusNode,
                validator: (searchValue) {
                  if (searchValue!.isEmpty) {
                    return 'Please enter search keyword';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 20),
            for (var i = 0; i < 20; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 35,
                          padding: EdgeInsets.all(1),
                          decoration: BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.circular(100)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Image.asset(
                              "assets/images/User.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Christine Doe",
                          style: TextStyle(color: AppColors.primaryDark, fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 30,
                      child: PrimaryButton(title: "View Profile", action: () {}),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
