// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'note_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
NoteDTO _$NoteDTOFromJson(Map<String, dynamic> json) {
  return _NoteDTO.fromJson(json);
}

/// @nodoc
class _$NoteDTOTearOff {
  const _$NoteDTOTearOff();

// ignore: unused_element
  _NoteDTO call(
      {@JsonKey(ignore: true) String id,
      @required String body,
      @required int color,
      @required List<TodoItemDTO> todos,
      @required @ServerTimeStampConverter() FieldValue serverTimeStamp}) {
    return _NoteDTO(
      id: id,
      body: body,
      color: color,
      todos: todos,
      serverTimeStamp: serverTimeStamp,
    );
  }

// ignore: unused_element
  NoteDTO fromJson(Map<String, Object> json) {
    return NoteDTO.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $NoteDTO = _$NoteDTOTearOff();

/// @nodoc
mixin _$NoteDTO {
  @JsonKey(ignore: true)
  String get id;
  String get body;
  int get color;
  List<TodoItemDTO> get todos;
  @ServerTimeStampConverter()
  FieldValue get serverTimeStamp;

  Map<String, dynamic> toJson();
  $NoteDTOCopyWith<NoteDTO> get copyWith;
}

/// @nodoc
abstract class $NoteDTOCopyWith<$Res> {
  factory $NoteDTOCopyWith(NoteDTO value, $Res Function(NoteDTO) then) =
      _$NoteDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(ignore: true) String id,
      String body,
      int color,
      List<TodoItemDTO> todos,
      @ServerTimeStampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class _$NoteDTOCopyWithImpl<$Res> implements $NoteDTOCopyWith<$Res> {
  _$NoteDTOCopyWithImpl(this._value, this._then);

  final NoteDTO _value;
  // ignore: unused_field
  final $Res Function(NoteDTO) _then;

  @override
  $Res call({
    Object id = freezed,
    Object body = freezed,
    Object color = freezed,
    Object todos = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      body: body == freezed ? _value.body : body as String,
      color: color == freezed ? _value.color : color as int,
      todos: todos == freezed ? _value.todos : todos as List<TodoItemDTO>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }
}

/// @nodoc
abstract class _$NoteDTOCopyWith<$Res> implements $NoteDTOCopyWith<$Res> {
  factory _$NoteDTOCopyWith(_NoteDTO value, $Res Function(_NoteDTO) then) =
      __$NoteDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(ignore: true) String id,
      String body,
      int color,
      List<TodoItemDTO> todos,
      @ServerTimeStampConverter() FieldValue serverTimeStamp});
}

/// @nodoc
class __$NoteDTOCopyWithImpl<$Res> extends _$NoteDTOCopyWithImpl<$Res>
    implements _$NoteDTOCopyWith<$Res> {
  __$NoteDTOCopyWithImpl(_NoteDTO _value, $Res Function(_NoteDTO) _then)
      : super(_value, (v) => _then(v as _NoteDTO));

  @override
  _NoteDTO get _value => super._value as _NoteDTO;

  @override
  $Res call({
    Object id = freezed,
    Object body = freezed,
    Object color = freezed,
    Object todos = freezed,
    Object serverTimeStamp = freezed,
  }) {
    return _then(_NoteDTO(
      id: id == freezed ? _value.id : id as String,
      body: body == freezed ? _value.body : body as String,
      color: color == freezed ? _value.color : color as int,
      todos: todos == freezed ? _value.todos : todos as List<TodoItemDTO>,
      serverTimeStamp: serverTimeStamp == freezed
          ? _value.serverTimeStamp
          : serverTimeStamp as FieldValue,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_NoteDTO extends _NoteDTO {
  const _$_NoteDTO(
      {@JsonKey(ignore: true) this.id,
      @required this.body,
      @required this.color,
      @required this.todos,
      @required @ServerTimeStampConverter() this.serverTimeStamp})
      : assert(body != null),
        assert(color != null),
        assert(todos != null),
        assert(serverTimeStamp != null),
        super._();

  factory _$_NoteDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_NoteDTOFromJson(json);

  @override
  @JsonKey(ignore: true)
  final String id;
  @override
  final String body;
  @override
  final int color;
  @override
  final List<TodoItemDTO> todos;
  @override
  @ServerTimeStampConverter()
  final FieldValue serverTimeStamp;

  @override
  String toString() {
    return 'NoteDTO(id: $id, body: $body, color: $color, todos: $todos, serverTimeStamp: $serverTimeStamp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NoteDTO &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.body, body) ||
                const DeepCollectionEquality().equals(other.body, body)) &&
            (identical(other.color, color) ||
                const DeepCollectionEquality().equals(other.color, color)) &&
            (identical(other.todos, todos) ||
                const DeepCollectionEquality().equals(other.todos, todos)) &&
            (identical(other.serverTimeStamp, serverTimeStamp) ||
                const DeepCollectionEquality()
                    .equals(other.serverTimeStamp, serverTimeStamp)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(body) ^
      const DeepCollectionEquality().hash(color) ^
      const DeepCollectionEquality().hash(todos) ^
      const DeepCollectionEquality().hash(serverTimeStamp);

  @override
  _$NoteDTOCopyWith<_NoteDTO> get copyWith =>
      __$NoteDTOCopyWithImpl<_NoteDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_NoteDTOToJson(this);
  }
}

abstract class _NoteDTO extends NoteDTO {
  const _NoteDTO._() : super._();
  const factory _NoteDTO(
          {@JsonKey(ignore: true) String id,
          @required String body,
          @required int color,
          @required List<TodoItemDTO> todos,
          @required @ServerTimeStampConverter() FieldValue serverTimeStamp}) =
      _$_NoteDTO;

  factory _NoteDTO.fromJson(Map<String, dynamic> json) = _$_NoteDTO.fromJson;

  @override
  @JsonKey(ignore: true)
  String get id;
  @override
  String get body;
  @override
  int get color;
  @override
  List<TodoItemDTO> get todos;
  @override
  @ServerTimeStampConverter()
  FieldValue get serverTimeStamp;
  @override
  _$NoteDTOCopyWith<_NoteDTO> get copyWith;
}

TodoItemDTO _$TodoItemDTOFromJson(Map<String, dynamic> json) {
  return _TodoItemDTO.fromJson(json);
}

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

// ignore: unused_element
  TodoItemDTO fromJson(Map<String, Object> json) {
    return TodoItemDTO.fromJson(json);
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

  Map<String, dynamic> toJson();
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

@JsonSerializable()

/// @nodoc
class _$_TodoItemDTO extends _TodoItemDTO {
  const _$_TodoItemDTO(
      {@required this.id, @required this.name, @required this.done})
      : assert(id != null),
        assert(name != null),
        assert(done != null),
        super._();

  factory _$_TodoItemDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_TodoItemDTOFromJson(json);

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

  @override
  Map<String, dynamic> toJson() {
    return _$_$_TodoItemDTOToJson(this);
  }
}

abstract class _TodoItemDTO extends TodoItemDTO {
  const _TodoItemDTO._() : super._();
  const factory _TodoItemDTO(
      {@required String id,
      @required String name,
      @required bool done}) = _$_TodoItemDTO;

  factory _TodoItemDTO.fromJson(Map<String, dynamic> json) =
      _$_TodoItemDTO.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  bool get done;
  @override
  _$TodoItemDTOCopyWith<_TodoItemDTO> get copyWith;
}
