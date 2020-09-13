// CMPT 295 Assignment 2 Four-bit Full Adder
// DO NOT include a main function in your final submission.
// Jia Ming WU
// 301278354
#include <stdio.h>

typedef char bit;

// Adders return a sum and carry-out. Sum may be multiple bits in size, but carry-out is
// always one bit in size.
typedef struct 
{
        int sum;
	bit carryOut;
} adderReturn;

// Implements the half adder logic from class. 
// PRE: the bits to be added are in the least significant bit of x and y
// POST: the sum and carry-out of adding the two bits is returned
adderReturn halfAdder(bit x, bit y)
{
	adderReturn output;
	output.sum = x^y;
	output.carryOut = x&y;

	return output;
}

// Implements the full adder logic from class, using two half-adders. 
// PRE: the bits to be added are in the least significant bit of x, y, and carryIn
// POST: the sum and carry-out of adding the three bits is returned
adderReturn fullAdder(bit x, bit y, bit carryIn)
{
  	//adderReturn output;
        //output.sum = x^y^carryIn;
        //output.carryOut = (x&y) | (carryIn&(x^y));
	adderReturn output;
	//add xy
	adderReturn s0 = halfAdder(x,y);
	//xy + carryin
	adderReturn s1 = halfAdder(carryIn,s0.sum);
	//return sum and carry out
	output.sum = s1.sum;
	output.carryOut = s0.carryOut | s1.carryOut;
	return output;
}

// Implements a four-bit full adder using multiple calls to the fullAdder function.
// PRE: the least significant four-bits of a and b contain the numbers to be added,
//      and the least significant bit of carryIn contains the carry-in to be used
// POST: the four-bit sum and single-bit carry-out is returned. Note that the carry-out
//       signals whether overflow occurred.
adderReturn fourBitAdder(int a, int b, bit carryIn)
{
	adderReturn output;
	
	//extract bits and put on rightmost
	int a0 = (a >> 0) & 1;
	int a1 = (a >> 1) & 1;
	int a2 = (a >> 2) & 1;
	int a3 = (a >> 3) & 1;
	int b0 = (b >> 0) & 1;
	int b1 = (b >> 1) & 1;
	int b2 = (b >> 2) & 1;
	int b3 = (b >> 3) & 1;
	//printf("a= %d %d %d %d \n",a0 ,a1, a2 ,a3);
	//printf("b= %d %d %d %d \n",b0 ,b1, b2 ,b3);
	
	//add the bits
	//  a0 a1 a2 a3
	//  b0 b1 b2 b3
	//+______________
	//  s0 s1 s2 s3
	adderReturn s0=fullAdder(a0,b0,carryIn);
	adderReturn s1=fullAdder(a1,b1,s0.carryOut);
	adderReturn s2=fullAdder(a2,b2,s1.carryOut);
	adderReturn s3=fullAdder(a3,b3,s2.carryOut);

	//keep and return the last carry out
	output.carryOut = s3.carryOut;

	/*printf("sum s0 : %d \n ",s0.sum);
	printf("sum s1 : %d \n ",s1.sum);
	printf("sum s2 : %d \n ",s2.sum);
	printf("sum s3 : %d \n ",s3.sum);
	printf("carry s0 : %d \n ",s0.carryOut);
	printf("carry s1 : %d \n ",s1.carryOut);
	printf("carry s2 : %d \n ",s2.carryOut);
	printf("carry s3 : %d \n ",s3.carryOut);
	*/

	
	//move the bits back into one pieces
	int sum0 =s0.sum;
	int sum1 =s1.sum<<1;
	int sum2 =s2.sum<<2;
	int sum3 =s3.sum<<3;
	//combine and return as output sum
	output.sum = sum0|sum1|sum2|sum3;

	return output;
}

 

