#include <stdio.h>
typedef unsigned bit32;

unsigned int sign(bit32 x){
	return x & 0x80000000; // f =16 which takes the left most
			       // 1000 0000 0000 0000 0000 0000 0000 0000
}

unsigned int expon(bit32 x){
	return x & 0x7f800000; // take the 8 bit follow by the first
}				// 0111 1111 1000 0000 0000 0000 0000 0000

unsigned int frac(bit32 x){
        return x & 0x007fffff; // take the rest after the first 9
}				// 0000 0000 0111 1111 1111 1111 1111 1111

bit32 float_32(unsigned int sign, unsigned int exp, unsigned int frac){
        bit32 val;
	bit32 signs = sign;
        bit32 exponent = exp;
        bit32 fraction = frac;
	val = signs + exponent + fraction;
	return val;
}
/* testing purpose
void printhex(bit32 x){
    printf("%.8x", x);
}
void main(){
printhex(sign(0x80000000));
printf("\n"); 
printhex(expon(0x11111111));
printf("\n");
printhex(frac(0x12844321));
printf("\n");
printhex(float_32(sign(0x80000000),expon(0x11111111),frac(0x00044321)));
printf("\n");
*/
}
