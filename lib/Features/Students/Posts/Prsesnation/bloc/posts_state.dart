part of 'posts_bloc.dart';

class PostsState {
  final RequestStatus status;
  final List<PostsModel> posts;
  final RequestStatus advertStatus;
  final List<IndexAdvertsModel> adverts;

  PostsState({
    this.status = RequestStatus.init,
    this.posts = const [],
    this.advertStatus = RequestStatus.init,
    this.adverts = const [],
  });

  PostsState copyWith({
    RequestStatus? status,
    List<PostsModel>? posts,
    RequestStatus? advertStatus,
    List<IndexAdvertsModel>? adverts,
  }) {
    return PostsState(
      status: status ?? this.status,
      posts: posts ?? this.posts,
      advertStatus: advertStatus ?? this.advertStatus,
      adverts: adverts ?? this.adverts,
    );
  }
}
