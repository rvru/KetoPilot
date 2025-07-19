// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'health_metric.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HealthMetric _$HealthMetricFromJson(Map<String, dynamic> json) {
  return _HealthMetric.fromJson(json);
}

/// @nodoc
mixin _$HealthMetric {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  HealthMetricType get type => throw _privateConstructorUsedError;
  double get value => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;

  /// Serializes this HealthMetric to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HealthMetric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HealthMetricCopyWith<HealthMetric> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HealthMetricCopyWith<$Res> {
  factory $HealthMetricCopyWith(
          HealthMetric value, $Res Function(HealthMetric) then) =
      _$HealthMetricCopyWithImpl<$Res, HealthMetric>;
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      HealthMetricType type,
      double value,
      String unit,
      String? notes});
}

/// @nodoc
class _$HealthMetricCopyWithImpl<$Res, $Val extends HealthMetric>
    implements $HealthMetricCopyWith<$Res> {
  _$HealthMetricCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HealthMetric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? type = null,
    Object? value = null,
    Object? unit = null,
    Object? notes = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HealthMetricType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HealthMetricImplCopyWith<$Res>
    implements $HealthMetricCopyWith<$Res> {
  factory _$$HealthMetricImplCopyWith(
          _$HealthMetricImpl value, $Res Function(_$HealthMetricImpl) then) =
      __$$HealthMetricImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      HealthMetricType type,
      double value,
      String unit,
      String? notes});
}

