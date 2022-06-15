import 'package:flutter/material.dart';

import 'delegate.dart';

class SliverHeader extends StatelessWidget {
  const SliverHeader(this.backgroundColor, this._title, {Key? key})
      : super(key: key);
  final Color backgroundColor;
  final String _title;

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      floating: false,
      delegate: Delegate(backgroundColor, _title),
    );
  }
}
