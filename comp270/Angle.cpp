// angle.cpp demonstrate class & objects

#include<iostream>
using namespace std;
class Angle // Angle calss
{
  private:
	int degrees;
	float minutes;
  public:
	void setdeg(int dg, float mn)  // set Angle use two arguments
	{ degrees = dg; minutes = mn; }

	void getdeg()
	{
	  cout<<"\nEnter degrees:";  cin>>degrees;
	  cout<<"\nEnter minutes:";  cin>>minutes;
	}

	void dispdeg()
	{cout<< degrees << "dgs.   "<< minutes << " mns.\n"<< endl;}
};

void main()
{
  Angle d1,d2;   // define two Angles
  d1.setdeg(11, 9.25);
  d2.getdeg();
  cout<<"\nd1= ";  d1.dispdeg();
  cout<<"\nd2= ";  d2.dispdeg();
}

