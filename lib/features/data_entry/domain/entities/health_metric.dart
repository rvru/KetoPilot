import 'package:freezed_annotation/freezed_annotation.dart';

part 'health_metric.freezed.dart';
part 'health_metric.g.dart';

@freezed
class HealthMetric with _$HealthMetric {
  const factory HealthMetric({
    required String id,
    required DateTime timestamp,
    required HealthMetricType type,
    required double value,
    required String unit,
    String? notes,
  }) = _HealthMetric;

  factory HealthMetric.fromJson(Map<String, dynamic> json) =>
      _$HealthMetricFromJson(json);
}

@freezed
class GlucoseKetoneIndex with _$GlucoseKetoneIndex {
  const factory GlucoseKetoneIndex({
    required String id,
    required DateTime timestamp,
    required double glucose,
    required double ketones,
    required double gkiValue,
    required GkiStatus status,
  }) = _GlucoseKetoneIndex;

  factory GlucoseKetoneIndex.fromJson(Map<String, dynamic> json) =>
      _$GlucoseKetoneIndexFromJson(json);
}

enum HealthMetricType {
  bloodGlucose,
  bloodKetones,
  weight,
  bloodPressureSystolic,
  bloodPressureDiastolic,
  heartRate,
  temperature,
  uricAcid,
  triglycerides,
  hdl,
  ldl,
  hba1c,
  hscrp,
  vitaminB12,
  apoB100,
}

enum GkiStatus { optimal, therapeutic, moderate, elevated, high }

extension HealthMetricTypeExtension on HealthMetricType {
  String get displayName {
    switch (this) {
      case HealthMetricType.bloodGlucose:
        return 'Blood Glucose';
      case HealthMetricType.bloodKetones:
        return 'Blood Ketones';
      case HealthMetricType.weight:
        return 'Weight';
      case HealthMetricType.bloodPressureSystolic:
        return 'Systolic BP';
      case HealthMetricType.bloodPressureDiastolic:
        return 'Diastolic BP';
      case HealthMetricType.heartRate:
        return 'Heart Rate';
      case HealthMetricType.temperature:
        return 'Temperature';
      case HealthMetricType.uricAcid:
        return 'Uric Acid';
      case HealthMetricType.triglycerides:
        return 'Triglycerides';
      case HealthMetricType.hdl:
        return 'HDL';
      case HealthMetricType.ldl:
        return 'LDL';
      case HealthMetricType.hba1c:
        return 'HbA1c';
      case HealthMetricType.hscrp:
        return 'hsCRP';
      case HealthMetricType.vitaminB12:
        return 'Vitamin B12';
      case HealthMetricType.apoB100:
        return 'ApoB-100';
    }
  }

  String get unit {
    switch (this) {
      case HealthMetricType.bloodGlucose:
        return 'mg/dL';
      case HealthMetricType.bloodKetones:
        return 'mmol/L';
      case HealthMetricType.weight:
        return 'kg';
      case HealthMetricType.bloodPressureSystolic:
      case HealthMetricType.bloodPressureDiastolic:
        return 'mmHg';
      case HealthMetricType.heartRate:
        return 'bpm';
      case HealthMetricType.temperature:
        return '°C';
      case HealthMetricType.uricAcid:
        return 'mg/dL';
      case HealthMetricType.triglycerides:
      case HealthMetricType.hdl:
      case HealthMetricType.ldl:
        return 'mg/dL';
      case HealthMetricType.hba1c:
        return '%';
      case HealthMetricType.hscrp:
        return 'mg/L';
      case HealthMetricType.vitaminB12:
        return 'pg/mL';
      case HealthMetricType.apoB100:
        return 'mg/dL';
    }
  }
}

extension GkiStatusExtension on GkiStatus {
  String get displayName {
    switch (this) {
      case GkiStatus.optimal:
        return 'Optimal';
      case GkiStatus.therapeutic:
        return 'Therapeutic';
      case GkiStatus.moderate:
        return 'Moderate';
      case GkiStatus.elevated:
        return 'Elevated';
      case GkiStatus.high:
        return 'High';
    }
  }

  String get description {
    switch (this) {
      case GkiStatus.optimal:
        return 'GKI 1-3: Optimal therapeutic range';
      case GkiStatus.therapeutic:
        return 'GKI 3-6: Therapeutic range';
      case GkiStatus.moderate:
        return 'GKI 6-9: Moderate ketosis';
      case GkiStatus.elevated:
        return 'GKI 9-12: Elevated glucose';
      case GkiStatus.high:
        return 'GKI >12: High glucose levels';
    }
  }
}
