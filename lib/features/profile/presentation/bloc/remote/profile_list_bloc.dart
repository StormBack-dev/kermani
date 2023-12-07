import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kermani/core/data/model/view_model_state.dart';
import 'package:kermani/features/profile/data/models/remote/remote_profile.dart';
import 'package:kermani/features/profile/data/models/remote/remote_profile_data.dart';
import 'package:kermani/features/profile/data/repository/remote/remote_profile_repository.dart';
import 'package:kermani/features/profile/domain/entities/profile_data.dart';
import 'package:kermani/features/profile/domain/usecases/get_profile_data_use_case.dart';

class ProfileListState {
  final IProfileData data;
  final ViewModelState dataState;
  final Exception? exception;

  ProfileListState({
    required this.data,
    this.dataState = ViewModelState.idle,
    this.exception,
  });

  ProfileListState copyWith({
    IProfileData? data,
    ViewModelState? dataState,
    Exception? exception,
  }) {
    return ProfileListState(
      data: data ?? this.data,
      dataState: dataState ?? this.dataState,
      exception: exception,
    );
  }
}

class ProfileListCubit extends Cubit<ProfileListState> {
  ProfileListCubit() : super(ProfileListState(data: RemoteProfileData()));

  Future<void> getProfileList() async {
    final data = state.data;

    emit(state.copyWith(
      data: data,
      dataState: ViewModelState.loading,
    ));

    final result = await GetProfileDataUseCase(RemoteProfileRepository())();
    if (result.isSuccess && result.data != null && result.data!.data != null) {
      emit(state.copyWith(
        data: result.data!.data,
        dataState: result.data != null ? ViewModelState.loaded : ViewModelState.empty,
      ));
    } else {
      emit(state.copyWith(
        data: data,
        dataState: ViewModelState.failed,
        exception: result.exception,
      ));
    }
  }
}
