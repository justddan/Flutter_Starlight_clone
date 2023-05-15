import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_sub_text_container.dart';
import 'package:starlight_clone/models/mypage/attendance.dart';
import 'package:starlight_clone/screens/mypage/detail/components/attendance_list.dart';
import 'package:starlight_clone/util/constant.dart';

class AttendancePointScreen extends StatelessWidget {
  const AttendancePointScreen({super.key});

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
          "Attendance Point",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Theme.of(context).colorScheme.onSecondary,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 30,
                bottom: 15,
                left: 15,
                right: 15,
              ),
              child: Column(
                children: [
                  Text(
                    "My attendance point",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/icon/icon_daily_check.png",
                        color: Theme.of(context).colorScheme.secondary,
                        width: screenWidth / 18,
                        height: screenWidth / 18,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        numberFormat.format(18001051),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(fontSize: 20),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CommonSubTextContainer(
                    backgroundColor: Theme.of(context).colorScheme.surface,
                    subText:
                        "Star auction service is about to start.\nAttendance point is available at Star Auction.",
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 15),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return AttendanceList(
                    date: attendance[index].date,
                    title: attendance[index].title,
                    balance: attendance[index].balance,
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: attendance.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
