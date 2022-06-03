import 'package:flutter/material.dart';
import 'package:logging/logging.dart';

mixin PaginationMixer<T extends StatefulWidget> on State<T> {
  final ScrollController _scrollController = ScrollController();

  ScrollController get paginationScrollController => _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _logger.fine('Scrolled to end of page');
        onEndOfScroll();
      }
    });
  }

  void onEndOfScroll();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

// ignore: unused_element
final Logger _logger = Logger('PaginationMixer');
