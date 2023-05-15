import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_sub_text_container.dart';
import 'package:starlight_clone/util/constant.dart';

class DailyStampScreen extends StatelessWidget {
  const DailyStampScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          "Daily Stamp",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CommonSubTextContainer(
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              prefixIcon: "assets/icon/icon_daily_stamp.png",
              prefixIconColor: Theme.of(context).colorScheme.secondary,
              title: "Daily Stamps",
              suffixText: "28",
            ),
            const SizedBox(
              height: 10,
            ),
            CommonSubTextContainer(
              backgroundColor: Theme.of(context).colorScheme.onSecondary,
              prefixIcon: "assets/icon/icon_daily_check.png",
              prefixIconColor: Theme.of(context).colorScheme.secondary,
              title: "Attendance point",
              suffixText: numberFormat.format(28000),
              subText:
                  "Star auction service is about to start.\nAttendance point is available at Star Auction.",
              subTextColor: Colors.white.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}
