import 'package:flutter/material.dart';
import 'package:metabolicapp/core/themes/app_theme.dart';

class SwipeableSectionWidget extends StatefulWidget {
  final String title;
  final String actionText;
  final VoidCallback onActionTap;
  final Widget dailyWidget;
  final Widget weeklyWidget;

  const SwipeableSectionWidget({
    super.key,
    required this.title,
    required this.actionText,
    required this.onActionTap,
    required this.dailyWidget,
    required this.weeklyWidget,
  });

  @override
  State<SwipeableSectionWidget> createState() => _SwipeableSectionWidgetState();
}

class _SwipeableSectionWidgetState extends State<SwipeableSectionWidget>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTabTap(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [_buildHeader(), _buildTabSelector(), _buildContent()],
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.title,
            style: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
          ),
          TextButton(
            onPressed: widget.onActionTap,
            style: TextButton.styleFrom(
              foregroundColor: AppTheme.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            ),
            child: Text(
              widget.actionText,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabSelector() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(child: _buildTab('Daily', 0)),
          Expanded(child: _buildTab('Weekly', 1)),
        ],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final bool isSelected = _currentIndex == index;

    return GestureDetector(
      onTap: () => _onTabTap(index),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      height: 320, // Fixed height to prevent overflow
      padding: const EdgeInsets.all(16),
      child: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: [
          _buildPageContent(widget.dailyWidget),
          _buildPageContent(widget.weeklyWidget),
        ],
      ),
    );
  }

  Widget _buildPageContent(Widget child) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: child,
    );
  }
}
