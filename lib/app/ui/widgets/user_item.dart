import 'package:flutter/material.dart';
import 'package:refactory_flutter_test/app/ui/widgets/list_item.dart';

class UserItem implements ListItem {
  final String content;

  UserItem(this.content);
  Widget buildContent(BuildContext context) => Text(content);
}