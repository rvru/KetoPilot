import 'package:freezed_annotation/freezed_annotation.dart';

part 'food_entry.freezed.dart';
part 'food_entry.g.dart';

@freezed
class FoodEntry with _$FoodEntry {
  const factory FoodEntry({
    required String id,
    required String name,
    required DateTime timestamp,
    required double servingSize,
    required String servingUnit,
    required Macronutrients macros,
    String? notes,
    String? brand,
    String? mealType,
  }) = _FoodEntry;

  factory FoodEntry.fromJson(Map<String, dynamic> json) =>
      _$FoodEntryFromJson(json);
}

@freezed
class Macronutrients with _$Macronutrients {
  const factory Macronutrients({
    required double carbs, // in grams
    required double protein, // in grams
    required double fat, // in grams
    required double fiber, // in grams
    required double netCarbs, // in grams (carbs - fiber)
    required double calories, // total calories
  }) = _Macronutrients;

  factory Macronutrients.fromJson(Map<String, dynamic> json) =>
      _$MacronutrientsFromJson(json);
}

@freezed
class DailyMacros with _$DailyMacros {
  const factory DailyMacros({
    required DateTime date,
    required Macronutrients consumed,
    required Macronutrients targets,
    required List<FoodEntry> entries,
  }) = _DailyMacros;

  factory DailyMacros.fromJson(Map<String, dynamic> json) =>
      _$DailyMacrosFromJson(json);
}

enum MealType { breakfast, lunch, dinner, snack }
