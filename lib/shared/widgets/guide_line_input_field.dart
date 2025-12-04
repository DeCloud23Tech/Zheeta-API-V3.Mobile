import 'package:flutter/material.dart';
import 'package:zheeta/core/constants/color.dart';

class GuidelinesInputWithCheckbox extends StatefulWidget {
  final String hintText;
  final String text;
  final Function(List<String>) onGuidelinesChanged;

  const GuidelinesInputWithCheckbox({
    super.key,
    required this.hintText,
    required this.text,
    required this.onGuidelinesChanged,
  });

  @override
  GuidelinesInputWithCheckboxState createState() =>
      GuidelinesInputWithCheckboxState();
}

class GuidelinesInputWithCheckboxState
    extends State<GuidelinesInputWithCheckbox> {
  final List<TextEditingController> _controllers = [];
  bool _isChecked = false;
  static const int maxGuidelines = 3; // Maximum number of guidelines

  @override
  void initState() {
    super.initState();
    _addNewField(); // Add the first input field
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose(); // Dispose controllers to prevent memory leaks
    }
    super.dispose();
  }

  void _addNewField() {
    if (_controllers.length < maxGuidelines) {
      final controller = TextEditingController();
      _controllers.add(controller);
      widget.onGuidelinesChanged(_getGuidelines());
      setState(() {});
    }
  }

  void _removeField(int index) {
    if (_controllers.isNotEmpty) {
      _controllers[index].dispose();
      _controllers.removeAt(index);
      widget.onGuidelinesChanged(_getGuidelines());
      setState(() {});
    }
  }

  List<String> _getGuidelines() {
    return _controllers.map((controller) => controller.text.trim()).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: AppColors.hintText,
              width: 1.0, // Border width
            ),
          ),
          child: Row(
            children: [
              Checkbox(
                checkColor: AppColors.primaryDark,
                activeColor: AppColors.secondaryLight,
                side: BorderSide(
                  color: AppColors.primaryDark,
                  width: 1.0,
                ),
                value: _isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
                },
              ),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Offstage(
          offstage: !_isChecked,
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _controllers.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        flex: 9,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: TextFormField(
                            controller: _controllers[index],
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.white,
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 10),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 0.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.primaryDark, width: 1.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.red, width: 0.5),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 0.5),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.red, width: 1.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: AppColors.grey, width: 0.5),
                              ),
                              hintText: '${widget.hintText} ${index + 1}',
                              hintStyle: TextStyle(
                                  color: AppColors.grey.withValues(alpha: 0.5),
                                  fontSize: 14),
                              errorStyle: const TextStyle(color: Colors.red),
                            ),
                            onChanged: (value) {
                              widget.onGuidelinesChanged(_getGuidelines());
                            },
                          ),
                        ),
                      ),
                      if (index != 0)
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () => _removeField(index),
                            icon: const Icon(
                              Icons.delete_forever_outlined,
                              color: AppColors.grey,
                              size: 18,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
              Align(
                alignment: Alignment.topLeft,
                child: TextButton.icon(
                  onPressed: _addNewField,
                  icon: const Icon(Icons.add, color: AppColors.black, size: 15),
                  label: const Text(
                    'Add Another',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
