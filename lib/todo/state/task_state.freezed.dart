// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TaskTearOff {
  const _$TaskTearOff();

  _Task call(
      {required String title,
      bool isDone = false,
      required int id,
      required String category}) {
    return _Task(
      title: title,
      isDone: isDone,
      id: id,
      category: category,
    );
  }
}

/// @nodoc
const $Task = _$TaskTearOff();

/// @nodoc
mixin _$Task {
  String get title => throw _privateConstructorUsedError;
  bool get isDone => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get category => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res>;
  $Res call({String title, bool isDone, int id, String category});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res> implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  final Task _value;
  // ignore: unused_field
  final $Res Function(Task) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? isDone = freezed,
    Object? id = freezed,
    Object? category = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TaskCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$TaskCopyWith(_Task value, $Res Function(_Task) then) =
      __$TaskCopyWithImpl<$Res>;
  @override
  $Res call({String title, bool isDone, int id, String category});
}

/// @nodoc
class __$TaskCopyWithImpl<$Res> extends _$TaskCopyWithImpl<$Res>
    implements _$TaskCopyWith<$Res> {
  __$TaskCopyWithImpl(_Task _value, $Res Function(_Task) _then)
      : super(_value, (v) => _then(v as _Task));

  @override
  _Task get _value => super._value as _Task;

  @override
  $Res call({
    Object? title = freezed,
    Object? isDone = freezed,
    Object? id = freezed,
    Object? category = freezed,
  }) {
    return _then(_Task(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      isDone: isDone == freezed
          ? _value.isDone
          : isDone // ignore: cast_nullable_to_non_nullable
              as bool,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Task implements _Task {
  _$_Task(
      {required this.title,
      this.isDone = false,
      required this.id,
      required this.category});

  @override
  final String title;
  @JsonKey()
  @override
  final bool isDone;
  @override
  final int id;
  @override
  final String category;

  @override
  String toString() {
    return 'Task(title: $title, isDone: $isDone, id: $id, category: $category)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Task &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality().equals(other.isDone, isDone) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.category, category));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(isDone),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(category));

  @JsonKey(ignore: true)
  @override
  _$TaskCopyWith<_Task> get copyWith =>
      __$TaskCopyWithImpl<_Task>(this, _$identity);
}

abstract class _Task implements Task {
  factory _Task(
      {required String title,
      bool isDone,
      required int id,
      required String category}) = _$_Task;

  @override
  String get title;
  @override
  bool get isDone;
  @override
  int get id;
  @override
  String get category;
  @override
  @JsonKey(ignore: true)
  _$TaskCopyWith<_Task> get copyWith => throw _privateConstructorUsedError;
}
