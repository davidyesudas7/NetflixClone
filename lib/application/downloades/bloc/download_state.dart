part of 'download_bloc.dart';

sealed class DownloadState extends Equatable {
  const DownloadState();

  @override
  List<Object> get props => [];
}

final class DownloadInitial extends DownloadState {}

final class DownloadLoadinng extends DownloadState {}

final class DownloadLoaded extends DownloadState {
  final List<DownloadPosterEntity> posterpath;

  const DownloadLoaded({required this.posterpath});
  @override
  List<Object> get props => [posterpath];
}

final class DownloadeError extends DownloadState {
  final String message;

  const DownloadeError({required this.message});
  @override
  List<Object> get props => [message];
}
