import 'package:allerhand_test/utils/locator.dart';
import 'package:allerhand_test/utils/repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InterviewPageState {
  final String? pageTitle;
  final String? subtitle;
  final String? videoRef;
  final String? baseContent;
  final String? hiddenContent;
  final bool isContentHidden;

  InterviewPageState(
      {this.pageTitle,
      this.subtitle,
      this.videoRef,
      this.baseContent,
      this.hiddenContent,
      this.isContentHidden = true});
  InterviewPageState copyWith(
          {pageTitle,
          subtitle,
          videoRef,
          baseContent,
          hiddenContent,
          isContentHidden}) =>
      InterviewPageState(
        pageTitle: pageTitle ?? this.pageTitle,
        subtitle: subtitle ?? this.subtitle,
        videoRef: videoRef ?? this.videoRef,
        baseContent: baseContent ?? this.baseContent,
        hiddenContent: hiddenContent ?? this.hiddenContent,
        isContentHidden: isContentHidden ?? this.isContentHidden,
      );
}

abstract class InterviewPageEvent {}

class InterviewPageOpenedEvent extends InterviewPageEvent {
  final int personId;

  InterviewPageOpenedEvent(this.personId);
}

class InterviewPageBloc extends Bloc<InterviewPageEvent, InterviewPageState> {
  InterviewPageBloc() : super(InterviewPageState()) {
    on<InterviewPageOpenedEvent>(
      (event, emit) async {
        var response = await repository.fetchInterview(event.personId);
        emit(state.copyWith(
          pageTitle:
              '${response.familyName} ${response.name} ${response.secondName}',
          subtitle: response.subtitle,
          videoRef: response.videoRef,
          baseContent: response.baseContent,
        ));
      },
    );
  }
  final repository = locator.get<AllerhandRepository>();
}
