#import<Foundation/Foundation.h>
#include<stdlib.h>

void sort(NSMutableArray* array, int start, int end);
void merge(NSMutableArray* array, int start, int end, int mid);
void print(NSMutableArray* input);
int main(int argv, const char* argc[]) {

	printf("\nSTART");
	printf("\n-------\n\n");
	NSMutableArray* input =  [[NSMutableArray alloc] init];
	for (int i = 0; i < 100000; i++) {
		int rand = arc4random_uniform(10000);
		[input addObject: [NSNumber numberWithInt: rand]];
	}
	NSTimeInterval before = [[NSDate date] timeIntervalSince1970];
	printf("\n %f", before);
	sort(input, 0, input.count - 1);
	NSTimeInterval after = [[NSDate date] timeIntervalSince1970];
	printf("\n %f", after);
	printf("\n %f \n", (after-before));
	printf("\n\n-------\n");
	printf("END\n");
	return 0;
}

// function commit one more commit
void sort(NSMutableArray* array, int start, int end) {
	if (start < end) {
		int mid = start + (end - start) / 2;
		sort(array, start, mid);
		sort(array, mid + 1, end);
		merge(array, start, end, mid);
	}
}

void merge(NSMutableArray* array, int start, int end, int mid) {
	NSMutableArray* left = [[NSMutableArray alloc] init];
	NSMutableArray* right = [[NSMutableArray alloc] init];
	int m = 0;
	for (int i = start; i <= mid; i++) {
		left[m++] = array[i];
	}
	
	int n = 0;
	for (int i = mid+1; i <= end; i++) {
		right[n++] = array[i];
	}

	int index = 0;
	m = 0;
	n = 0;
	while(m < left.count && n < right.count) {
		if (left[m] < right[n]) {
			array[start + index] = left[m];
			m++;
		} else {
			array[start + index] = right[n];
			n++;
		}
		index++;
	}

	while(m < left.count) {
		array[start + index] = left[m];
		m++;
		index++;
	}

	while(n < right.count) {
		array[start + index] = right[n];
		n++;
		index++;
	}
} 

void print(NSMutableArray* input) {
	printf("\n");
	for (int i = 0; i < input.count ; i++) {
		NSNumber* num = [input objectAtIndex: i];
		printf("\t%d", [num intValue]);
	}
	printf("\n");
}

