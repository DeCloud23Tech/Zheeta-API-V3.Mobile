import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/common/constants/color.dart';

class InputField extends StatefulWidget {
  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool password;
  final int minLine;
  final int maxLine;
  final VoidCallback? onTap;
  final bool readonly;
  final String? initialValue;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;

  const InputField({
    super.key,
    this.controller,
    this.hintText,
    this.password = false,
    this.onChanged,
    this.validator,
    this.minLine = 1,
    this.maxLine = 1,
    this.onTap,
    this.readonly = false,
    this.initialValue,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: TextFormField(
        initialValue: widget.initialValue,
        onTap: widget.onTap,
        autocorrect: false,
        obscureText: widget.password ? obscure : false,
        style: TextStyle(
          color: AppColors.black,
          fontSize: 14,
        ),
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        onChanged: widget.onChanged,
        minLines: widget.minLine,
        maxLines: widget.maxLine,
        readOnly: widget.readonly,
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.grey, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.primaryDark, width: 1.0),
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
          hintText: widget.hintText,
          hintStyle:
              TextStyle(color: AppColors.grey.withOpacity(0.5), fontSize: 14),
          errorStyle: const TextStyle(color: Colors.red),
          suffixIcon: widget.suffixIcon ??
              (widget.password
                  ? InkWell(
                      onTap: () => setState(() {
                        obscure = !obscure;
                      }),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: obscure
                              ? SvgPicture.asset(
                                  "assets/images/icons/eye_closed.svg")
                              : SvgPicture.asset("assets/images/icons/eye.svg"),
                        ),
                      ),
                    )
                  : SizedBox()),
        ),
        validator: widget.validator,
      ),
    );
  }
}




class DropdownInputField extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool password;
  final List<String> items;
  final String? value;
  final VoidCallback? onTap;
  final String? searchHintText;
  final bool showSearch;
  final Widget? searchPrefixIcon;
  final Widget? searchSuffixIcon;
  final TextStyle? searchTextStyle;
  final Color? searchBackgroundColor;
  final InputBorder? searchBorder;
  final EdgeInsets? searchPadding;
  final Widget? noResultsWidget;
  final DropdownPosition dropdownPosition;

  const DropdownInputField({
    super.key,
    this.controller,
    this.hintText,
    this.password = false,
    this.onChanged,
    this.validator,
    required this.items,
    this.value,
    this.onTap,
    this.searchHintText,
    this.showSearch = true,
    this.searchPrefixIcon,
    this.searchSuffixIcon,
    this.searchTextStyle,
    this.searchBackgroundColor,
    this.searchBorder,
    this.searchPadding,
    this.noResultsWidget,
    this.dropdownPosition = DropdownPosition.auto,
  });

  @override
  State<DropdownInputField> createState() => _DropdownInputFieldState();
}

enum DropdownPosition {
  above,
  below,
  auto // Will automatically choose based on available space
}

