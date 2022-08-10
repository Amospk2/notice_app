import 'package:flutter/material.dart';
import 'package:notice_app/components/home/custom_list_posts_component.dart';
import 'package:notice_app/controllers/home_controller.dart';
import 'package:notice_app/services/prefs_services.dart';

import '../repositories/home_repository_imp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = HomeController(HomeRepositoryImp());

  @override
  void initState() {
    super.initState();
    _controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                PrefsServices.logout();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/login', (_) => true);
              },
              icon: const Icon(Icons.logout)),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: ValueListenableBuilder<bool>(
            valueListenable: _controller.postInLoader,
            builder: (_, inLoader, __) => inLoader
                ? const CircularProgressIndicator()
                : CustomListPostsComponent(controller: _controller),
          ),
        ),
      ),
    );
  }
}
