#include<stdio.h>

typedef unsigned char * byte_pointer;

void show_bytes(byte_pointer start, int len){
	int i;
	for(int i=0; i<len; ++i)
		printf("%.2x", start[i]);
	printf("\n");
}

void show_int(int x){
	show_bytes((byte_pointer)&x, sizeof(int));
}

void show_float(float x){
	show_bytes((byte_pointer) &x, sizeof(float));
}

void show_pointer(void *x){
	show_bytes((byte_pointer) &x, sizeof(void *));
}

int arith(int x, int y, int z){
	int t1 = x+y;
	int t2 = z*48;
	int t3 = t1&0xffff;
	int t4 = t2*t3;
	return t4;
}

void sotre_prob(long long *dest, unsigned x, long long y){
	*dest = x*y;
}

void compare(unsigned x, unsigned y, unsigned *c){
	if(x < y)
		*c = x;
	else
		*c = y;
}

//exercise 3.26
int arithDivide(int x){
	return x / 4;
}

//exercise 3.27
int test1(int x, int y){
	int val = x+y;
	if(y > 0){
		if(x<y)	
			val = x-y;
		else
			val = x^y;
	} else if(y<-2)
		val = 4*x;
	return val;
}

//picture 3-18
int switch_eg(int x, int n){
	int result = x;
	switch(n){
		case 100:
			result *= 13;
			break;
		case 102:
			result += 10;
		case 103:
			result += 11;
			break;
		case 104:
		case 106:
			result *= result;
			break;
		default:
			result = 0;
	}
	return result;
}

int main(){
	unsigned char c = 0x80;
	unsigned i = (unsigned)c;
	show_int(i);
}
