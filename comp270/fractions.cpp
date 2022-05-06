//
//COMP270 Prof. Chao
//Object Oriented Programming
//
//Justin Knox
//Lab Experiement 1

//This program is to demontrate the 
//use of structures, and show how one might
//use them in the case of adding two 
//fractions together.

#include<iostream>

using namespace std;

void main()
{
	struct fraction
	{
		int top;
		int bot;
	};
	
	
	float approx = 0;
	fraction frac1;
	fraction frac2;
	fraction fractot;

	cout <<	"Welcome to the Fractionator\n\n "  << endl;
	cout <<	"Please enter the first fraction "  << endl;
	cout << "that you would like to add:     "  << endl;

	cin  >> frac1.top ;
	cin.get();
	cin  >> frac1.bot ;

	cout <<	"Please enter the second fraction" << endl;
	cout << "that you would like to add:    "  << endl;

	cin  >> frac2.top ;
	cin.get();
	cin  >> frac2.bot ;

	fractot.top = (frac1.top * frac2.bot) + (frac2.top * frac1.bot) ;
	fractot.bot = (frac1.bot * frac2.bot) ;

	approx = (float)fractot.top / (float)fractot.bot ;
	
	
	cout << "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"		<< endl;
	cout << "Your answer is:				 "		<< endl;
	cout << fractot.top << " / " << fractot.bot		<< endl;
	cout << "Which is approx.  " << approx	 		<< endl;
	
}
