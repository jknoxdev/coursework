//COMP270
//Professor Chao
//
//LAB 4
//This is a program to convert a user
//inputted time into its' equivalent 
//value in seconds unsing overloaded 
//functions


#include <iostream>
#include <cmath>
using namespace std;

long hms_to_secs(int, int, int);

void main()
{
	int hours = 0;
	int secs  = 0;
	int mins  = 0;
	char flag = 'n';

	cout << "Welcome to the time to second converter! "	<< endl;

	do
	{
		cout << "Please enter the time to be converted "	<< endl;
		cout << "in the following format:			   "	<< endl;
		cout << "\n\nhours : mins : secs "					<< endl;
		
		cin	>> hours;
		cin.get();
		cin >> mins;
		cin.get();
		cin >> secs;

		cout << "\n\nThe total time in secs is :		   " << endl;
		cout << hms_to_secs(hours , mins , secs) << "s "	 << endl;
		cout << "\n\nWould you like to enter another time? " << endl;
		cout << "Press y to continue					   " << endl;
		cin  >> flag ;
	}
	while(flag == 'y' || flag == 'Y');
}

long hms_to_secs(int hrsin, int mnsin, int scsin)
{
	long total = 0;

	total = ((long) hrsin * 60 * 60) + ((long)mnsin * 60) + ((long)scsin) ;

	return (total);
}


