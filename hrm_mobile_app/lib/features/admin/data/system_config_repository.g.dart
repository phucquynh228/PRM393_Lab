// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'system_config_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(systemConfigRepository)
final systemConfigRepositoryProvider = SystemConfigRepositoryProvider._();

final class SystemConfigRepositoryProvider
    extends
        $FunctionalProvider<
          SystemConfigRepository,
          SystemConfigRepository,
          SystemConfigRepository
        >
    with $Provider<SystemConfigRepository> {
  SystemConfigRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'systemConfigRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$systemConfigRepositoryHash();

  @$internal
  @override
  $ProviderElement<SystemConfigRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SystemConfigRepository create(Ref ref) {
    return systemConfigRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SystemConfigRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SystemConfigRepository>(value),
    );
  }
}

String _$systemConfigRepositoryHash() =>
    r'6c309a76f709242ab686743316f322c61bfb5e6f';
