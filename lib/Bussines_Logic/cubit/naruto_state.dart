part of 'naruto_cubit.dart';

abstract class NarutoState {}

class NarutoInitial extends NarutoState {}

class NarutoLoaded extends NarutoState {
  List<CharacterModel> characterModel;
  NarutoLoaded(
    this.characterModel,
  );
}

class NarutoLoading extends NarutoState {}

class AllAnimeLoading extends NarutoState {}
class AllAnimeLoaded extends NarutoState {}

class QutoeLoading extends NarutoState {}
class QutoeLoaded extends NarutoState {}



class ChangeCurrentIndex extends NarutoState {}


class NarutoErorr extends NarutoState {}

class SearchedForItem extends NarutoState {}

class StartSearched extends NarutoState {}

class IsSearched extends NarutoState {}


class ClearController extends NarutoState {}

class StartSearched2 extends NarutoState {}

class ClearController2 extends NarutoState {}

class FilterListForItems extends NarutoState {}


class UpdateList extends NarutoState {}
class SearchedLoaded extends NarutoState {}




