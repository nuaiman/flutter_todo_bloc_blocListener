import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum Filter { all, active, done }

Uuid uuid = const Uuid();

class TodoModel extends Equatable {
  final String id;
  final String desc;
  final bool isDone;
  TodoModel({
    String? id,
    required this.desc,
    this.isDone = false,
  }) : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, desc, isDone];

  @override
  bool get stringify => true;

  TodoModel copyWith({
    String? id,
    String? desc,
    bool? isDone,
  }) {
    return TodoModel(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      isDone: isDone ?? this.isDone,
    );
  }
}
