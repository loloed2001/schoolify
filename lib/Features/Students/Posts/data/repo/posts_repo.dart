import 'package:dartz/dartz.dart';

import '../../../../../core/error/failures.dart';
import '../../../../../core/unified_api/handling_exception_manager.dart';
import '../datasource/post_datasource.dart';
import '../model/adverts_model.dart';
import '../model/post_model.dart';

class PostsRepo with HandlingExceptionManager {
  Future<Either<Failure, List<PostsModel>>> indexPosts() async {
    return wrapHandling(tryCall: () async {
      return await PostDatasource().indexposts();
    });
  }

  Future<Either<Failure, List<IndexAdvertsModel>>> indexAdverts(
      String id) async {
    return wrapHandling(tryCall: () async {
      return await PostDatasource().indexAdverts(id);
    });
  }
}
