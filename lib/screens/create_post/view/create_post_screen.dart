import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pening_repository_ngr/screens/home/models/user_post_model.dart';
import '../../../core/extensions/context_extensions.dart';
import '../provider/create_post_provider.dart';
import 'widgets/add_links_dialog.dart';
import '../../../shared/utils/ui_helper.dart';
import '../../../shared/widgets/app_bar.dart';
import '../../../shared/widgets/buttons/filled_button.dart';
import '../../../shared/widgets/buttons/outline_button.dart';
import '../../../shared/widgets/drawer.dart';
import '../../../shared/widgets/snackbar.dart';
import '../../../shared/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../../auth/providers/auth_provider.dart';

class CreateScreen extends StatefulWidget {
  const CreateScreen({super.key});

  @override
  State<CreateScreen> createState() => _CreateScreenState();
}

class _CreateScreenState extends State<CreateScreen> {
  late CreatePostProvider createPostP;
  final scrollCtrl = ScrollController();

  final titleCtrl = TextEditingController();
  final descCtrl = TextEditingController();

  @override
  void initState() {
    createPostP = context.read<CreatePostProvider>();
    super.initState();
  }

  @override
  void dispose() {
    titleCtrl.dispose();
    descCtrl.dispose();
    super.dispose();
  }

  void validate() async {
    if (titleCtrl.text.isNotEmpty &&
        descCtrl.text.isNotEmpty &&
        createPostP.createPostData.links.isNotEmpty) {
      createPostP.setTitlePostData(titleCtrl.text);
      createPostP.setBodyPostData(descCtrl.text);

      final authP = context.read<AuthenticationProvider>();

      createPostP.setUserPostModel(
        UserPostModel(
          uid: authP.user!.uid,
          displayName: authP.user!.displayName!,
          email: authP.user!.email!,
          photoURL: authP.user!.photoURL!,
        ),
      );

      UiHelper.showLoadingDialog(context, isLoading: true);

      await createPostP.createPost(
        userId: authP.user!.uid,
        post: createPostP.createPostData,
      );

      if (mounted) {
        UiHelper.showLoadingDialog(context, isLoading: false);
        showSnackbar(
          context: context,
          message: 'Post created',
          status: SnackbarStatus.success,
        );
        context.go('/home');
      }
    } else {
      showSnackbar(
        context: context,
        message: 'Please fill all fields',
        status: SnackbarStatus.error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MAppBar(title: 'Create Post'),
      drawer: const MDrawer(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            controller: scrollCtrl,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create New Post Treasure',
                    style: context.titleLargeTextStyle!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Your treasure will be saved and shared with others users in the this platform.',
                    style: context.bodySmallTextStyle!.copyWith(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),
                  MTextField(
                    controller: titleCtrl,
                    showLabel: true,
                    labelText: 'Title',
                    hintText: 'Add title treasure',
                  ),

                  const SizedBox(height: 20),
                  MTextField(
                    controller: descCtrl,
                    showLabel: true,
                    labelText: 'Description',
                    hintText: 'Add description treasure',
                    minLines: 5,
                    maxLines: 10,
                  ),

                  const SizedBox(height: 40),
                  Text(
                    'Links Grouping',
                    style: context.titleLargeTextStyle!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Add links grouping in this section for your treasure.',
                    style: context.bodySmallTextStyle!.copyWith(
                      color: Colors.grey,
                    ),
                  ),

                  const SizedBox(height: 20),
                  Consumer<CreatePostProvider>(
                    builder: (context, createPostP, child) {
                      if (createPostP.createPostData.links.isEmpty) {
                        return const Center(child: Text('No links Yet..'));
                      }
                      return ListView(
                        shrinkWrap: true,
                        children: createPostP.createPostData.links.map((e) {
                          final isFirst =
                              createPostP.createPostData.links.indexOf(e) == 0;
                          return Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 5,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    spacing: 10,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        e.title,
                                        style: context.bodyMediumTextStyle!
                                            .copyWith(
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                      Text(
                                        e.url,
                                        style: context.bodySmallTextStyle!
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                if (isFirst)
                                  const Tooltip(
                                    message:
                                        'Generate Preview Image from this link if possible',
                                    child: Icon(
                                      Icons.image_outlined,
                                      color: Colors.grey,
                                    ),
                                  ),
                                IconButton(
                                  onPressed: () {
                                    createPostP.removeLinkPostData(
                                      createPostP.createPostData.links.indexOf(
                                        e,
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.delete_outline_rounded,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: MOutlineButton(
                      onPressed: () {
                        openAddNewLinksDialog(context);
                      },
                      icon: const Icon(Icons.link),
                      child: const Text('Add new Link'),
                    ),
                  ),

                  const SizedBox(height: 40),
                  SizedBox(
                    width: double.infinity,
                    child: MFilledButton(
                      onPressed: () {
                        validate();
                      },
                      child: const Text('Save Data'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
