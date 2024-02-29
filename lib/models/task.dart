import 'package:equatable/equatable.dart';
// ignore: must_be_immutable
class Task extends Equatable{
  final String title,description;
   bool? isDone,isDelete;
  Task({
    required this.title,
    required this.description,
    this.isDone,
    this.isDelete,
  }){
    isDone = isDone?? false;
    isDelete = isDelete?? false;
  }
  Task copyWith({
    String? title,
    String? description,
    bool? isDone,
    bool? isDelete,
  }) {
    return Task(
      title: title ?? this.title,
      description: description ?? this.description,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,

    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isDone': isDone,
      'isDelete':isDelete,
    };
  }
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      isDone:map['isDone'],
      isDelete: map['isDelete'],
    );
  }
  
  @override
  List<Object?> get props => [title,isDone,isDelete];
}
