import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_radius_button.dart';

class EditNicknameScreen extends StatefulWidget {
  const EditNicknameScreen({super.key});

  @override
  State<EditNicknameScreen> createState() => _EditNicknameScreenState();
}

class _EditNicknameScreenState extends State<EditNicknameScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _textEditingController = TextEditingController();
  bool inLetter = false;
  bool noMark = false;
  String nickname = "";

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
          "Edit Nickname",
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
                Text(
                  "Enter your new nickname",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 10,
                ),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _textEditingController,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
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
                  fun: () {
                    Get.back();
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "Failed",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontSize: 16),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "You recently changed your nickname.\n Try again after 30 days.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(color: const Color(0xFFA4A29E)),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                      Get.back();
                                    },
                                    child: Text(
                                      "Close",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .primary,
                                          ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
