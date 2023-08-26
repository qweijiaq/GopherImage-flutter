import 'package:flutter/material.dart';

import 'components/post_create_form.dart';

class PostCreate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(16),
        child: SafeArea(
          child: PostCreateForm(),
        ),
      ),
    );
  }
}
