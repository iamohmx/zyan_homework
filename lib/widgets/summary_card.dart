import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  const SummaryCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'ปริมาณน้ำนมดิบจากศูนย์วันนี้',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 4),
            const Text(
              'ศูนย์รวบรวมน้ำนมดิบ แผนกฟาร์มประสิทธิภาพสูง อ.ส.ค.',
              style: TextStyle(fontSize: 12, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            _buildSummaryRow('หมายเลขสมาชิก: ', '003'),
            const SizedBox(height: 4),
            _buildRichTextSummary(
              'รอบเช้า: ',
              '0.0',
              ' กก. รอบเย็น: ',
              '0.0',
              ' กก.',
            ),
            const SizedBox(height: 4),
            _buildRichTextSummary('รวมทั้งหมด: ', '0.0', ' กิโลกรัม', '', ''),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Text(
      '$label$value',
      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildRichTextSummary(
    String s1,
    String v1,
    String s2,
    String v2,
    String s3,
  ) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black,
          fontFamily: 'Prompt',
        ),
        children: <TextSpan>[
          TextSpan(text: s1),
          TextSpan(
            text: v1,
            style: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(text: s2),
          if (v2.isNotEmpty)
            TextSpan(
              text: v2,
              style: const TextStyle(
                color: Colors.purple,
                fontWeight: FontWeight.bold,
              ),
            ),
          TextSpan(text: s3),
        ],
      ),
    );
  }
}
