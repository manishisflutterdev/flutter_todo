import 'package:equatable/equatable.dart';

enum CubitStatus {
  init,
  loading,
  success,
  error,
  empty;
}

class CubitState<T> extends Equatable {
  final CubitStatus status;
  final T? value;
  final String? error;
  const CubitState({
    required this.status,
    this.value,
    this.error,
  });
  @override
  List<Object?> get props => [
        status,
        value,
        error,
      ];
  const CubitState.loading({
    this.status = CubitStatus.loading,
    this.value,
    this.error,
  });
}
