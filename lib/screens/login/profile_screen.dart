import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starlight_clone/components/common_button.dart';
import 'package:starlight_clone/components/common_radius_button.dart';
import 'package:starlight_clone/screens/login/login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  bool inLetter = false;
  bool noMark = false;
  String nickname = "";

  XFile? _pickedFile;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
          ),
          onPressed: () => Get.back(),
        ),
        title: Text(
          "New Account",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select your profile picture",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    _pickedFile == null
                        ? GestureDetector(
                            onTap: () {
                              _showBottomSheet();
                            },
                            child: Container(
                              width: screenWidth * 2 / 9,
                              height: screenWidth * 2 / 9,
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  width: 1,
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "assets/icon/icon_plus.png",
                                    color: Colors.white,
                                    width: screenWidth / 24,
                                    height: screenWidth / 24,
                                  ),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              _showBottomSheet();
                            },
                            child: Container(
                              width: screenWidth * 2 / 9,
                              height: screenWidth * 2 / 9,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: FileImage(
                                    File(_pickedFile!.path),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  "Enter your nickname",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _textEditingController,
                    style: Theme.of(context).textTheme.bodySmall,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onBackground,
                      hintText: "Enter your nickname",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: Colors.white.withOpacity(0.6)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      errorBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter your nickname.";
                      } else if (value.length > 15 || value.length < 5) {
                        setState(() {
                          inLetter = false;
                        });
                        return "Enter 5~15 letters.";
                      } else if (!RegExp(r"^[a-zA-Z0-9]+$").hasMatch(value)) {
                        setState(() {
                          noMark = false;
                        });
                        return "Don't enter exclamation mark.";
                      } else {
                        setState(() {
                          inLetter = true;
                          noMark = true;
                        });
                        return null;
                      }
                    },
                    onSaved: (newValue) {
                      setState(() {
                        nickname = newValue as String;
                      });
                    },
                    onChanged: (value) {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: screenWidth / 24,
                      color: inLetter
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "5~15 letters",
                        style: inLetter
                            ? Theme.of(context).textTheme.displayMedium
                            : Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.check,
                      size: screenWidth / 24,
                      color: noMark
                          ? Theme.of(context).colorScheme.primary
                          : Colors.white,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Text(
                        "No exclamation mark(!,#,\$,%,etc...)",
                        style: noMark
                            ? Theme.of(context).textTheme.displayMedium
                            : Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Visibility(
              visible: inLetter && noMark,
              child: Positioned(
                width: MediaQuery.of(context).size.width - 30,
                bottom: 30,
                child: CommonRadiusButton(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  borderColor: Theme.of(context).colorScheme.primary,
                  buttonText: "Next",
                  buttonTextColor: Colors.black,
                  fun: () => Get.offAll(const LoginScreen()),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showBottomSheet() {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Theme.of(context).colorScheme.onBackground,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select profile from",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const Image(
                        image: AssetImage("assets/icon/icon_cancel.png"),
                        width: 14,
                        height: 14,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
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
