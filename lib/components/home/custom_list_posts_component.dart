import 'package:flutter/material.dart';
import 'package:notice_app/controllers/home_controller.dart';

import '../../models/post_model.dart';

class CustomListPostsComponent extends StatelessWidget {
  final HomeController controller;
  const CustomListPostsComponent({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<PostModel>>(
        valueListenable: controller.posts,
        builder: (_, list, __) {
          return ListView.separated(
            physics: const AlwaysScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, idx) => ListTile(
              leading: Text(list[idx].id.toString()),
              title: Text(list[idx].title),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Navigator.of(context)
                  .pushNamed('/details', arguments: list[idx]),
            ),
            separatorBuilder: (_, __) => const Divider(),
          );
        });
  }
}
