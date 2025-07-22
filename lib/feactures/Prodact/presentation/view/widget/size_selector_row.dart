import 'package:flutter/material.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/custom_drop_button_size_selector_method.dart';
import 'package:yumquickdashboard/feactures/Prodact/presentation/view/widget/custom_selected_values_method.dart';

class SizeSelectorRow extends StatefulWidget {
  const SizeSelectorRow({super.key});

  @override
  State<SizeSelectorRow> createState() => _SizeSelectorRowState();
}

class _SizeSelectorRowState extends State<SizeSelectorRow> {
  String? selectedSize;
  List<String> selectedSizes = [];

  final List<String> allSizes = ['XS', 'S', 'M', 'L', 'XL', 'XXL', 'XXXL'];

  void addSelectedSize() {
    if (selectedSize != null && !selectedSizes.contains(selectedSize)) {
      setState(() {
        selectedSizes.add(selectedSize!);
      });
    }
  }

  void removeSize(String size) {
    setState(() {
      selectedSizes.remove(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        customDropButtonSizeSelector(
          context,
          value: selectedSize,
          onChanged: (value) {
            setState(() {
              selectedSize = value;
            });
            addSelectedSize();
          },
          items:
              allSizes.map((size) {
                return DropdownMenuItem<String>(value: size, child: Text(size));
              }).toList(),
        ),

        const SizedBox(width: 10),

        customSelectedValues(
          context,
          selectedSizes: selectedSizes,
          removeSize: removeSize,
        ),
      ],
    );
  }
}
