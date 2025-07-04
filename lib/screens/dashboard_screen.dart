import 'package:flutter/material.dart';
import 'package:zyan_homework/components/qr_code_scanner.dart';
import 'package:zyan_homework/screens/data_entry_screen.dart';
import 'package:zyan_homework/screens/population_report_screen.dart';
import 'package:zyan_homework/widgets/dashboard_header.dart';
import 'package:zyan_homework/widgets/population_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Zyan Dairy', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                const DashboardHeader(),
                Positioned(
                  bottom: -45, // Half the height of the buttons (90/2)
                  left: 0,
                  right: 0,
                  child: _buildTopActionButtons(),
                ),
              ],
            ),
            const SizedBox(height: 60), // Space for the overlapping buttons
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildMiddleButtons(),
                  const SizedBox(height: 20),
                  _buildLargeButton(
                    'ฉีดวัคซีน',
                    Icons.vaccines, // Changed icon
                    const Color(0xFF008080), // Teal color from ref
                    context,
                  ),
                  const SizedBox(height: 12),
                  _buildLargeButton(
                    'ให้ยา',
                    Icons.medication, // Changed icon
                    const Color(0xFFE55B3C), // Orange-red color from ref
                    context,
                  ),
                  const SizedBox(height: 20),
                  _buildPopulationCard(context),
                  const SizedBox(height: 20),
                  _buildSummaryCard(context),
                  const SizedBox(height: 20),
                  _buildChartCard(context),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: _buildCentralButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildTopActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildActionButton(Icons.format_list_bulleted, 'รายการโค', Colors.pink),
        _buildActionButton(Icons.add, 'นำเข้าโค', Colors.pink),
        _buildActionButton(Icons.opacity, 'น้ำนม', Colors.pink),
      ],
    );
  }

  Widget _buildActionButton(IconData icon, String label, Color color) {
    return Container(
      width: 90,
      height: 90,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color, size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              fontFamily: 'Prompt',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMiddleButton(String label, Color color, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
        boxShadow: color == Colors.pink
            ? [
                BoxShadow(
                  color: Colors.pink.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ]
            : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildMiddleButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildMiddleButton('การรักษา', Colors.pink, Colors.white),
        _buildMiddleButton('ผสมพันธุ์', Colors.grey[200]!, Colors.black54),
        _buildMiddleButton('จัดการข้อมูล', Colors.grey[200]!, Colors.black54),
      ],
    );
  }

  Widget _buildLargeButton(
    String label,
    IconData icon,
    Color color,
    BuildContext context,
  ) {
    return Container(
      height: 80, // Increased height
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16), // Increased border radius
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0), // Increased padding
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 24.0), // Increased padding
            child: Icon(
              icon,
              color: Colors.white,
              size: 32,
            ), // Increased icon size
          ),
        ],
      ),
    );
  }

  Widget _buildPopulationCard(BuildContext context) {
    return _buildCard(
      title: 'จำนวนประชากรโคนม',
      subtitle: 'มิ.ย 2568',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
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
          const SizedBox(height: 16),
          const Text(
            'จำนวนประชากรโคนมทั้งหมดในเดือนมิถุนายน 2568 มี 122 ตัว',
            style: TextStyle(fontSize: 10, color: Colors.grey),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DataEntryScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'บันทึกประชากรโคนม\nประจำเดือน',
                    style: TextStyle(fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PopulationReportScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'รายงานประชากรโคนม',
                    style: TextStyle(fontSize: 11),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard(BuildContext context) {
    return _buildCard(
      title: 'ปริมาณน้ำนมดิบจากศูนย์วันนี้',
      subtitle: 'ศูนย์รวบรวมน้ำนมดิบ แผนกฟาร์มประสิทธิภาพสูง อ.ส.ค.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 12),
          Center(child: _buildSummaryRow('หมายเลขสมาชิก: ', '003')),
          const SizedBox(height: 4),
          Center(
            child: _buildRichTextSummary(
              'รอบเช้า: ',
              '0.0',
              ' กก. รอบเย็น: ',
              '0.0',
              ' กก.',
            ),
          ),
          const SizedBox(height: 4),
          Center(
            child: _buildRichTextSummary(
              'รวมทั้งหมด: ',
              '0.0',
              ' กิโลกรัม',
              '',
              '',
            ),
          ),
        ],
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

  Widget _buildChartCard(BuildContext context) {
    return _buildCard(
      title: 'จำนวนโคในฟาร์ม',
      icon: Icons.refresh,
      child: SizedBox(
        height: 150,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildVerticalBar('ลูกโค', 10, Colors.pink),
            _buildVerticalBar('โคสาว', 47, Colors.pink),
            _buildVerticalBar('โครีด', 18, Colors.pink),
            _buildVerticalBar('โคดราย', 0, Colors.pink),
            _buildVerticalBar('โคคลอด', 0, Colors.pink),
            _buildVerticalBar('พ่อโค', 4, Colors.pink),
            _buildVerticalBar('ยังไม่ระบุ', 8, Colors.pink),
          ],
        ),
      ),
    );
  }

  Widget _buildCard({
    required String title,
    String? subtitle,
    required Widget child,
    IconData? icon,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (icon != null) Icon(icon, color: Colors.grey),
              ],
            ),
            if (subtitle != null)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  subtitle,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildVerticalBar(String label, int value, Color color) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (value > 0)
          Text(
            value.toString(),
            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
          ),
        Container(
          width: 20,
          height: value == 0 ? 5 : (value / 50 * 100).clamp(5, 120),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 10)),
      ],
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          _buildBottomNavItem(context, Icons.home, 'หน้าแรก', true),
          _buildBottomNavItem(context, Icons.person, 'บัญชี', false),
        ],
      ),
    );
  }

  Widget _buildCentralButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const QRCodeScanner()),
        );
      },
      backgroundColor: Colors.pink,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2.0,
      child: const Icon(Icons.qr_code_scanner, color: Colors.white, size: 30),
    );
  }

  Widget _buildBottomNavItem(
    BuildContext context,
    IconData icon,
    String label,
    bool isActive,
  ) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, color: isActive ? Colors.pink : Colors.grey),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.pink : Colors.grey,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
