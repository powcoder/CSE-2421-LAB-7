https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
https://powcoder.com
代写代考加微信 powcoder
Assignment Project Exam Help
Add WeChat powcoder
#include <stdlib.h>
#include <stdio.h>

struct ThreeD_values {
	unsigned long z;
	int y;
	int x;
} ;


void multlong(int x, int y, struct ThreeD_values * values);

int main(int argc, char ** argv){

int x, y;
long limit, i;
FILE *results;


struct ThreeD_values *values, *ThreeD_ptr;


/* set limit to # of structures we need in array given x and y	*/
limit = 0;

/* calculate correct value for size of array	*/

/* malloc space for array of structures */
if((values = (struct ThreeD_values *)malloc(limit*sizeof(struct ThreeD_values)))==NULL){
	/* appropriate error messages	*/
	return(-1);
}

/* populate array of ThreeD_value structures	*/
multlong(x,y,values);

/* open filename */
if((results = fopen(argv[3], "w")) == NULL){
	/* appropriate error messages	*/
	return(-1);
}

/* write  x, y, z values in each structure to file in specified format	*/
for (i=0; i<limit; i++){
	
	ThreeD_ptr = values + i;
	fprintf(results, "%d %d %lu\n",ThreeD_ptr->x,ThreeD_ptr->y, ThreeD_ptr->z);
}

/* close file	*/
fclose(results);


return(0);

}

