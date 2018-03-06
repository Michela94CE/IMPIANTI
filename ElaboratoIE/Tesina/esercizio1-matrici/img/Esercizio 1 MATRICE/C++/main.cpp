#include <iostream>
#include <cstdlib>
#include <time.h>
#include <sys/time.h>
#include <windows.h>
using namespace std;

void generaMatrice(int** , int );
void multiple(int , int** , int** );
void removeMatrix ( int**  , int **  , int );

int main(int argc, char** argv) {
	srand((unsigned)time(NULL));
	int n = 5000;
	int** A = new int* [n];
	int** B = new int*[n];

	//Inizializzazione
	generaMatrice(A,n);
	generaMatrice(B,n);

	clock_t start,stop;
	LARGE_INTEGER startTime, endTime, frequency;
	QueryPerformanceFrequency(&frequency);
	double pcFreq = double (frequency.QuadPart);
	QueryPerformanceCounter(&startTime);
		multiple(n,A,B);
	QueryPerformanceCounter(&endTime);
	double time = double(endTime.QuadPart - startTime.QuadPart);
	time = time / pcFreq;
	cout<< " Tempo calcolato : "<<time<<endl;
	removeMatrix(A,B,n);
	system("PAUSE");
	return 0;
}

void generaMatrice(int** A , int n){
		for(int i = 0 ; i < n ; i++){
			A[i] = new int[n];
			for(int j=0 ; j<n ; j++){
				A[i][j] = rand()%9999+1;
				
			}
			
		}		
}

void multiple(int n , int** A, int** B){
		int somma = 0;
		
		for(int j = 0 ; j < n ; j++){
			for(int i = 0; i < n ; i++){
				somma = 0;
				for( int k = 0 ; k < n ; k++){
					somma += A[j][k]*B[k][i];
				}
				
			}
		}
}

void removeMatrix ( int** A , int ** B , int n){
	for(int i = 0 ; i < n ; i++){
		delete A[i];
		delete B[i];
	}
	delete A;
	delete B;
}
