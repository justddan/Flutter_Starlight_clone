import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_poster.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/models/home/group.dart';
import 'package:starlight_clone/screens/artist/artist_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          "Search",
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [];
        },
        body: Column(
          children: [
            Container(
              color: Colors.black,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        TextField(
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w300,
                                  ),
                          decoration: InputDecoration(
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.asset(
                                'assets/icon/icon_search.png',
                                width: screenWidth / 22.5,
                                height: screenWidth / 22.5,
                                fit: BoxFit.contain,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 17,
                              horizontal: 15,
                            ),
                            hintText: "Search by name or group",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.white.withOpacity(0.5)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.white.withOpacity(0.2),
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
                            fillColor:
                                Theme.of(context).colorScheme.onBackground,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            CommonShortRadiusButton(
                              paddingVertical: 10,
                              paddingHorizontal: 15,
                              title: Text(
                                "Girl Group",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: _selectedIndex == 0
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                              ),
                              backgroundColor: _selectedIndex == 0
                                  ? Colors.white
                                  : Colors.black,
                              borderColor: Colors.white,
                              fun: () {
                                setState(() {
                                  _selectedIndex = 0;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CommonShortRadiusButton(
                              paddingVertical: 10,
                              paddingHorizontal: 15,
                              title: Text(
                                "Boy Group",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: _selectedIndex == 1
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                              ),
                              backgroundColor: _selectedIndex == 1
                                  ? Colors.white
                                  : Colors.black,
                              borderColor: Colors.white,
                              fun: () {
                                setState(() {
                                  _selectedIndex = 1;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            CommonShortRadiusButton(
                              paddingVertical: 10,
                              paddingHorizontal: 15,
                              title: Text(
                                "Solo",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: _selectedIndex == 2
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                              ),
                              backgroundColor: _selectedIndex == 2
                                  ? Colors.white
                                  : Colors.black,
                              borderColor: Colors.white,
                              fun: () {
                                setState(() {
                                  _selectedIndex = 2;
                                });
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: Color(0xFF5D5D5D),
                    thickness: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 7.5,
                  horizontal: 15,
                ),
                child: GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 50 / 61,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 15,
                  children: List.generate(groups.length, (index) {
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          () => ArtistScreen(
                            rank: (index + 1).toString(),
                            name: groups[index].name,
                            votes: groups[index].votes,
                            poster: groups[index].imgUrl,
                          ),
                        );
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CommonPoster(
                              posterUrl: groups[index].imgUrl,
                              length: screenWidth * 5 / 18,
                              radius: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            groups[index].name,
                            style: Theme.of(context).textTheme.headlineSmall,
                          )
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
