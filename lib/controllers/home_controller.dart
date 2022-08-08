
import 'package:flutter/material.dart';
import 'package:notice_app/models/post_model.dart';
import 'package:notice_app/repositories/home_repository.dart';

class HomeController {
  final HomeRepository _homeRepository;

  HomeController(this._homeRepository);

  ValueNotifier<List<PostModel>> posts = ValueNotifier<List<PostModel>>([]);
  ValueNotifier<bool> postInLoader = ValueNotifier<bool>(false);

  fetch() async {
    postInLoader.value = true;
    posts.value = await _homeRepository.getList();
    postInLoader.value = false;
  }
}
