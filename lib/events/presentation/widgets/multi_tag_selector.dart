import 'package:flutter/material.dart';
import 'package:zheeta/app/common/color.dart';

class MultiSelectTags extends StatefulWidget {
  final List<String> tags;
  final Function(List<String>) onTagsChanged;

  const MultiSelectTags({
    Key? key,
    required this.tags,
    required this.onTagsChanged,
  }) : super(key: key);

  @override
  _MultiSelectTagsState createState() => _MultiSelectTagsState();
}

class _MultiSelectTagsState extends State<MultiSelectTags> {
  List<String> selectedTags = [];

  void _addTag(String tag) {
    if (!selectedTags.contains(tag)) {
      setState(() {
        selectedTags.add(tag);
      });
      widget.onTagsChanged(selectedTags);
    }
  }

  void _removeTag(String tag) {
    setState(() {
      selectedTags.remove(tag);
    });
    widget.onTagsChanged(selectedTags);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 0),
          child: DropdownButtonFormField<String>(
            hint: Text(
              'Select tags',
              style: TextStyle(
                color: AppColors.grey.withOpacity(0.5),
              ),
            ),
            style: TextStyle(
              color: AppColors.black,
              fontSize: 14,
            ),
            items: widget.tags
                .map((tag) => DropdownMenuItem<String>(
                      value: tag,
                      child: Text(tag),
                    ))
                .toList(),
            onChanged: (value) {
              if (value != null) _addTag(value);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey, width: 0.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(color: AppColors.primaryDark, width: 1.0),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 0.5),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey, width: 0.5),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 1.0),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey, width: 0.5),
              ),
              errorStyle: const TextStyle(color: Colors.red),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Wrap(
          spacing: 5.0,
          runSpacing: 0.0,
          children: selectedTags
              .map(
                (tag) => Chip(
                  color:
                      WidgetStateProperty.all<Color>(AppColors.secondarySwirl),
                  side: BorderSide(color: AppColors.secondarySwirl),
                  padding: EdgeInsets.zero,
                  label: Text(
                    tag,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  deleteIcon: const Icon(Icons.close),
                  onDeleted: () => _removeTag(tag),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
