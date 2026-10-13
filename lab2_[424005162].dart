import 'dart:io';

/// Represents a student and their three subject grades.
class Student {
	String fullName; // String
	int idNumber; // int
	List<double> grades; // three subject grades (double)
	double average = 0.0;
	String status = '';

	Student(this.fullName, this.idNumber, this.grades);

	/// Method: prints the student's profile and the grades in a formatted list.
	void displayInfo() {
		print('\n========== STUDENT GRADE REPORT ==========');
		print('Full Name : $fullName');
		print('ID Number : $idNumber');
		print('------------------------------------------');
		print('Subject Grades:');

		// For loop: display all 3 grades in a formatted list
		for (int i = 0; i < grades.length; i++) {
			print('  ${i + 1}. Subject ${i + 1}: ${grades[i].toStringAsFixed(2)}');
		}

		print('------------------------------------------');
		print('Average   : ${average.toStringAsFixed(2)}');
		print('Status    : $status');
		print('==========================================');
	}
}

/// Function: computes the average grade using arithmetic operators.
double computeGrade(double g1, double g2, double g3) {
	return (g1 + g2 + g3) / 3;
}

/// Determines the status using an if-else ladder.
String getStatus(double average) {
	if (average >= 75) {
		return 'Passed';
	} else if (average >= 70) {
		return 'Conditional'; // 70-74
	} else {
		return 'Failed'; // below 70
	}
}

/// Reads a non-empty line of text from the user.
String readText(String prompt) {
	while (true) {
		stdout.write(prompt);
		String? input = stdin.readLineSync();
		if (input != null && input.trim().isNotEmpty) {
			return input.trim();
		}
		print('  Input cannot be empty. Please try again.');
	}
}

/// Reads a valid integer ID number from the user.
int readId(String prompt) {
	while (true) {
		stdout.write(prompt);
		int? id = int.tryParse(stdin.readLineSync()?.trim() ?? '');
		if (id != null) {
			return id;
		}
		print('  Invalid ID. Please enter numbers only.');
	}
}

/// Reads a valid grade (0-100) from the user.
double readGrade(String prompt) {
	while (true) {
		stdout.write(prompt);
		double? grade = double.tryParse(stdin.readLineSync()?.trim() ?? '');
		if (grade != null && grade >= 0 && grade <= 100) {
			return grade;
		}
		print('  Invalid grade. Enter a number from 0 to 100.');
	}
}

void main() {
	print('===== STUDENT GRADE CALCULATOR =====\n');

	// Accept full name, ID number, and 3 subject grades via stdin.readLineSync()
	String name = readText('Enter Full Name: ');
	int id = readId('Enter ID Number: ');
	double grade1 = readGrade('Enter Grade for Subject 1: ');
	double grade2 = readGrade('Enter Grade for Subject 2: ');
	double grade3 = readGrade('Enter Grade for Subject 3: ');

	// Student class instantiated in main()
	Student student = Student(name, id, [grade1, grade2, grade3]);

	// Compute average using computeGrade() and determine status
	student.average = computeGrade(grade1, grade2, grade3);
	student.status = getStatus(student.average);

	// Display the formatted report
	student.displayInfo();
}
