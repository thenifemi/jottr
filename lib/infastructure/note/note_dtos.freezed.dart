// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'note_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TodoItemDTOTearOff {
  const _$TodoItemDTOTearOff();

// ignore: unused_element
  _TodoItemDTO call(
      {@required String id, @required String name, @required bool done}) {
    return _TodoItemDTO(
      id: id,
      name: name,
      done: done,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TodoItemDTO = _$TodoItemDTOTearOff();

/// @nodoc
mixin _$TodoItemDTO {
  String get id;
  String get name;
  bool get done;

  $TodoItemDTOCopyWith<TodoItemDTO> get copyWith;
}

/// @nodoc
abstract class $TodoItemDTOCopyWith<$Res> {
  factory $TodoItemDTOCopyWith(
          TodoItemDTO value, $Res Function(TodoItemDTO) then) =
      _$TodoItemDTOCopyWithImpl<$Res>;
  $Res call({String id, String name, bool done});
}

/// @nodoc
class _$TodoItemDTOCopyWithImpl<$Res> implements $TodoItemDTOCopyWith<$Res> {
  _$TodoItemDTOCopyWithImpl(this._value, this._then);

  final TodoItemDTO _value;
  // ignore: unused_field
  final $Res Function(TodoItemDTO) _then;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

/// @nodoc
abstract class _$TodoItemDTOCopyWith<$Res>
    implements $TodoItemDTOCopyWith<$Res> {
  factory _$TodoItemDTOCopyWith(
          _TodoItemDTO value, $Res Function(_TodoItemDTO) then) =
      __$TodoItemDTOCopyWithImpl<$Res>;
  @override
  $Res call({String id, String name, bool done});
}

/// @nodoc
class __$TodoItemDTOCopyWithImpl<$Res> extends _$TodoItemDTOCopyWithImpl<$Res>
    implements _$TodoItemDTOCopyWith<$Res> {
  __$TodoItemDTOCopyWithImpl(
      _TodoItemDTO _value, $Res Function(_TodoItemDTO) _then)
      : super(_value, (v) => _then(v as _TodoItemDTO));

  @override
  _TodoItemDTO get _value => super._value as _TodoItemDTO;

  @override
  $Res call({
    Object id = freezed,
    Object name = freezed,
    Object done = freezed,
  }) {
    return _then(_TodoItemDTO(
      id: id == freezed ? _value.id : id as String,
      name: name == freezed ? _value.name : name as String,
      done: done == freezed ? _value.done : done as bool,
    ));
  }
}

/// @nodoc
class _$_TodoItemDTO extends _TodoItemDTO {
  const _$_TodoItemDTO(
      {@required this.id, @required this.name, @required this.done})
      : assert(id != null),
        assert(name != null),
        assert(done != null),
        super._();

  @override
  final String id;
  @override
  final String name;
  @override
  final bool done;

  @override
  String toString() {
    return 'TodoItemDTO(id: $id, name: $name, done: $done)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodoItemDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.done, done) ||
                const DeepCollectionEquality().equals(other.done, done)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(done);

  @override
  _$TodoItemDTOCopyWith<_TodoItemDTO> get copyWith =>
      __$TodoItemDTOCopyWithImpl<_TodoItemDTO>(this, _$identity);
}

abstract class _TodoItemDTO extends TodoItemDTO {
  const _TodoItemDTO._() : super._();
  const factory _TodoItemDTO(
      {@required String id,
      @required String name,
      @required bool done}) = _$_TodoItemDTO;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get done;
  @override
  _$TodoItemDTOCopyWith<_TodoItemDTO> get copyWith;
}
