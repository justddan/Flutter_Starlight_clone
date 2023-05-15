import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:starlight_clone/components/common_radius_button.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({
    super.key,
  });

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final TextEditingController textController = TextEditingController();

  CroppedFile? _croppedFile;

  getImage() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      CroppedFile? cropped = await ImageCropper().cropImage(
        sourcePath: image.path,
        compressQuality: 100,
        compressFormat: ImageCompressFormat.jpg,
        uiSettings: [
          AndroidUiSettings(
            toolbarColor: Colors.black,
            toolbarTitle: "Cropper",
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: "Cropper",
          )
        ],
      );

      if (cropped != null) {
        setState(() {
          _croppedFile = cropped;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () => Get.back(),
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
        title: Text(
          "New Post",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onBackground,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 1),
                    ),
                    width: screenWidth * 7 / 36,
                    height: screenWidth * 7 / 36,
                    child: _croppedFile != null
                        ? Image.file(
                            File(_croppedFile!.path),
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.add_rounded, color: Colors.white),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Flexible(
                  child: TextField(
                    controller: textController,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      hintText: "Enter the content here.",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(
                              fontWeight: FontWeight.w300,
                              color: Colors.white.withOpacity(0.5)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.onBackground,
                    ),
                    minLines: 3,
                    maxLines: 10,
                  ),
                )
              ],
            ),
            Column(
              children: [
                textController.value.text.isEmpty
                    ? CommonRadiusButton(
                        backgroundColor: Colors.black,
                        borderColor: Theme.of(context).colorScheme.primary,
                        buttonText: "Post without text",
                        buttonTextColor: Theme.of(context).colorScheme.primary,
                        fun: () {},
                      )
                    : CommonRadiusButton(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        borderColor: Colors.transparent,
                        buttonText: "Post",
                        buttonTextColor: Colors.black,
                        fun: () {
                          if (textController.value.text.isNotEmpty) {
                            Get.back();
                          } else {
                            return;
                          }
                        },
                      ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
