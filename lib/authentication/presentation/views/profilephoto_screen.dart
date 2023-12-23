import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/app/strings.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ProfilePhotoScreen extends StatefulWidget {
  const ProfilePhotoScreen({super.key});

  @override
  State<ProfilePhotoScreen> createState() => _ProfilePhotoScreenState();
}

class _ProfilePhotoScreenState extends State<ProfilePhotoScreen> {
  // late File _image;

  final picker = ImagePicker();

  // Future _chooseImage() async {
  //   final pickedFile = await picker.pickImage(source: ImageSource.gallery);
  //   setState(() {
  //     _image = File(pickedFile!.path);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primaryDark,
        body: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60),
                Text(
                  photoTitle,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 28),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: Text(
                    photoSubtitle,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ),
                SizedBox(height: 120),
                Center(
                    child: GestureDetector(
                        // onTap: _chooseImage,
                        child:
                            // _image == null ?
                            Image.asset(
                  'assets/images/photo-container.png',
                  width: 160,
                )
                        // : ClipOval(
                        //     child: Image.file(
                        //       _image,
                        //       width: 160,
                        //       height: 160,
                        //       fit: BoxFit.cover,
                        //     ),
                        //   ),
                        )),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "@christine",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Colors.white),
                  ),
                ),
                SizedBox(height: 60)
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
          child: PrimaryButton(
            invert: true,
            title: 'Done',
            action: () {
              router.replace(HomeRoute());
            },
          ),
        ));
  }
}
