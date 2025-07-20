import 'package:flutter/material.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../shared/widgets/base_dialog.dart';
import '../../../../shared/widgets/text_field.dart';
import 'package:provider/provider.dart';

import '../../../../shared/widgets/snackbar.dart';
import '../../../home/models/post_model.dart';
import '../../provider/create_post_provider.dart';

void openAddNewLinksDialog(BuildContext context) {
  final titleCtrl = TextEditingController();
  final urlCtrl = TextEditingController();

  void validate() {
    if (titleCtrl.text.isNotEmpty && urlCtrl.text.isNotEmpty) {
      final createPostP = context.read<CreatePostProvider>();

      createPostP.setLinksPostData(
        LinkPost(title: titleCtrl.text, url: urlCtrl.text),
      );

      Navigator.pop(context);
    } else {
      showSnackbar(
        context: context,
        message: 'Please fill all fields',
        status: SnackbarStatus.error,
      );
    }
  }

  baseDialog(
    context,
    onPressed: () {
      validate();
    },
    child: Column(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Add New Link',
          style: context.bodyLargeTextStyle!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        MTextField(
          controller: titleCtrl,
          showLabel: true,
          labelText: 'Link title',
        ),
        MTextField(controller: urlCtrl, showLabel: true, labelText: 'URL'),
      ],
    ),
  );
}
