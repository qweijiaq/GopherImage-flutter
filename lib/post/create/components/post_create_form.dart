import 'package:GopherImage/post/create/components/post_create_media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/components/app_button.dart';
import '../../../app/components/app_text_field.dart';
import '../../../app/exceptions/app_exception.dart';
import '../../../app/exceptions/validate_exception.dart';
import '../post_create_model.dart';

class PostCreateForm extends StatefulWidget {
  @override
  _PostCreateFormState createState() => _PostCreateFormState();
}

class _PostCreateFormState extends State<PostCreateForm> {
  // 表单 key
  final formKey = GlobalKey<FormState>();

  // 是否自动验证
  bool canValidate = true;

  // 文本编辑控制器
  final titleFieldController = TextEditingController();
  final contentFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();

    final title = context.read<PostCreateModel>().title;
    final content = context.read<PostCreateModel>().content;

    if (title != null) {
      titleFieldController.text = title;
    }

    if (content != null) {
      contentFieldController.text = content;
    }
  }

  @override
  Widget build(BuildContext context) {
    final postCreateModel = context.watch<PostCreateModel>();

    // 选择文件后设置标题
    if (postCreateModel.selectedFile != null && postCreateModel.title == null) {
      final title = postCreateModel.selectedFile!.name.split('.')[0];
      titleFieldController.text = title;
      postCreateModel.setTitle(title);
    }

    // 标题字段
    final titleField = AppTextField(
      labelText: '标题',
      controller: titleFieldController,
      enabled: !postCreateModel.loading,
      canValidate: canValidate,
      onChanged: (value) {
        postCreateModel.setTitle(value);
      },
    );

    // 正文字段
    final contentField = AppTextField(
      labelText: '正文',
      controller: contentFieldController,
      enabled: !postCreateModel.loading,
      canValidate: canValidate,
      isMultiline: true,
      onChanged: (value) {
        postCreateModel.setContent(value);
      },
    );

    // 验证
    validate() {
      final isValid = formKey.currentState!.validate();

      if (!isValid) {
        throw ValidateException();
      }
    }

    // 重置
    reset() {
      setState(() {
        titleFieldController.text = '';
        contentFieldController.text = '';
        canValidate = false;
        postCreateModel.reset();
      });
    }

    // 提交创建内容
    submitCreatePost() async {
      try {
        validate();

        postCreateModel.setLoading(true);
        final postId = await postCreateModel.createPost();
        await postCreateModel.createFile(postId: postId);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('内容发布成功！')),
        );

        reset();
      } on AppException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.message)),
        );
      } finally {
        postCreateModel.setLoading(false);
      }
    }

    // 提交按钮
    final submitButton = AppButton(
      text: '发布',
      onPressed: postCreateModel.loading ? null : submitCreatePost,
    );

    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostCreateMedia(),
          titleField,
          contentField,
          submitButton,
        ],
      ),
    );
  }
}
