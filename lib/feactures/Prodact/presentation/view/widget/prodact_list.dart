import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/data/prodact_table.dart';
import 'package:yumquickdashboard/core/widget/fliter_search_edit_and_delete_header.dart';

class ProdactList extends StatefulWidget {
  const ProdactList({super.key});

  @override
  State<ProdactList> createState() => _ProdactListState();
}

class _ProdactListState extends State<ProdactList> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.876,
      width: MediaQuery.sizeOf(context).width * 0.77,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.sizeOf(context).height * 0.0218,
          horizontal: MediaQuery.sizeOf(context).width * 0.0194,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FliterSearchEditAndDeleteHeader(),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.0145),
              ProdactsTable(),
            ],
          ),
        ),
      ),
    );
  }
}
