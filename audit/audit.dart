// audit.dart
// Simple audit script for Flutter project.
// Scans lib/ for:
//   - Fixed width/height values
//   - Duplicate widget files (same class name)
//   - Async/await misuse (await without async)
// Generates AUDIT_REPORT.md in project root.
import 'dart:io';

void main() async {
  final libDir = Directory('lib');
  if (!await libDir.exists()) {
    print('lib directory not found');
    exit(1);
  }
  final report = StringBuffer();
  report.writeln('# AUDIT REPORT');
  report.writeln('\n## Fixed Size Widgets');
  await for (var entity in libDir.list(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final lines = await entity.readAsLines();
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i];
        if (line.contains('width:') || line.contains('height:')) {
          if (RegExp(r'width:\s*\d+').hasMatch(line) || RegExp(r'height:\s*\d+').hasMatch(line)) {
            report.writeln('- ${entity.path} (line ${i + 1}): ${line.trim()}');
          }
        }
      }
    }
  }
  report.writeln('\n## Duplicate Widget Classes');
  // naive duplicate detection by class name
  final classMap = <String, List<String>>{};
  await for (var entity in libDir.list(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final content = await entity.readAsString();
      final classMatches = RegExp(r'class\s+(\w+)\s+extends\s+StatelessWidget|class\s+(\w+)\s+extends\s+StatefulWidget', multiLine: true).allMatches(content);
      for (var m in classMatches) {
        final className = m.group(1) ?? m.group(2);
        if (className != null) {
          classMap.putIfAbsent(className, () => []).add(entity.path);
        }
      }
    }
  }
  classMap.forEach((name, files) {
    if (files.length > 1) {
      report.writeln('- $name found in:');
      for (var f in files) {
        report.writeln('  - $f');
      }
    }
  });
  report.writeln('\n## Async/Await Issues');
  await for (var entity in libDir.list(recursive: true, followLinks: false)) {
    if (entity is File && entity.path.endsWith('.dart')) {
      final lines = await entity.readAsLines();
      for (var i = 0; i < lines.length; i++) {
        final line = lines[i];
        if (line.contains('await ') && !lines.sublist(0, i).any((l) => l.contains('async'))) {
          report.writeln('- ${entity.path} (line ${i + 1}): ${line.trim()}');
        }
      }
    }
  }
  final reportFile = File('AUDIT_REPORT.md');
  await reportFile.writeAsString(report.toString());
  print('Audit completed. Report generated at ${reportFile.path}');
}
