import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskFormScreen extends StatelessWidget {
 TaskFormScreen({super.key});

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('เพิ่มงานใหม่'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'ชื่องาน',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'รายละเอียด',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16), 

            ElevatedButton(
              onPressed:(){

              final newTask = Task( // สร้างงานใหม่
                title: titleController.text,
                description: descriptionController.text,
              );  
                Navigator.pop(
                  context,
                  newTask, // ส่งงานใหม่กลับไปยังหน้าก่อนหน้า
                  );
              },
              child: const Text('บันทึก')
            )
          ]
      ),
    ),
    );
  }
}