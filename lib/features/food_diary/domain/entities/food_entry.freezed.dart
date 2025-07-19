// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_entry.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FoodEntry _$FoodEntryFromJson(Map<String, dynamic> json) {
  return _FoodEntry.fromJson(json);
}

/// @nodoc
mixin _$FoodEntry {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  double get servingSize => throw _privateConstructorUsedError;
  String get servingUnit => throw _privateConstructorUsedError;
  Macronutrients get macros => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  String? get brand => throw _privateConstructorUsedError;
  String? get mealType => throw _privateConstructorUsedError;

  /// Serializes this FoodEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FoodEntryCopyWith<FoodEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodEntryCopyWith<$Res> {
  factory $FoodEntryCopyWith(FoodEntry value, $Res Function(FoodEntry) then) =
      _$FoodEntryCopyWithImpl<$Res, FoodEntry>;
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime timestamp,
      double servingSize,
      String servingUnit,
      Macronutrients macros,
      String? notes,
      String? brand,
      String? mealType});

  $MacronutrientsCopyWith<$Res> get macros;
}

/// @nodoc
class _$FoodEntryCopyWithImpl<$Res, $Val extends FoodEntry>
    implements $FoodEntryCopyWith<$Res> {
  _$FoodEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? timestamp = null,
    Object? servingSize = null,
    Object? servingUnit = null,
    Object? macros = null,
    Object? notes = freezed,
    Object? brand = freezed,
    Object? mealType = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      servingSize: null == servingSize
          ? _value.servingSize
          : servingSize // ignore: cast_nullable_to_non_nullable
              as double,
      servingUnit: null == servingUnit
          ? _value.servingUnit
          : servingUnit // ignore: cast_nullable_to_non_nullable
              as String,
      macros: null == macros
          ? _value.macros
          : macros // ignore: cast_nullable_to_non_nullable
              as Macronutrients,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      mealType: freezed == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of FoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MacronutrientsCopyWith<$Res> get macros {
    return $MacronutrientsCopyWith<$Res>(_value.macros, (value) {
      return _then(_value.copyWith(macros: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodEntryImplCopyWith<$Res>
    implements $FoodEntryCopyWith<$Res> {
  factory _$$FoodEntryImplCopyWith(
          _$FoodEntryImpl value, $Res Function(_$FoodEntryImpl) then) =
      __$$FoodEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      DateTime timestamp,
      double servingSize,
      String servingUnit,
      Macronutrients macros,
      String? notes,
      String? brand,
      String? mealType});

  @override
  $MacronutrientsCopyWith<$Res> get macros;
}

/// @nodoc
class __$$FoodEntryImplCopyWithImpl<$Res>
    extends _$FoodEntryCopyWithImpl<$Res, _$FoodEntryImpl>
    implements _$$FoodEntryImplCopyWith<$Res> {
  __$$FoodEntryImplCopyWithImpl(
      _$FoodEntryImpl _value, $Res Function(_$FoodEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of FoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? timestamp = null,
    Object? servingSize = null,
    Object? servingUnit = null,
    Object? macros = null,
    Object? notes = freezed,
    Object? brand = freezed,
    Object? mealType = freezed,
  }) {
    return _then(_$FoodEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      servingSize: null == servingSize
          ? _value.servingSize
          : servingSize // ignore: cast_nullable_to_non_nullable
              as double,
      servingUnit: null == servingUnit
          ? _value.servingUnit
          : servingUnit // ignore: cast_nullable_to_non_nullable
              as String,
      macros: null == macros
          ? _value.macros
          : macros // ignore: cast_nullable_to_non_nullable
              as Macronutrients,
      notes: freezed == notes
          ? _value.notes
          : notes // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      mealType: freezed == mealType
          ? _value.mealType
          : mealType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodEntryImpl implements _FoodEntry {
  const _$FoodEntryImpl(
      {required this.id,
      required this.name,
      required this.timestamp,
      required this.servingSize,
      required this.servingUnit,
      required this.macros,
      this.notes,
      this.brand,
      this.mealType});

  factory _$FoodEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodEntryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final DateTime timestamp;
  @override
  final double servingSize;
  @override
  final String servingUnit;
  @override
  final Macronutrients macros;
  @override
  final String? notes;
  @override
  final String? brand;
  @override
  final String? mealType;

  @override
  String toString() {
    return 'FoodEntry(id: $id, name: $name, timestamp: $timestamp, servingSize: $servingSize, servingUnit: $servingUnit, macros: $macros, notes: $notes, brand: $brand, mealType: $mealType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.servingSize, servingSize) ||
                other.servingSize == servingSize) &&
            (identical(other.servingUnit, servingUnit) ||
                other.servingUnit == servingUnit) &&
            (identical(other.macros, macros) || other.macros == macros) &&
            (identical(other.notes, notes) || other.notes == notes) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.mealType, mealType) ||
                other.mealType == mealType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, timestamp, servingSize,
      servingUnit, macros, notes, brand, mealType);

  /// Create a copy of FoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodEntryImplCopyWith<_$FoodEntryImpl> get copyWith =>
      __$$FoodEntryImplCopyWithImpl<_$FoodEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodEntryImplToJson(
      this,
    );
  }
}

abstract class _FoodEntry implements FoodEntry {
  const factory _FoodEntry(
      {required final String id,
      required final String name,
      required final DateTime timestamp,
      required final double servingSize,
      required final String servingUnit,
      required final Macronutrients macros,
      final String? notes,
      final String? brand,
      final String? mealType}) = _$FoodEntryImpl;

  factory _FoodEntry.fromJson(Map<String, dynamic> json) =
      _$FoodEntryImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  DateTime get timestamp;
  @override
  double get servingSize;
  @override
  String get servingUnit;
  @override
  Macronutrients get macros;
  @override
  String? get notes;
  @override
  String? get brand;
  @override
  String? get mealType;

  /// Create a copy of FoodEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FoodEntryImplCopyWith<_$FoodEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Macronutrients _$MacronutrientsFromJson(Map<String, dynamic> json) {
  return _Macronutrients.fromJson(json);
}

/// @nodoc
mixin _$Macronutrients {
  double get carbs => throw _privateConstructorUsedError; // in grams
  double get protein => throw _privateConstructorUsedError; // in grams
  double get fat => throw _privateConstructorUsedError; // in grams
  double get fiber => throw _privateConstructorUsedError; // in grams
  double get netCarbs =>
      throw _privateConstructorUsedError; // in grams (carbs - fiber)
  double get calories => throw _privateConstructorUsedError;

  /// Serializes this Macronutrients to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Macronutrients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MacronutrientsCopyWith<Macronutrients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MacronutrientsCopyWith<$Res> {
  factory $MacronutrientsCopyWith(
          Macronutrients value, $Res Function(Macronutrients) then) =
      _$MacronutrientsCopyWithImpl<$Res, Macronutrients>;
  @useResult
  $Res call(
      {double carbs,
      double protein,
      double fat,
      double fiber,
      double netCarbs,
      double calories});
}

/// @nodoc
class _$MacronutrientsCopyWithImpl<$Res, $Val extends Macronutrients>
    implements $MacronutrientsCopyWith<$Res> {
  _$MacronutrientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Macronutrients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carbs = null,
    Object? protein = null,
    Object? fat = null,
    Object? fiber = null,
    Object? netCarbs = null,
    Object? calories = null,
  }) {
    return _then(_value.copyWith(
      carbs: null == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as double,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double,
      fat: null == fat
          ? _value.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as double,
      fiber: null == fiber
          ? _value.fiber
          : fiber // ignore: cast_nullable_to_non_nullable
              as double,
      netCarbs: null == netCarbs
          ? _value.netCarbs
          : netCarbs // ignore: cast_nullable_to_non_nullable
              as double,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MacronutrientsImplCopyWith<$Res>
    implements $MacronutrientsCopyWith<$Res> {
  factory _$$MacronutrientsImplCopyWith(_$MacronutrientsImpl value,
          $Res Function(_$MacronutrientsImpl) then) =
      __$$MacronutrientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {double carbs,
      double protein,
      double fat,
      double fiber,
      double netCarbs,
      double calories});
}

/// @nodoc
class __$$MacronutrientsImplCopyWithImpl<$Res>
    extends _$MacronutrientsCopyWithImpl<$Res, _$MacronutrientsImpl>
    implements _$$MacronutrientsImplCopyWith<$Res> {
  __$$MacronutrientsImplCopyWithImpl(
      _$MacronutrientsImpl _value, $Res Function(_$MacronutrientsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Macronutrients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carbs = null,
    Object? protein = null,
    Object? fat = null,
    Object? fiber = null,
    Object? netCarbs = null,
    Object? calories = null,
  }) {
    return _then(_$MacronutrientsImpl(
      carbs: null == carbs
          ? _value.carbs
          : carbs // ignore: cast_nullable_to_non_nullable
              as double,
      protein: null == protein
          ? _value.protein
          : protein // ignore: cast_nullable_to_non_nullable
              as double,
      fat: null == fat
          ? _value.fat
          : fat // ignore: cast_nullable_to_non_nullable
              as double,
      fiber: null == fiber
          ? _value.fiber
          : fiber // ignore: cast_nullable_to_non_nullable
              as double,
      netCarbs: null == netCarbs
          ? _value.netCarbs
          : netCarbs // ignore: cast_nullable_to_non_nullable
              as double,
      calories: null == calories
          ? _value.calories
          : calories // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MacronutrientsImpl implements _Macronutrients {
  const _$MacronutrientsImpl(
      {required this.carbs,
      required this.protein,
      required this.fat,
      required this.fiber,
      required this.netCarbs,
      required this.calories});

  factory _$MacronutrientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$MacronutrientsImplFromJson(json);

  @override
  final double carbs;
// in grams
  @override
  final double protein;
// in grams
  @override
  final double fat;
// in grams
  @override
  final double fiber;
// in grams
  @override
  final double netCarbs;
// in grams (carbs - fiber)
  @override
  final double calories;

  @override
  String toString() {
    return 'Macronutrients(carbs: $carbs, protein: $protein, fat: $fat, fiber: $fiber, netCarbs: $netCarbs, calories: $calories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MacronutrientsImpl &&
            (identical(other.carbs, carbs) || other.carbs == carbs) &&
            (identical(other.protein, protein) || other.protein == protein) &&
            (identical(other.fat, fat) || other.fat == fat) &&
            (identical(other.fiber, fiber) || other.fiber == fiber) &&
            (identical(other.netCarbs, netCarbs) ||
                other.netCarbs == netCarbs) &&
            (identical(other.calories, calories) ||
                other.calories == calories));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, carbs, protein, fat, fiber, netCarbs, calories);

  /// Create a copy of Macronutrients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MacronutrientsImplCopyWith<_$MacronutrientsImpl> get copyWith =>
      __$$MacronutrientsImplCopyWithImpl<_$MacronutrientsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MacronutrientsImplToJson(
      this,
    );
  }
}

abstract class _Macronutrients implements Macronutrients {
  const factory _Macronutrients(
      {required final double carbs,
      required final double protein,
      required final double fat,
      required final double fiber,
      required final double netCarbs,
      required final double calories}) = _$MacronutrientsImpl;

  factory _Macronutrients.fromJson(Map<String, dynamic> json) =
      _$MacronutrientsImpl.fromJson;

  @override
  double get carbs; // in grams
  @override
  double get protein; // in grams
  @override
  double get fat; // in grams
  @override
  double get fiber; // in grams
  @override
  double get netCarbs; // in grams (carbs - fiber)
  @override
  double get calories;

  /// Create a copy of Macronutrients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MacronutrientsImplCopyWith<_$MacronutrientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyMacros _$DailyMacrosFromJson(Map<String, dynamic> json) {
  return _DailyMacros.fromJson(json);
}

/// @nodoc
mixin _$DailyMacros {
  DateTime get date => throw _privateConstructorUsedError;
  Macronutrients get consumed => throw _privateConstructorUsedError;
  Macronutrients get targets => throw _privateConstructorUsedError;
  List<FoodEntry> get entries => throw _privateConstructorUsedError;

  /// Serializes this DailyMacros to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyMacros
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyMacrosCopyWith<DailyMacros> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyMacrosCopyWith<$Res> {
  factory $DailyMacrosCopyWith(
          DailyMacros value, $Res Function(DailyMacros) then) =
      _$DailyMacrosCopyWithImpl<$Res, DailyMacros>;
  @useResult
  $Res call(
      {DateTime date,
      Macronutrients consumed,
      Macronutrients targets,
      List<FoodEntry> entries});

  $MacronutrientsCopyWith<$Res> get consumed;
  $MacronutrientsCopyWith<$Res> get targets;
}

/// @nodoc
class _$DailyMacrosCopyWithImpl<$Res, $Val extends DailyMacros>
    implements $DailyMacrosCopyWith<$Res> {
  _$DailyMacrosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyMacros
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? consumed = null,
    Object? targets = null,
    Object? entries = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as Macronutrients,
      targets: null == targets
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as Macronutrients,
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<FoodEntry>,
    ) as $Val);
  }

  /// Create a copy of DailyMacros
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MacronutrientsCopyWith<$Res> get consumed {
    return $MacronutrientsCopyWith<$Res>(_value.consumed, (value) {
      return _then(_value.copyWith(consumed: value) as $Val);
    });
  }

  /// Create a copy of DailyMacros
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MacronutrientsCopyWith<$Res> get targets {
    return $MacronutrientsCopyWith<$Res>(_value.targets, (value) {
      return _then(_value.copyWith(targets: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DailyMacrosImplCopyWith<$Res>
    implements $DailyMacrosCopyWith<$Res> {
  factory _$$DailyMacrosImplCopyWith(
          _$DailyMacrosImpl value, $Res Function(_$DailyMacrosImpl) then) =
      __$$DailyMacrosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      Macronutrients consumed,
      Macronutrients targets,
      List<FoodEntry> entries});

  @override
  $MacronutrientsCopyWith<$Res> get consumed;
  @override
  $MacronutrientsCopyWith<$Res> get targets;
}

/// @nodoc
class __$$DailyMacrosImplCopyWithImpl<$Res>
    extends _$DailyMacrosCopyWithImpl<$Res, _$DailyMacrosImpl>
    implements _$$DailyMacrosImplCopyWith<$Res> {
  __$$DailyMacrosImplCopyWithImpl(
      _$DailyMacrosImpl _value, $Res Function(_$DailyMacrosImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyMacros
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? consumed = null,
    Object? targets = null,
    Object? entries = null,
  }) {
    return _then(_$DailyMacrosImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      consumed: null == consumed
          ? _value.consumed
          : consumed // ignore: cast_nullable_to_non_nullable
              as Macronutrients,
      targets: null == targets
          ? _value.targets
          : targets // ignore: cast_nullable_to_non_nullable
              as Macronutrients,
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<FoodEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyMacrosImpl implements _DailyMacros {
  const _$DailyMacrosImpl(
      {required this.date,
      required this.consumed,
      required this.targets,
      required final List<FoodEntry> entries})
      : _entries = entries;

  factory _$DailyMacrosImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyMacrosImplFromJson(json);

  @override
  final DateTime date;
  @override
  final Macronutrients consumed;
  @override
  final Macronutrients targets;
  final List<FoodEntry> _entries;
  @override
  List<FoodEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'DailyMacros(date: $date, consumed: $consumed, targets: $targets, entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyMacrosImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.consumed, consumed) ||
                other.consumed == consumed) &&
            (identical(other.targets, targets) || other.targets == targets) &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, consumed, targets,
      const DeepCollectionEquality().hash(_entries));

  /// Create a copy of DailyMacros
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyMacrosImplCopyWith<_$DailyMacrosImpl> get copyWith =>
      __$$DailyMacrosImplCopyWithImpl<_$DailyMacrosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyMacrosImplToJson(
      this,
    );
  }
}

abstract class _DailyMacros implements DailyMacros {
  const factory _DailyMacros(
      {required final DateTime date,
      required final Macronutrients consumed,
      required final Macronutrients targets,
      required final List<FoodEntry> entries}) = _$DailyMacrosImpl;

  factory _DailyMacros.fromJson(Map<String, dynamic> json) =
      _$DailyMacrosImpl.fromJson;

  @override
  DateTime get date;
  @override
  Macronutrients get consumed;
  @override
  Macronutrients get targets;
  @override
  List<FoodEntry> get entries;

  /// Create a copy of DailyMacros
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyMacrosImplCopyWith<_$DailyMacrosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
