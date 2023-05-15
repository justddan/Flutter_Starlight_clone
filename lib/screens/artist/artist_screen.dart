import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:starlight_clone/components/common_short_radius_button.dart';
import 'package:starlight_clone/models/home/group.dart';
import 'package:starlight_clone/screens/artist/artist_gallery_screen.dart';
import 'package:starlight_clone/screens/artist/components/community_write.dart';
import 'package:starlight_clone/screens/artist/new_post_screen.dart';
import 'package:starlight_clone/screens/artist/vote_screen.dart';
import 'package:starlight_clone/util/constant.dart';

class ArtistScreen extends StatefulWidget {
  final String rank;
  final String name;
  final String votes;
  final String poster;
  const ArtistScreen({
    super.key,
    required this.rank,
    required this.name,
    required this.votes,
    required this.poster,
  });

  @override
  State<ArtistScreen> createState() => _ArtistScreenState();
}

class _ArtistScreenState extends State<ArtistScreen> {
  bool isVisible = false;
  bool isGalleryTop = false;
  bool isCommunityTop = false;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.offset >
              scrollController.position.maxScrollExtent / 2 - 50 &&
          !isVisible) {
        setState(() {
          isVisible = true;
        });
      } else if (scrollController.offset <=
              scrollController.position.minScrollExtent / 2 &&
          isVisible) {
        setState(() {
          isVisible = false;
        });
      }
    });

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
          widget.name,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          widget.poster,
                          fit: BoxFit.cover,
                          width: screenWidth,
                          height: screenWidth,
                        ),
                        Positioned(
                          left: 10.0,
                          bottom: -10,
                          child: Stack(
                            children: [
                              Text(
                                widget.rank,
                                style: TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color = Colors.white,
                                ),
                              ),
                              Text(
                                widget.rank,
                                style: const TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.name,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(fontSize: 20),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              Text(
                                "${numberFormat.format(int.parse(widget.votes))} Votes",
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary),
                              ),
                            ],
                          ),
                          CommonShortRadiusButton(
                            paddingVertical: 6,
                            paddingHorizontal: 16,
                            title: Text(
                              "Vote",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: Colors.black, fontSize: 12),
                            ),
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                            borderColor: Colors.transparent,
                            fun: () {
                              Get.to(() => const VoteScreen());
                            },
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ];
          },
          body: Column(
            children: [
              Container(
                color: Colors.black,
                child: TabBar(
                  tabs: [
                    Tab(
                      child: Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "Photos",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: double.infinity,
                        color: Colors.black,
                        child: Center(
                          child: Text(
                            "Community",
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                      ),
                    ),
                  ],
                  indicatorWeight: 2,
                  unselectedLabelColor: Colors.grey,
                  labelColor: Colors.black,
                  indicatorColor: Colors.white,
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 3,
                      children: List.generate(groups.length, (index) {
                        return Hero(
                          tag: groups[index].id,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ArtistGalleyScreen(
                                    poster: groups[index].imgUrl,
                                    id: groups[index].id,
                                  ));
                            },
                            child: Image.asset(
                              groups[index].imgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }),
                    ),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return const CommunityWrite(
                          avatar: "assets/images/img_blackpink_1.png",
                          nickname: "will25pink",
                          reply: "12",
                          heart: "12",
                          text:
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since...",
                          date: "11.31.2022",
                          hasPicture: true,
                          picture: "assets/images/img_blackpink_1.png",
                        );
                      },
                      separatorBuilder: (context, index) => const SizedBox(
                        height: 35,
                      ),
                      itemCount: 2,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: isVisible,
        child: FloatingActionButton(
          onPressed: () {
            Get.to(() => const NewPostScreen());
          },
          backgroundColor: Theme.of(context).colorScheme.primary,
          child: Image.asset(
            "assets/icon/icon_plus.png",
            width: screenWidth / 24,
            height: screenWidth / 24,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
