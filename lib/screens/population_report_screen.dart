import 'package:flutter/material.dart';
import 'package:zyan_homework/widgets/population_chart.dart';

class PopulationReportScreen extends StatelessWidget {
  const PopulationReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'รายงานประชากรโคนม',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'จำนวนประชากรโคนม',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: const [
                          Text('มิ.ย 2568', style: TextStyle(fontSize: 12)),
                          Icon(Icons.arrow_drop_down, color: Colors.grey),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(Icons.circle, color: Colors.cyan, size: 12),
                    const SizedBox(width: 4),
                    const Text('โคไม่ท้อง', style: TextStyle(fontSize: 12)),
                    const SizedBox(width: 16),
                    const Icon(Icons.circle, color: Colors.orange, size: 12),
                    const SizedBox(width: 4),
                    const Text('โคท้อง', style: TextStyle(fontSize: 12)),
                  ],
                ),
                const SizedBox(height: 16),
                const PopulationChart(),
                const SizedBox(height: 24),
                const Text(
                  'จำนวนประชากรโคนมทั้งหมดมี 122 ตัว',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _buildReportDetailRow('จำนวนโครีดทั้งหมด', '35 ตัว'),
                _buildReportDetailRow('จำนวนโคดรายทั้งหมด', '32 ตัว'),
                _buildReportDetailRow('จำนวนโคสาวทั้งหมด', '27 ตัว'),
                _buildReportDetailRow('จำนวนโคคลอดทั้งหมด', '16 ตัว'),
                _buildReportDetailRow('จำนวนลูกโคทั้งหมด', '12 ตัว'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReportDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        '$label $value',
        style: const TextStyle(fontSize: 12, color: Colors.grey),
      ),
    );
  }
}
