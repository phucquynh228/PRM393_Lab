// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkin_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CheckInController)
final checkInControllerProvider = CheckInControllerProvider._();

final class CheckInControllerProvider
    extends $NotifierProvider<CheckInController, CheckInStatus> {
  CheckInControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkInControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkInControllerHash();

  @$internal
  @override
  CheckInController create() => CheckInController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckInStatus value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckInStatus>(value),
    );
  }
}

String _$checkInControllerHash() => r'a033b499fe0a22bf8119bf153baba644747513da';

abstract class _$CheckInController extends $Notifier<CheckInStatus> {
  CheckInStatus build();
  @$mustCallSuper
  @override
  WhenComplete runBuild() {
    final ref = this.ref as $Ref<CheckInStatus, CheckInStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CheckInStatus, CheckInStatus>,
              CheckInStatus,
              Object?,
              Object?
            >;
    return element.handleCreate(ref, build);
  }
}
