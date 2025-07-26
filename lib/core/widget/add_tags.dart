import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/core/widget/custom_text_filed.dart';

class AddTags extends StatefulWidget {
  const AddTags({super.key});

  @override
  State<AddTags> createState() => _AddTagsState();
}

class _AddTagsState extends State<AddTags> {
  final TextEditingController tagController = TextEditingController();
  final List<String> tags = ['T-Shirt', 'Men Clothes', 'Summer Collection'];

  void addTag(String tag) {
    if (tag.isNotEmpty && !tags.contains(tag)) {
      setState(() {
        tags.add(tag);
      });
      tagController.clear();
    }
  }

  void removeTag(String tag) {
    setState(() {
      tags.remove(tag);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.243,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0169,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tags',
              style: AppStayls.styleInterBold16(
                context,
              ).copyWith(color: AppColor.kDarkRed),
            ),
            SizedBox(height: 20),
            CustomTextFiled(
              controller: tagController,
              helperText: 'Add Tags',
              hintText: 'Enter tag name',
              onSubmitted: addTag,
            ),
            SizedBox(height: 20),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children:
                  tags
                      .map(
                        (tag) => Chip(
                          label: Text(tag),
                          backgroundColor: Colors.grey.shade200,
                          deleteIcon: Icon(Icons.close, size: 16),
                          onDeleted: () => removeTag(tag),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
