// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FoodEntryImpl _$$FoodEntryImplFromJson(Map<String, dynamic> json) =>
    _$FoodEntryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      servingSize: (json['servingSize'] as num).toDouble(),
      servingUnit: json['servingUnit'] as String,
      macros: Macronutrients.fromJson(json['macros'] as Map<String, dynamic>),
      notes: json['notes'] as String?,
      brand: json['brand'] as String?,
      mealType: json['mealType'] as String?,
    );

Map<String, dynamic> _$$FoodEntryImplToJson(_$FoodEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'timestamp': instance.timestamp.toIso8601String(),
      'servingSize': instance.servingSize,
      'servingUnit': instance.servingUnit,
      'macros': instance.macros,
      'notes': instance.notes,
      'brand': instance.brand,
      'mealType': instance.mealType,
    };

_$MacronutrientsImpl _$$MacronutrientsImplFromJson(Map<String, dynamic> json) =>
    _$MacronutrientsImpl(
      carbs: (json['carbs'] as num).toDouble(),
      protein: (json['protein'] as num).toDouble(),
      fat: (json['fat'] as num).toDouble(),
      fiber: (json['fiber'] as num).toDouble(),
      netCarbs: (json['netCarbs'] as num).toDouble(),
      calories: (json['calories'] as num).toDouble(),
    );

Map<String, dynamic> _$$MacronutrientsImplToJson(
        _$MacronutrientsImpl instance) =>
    <String, dynamic>{
      'carbs': instance.carbs,
      'protein': instance.protein,
      'fat': instance.fat,
      'fiber': instance.fiber,
      'netCarbs': instance.netCarbs,
      'calories': instance.calories,
    };

_$DailyMacrosImpl _$$DailyMacrosImplFromJson(Map<String, dynamic> json) =>
    _$DailyMacrosImpl(
      date: DateTime.parse(json['date'] as String),
      consumed:
          Macronutrients.fromJson(json['consumed'] as Map<String, dynamic>),
      targets: Macronutrients.fromJson(json['targets'] as Map<String, dynamic>),
      entries: (json['entries'] as List<dynamic>)
          .map((e) => FoodEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DailyMacrosImplToJson(_$DailyMacrosImpl instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'consumed': instance.consumed,
      'targets': instance.targets,
      'entries': instance.entries,
    };
