import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  final List<String> categories;
  final Function(String) onCategorySelected;
final String? selectedCategory;

  const CustomDropdown({
    super.key,
    required this.categories,
    required this.onCategorySelected,
    this.selectedCategory
    
  });


  @override
  // ignore: library_private_types_in_public_api
  _CategoryDropdownState createState() => _CategoryDropdownState();
}

class _CategoryDropdownState extends State<CustomDropdown> {
  

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.selectedCategory,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText:widget.selectedCategory ?? "Select Category",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      items:
          widget.categories.map((category) {
            return DropdownMenuItem<String>(
              value: category,
              child: Text(category),
            );
          }).toList(),
      onChanged: (value) {
        

        setState(() {
        });
        widget.onCategorySelected(value!);
      },
    );
  }
}