class _DropdownInputFieldState extends State<DropdownInputField> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  List<String> filteredItems = [];
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;
  late DropdownPosition _effectivePosition;

  @override
  void initState() {
    super.initState();
    filteredItems = widget.items;
    _searchController.addListener(_filterItems);
    _searchFocusNode.addListener(_onSearchFocusChanged);
    _effectivePosition = widget.dropdownPosition;
  }

  @override
  void didUpdateWidget(covariant DropdownInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.items != widget.items) {
      _filterItems();
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    // _searchFocusNode.dispose();
    // _removeOverlay();
    super.dispose();
  }

  void _onSearchFocusChanged() {
    if (!_searchFocusNode.hasFocus && _searchController.text.isEmpty) {
      _removeOverlay();
    }
  }

  void _filterItems() {
    final searchText = _searchController.text.toLowerCase();
    setState(() {
      if (searchText.isEmpty) {
        filteredItems = widget.items;
      } else {
        // Split search terms by whitespace
        final searchTerms = searchText.split(' ');

        filteredItems = widget.items.where((item) {
          final lowerItem = item.toLowerCase();
          // Match all search terms (AND logic)
          return searchTerms.every((term) => lowerItem.contains(term));
        }).toList();
      }
    });
  }

  void _showOverlay() {
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    // Calculate available space above and below
    final screenHeight = MediaQuery.of(context).size.height;
    final spaceBelow = screenHeight - offset.dy - size.height;
    final spaceAbove = offset.dy;

    // Determine position if auto is selected
    if (widget.dropdownPosition == DropdownPosition.auto) {
      _effectivePosition = spaceBelow > spaceAbove
          ? DropdownPosition.below
          : DropdownPosition.above;
    } else {
      _effectivePosition = widget.dropdownPosition;
    }

    // Calculate offset based on position
    double verticalOffset;
    if (_effectivePosition == DropdownPosition.below) {
      verticalOffset = size.height + 5;
    } else {
      verticalOffset = -MediaQuery.of(context).size.height * .45; // Start above the widget
    }

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, verticalOffset),
          child: Material(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxHeight: _calculateMaxHeight(
                    _effectivePosition == DropdownPosition.below
                        ? spaceBelow
                        : spaceAbove
                ),
              ),
              decoration: BoxDecoration(
                color: widget.searchBackgroundColor ??
                    Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Reverse order if showing above
                  if (_effectivePosition == DropdownPosition.above) ...[
                    if (filteredItems.isNotEmpty) _buildListItems(),
                    if (widget.showSearch) _buildSearchField(),
                  ] else ...[
                    if (widget.showSearch) _buildSearchField(),
                    if (filteredItems.isNotEmpty) _buildListItems(),
                  ],
                  if (filteredItems.isEmpty) _buildNoResults(),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
    setState(() => _isDropdownOpen = true);
  }

  double _calculateMaxHeight(double availableSpace) {
    const minHeight = 100.0; // Minimum height for dropdown
    const maxHeightFactor = 0.4; // Max 40% of screen height
    final screenHeight = MediaQuery.of(context).size.height;

    return availableSpace.clamp(
        minHeight,
        screenHeight * maxHeightFactor
    );
  }

  Widget _buildSearchField() {
    return Column(
      children: [
        Padding(
          padding: widget.searchPadding ?? const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            focusNode: _searchFocusNode,
            style: widget.searchTextStyle,
            decoration: InputDecoration(
              hintText: widget.searchHintText ?? 'Search...',
              prefixIcon: widget.searchPrefixIcon ?? const Icon(Icons.search),
              suffixIcon: _searchController.text.isNotEmpty
                  ? IconButton(
                icon: widget.searchSuffixIcon ?? const Icon(Icons.clear),
                onPressed: () {
                  _searchController.clear();
                  _searchFocusNode.requestFocus();
                },
              )
                  : null,
              border: widget.searchBorder ?? const OutlineInputBorder(),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 8, vertical: 12),
              isDense: true,
            ),
            autofocus: true,
          ),
        ),
        const Divider(height: 1),
      ],
    );
  }

  Widget _buildListItems() {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (notification) {
          if (notification is UserScrollNotification &&
              notification.direction != ScrollDirection.idle) {
            _searchFocusNode.unfocus();
          }
          return false;
        },
        child: Scrollbar(
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            itemCount: filteredItems.length,
            itemBuilder: (context, index) {
              final item = filteredItems[index];
              final isSelected = item == widget.value;
              return InkWell(
                onTap: () {
                  widget.onChanged?.call(item);
                  _removeOverlay();
                },
                child: Container(
                  color: isSelected
                      ? Theme.of(context).primaryColor.withOpacity(0.1)
                      : null,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16, vertical: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          item,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      if (isSelected)
                        Icon(
                          Icons.check,
                          size: 18,
                          color: Theme.of(context).primaryColor,
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _removeOverlay() {
    _searchFocusNode.unfocus();
    _overlayEntry?.remove();
    _overlayEntry = null;
    _searchController.clear();

    if (mounted) {
      setState(() {
        _isDropdownOpen = false;
        filteredItems = widget.items;
      });
    }
  }


  void _toggleDropdown() {
    if (_isDropdownOpen) {
      _removeOverlay();
    } else {
      _showOverlay();
    }
    widget.onTap?.call();
  }

  Widget _buildNoResults() {
    return widget.noResultsWidget ??
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'No results found',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: CompositedTransformTarget(
        link: _layerLink,
        child: GestureDetector(
          onTap: _toggleDropdown,
          child: InputDecorator(
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.white,
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 14),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primaryDark, width: 1.0),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.red, width: 1.0),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(8),
              ),
              errorStyle: const TextStyle(color: Colors.red),
              suffixIcon: Icon(
                _isDropdownOpen
                    ? _effectivePosition == DropdownPosition.below
                    ? Icons.arrow_drop_up
                    : Icons.arrow_drop_down
                    : _effectivePosition == DropdownPosition.below
                    ? Icons.arrow_drop_down
                    : Icons.arrow_drop_up,
                color: Colors.grey,
              ),
            ),
            isEmpty: widget.value == null,
            child: Text(
              widget.value ?? widget.hintText ?? 'Select an option',
              style: widget.value == null
                  ? TextStyle(color: AppColors.grey.withOpacity(0.5))
                  : TextStyle(color: AppColors.black, fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}