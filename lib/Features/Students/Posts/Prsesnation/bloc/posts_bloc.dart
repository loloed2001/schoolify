import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/model/adverts_model.dart';
import '../../data/model/post_model.dart';
import '../../data/repo/posts_repo.dart';
import '../../../../../core/shared/request_status.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsState()) {
    on<IndexPostsEvent>((event, emit) async {
      emit(state.copyWith(status: RequestStatus.loading));
      final result = await PostsRepo().indexPosts();
      result.fold((l) {
        emit(state.copyWith(status: RequestStatus.failed));
      }, (r) {
        emit(
          state.copyWith(status: RequestStatus.success, posts: r),
        );
      });
    });
    on<IndexAdvertssEvent>((event, emit) async {
      emit(state.copyWith(advertStatus: RequestStatus.loading));
      final result = await PostsRepo().indexAdverts();
      result.fold((l) {
        emit(state.copyWith(advertStatus: RequestStatus.failed));
      }, (r) {
        emit(
          state.copyWith(advertStatus: RequestStatus.success, adverts: r),
        );
      });
    });
  }
}
