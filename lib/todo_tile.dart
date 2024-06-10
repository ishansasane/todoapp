import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  final String name;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  void Function(BuildContext)? deleteFunction;

  TodoTile(
      {super.key,
      required this.name,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              borderRadius: BorderRadius.circular(12),
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Color(0xFF0A8A2A),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: Color(0xFFC5FFE4),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  name,
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                    color: taskCompleted ? Colors.grey : Colors.black,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.green,
                checkColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
