part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

class IndexPostsEvent extends PostsEvent {}

class IndexAdvertssEvent extends PostsEvent {}
