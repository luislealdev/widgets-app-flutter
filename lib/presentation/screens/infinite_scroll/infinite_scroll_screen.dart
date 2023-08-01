import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  ScrollController scrollController = ScrollController();
  List<int> imagesIds = [1, 2, 3, 4, 5];
  bool isLoading = false;
  bool isMounted = true;

  Future loadNextPage() async {
    if (isLoading) return;
    setState(() {});

    isLoading = true;

    await Future.delayed(const Duration(seconds: 1));

    addFiveImages();
    isLoading = false;
    setState(() {});
    scrollToBottom();
  }

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  Future<void> onRefresh() async {
    if (!isMounted) return;
    isLoading = true;
    setState(() {});
    await Future.delayed(const Duration(seconds: 3));
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();
    isLoading = false;
    setState(() {});
  }

  void scrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(scrollController.position.pixels + 120,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    isMounted = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(children: [
          MediaQuery.removePadding(
            context: context,
            removeTop: true,
            removeBottom: true,
            child: RefreshIndicator(
              edgeOffset: 10,
              strokeWidth: 2,
              onRefresh: onRefresh,
              child: ListView.builder(
                  controller: scrollController,
                  itemCount: imagesIds.length,
                  itemBuilder: (context, index) {
                    return FadeInImage(
                        placeholder:
                            const AssetImage("assets/images/jar-loading.gif"),
                        image: NetworkImage(
                            "https://picsum.photos/id/${imagesIds[index]}/500/300"));
                  }),
            ),
          ),
          isLoading
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: FadeOut(
                      child: SpinPerfect(
                        child: const Icon(
                          Icons.change_circle_outlined,
                          size: 50,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox()
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.pop();
          },
          child: const Icon(Icons.arrow_back),
        ));
  }
}
