import 'package:flutter/material.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';

class AuctionBanner extends StatelessWidget {
  const AuctionBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFBCE4FD),
            Color(0xFFDF88FE),
          ],
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Special event vote",
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                "Star Auction",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(color: Colors.black),
              ),
            ],
          ),
          CommonShortRadiusButton(
            paddingVertical: 10,
            paddingHorizontal: 25,
            title: Text(
              "Go",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            backgroundColor: const Color(0xFF053B59),
            borderColor: Colors.transparent,
            fun: () {},
          )
        ],
      ),
    );
  }
}
