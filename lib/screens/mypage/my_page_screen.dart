import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starlight_clone/components/common_back_with_close_header_bottom_sheet.dart';
import 'package:starlight_clone/components/common_button.dart';
import 'package:starlight_clone/components/common_button_with_right_check.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/components/common_text_with_close_header_bottom_sheet.dart';
import 'package:starlight_clone/models/mypage/menu.dart';
import 'package:starlight_clone/screens/login/login_screen.dart';
import 'package:starlight_clone/screens/mypage/detail/edit_nickname_screen.dart';
import 'package:starlight_clone/util/auth.dart';

class MyPageMenu {
  final String title, prefixIcon;
  final Color backgroundColor, prefixColor;
  final int menuId;
  final Function fun;

  MyPageMenu({
    required this.title,
    required this.prefixIcon,
    required this.backgroundColor,
    required this.prefixColor,
    required this.menuId,
    required this.fun,
  });
}

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends State<MyPageScreen> {
  XFile? _pickedFile;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        title: Text(
          "Mypage",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: screenWidth * 13 / 36,
                height: screenWidth * 13 / 36,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Nickname",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 20,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonShortRadiusButton(
                    paddingVertical: 10,
                    paddingHorizontal: 18,
                    title: Text(
                      "Edit Profile",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    borderColor: Colors.transparent,
                    fun: () {
                      _showEditBottomSheet();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return CommonButtonWithRightCheck(
                    title: myPageMenu[index].title,
                    backgroundColor: myPageMenu[index].backgroundColor,
                    borderColor: Colors.transparent,
                    fun: myPageMenu[index].fun,
                    prefixIcon: myPageMenu[index].prefixIcon,
                    prefixIconColor:
                        myPageMenu[index].prefixColor ?? Colors.white,
                    prefixWidth: screenWidth / 18,
                    prefixHeight: screenWidth / 18,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
                itemCount: myPageMenu.length,
              ),
              const SizedBox(
                height: 10,
              ),
              CommonButtonWithRightCheck(
                title: "Logout",
                backgroundColor: const Color.fromRGBO(255, 255, 255, 0.1),
                borderColor: Colors.transparent,
                fun: () async {
                  await Auth.signOut(context: context);
                  Get.to(() => const LoginScreen());
                },
                prefixIcon: "assets/icon/icon_logout.png",
                prefixIconColor: Colors.white,
                prefixWidth: screenWidth / 18,
                prefixHeight: screenWidth / 18,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _showEditBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommonTextWithCloseHeaderBottomSheet(
          title: "Edit profile",
          childWidget: Column(
            children: [
              CommonButtonWithRightCheck(
                title: "Change profile image",
                backgroundColor: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.surface,
                fun: () => _showImageBottomSheet(),
              ),
              const SizedBox(
                height: 10,
              ),
              CommonButtonWithRightCheck(
                title: "Change nickname",
                backgroundColor: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.surface,
                fun: () {
                  Get.to(() => const EditNicknameScreen());
                },
              ),
            ],
          ),
        );
      },
    );
  }

  _showImageBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return CommonBackWithCloseHeaderBottomSheet(
          backFun: () {
            Get.back();
          },
          closeFun: () {
            Get.back();
            Get.back();
          },
          childWidget: Column(
            children: [
              CommonButton(
                title: "Camera",
                backgroundColor: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.surface,
                prefixIcon: "assets/icon/icon_camera.png",
                prefixWidth: 20,
                prefixHeight: 20,
                fun: () => _getCameraImage(),
              ),
              const SizedBox(
                height: 10,
              ),
              CommonButton(
                title: "Library",
                backgroundColor: Theme.of(context).colorScheme.surface,
                borderColor: Theme.of(context).colorScheme.surface,
                prefixIcon: "assets/icon/icon_library.png",
                prefixWidth: 20,
                prefixHeight: 20,
                fun: () => _getPhotoLibraryImage(),
              ),
            ],
          ),
        );
      },
    );
  }

  _getCameraImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      _pickedFile = pickedFile;
    });
    Get.back();
  }

  _getPhotoLibraryImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedFile = pickedFile;
    });
    Get.back();
  }
}
