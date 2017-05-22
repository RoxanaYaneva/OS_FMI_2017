/*
Задача 1:

Напишете програма на C, която да работи подобно на командата cat, реализирайки само следната функционалност:
- програмата извежда на STDOUT
- ако няма подадени параметри, програмата чете от STDIN
- ако има подадени параметри - файлове, програмата последователно ги извежда
- ако някой от параметрите е тире (-), програмата да го третира като специално име за STDIN

Примерно извикване:

$ ./main f - g -- извежда съдържанието на файла f, после STDIN, след това съдържанието на файла g
*/

#include<stdlib.h>
#include<fcntl.h>
#include<unistd.h>
#include<err.h>
#include<string.h>

void write_to_output(int, int, char*);

int main(int argc, char* argv[]){

	char c;
	char input[256];
	
	int i=0;	
	int fd;
	
	if (argc == 1) {
		while(read(0, &c, 1) > 0) {
			if (c == '\n') {
				input[i++]=c;
				for (int p = 0; p < i; p++) {
					write(1, &input[p], 1);
				}
				i=0;			
			} else {
				input[i++]=c;
			}
		}
	} else if (argc > 1) {
		for (i=1; i < argc; i++) {
			if (strcmp(argv[i], "-") == 0) {
				write_to_output(0, 1, &c);
			} else if ( (fd=open(argv[i], O_RDONLY )) == -1) {
				err(1, "Error!\n");
			} else {
				write_to_output(fd, 1, &c);
				close(fd);
			}
		}
	}

	exit(0);	
}

void write_to_output(int input, int output, char* symbol) {
	while(read(input, symbol, 1) > 0) {
		write(output, symbol, 1);
	}
}

