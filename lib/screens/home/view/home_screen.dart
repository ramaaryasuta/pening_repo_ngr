import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../../../core/extensions/context_extensions.dart';
import '../../../generated/assets.gen.dart';
import '../providers/home_provider.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/buttons/filled_button.dart';
import '../../../shared/widgets/drawer.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider homeP;

  final searchCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    homeP = Provider.of<HomeProvider>(context, listen: false);
    homeP.getAllPosts();
  }

  @override
  void dispose() {
    searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(title: 'PRN'),
      drawer: const MDrawer(),
      body: Consumer<HomeProvider>(
        builder: (context, homeP, child) {
          if (homeP.isLoading) {
            return const Center(child: CupertinoActivityIndicator());
          }

          if (homeP.posts.isEmpty && !homeP.isLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(Assets.lottie.emptyBox, height: 150),
                  Text(
                    'No posts found',
                    style: context.bodyMediumTextStyle!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              // final maxWidth = constraints.maxWidth;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // MTextField(
                      //   controller: searchCtrl,
                      //   labelText: 'Search',
                      //   showLabel: true,
                      //   hintText: 'Search Treasure...',
                      //   prefixIcon: const Icon(Icons.search),
                      // ),
                      // const SizedBox(height: 20),
                      Center(
                        child: Wrap(
                          spacing: 20,
                          runSpacing: 20,
                          children: homeP.posts.map((post) {
                            return ConstrainedBox(
                              constraints: const BoxConstraints(
                                minWidth: 280,
                                maxWidth: 320,
                              ),
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withValues(
                                          alpha: .3,
                                        ),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    spacing: 10,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AnyLinkPreview(
                                        link: post.links.first.url,
                                        displayDirection:
                                            UIDirection.uiDirectionVertical,
                                        showMultimedia: true,
                                        borderRadius: 6,
                                        backgroundColor: Colors.grey.shade100,
                                        bodyMaxLines: 3,
                                        bodyTextOverflow: TextOverflow.ellipsis,
                                        titleStyle: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        bodyStyle: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                        errorWidget: Container(
                                          width: double.infinity,
                                          height: 210,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: Colors.grey.shade100,
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                            border: Border.all(
                                              color: Colors.grey.shade300,
                                            ),
                                          ),
                                          child: const Text(
                                            'Failed to load preview',
                                          ),
                                        ),
                                      ),
                                      Text(
                                        post.title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: context.bodyMediumTextStyle!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        post.body,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: context.bodySmallTextStyle!
                                            .copyWith(color: Colors.grey),
                                      ),

                                      Container(
                                        width: double.infinity,
                                        margin: const EdgeInsets.only(top: 10),
                                        child: MFilledButton(
                                          onPressed: () {
                                            // TODO : change later
                                            launchUrl(
                                              Uri.parse(post.links.first.url),
                                              mode: LaunchMode
                                                  .externalApplication,
                                            );
                                          },
                                          child: const Text('Open'),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),

      floatingActionButton: Tooltip(
        message: 'Contribute to Community',
        child: FloatingActionButton(
          onPressed: () {
            context.go('/create-post');
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
