import 'package:NeuralNetworkEngine/NeuralNetworkEngine.dart' as NeuralNetworkEngine;
import 'package:NeuralNetworkEngine/Matrix.dart';
import 'package:NeuralNetworkEngine/Vector.dart';


main(List<String> arguments) {
	// lessonTwo();
	// lessonThree();
	// lessonFour();
	// lessonFive();
	lessonSix();
 }


// ==========================================================================================
// These lesson methods follow along with this Coursera course:
//   https://www.coursera.org/lecture/machine-learning/matrices-and-vectors-38jIT
// ==========================================================================================

void lessonTwo() {

	print('\n[Example #1]\n');
	var m1 = new Matrix([
		[1, 0],
		[2, 5],
		[3, 1],
	  ])
	..printMatrix();

	print('\nmultiplied by\n');
	var m2 = new Matrix([
		[4, 0.5],
		[2, 5],
		[0, 1],
	  ])
	..printMatrix();

	print('\nequals\n');

	var resultMatrix = m1 + m2;

	resultMatrix.printMatrix();	

	print('\n[Example #2]\n');
	var m3 = new Matrix([
		[1, 0],
		[2, 5],
		[3, 1],
	  ])
	..printMatrix();

	var scalar = 3;

	print('\nmultiplied by\n');
	print(scalar);
	print('\nequals\n');

	(m3*scalar)
	..printMatrix();

	var m4 = new Matrix([
		[4, 0],
		[6, 3],
	  ])
	..printMatrix();

	var scalar2 = 4;

	print('\ndivided by\n');
	print(scalar2);
	print('\nequals\n');
	(m4/scalar2)
	..printMatrix();

	print('\n[Example #3]\n');

	var v1 = new Vector([1, 4, 2])
	..printVector();

	var v2 = new Vector([0, 0, 5])
	..printVector();

	var v3 = new Vector([3, 0, 2])
	..printVector();

	var resultVector = v1*3+v2-v3/3
	..printVector();	
}

void lessonThree() {
	print('\n[Example #1]\n');
	var m1 = new Matrix([
		[1, 3],
		[4, 0],
		[2, 1],
	  ])
	..printMatrix();

	print('\nmultiplied by\n');

	var v1 = new Vector([1, 5])
	..printVector();

	print('\nequals\n');

	var result = m1*v1;
	result.printVector();


	print('\n[Example #2]\n');
	var m2 = new Matrix([
		[1, 2, 1, 5],
		[0, 3, 0, 4],
		[-1, -2, 0, 0],
	  ])
	..printMatrix();

	print('\nmultiplied by\n');

	var v2 = new Vector([1, 3, 2, 1])
	..printVector();

	print('\nequals\n');

	var result2 = m2*v2;
	result2.printVector();


	print('\n[Example #3]\n');
	var m3 = new Matrix([
		[1, 2104],
		[1, 1416],
		[1, 1534],
		[1, 852],
	  ])
	..printMatrix();

	print('\nmultiplied by\n');

	var v3 = new Vector([-40, 0.25])
	..printVector();

	print('\nequals\n');

	var result3 = m3*v3;
	result3.printVector();
}

void lessonFour() {

	print('\n[Example #1]\n');
	var m1 = new Matrix([
		[1, 3, 2],
		[4, 0, 1],
	  ])
	..printMatrix();

	print('\nmultiplied by\n');

	var m2 = new Matrix([
		[1, 3],
		[0, 1],
		[5, 2],
	  ])
	..printMatrix();

	print('\nequals\n');

	var result = m1*m2;
	result.printMatrix();



	print('\n[Example #2]\n');
	var m3 = new Matrix([
		[1, 3],
		[2, 5],
	  ])
	..printMatrix();

	print('\nmultiplied by\n');

	var m4 = new Matrix([
		[0, 1],
		[3, 2],
	  ])
	..printMatrix();

	print('\nequals\n');

	var result2 = m3*m4;
	result2.printMatrix();



	print('\n[Example #3]\n');
	var m5 = new Matrix([
		[1, 2104],
		[1, 1416],
		[1, 1534],
		[1, 852],
	  ])
	..printMatrix();

	print('\nmultiplied by\n');

	var m6 = new Matrix([
		[-40, 200, -150],
		[0.25, 0.1, 0.4],
	  ])
	..printMatrix();

	print('\nequals\n');

	var result3 = m5*m6;
	result3.printMatrix();
}

void lessonFive() {

	print('\n[Example #1]\n');
	var m1 = new Matrix([
		[1, 1],
		[0, 0],
	  ])
	..printMatrix();

	print('\nmultiplied by\n');

	var m2 = new Matrix([
		[0, 0],
		[2, 0],
	  ])
	..printMatrix();

	print('\nequals\n');

	var result = m1*m2;
	result.printMatrix();

	print('\nreverse multiplied equals\n');

	var result2 = m2*m1;
	result2.printMatrix();


	print('\n[Breakaway Test #1]\n');
	var m3 = new Matrix([
		[5, 10, 15, 20],
		[4,  8, 12, 16],
		[3,  6,  9, 12],
		[2,  4,  6,  8],
	  ])
	..printMatrix();

	print('\nmultiplied by\n');

	var m4 = new Matrix([
		[1, 0, 0, 0],
		[0, 1, 0, 0],
		[0, 0, 1, 0],
		[0, 0, 0, 1],
	  ])
	..printMatrix();

	print('\nequals\n');

	var result3 = m3*m4;
	result3.printMatrix();

	print('\nreverse multiplied equals\n');

	var result4 = m4*m3;
	result4.printMatrix();
}

void lessonSix() {

	print('\n[Example #1]\n');
	var m1 = new Matrix([
		[3, 4],
		[2, 16],
	  ])
	..printMatrix();

	print('\nmultiplied by\n');

	var m2 = new Matrix([
		[0.4, -0.1],
		[-0.05, 0.075],
	  ])
	..printMatrix();

	print('\nequals\n');

	var result = m1*m2;
	result.printMatrix();

	print('\nreverse multiplied equals\n');

	var result2 = m2*m1;
	result2.printMatrix();

}
