import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_form_screen.dart';
 
class TaskListScreen extends StatefulWidget{
  TaskListScreen({super.key});
 
  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}
 
 
 
class _TaskListScreenState extends State<TaskListScreen> {
 
  
  final List<Task> tasks = [
    Task(
      title: 'ทำการบ้าน',
      description: 'ส่งการบ้าน',
    ),
    Task(
      title: 'ซักผ้า',
      description: 'ซักเสื้อผ้าให้เรียบร้อย',
      isDone: true,
    ),
    Task(
      title: 'ซื้อของ',
      description: 'ซื้อของที่ตลาด',
    ),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('งานที่ต้องทำ'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
 
          return Card(
            child: ListTile(
              onTap: (){
                setState(() {
                  task.isDone = !task.isDone;
                });
              },
              
              leading: Icon(
                task.isDone
                    ? Icons.check_circle
                    : Icons.circle_outlined,
              ),
              title: Text(task.title),
              subtitle: Text(task.description),

              trailing: IconButton(
                icon: const Icon(Icons.delete), // ปุ่มลบงาน
                onPressed: () {
                  setState(() {
                    tasks.removeAt(index);
                  });
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async { //ใช้ async เพื่อรอผลลัพธ์จากหน้าฟอร์ม
          final newTask = await Navigator.push<Task>( // ส่งไปยังหน้าฟอร์มและรอผลลัพธ์
            context,
            MaterialPageRoute(
              builder: (context) =>  TaskFormScreen(),
            ),
          );
           // หลังจากผู้ใช้กรอกฟอร์มและกด บันทึก จะได้ผลลัพธ์เป็นงานใหม่ (newTask) 
           //ก็จะทำการเพิ่มงานใหม่ลงในรายการ tasks และอัปเดตหน้าจอ
           // ตรวจสอบว่าผู้ใช้ได้กรอกข้อมูลและกดบันทึกหรือไม่
          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
 
 
 