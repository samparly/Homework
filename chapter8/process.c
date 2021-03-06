#include <stdio.h>
#include <sys/types.h>
#include <unistd.h>
#include "csapp.h"

pid_t getpid(void);
pid_t getppid(void);


void test1(){
	printf("pid: %d\n", getpid());
	printf("ppid: %d\n", getppid());
}


void test2(){
	pid_t pid;
	int x = 1;

	pid = Fork();

	if(pid == 0){
		//child process
		printf("child : x=%d\n", ++x);
		exit(0);
	}

	//parent process
	printf("parent : x=%d\n", --x);
	exit(0);
}

void test3(){
	Fork();
	printf("hello\n");
}

void test4(){
	pid_t pid;

	if( (pid = Fork()) == 0){
		Pause();
		printf("control should never reach here!\n");
		exit(0);
	}

	Kill(pid, SIGKILL);
	exit(0);
}

void main(){
	test4();

}
