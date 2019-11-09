import 'package:NeuralNetworkEngine/Vector.dart';


class Matrix {

	List<List<double>> _values;
	int height; // TODO: Make final/calculated?
	int width; // TODO: Make final/calculated?

	Matrix(List<List<double>> values) {
		if (values == null) {
			throw ArgumentError('\'values\' is not a proper matrix literal.');
		}
		this.height = values.length;
		if (this.height <= 0) {
			throw ArgumentError('\'values\' is not a proper matrix literal.');
		}
		this.width = values[0].length;
		if (this.width <= 0) {
			throw ArgumentError('\'values\' is not a proper matrix literal.');
		}
		this._values = List(this.height);
		for (var hItr = 0; hItr < this.height; hItr++ ) {
			var row = List<double>(this.width);
			for (var wItr = 0; wItr < this.width; wItr++ ) {
				// TODO: Allow jagged Matricies?  Pad with 0s
				row[wItr] = values[hItr][wItr].toDouble();
			}
			_values[hItr] = row;
		}
	}

	Matrix.fromHeightWidth(int height, int width) {
		this.height = height;
		this.width = width;
		this._values = List(this.height);
		for (var hItr = 0; hItr < this.height; hItr++ ) {
			var row = List<double>(this.width);
			for (var wItr = 0; wItr < this.width; wItr++ ) {
				row[wItr] = 0;
			}
			_values[hItr] = row;
		}
	}




	// ====================
	//   Methods
	// ====================

	void printMatrix() {
		print('[');
		for (var hItr = 0; hItr < this.height; hItr++ ) {
			var rowString = "";
			for (var wItr = 0; wItr < this.width; wItr++ ) {
				rowString = "${rowString}${_values[hItr][wItr]}\t";
			}
			print(rowString);
		}
		print(']');
	}

	Vector getVectorFromColumn(int index) {
		var newValues = List<double>(this.height);
		for (var hItr= 0; hItr < this.height; hItr++) {
			newValues[hItr] = this[hItr][index];
		}
		return new Vector(newValues);
	}

	Matrix setColumnToVector(int index, Vector vector) {
		var newValues = List<List<double>>(height);
		for (var hItr = 0; hItr < this.height; hItr++ ) {
			var row = List<double>(this.width);
			for (var wItr = 0; wItr < this.width; wItr++ ) {
				row[wItr] = this[hItr][wItr];
			}
			newValues[hItr] = row;
		}

		// Update the Column
		for (var hItr = 0; hItr < this.height; hItr++ ) {
				newValues[hItr][index] = vector[hItr];
		}
		return new Matrix(newValues);
	}

	// Matrix setRowToVector(int index, Vector vect) { }







	// ====================
	//   Operations
	// ====================

	List<double> operator [](int index) {
		var row = List<double>(this.width);
		for (var wItr = 0; wItr < this.width; wItr++ ) {
			row[wItr] = _values[index][wItr];
		}
		return row;
	}

	Matrix operator +(other) {
		if (other is Matrix) {
			if (this.height != other.height || this.width != other.width) {
				throw ArgumentError('Cannot add matrices of different sizes');
			}
			var newValues = List<List<double>>(height);
			for (var hItr = 0; hItr < this.height; hItr++ ) {
				var row = List<double>(this.width);
				for (var wItr = 0; wItr < this.width; wItr++ ) {
					row[wItr] = this[hItr][wItr]+other[hItr][wItr];
				}
				newValues[hItr] = row;
			}
			return new Matrix(newValues);
		}
		// if (other is double || other is num || other is int) { }
		throw UnsupportedError('Unsupported Multiplication operation');
	}

	Matrix operator -(other) {
		if (other is Matrix) {
			if (this.height != other.height || this.width != other.width) {
				throw ArgumentError('Cannot add matrices of different sizes');
			}
			var newValues = List<List<double>>(height);
			for (var hItr = 0; hItr < this.height; hItr++ ) {
				var row = List<double>(this.width);
				for (var wItr = 0; wItr < this.width; wItr++ ) {
					row[wItr] = this[hItr][wItr]-other[hItr][wItr];
				}
				newValues[hItr] = row;
			}
			return new Matrix(newValues);
		}
		// if (other is double || other is num || other is int) { }
		throw UnsupportedError('Unsupported Multiplication operation');
	}

	dynamic operator *(other) {
		if (other is Vector) {
			if (this.width != other.height) {
				throw ArgumentError('Cannot multiply matrices/vectors of improper sizes');
			}
			var newValues = List<double>(this.height);
			for (var hItr = 0; hItr < this.height; hItr++ ) {
				double sum = 0;
				for (var wItr = 0; wItr < this.width; wItr++ ) {
					sum += this[hItr][wItr]*other[wItr];
				}
				newValues[hItr] = sum;
			}
			return new Vector(newValues);
		}
		if (other is Matrix) {
			if (this.width != other.height) {
				throw ArgumentError('Cannot multiply matrices of improper sizes');
			}
			var newMatrix = new Matrix.fromHeightWidth(this.height, other.width);
			for (var wItr = 0; wItr < other.width; wItr++ ) {
				var resultVector = this*other.getVectorFromColumn(wItr);
				newMatrix = newMatrix.setColumnToVector(wItr, resultVector);
			}
			return newMatrix;
		}
		if (other is double || other is num || other is int) {
			var newValues = List<List<double>>(height);
			for (var hItr = 0; hItr < this.height; hItr++ ) {
				var row = List<double>(this.width);
				for (var wItr = 0; wItr < this.width; wItr++ ) {
					row[wItr] = this[hItr][wItr]*other;
				}
				newValues[hItr] = row;
			}
			return new Matrix(newValues);
		}
		throw UnsupportedError('Unsupported Multiplication operation');
	}

	Matrix operator /(other) {
		if (other is double || other is num || other is int) {
			return this*(1/other);
		}
		throw UnsupportedError('Unsupported Multiplication operation');		
	}

	
}