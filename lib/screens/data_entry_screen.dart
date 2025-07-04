import 'package:flutter/material.dart';

class DataEntryScreen extends StatefulWidget {
  const DataEntryScreen({Key? key}) : super(key: key);

  @override
  _DataEntryScreenState createState() => _DataEntryScreenState();
}

class _DataEntryScreenState extends State<DataEntryScreen> {
  final _formKey = GlobalKey<FormState>();
  final _koreedController = TextEditingController();
  final _koreedTongController = TextEditingController();
  final _kodraiController = TextEditingController();
  final _kodraiTongController = TextEditingController();
  final _kosaoController = TextEditingController();
  final _kosaoTongController = TextEditingController();
  final _koklodController = TextEditingController();

  @override
  void dispose() {
    // Dispose all controllers
    _koreedController.dispose();
    _koreedTongController.dispose();
    _kodraiController.dispose();
    _kodraiTongController.dispose();
    _kosaoController.dispose();
    _kosaoTongController.dispose();
    _koklodController.dispose();
    super.dispose();
  }

  void _showConfirmationDialog() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            title: const Center(
              child: Text(
                'บันทึกข้อมูลประชากรโค',
                // style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
            content: const Text('คุณต้องการบันทึกข้อมูลประชากรโคหรือไม่'),
            actionsAlignment: MainAxisAlignment.center,
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'ยกเลิก',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop(); // Close confirmation dialog
                  _showSuccessDialog();
                },
                child: const Text(
                  'ตกลง',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          );
        },
      );
    } else {
      // Show error message if validation fails
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('กรุณากรอกข้อมูลให้ครบถ้วนและถูกต้อง'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent dismissing by tapping outside
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Success background with green gradient
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color(0xFF4CAF50), // Green
                        Color(0xFF66BB6A), // Light green
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(Icons.check, size: 60, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'สำเร็จ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close success dialog
                      Navigator.of(context).pop(); // Go back to dashboard
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'OK',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          'บันทึกประชากรโคนมประจำเดือน',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    _buildTextField(
                      controller: _koreedController,
                      label: 'โครีด',
                      hint: 'ระบุจำนวนโครีด',
                    ),
                    _buildTextField(
                      controller: _koreedTongController,
                      label: 'โครีดท้อง',
                      hint: 'ระบุจำนวนโครีดท้อง',
                    ),
                    _buildTextField(
                      controller: _kodraiController,
                      label: 'โคดราย',
                      hint: 'ระบุจำนวนโคดราย',
                    ),
                    _buildTextField(
                      controller: _kodraiTongController,
                      label: 'โคดรายท้อง',
                      hint: 'ระบุจำนวนโคดรายท้อง',
                    ),
                    _buildTextField(
                      controller: _kosaoController,
                      label: 'โคสาว',
                      hint: 'ระบุจำนวนโคสาว',
                    ),
                    _buildTextField(
                      controller: _kosaoTongController,
                      label: 'โคสาวท้อง',
                      hint: 'ระบุจำนวนโคสาวท้อง',
                    ),
                    _buildTextField(
                      controller: _koklodController,
                      label: 'โคคลอด',
                      hint: 'ระบุจำนวนโคคลอด',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _showConfirmationDialog,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Text(
                  'บันทึก',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'กรุณาระบุจำนวน$label';
          }

          // Check if the value is a valid number
          final number = int.tryParse(value);
          if (number == null) {
            return 'กรุณาระบุตัวเลขที่ถูกต้อง';
          }

          // Check if the number is not negative
          if (number < 0) {
            return 'จำนวนต้องไม่เป็นค่าลบ';
          }

          return null;
        },
      ),
    );
  }
}
