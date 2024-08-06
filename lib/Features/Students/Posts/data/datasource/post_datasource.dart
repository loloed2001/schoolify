import '../../../../../core/unified_api/api_variables.dart';
import '../../../../../core/unified_api/get_api.dart';
import '../model/adverts_model.dart';
import '../model/post_model.dart';

class PostDatasource {
  Future<List<PostsModel>> indexposts() async {
    final getApi = GetApi(
        uri: ApiVariables().getPosts(), fromJson: indexPostsModelFromJson);
    return await getApi.callRequest();
  }

  Future<List<IndexAdvertsModel>> indexAdverts(String id) async {
    final getApi = GetApi(
        uri: ApiVariables().getAdverts(id),
        fromJson: indexAdvertsModelFromJson);
    return await getApi.callRequest();
  }
}
