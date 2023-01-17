// Generated with smithy-dart 0.3.1. DO NOT MODIFY.

library smoke_test.s3.model.object_lock_configuration; // ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:aws_common/aws_common.dart' as _i1;
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:smithy/smithy.dart' as _i4;
import 'package:smoke_test/src/sdk/src/s3/model/object_lock_enabled.dart'
    as _i2;
import 'package:smoke_test/src/sdk/src/s3/model/object_lock_rule.dart' as _i3;

part 'object_lock_configuration.g.dart';

/// The container element for Object Lock configuration parameters.
abstract class ObjectLockConfiguration
    with _i1.AWSEquatable<ObjectLockConfiguration>
    implements Built<ObjectLockConfiguration, ObjectLockConfigurationBuilder> {
  /// The container element for Object Lock configuration parameters.
  factory ObjectLockConfiguration({
    _i2.ObjectLockEnabled? objectLockEnabled,
    _i3.ObjectLockRule? rule,
  }) {
    return _$ObjectLockConfiguration._(
      objectLockEnabled: objectLockEnabled,
      rule: rule,
    );
  }

  /// The container element for Object Lock configuration parameters.
  factory ObjectLockConfiguration.build(
          [void Function(ObjectLockConfigurationBuilder) updates]) =
      _$ObjectLockConfiguration;

  const ObjectLockConfiguration._();

  static const List<_i4.SmithySerializer> serializers = [
    ObjectLockConfigurationRestXmlSerializer()
  ];

  @BuiltValueHook(initializeBuilder: true)
  static void _init(ObjectLockConfigurationBuilder b) {}

  /// Indicates whether this bucket has an Object Lock configuration enabled. Enable `ObjectLockEnabled` when you apply `ObjectLockConfiguration` to a bucket.
  _i2.ObjectLockEnabled? get objectLockEnabled;

  /// Specifies the Object Lock rule for the specified object. Enable the this rule when you apply `ObjectLockConfiguration` to a bucket. Bucket settings require both a mode and a period. The period can be either `Days` or `Years` but you must select one. You cannot specify `Days` and `Years` at the same time.
  _i3.ObjectLockRule? get rule;
  @override
  List<Object?> get props => [
        objectLockEnabled,
        rule,
      ];
  @override
  String toString() {
    final helper = newBuiltValueToStringHelper('ObjectLockConfiguration');
    helper.add(
      'objectLockEnabled',
      objectLockEnabled,
    );
    helper.add(
      'rule',
      rule,
    );
    return helper.toString();
  }
}

class ObjectLockConfigurationRestXmlSerializer
    extends _i4.StructuredSmithySerializer<ObjectLockConfiguration> {
  const ObjectLockConfigurationRestXmlSerializer()
      : super('ObjectLockConfiguration');

  @override
  Iterable<Type> get types => const [
        ObjectLockConfiguration,
        _$ObjectLockConfiguration,
      ];
  @override
  Iterable<_i4.ShapeId> get supportedProtocols => const [
        _i4.ShapeId(
          namespace: 'aws.protocols',
          shape: 'restXml',
        )
      ];
  @override
  ObjectLockConfiguration deserialize(
    Serializers serializers,
    Iterable<Object?> serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final result = ObjectLockConfigurationBuilder();
    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current;
      iterator.moveNext();
      final value = iterator.current;
      switch (key as String) {
        case 'ObjectLockEnabled':
          if (value != null) {
            result.objectLockEnabled = (serializers.deserialize(
              value,
              specifiedType: const FullType(_i2.ObjectLockEnabled),
            ) as _i2.ObjectLockEnabled);
          }
          break;
        case 'Rule':
          if (value != null) {
            result.rule.replace((serializers.deserialize(
              value,
              specifiedType: const FullType(_i3.ObjectLockRule),
            ) as _i3.ObjectLockRule));
          }
          break;
      }
    }

    return result.build();
  }

  @override
  Iterable<Object?> serialize(
    Serializers serializers,
    Object? object, {
    FullType specifiedType = FullType.unspecified,
  }) {
    final payload = (object as ObjectLockConfiguration);
    final result = <Object?>[
      const _i4.XmlElementName(
        'ObjectLockConfiguration',
        _i4.XmlNamespace('http://s3.amazonaws.com/doc/2006-03-01/'),
      )
    ];
    if (payload.objectLockEnabled != null) {
      result
        ..add(const _i4.XmlElementName('ObjectLockEnabled'))
        ..add(serializers.serialize(
          payload.objectLockEnabled!,
          specifiedType: const FullType.nullable(_i2.ObjectLockEnabled),
        ));
    }
    if (payload.rule != null) {
      result
        ..add(const _i4.XmlElementName('Rule'))
        ..add(serializers.serialize(
          payload.rule!,
          specifiedType: const FullType(_i3.ObjectLockRule),
        ));
    }
    return result;
  }
}
