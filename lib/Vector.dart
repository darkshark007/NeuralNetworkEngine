class Vector {

	List<double> _values;
	int height; // TODO: Make final/calculated?

	Vector(List<double> values) {
		if (values == null) {
			throw ArgumentError('\'values\' is not a proper vector literal.');
		}
		this.height = values.length;
		if (this.height <= 0) {
			throw ArgumentError('\'values\' is not a proper vector literal.');
		}
		this._values = List(this.height);
		for (var hItr = 0; hItr < this.height; hItr++ ) {
			_values[hItr] = values[hItr].toDouble();
		}
	}

	Vector.fromHeight(int height) {
		this.height = height;
		this._values = List(this.height);
		for (var hItr = 0; hItr < this.height; hItr++ ) {
			_values[hItr] = 0;
		}
	}





	// ====================
	//   Methods
	// ====================

	void printVector() {
		print('[');
		for (var hItr = 0; hItr < this.height; hItr++ ) {
			print(_values[hItr]);
		}
		print(']');
	}





	// ====================
	//   Operations
	// ====================

	double operator [](int index) {
		return _values[index];
	}


	dynamic operator +(other) {
		if (other is Vector) {
			if (this.height != other.height) {
				throw ArgumentError('Cannot add vectors of different sizes');
			}
			var newValues = List<double>(height);
			for (var hItr = 0; hItr < this.height; hItr++ ) {
				newValues[hItr] = this[hItr]+other[hItr];
			}
			return new Vector(newValues);
		}
		// if (other is double || other is num || other is int) { }
		throw UnsupportedError('Unsupported Multiplication operation');
	}

	dynamic operator -(other) {
		if (other is Vector) {
			if (this.height != other.height) {
				throw ArgumentError('Cannot subtract vectors of different sizes');
			}
			var newValues = List<double>(height);
			for (var hItr = 0; hItr < this.height; hItr++ ) {
				newValues[hItr] = this[hItr]-other[hItr];
			}
			return new Vector(newValues);
		}
		// if (other is double || other is num || other is int) { }
		throw UnsupportedError('Unsupported Multiplication operation');
	}

	dynamic operator *(other) {
		if (other is double || other is num || other is int) {
			var newValues = List<double>(height);
			for (var hItr = 0; hItr < this.height; hItr++ ) {
				newValues[hItr] = this[hItr]*other;
			}
			return new Vector(newValues);
		}
		throw UnsupportedError('Unsupported Multiplication operation');
	}

	dynamic operator /(other) {
		if (other is double || other is num || other is int) {
			return this*(1/other);
		}
		throw UnsupportedError('Unsupported Multiplication operation');		
	}



}
