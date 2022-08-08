import 'package:notice_app/models/post_model.dart';

abstract class HomeRepository {
  Future<List<PostModel>> getList();
}