/// @nodoc
class __$$HealthMetricImplCopyWithImpl<$Res>
    extends _$HealthMetricCopyWithImpl<$Res, _$HealthMetricImpl>
    implements _$$HealthMetricImplCopyWith<$Res> {
  __$$HealthMetricImplCopyWithImpl(
      _$HealthMetricImpl _value, $Res Function(_$HealthMetricImpl) _then)
      : super(_value, _then);

  /// Create a copy of HealthMetric
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? type = null,
    Object? value = null,
    Object? unit = null,
    Object? notes = freezed,
  }) {
    return _then(_$HealthMetricImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as HealthMetricType,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HealthMetricImpl implements _HealthMetric {
  const _$HealthMetricImpl(
      {required this.id,
      required this.timestamp,
      required this.type,
      required this.value,
      required this.unit,
      this.notes});

  factory _$HealthMetricImpl.fromJson(Map<String, dynamic> json) =>
      _$$HealthMetricImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final HealthMetricType type;
  @override
  final double value;
  @override
  final String unit;
  @override
  final String? notes;

  @override
  String toString() {
    return 'HealthMetric(id: $id, timestamp: $timestamp, type: $type, value: $value, unit: $unit, notes: $notes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HealthMetricImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.notes, notes) || other.notes == notes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, timestamp, type, value, unit, notes);

  /// Create a copy of HealthMetric
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HealthMetricImplCopyWith<_$HealthMetricImpl> get copyWith =>
      __$$HealthMetricImplCopyWithImpl<_$HealthMetricImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HealthMetricImplToJson(
      this,
    );
  }
}

abstract class _HealthMetric implements HealthMetric {
  const factory _HealthMetric(
      {required final String id,
      required final DateTime timestamp,
      required final HealthMetricType type,
      required final double value,
      required final String unit,
      final String? notes}) = _$HealthMetricImpl;

  factory _HealthMetric.fromJson(Map<String, dynamic> json) =
      _$HealthMetricImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  HealthMetricType get type;
  @override
  double get value;
  @override
  String get unit;
  @override
  String? get notes;

  /// Create a copy of HealthMetric
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HealthMetricImplCopyWith<_$HealthMetricImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GlucoseKetoneIndex _$GlucoseKetoneIndexFromJson(Map<String, dynamic> json) {
  return _GlucoseKetoneIndex.fromJson(json);
}

/// @nodoc
mixin _$GlucoseKetoneIndex {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get glucose => throw _privateConstructorUsedError;
  double get ketones => throw _privateConstructorUsedError;
  double get gkiValue => throw _privateConstructorUsedError;
  GkiStatus get status => throw _privateConstructorUsedError;

  /// Serializes this GlucoseKetoneIndex to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GlucoseKetoneIndex
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GlucoseKetoneIndexCopyWith<GlucoseKetoneIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GlucoseKetoneIndexCopyWith<$Res> {
  factory $GlucoseKetoneIndexCopyWith(
          GlucoseKetoneIndex value, $Res Function(GlucoseKetoneIndex) then) =
      _$GlucoseKetoneIndexCopyWithImpl<$Res, GlucoseKetoneIndex>;
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      double glucose,
      double ketones,
      double gkiValue,
      GkiStatus status});
}

/// @nodoc
class _$GlucoseKetoneIndexCopyWithImpl<$Res, $Val extends GlucoseKetoneIndex>
    implements $GlucoseKetoneIndexCopyWith<$Res> {
  _$GlucoseKetoneIndexCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GlucoseKetoneIndex
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? glucose = null,
    Object? ketones = null,
    Object? gkiValue = null,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      glucose: null == glucose
          ? _value.glucose
          : glucose // ignore: cast_nullable_to_non_nullable
              as double,
      ketones: null == ketones
          ? _value.ketones
          : ketones // ignore: cast_nullable_to_non_nullable
              as double,
      gkiValue: null == gkiValue
          ? _value.gkiValue
          : gkiValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GkiStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GlucoseKetoneIndexImplCopyWith<$Res>
    implements $GlucoseKetoneIndexCopyWith<$Res> {
  factory _$$GlucoseKetoneIndexImplCopyWith(_$GlucoseKetoneIndexImpl value,
          $Res Function(_$GlucoseKetoneIndexImpl) then) =
      __$$GlucoseKetoneIndexImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime timestamp,
      double glucose,
      double ketones,
      double gkiValue,
      GkiStatus status});
}

/// @nodoc
class __$$GlucoseKetoneIndexImplCopyWithImpl<$Res>
    extends _$GlucoseKetoneIndexCopyWithImpl<$Res, _$GlucoseKetoneIndexImpl>
    implements _$$GlucoseKetoneIndexImplCopyWith<$Res> {
  __$$GlucoseKetoneIndexImplCopyWithImpl(_$GlucoseKetoneIndexImpl _value,
      $Res Function(_$GlucoseKetoneIndexImpl) _then)
      : super(_value, _then);

  /// Create a copy of GlucoseKetoneIndex
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
    Object? glucose = null,
    Object? ketones = null,
    Object? gkiValue = null,
    Object? status = null,
  }) {
    return _then(_$GlucoseKetoneIndexImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      glucose: null == glucose
          ? _value.glucose
          : glucose // ignore: cast_nullable_to_non_nullable
              as double,
      ketones: null == ketones
          ? _value.ketones
          : ketones // ignore: cast_nullable_to_non_nullable
              as double,
      gkiValue: null == gkiValue
          ? _value.gkiValue
          : gkiValue // ignore: cast_nullable_to_non_nullable
              as double,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as GkiStatus,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GlucoseKetoneIndexImpl implements _GlucoseKetoneIndex {
  const _$GlucoseKetoneIndexImpl(
      {required this.id,
      required this.timestamp,
      required this.glucose,
      required this.ketones,
      required this.gkiValue,
      required this.status});

  factory _$GlucoseKetoneIndexImpl.fromJson(Map<String, dynamic> json) =>
      _$$GlucoseKetoneIndexImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime timestamp;
  @override
  final double glucose;
  @override
  final double ketones;
  @override
  final double gkiValue;
  @override
  final GkiStatus status;

  @override
  String toString() {
    return 'GlucoseKetoneIndex(id: $id, timestamp: $timestamp, glucose: $glucose, ketones: $ketones, gkiValue: $gkiValue, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GlucoseKetoneIndexImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.glucose, glucose) || other.glucose == glucose) &&
            (identical(other.ketones, ketones) || other.ketones == ketones) &&
            (identical(other.gkiValue, gkiValue) ||
                other.gkiValue == gkiValue) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, timestamp, glucose, ketones, gkiValue, status);

  /// Create a copy of GlucoseKetoneIndex
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GlucoseKetoneIndexImplCopyWith<_$GlucoseKetoneIndexImpl> get copyWith =>
      __$$GlucoseKetoneIndexImplCopyWithImpl<_$GlucoseKetoneIndexImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GlucoseKetoneIndexImplToJson(
      this,
    );
  }
}

abstract class _GlucoseKetoneIndex implements GlucoseKetoneIndex {
  const factory _GlucoseKetoneIndex(
      {required final String id,
      required final DateTime timestamp,
      required final double glucose,
      required final double ketones,
      required final double gkiValue,
      required final GkiStatus status}) = _$GlucoseKetoneIndexImpl;

  factory _GlucoseKetoneIndex.fromJson(Map<String, dynamic> json) =
      _$GlucoseKetoneIndexImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get timestamp;
  @override
  double get glucose;
  @override
  double get ketones;
  @override
  double get gkiValue;
  @override
  GkiStatus get status;

  /// Create a copy of GlucoseKetoneIndex
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GlucoseKetoneIndexImplCopyWith<_$GlucoseKetoneIndexImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
