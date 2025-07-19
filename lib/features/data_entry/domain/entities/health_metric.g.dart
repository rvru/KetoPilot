// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'health_metric.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HealthMetricImpl _$$HealthMetricImplFromJson(Map<String, dynamic> json) =>
    _$HealthMetricImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      type: $enumDecode(_$HealthMetricTypeEnumMap, json['type']),
      value: (json['value'] as num).toDouble(),
      unit: json['unit'] as String,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$$HealthMetricImplToJson(_$HealthMetricImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'type': _$HealthMetricTypeEnumMap[instance.type]!,
      'value': instance.value,
      'unit': instance.unit,
      'notes': instance.notes,
    };

const _$HealthMetricTypeEnumMap = {
  HealthMetricType.bloodGlucose: 'bloodGlucose',
  HealthMetricType.bloodKetones: 'bloodKetones',
  HealthMetricType.weight: 'weight',
  HealthMetricType.bloodPressureSystolic: 'bloodPressureSystolic',
  HealthMetricType.bloodPressureDiastolic: 'bloodPressureDiastolic',
  HealthMetricType.heartRate: 'heartRate',
  HealthMetricType.temperature: 'temperature',
  HealthMetricType.uricAcid: 'uricAcid',
  HealthMetricType.triglycerides: 'triglycerides',
  HealthMetricType.hdl: 'hdl',
  HealthMetricType.ldl: 'ldl',
  HealthMetricType.hba1c: 'hba1c',
  HealthMetricType.hscrp: 'hscrp',
  HealthMetricType.vitaminB12: 'vitaminB12',
  HealthMetricType.apoB100: 'apoB100',
};

_$GlucoseKetoneIndexImpl _$$GlucoseKetoneIndexImplFromJson(
        Map<String, dynamic> json) =>
    _$GlucoseKetoneIndexImpl(
      id: json['id'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      glucose: (json['glucose'] as num).toDouble(),
      ketones: (json['ketones'] as num).toDouble(),
      gkiValue: (json['gkiValue'] as num).toDouble(),
      status: $enumDecode(_$GkiStatusEnumMap, json['status']),
    );

Map<String, dynamic> _$$GlucoseKetoneIndexImplToJson(
        _$GlucoseKetoneIndexImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'timestamp': instance.timestamp.toIso8601String(),
      'glucose': instance.glucose,
      'ketones': instance.ketones,
      'gkiValue': instance.gkiValue,
      'status': _$GkiStatusEnumMap[instance.status]!,
    };

const _$GkiStatusEnumMap = {
  GkiStatus.optimal: 'optimal',
  GkiStatus.therapeutic: 'therapeutic',
  GkiStatus.moderate: 'moderate',
  GkiStatus.elevated: 'elevated',
  GkiStatus.high: 'high',
};
