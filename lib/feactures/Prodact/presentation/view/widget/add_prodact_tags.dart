import 'package:flutter/material.dart';
import 'package:yumquickdashboard/core/utils/app_color.dart';
import 'package:yumquickdashboard/core/utils/app_stayls.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/add_prodact_text_filed.dart';

class AddProdactTags extends StatefulWidget {
  const AddProdactTags({super.key});

  @override
  State<AddProdactTags> createState() => _AddProdactTagsState();
}

class _AddProdactTagsState extends State<AddProdactTags> {
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
            AddProdactTextFiled(
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
