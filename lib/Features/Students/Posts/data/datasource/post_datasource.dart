import '../model/adverts_model.dart';
import '../../../../../core/unified_api/api_variables.dart';
import '../../../../../core/unified_api/get_api.dart';

import '../model/post_model.dart';

class PostDatasource {
  Future<List<PostsModel>> indexposts() async {
    final getApi = GetApi(
        uri: ApiVariables().getPosts(), fromJson: indexPostsModelFromJson);
    return await getApi.callRequest();
  }

  Future<List<IndexAdvertsModel>> indexAdverts() async {
    final getApi = GetApi(
        uri: ApiVariables().getAdverts(), fromJson: indexAdvertsModelFromJson);
    return await getApi.callRequest();
  }
}
