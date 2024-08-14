part of 'preview_item.bloc.dart';

enum PreviewItemScreenState {
  initial,
  success,
  inprogress,
  aborted,
  failed,
}

@immutable
class PreviewItemState {
  final PreviewItemScreenState screenState;
  final String mediaUrl;
  final String errorMessage;

  PreviewItemState({
    required this.screenState,
    required this.mediaUrl,
    required this.errorMessage,
  });

  factory PreviewItemState.initial() {
    return PreviewItemState(
      screenState: PreviewItemScreenState.initial,
      mediaUrl: "",
      errorMessage: "",
    );
  }

  PreviewItemState copyWithState({
    required PreviewItemScreenState screenState,
  }) {
    return PreviewItemState(
      screenState: screenState,
      mediaUrl: "",
      errorMessage: "",
    );
  }

  PreviewItemState copyWithStateAndMediaUrl({
    required PreviewItemScreenState screenState,
    required String mediaUrl,
  }) {
    return PreviewItemState(
        screenState: screenState, mediaUrl: mediaUrl, errorMessage: "");
  }

  PreviewItemState copyWithStateAndError({
    required PreviewItemScreenState screenState,
    required String errorMessage,
  }) {
    return PreviewItemState(
        screenState: screenState, mediaUrl: "", errorMessage: errorMessage);
  }
}
