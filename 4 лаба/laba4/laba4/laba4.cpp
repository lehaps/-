#include <iostream>
#include <iostream>

extern "C" float* SumR(int, float* x);
using namespace std;
		
int main() {
	setlocale(LC_ALL, "Russian");
	int n = 0;
	float* x = nullptr;
	cout << "\nВведите количество значений функции:";
	cin >> n;
	cout << "Значения x:\n";
	x = new float[n];
	for (int i = 0; i < n; i++) {
		cout << "x[" << i+1 << "] = ";
		cin >> x[i];
	}
	float* R = nullptr;
	R = SumR(n, x);
	cout << "\nРезультат:\n";
	for (int i = 0; i < n; i++) {
		cout << "R[" << i+1 << "] = " << R[i] << endl;
	}
	return 0;
}

