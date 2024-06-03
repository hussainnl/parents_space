import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:parent_space_new/controllers/post_controller.dart';
import 'package:parent_space_new/ui/screens/add_post_screen.dart';
import 'package:parent_space_new/ui/size_config.dart';
import 'package:parent_space_new/ui/them.dart';
import 'package:parent_space_new/ui/widgets/buttom.dart';
import 'package:parent_space_new/ui/screens/VideoScreen.dart';
import 'package:parent_space_new/ui/screens/CoursesScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PostController _postController = Get.put(PostController());
  final MediaController _mediaController = Get.put(MediaController());

  List<ClipRRect> catImages = [
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(color: Colors.tealAccent),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(color: Colors.black),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(color: Colors.black54),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(color: Colors.grey),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(color: Colors.amber),
    ),
    ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(color: Colors.tealAccent),
    ),
  ];

  int page = 0;
  late final PageController pageController;
  Timer? carouselTimer;

  Timer getTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      if (page == 5) {
        page = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          page,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOutCirc,
        );
      }
      page++;
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: 0, viewportFraction: .8);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      carouselTimer = getTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: false,
            expandedHeight: MediaQuery.of(context).size.height * .29,
            automaticallyImplyLeading: false, // هنا قمنا بإزالة زر الرجوع
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                margin: const EdgeInsets.only(top: 3),
                decoration: BoxDecoration(
                  color: Get.isDarkMode ? Colors.black : Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Get.isDarkMode
                          ? Colors.grey.withOpacity(.1)
                          : Colors.black26,
                      spreadRadius: 1,
                      blurRadius: .5,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    _addPostBar(),
                    _sliderBar(),
                  ],
                ),
              ),
            ),
          ),
          Obx(() {
            if (_postController.postList.isEmpty) {
              return SliverToBoxAdapter(
                child: _noPostMsg(),
              );
            } else {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    var post = _postController.postList[index];
                    return _buildPostCard(post, index);
                  },
                  childCount: _postController.postList.length,
                ),
              );
            }
          }),
        ],
      ),
    );
  }

  Widget _buildPostCard(Map<String, dynamic> post, int index) {
    Color? categoryBgColor;
    switch (post['category']) {
      case 'Problem':
        categoryBgColor = Get.isDarkMode ? Colors.red[900] : Colors.redAccent;
        break;
      case 'Advice':
        categoryBgColor =
            Get.isDarkMode ? Colors.green[900] : Colors.greenAccent;
        break;
      case 'Question':
        categoryBgColor = Get.isDarkMode ? Colors.blue[900] : Colors.blueAccent;
        break;
      default:
        categoryBgColor = Colors.grey;
    }

    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 3,
      ),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Get.isDarkMode ? Colors.black54 : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Get.isDarkMode ? Colors.black12 : Colors.black26,
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(post['imagePath']),
                    radius: 25,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post['name'],
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: categoryBgColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4, vertical: 2),
                            child: Text(
                              post['category'],
                              style: TextStyle(
                                fontSize: 10,
                                color: Get.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            DateFormat('dd MMM  hh:mm a').format(post['date']),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Get.isDarkMode ? Colors.white60 : Colors.black54,
                ),
                onPressed: () {
                  _showDeleteDialog(index);
                },
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            post['content'],
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 5),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.black,
            thickness: .3,
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 5),
                  Text('84'),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.comment),
                  SizedBox(width: 5),
                  Text('33 comments'),
                ],
              ),
              Icon(Icons.share),
            ],
          ),
        ],
      ),
    );
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Post'),
          content: const Text('Are you sure you want to delete this post?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                _postController.deleteTask(index);
                Get.back();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }

  Widget _sliderBar() {
    return Obx(() {
      final mediaList = _mediaController.mediaList.take(6).toList();
      return Container(
        margin: const EdgeInsets.only(top: 6, left: 20, bottom: 10),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 130,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Get.isDarkMode ? Colors.white : darkGreyClr,
              ),
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (index) {
                  page = index;
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  final mediaItem = mediaList[index];
                  return AnimatedBuilder(
                    animation: pageController,
                    builder: (context, child) => child!,
                    child: GestureDetector(
                      onTap: () {
                        Get.to(() => VideoScreen(
                            videoUrl: mediaItem['videoUrl']!,
                            relatedVideos:
                                _mediaController.mediaList.toList()));
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          mediaItem['imageUrl']!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: mediaList.length,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                mediaList.length,
                (index) => Container(
                  padding: const EdgeInsets.only(bottom: 7),
                  margin: const EdgeInsets.all(2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.circle,
                      size: 12,
                      color: page == index ? Colors.teal : Colors.teal[200],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _addPostBar() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome', style: subHeadingstyle),
              Text('Hussain', style: headingstyle),
            ],
          ),
          MyButton(
            label: "+ Add Task",
            onTap: () async {
              await Get.to(() => AddPostScreen());
            },
          ),
        ],
      ),
    );
  }

  Widget _noPostMsg() {
    return Center(
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 2000),
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                direction: SizeConfig.orientation == Orientation.landscape
                    ? Axis.horizontal
                    : Axis.vertical,
                children: [
                  if (SizeConfig.orientation == Orientation.landscape)
                    const SizedBox(height: 6)
                  else
                    const SizedBox(height: 200),
                  SvgPicture.asset(
                    'assets/Images/text-document.svg',
                    semanticsLabel: 'Post',
                    height: 90,
                    color: PrimaryClr.withOpacity(.5),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: Text(
                      'No posts yet!',
                      style: subTitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
