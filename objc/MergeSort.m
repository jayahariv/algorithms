#import "MergeSort.h"

@implementation MergeSort

+ (NSArray*)sort: (NSMutableArray*)input {
	[MergeSort sort: input  start: 0 end: input.count - 1];
	return [NSArray arrayWithArray: input];
}

+ (void)sort:(NSMutableArray*)input start: (int)start end: (int)end {
	if (start < end) {
		int mid = start + (end - start) / 2;
		[MergeSort sort: input start: start end: mid];
		[MergeSort sort: input start: mid + 1 end: end];
		[MergeSort merge: input start: start end: end mid: mid];
	}
}

+ (void)merge: (NSMutableArray*)input start: (int) start end: (int) end mid: (int) mid {
	NSMutableArray* left = [[NSMutableArray alloc] init];
	NSMutableArray* right = [[NSMutableArray alloc] init];

	int m = 0; 
	for (int i = start; i <= mid; i++) {
		left[m++] = input[i];
	}

	int n = 0; 
	for (int i = mid + 1; i <= end; i++) {
		right[n++] = input[i];
	}


	int index = 0;
	m = 0;
	n = 0;
	while(m < left.count && n < right.count) {
		if (left[m] < right[n]) {
			input[start + index] = left[m];
			m++;
			index++;
		} else {
			input[start + index] = right[n];
			n++;
			index++;
		}
	}

	while(m < left.count) {
		input[start + index] = left[m];
		m++;
		index++;
	}

	while(n < right.count) {
		input[start + index] = right[n];
		n++;
		index++;
	}

}


@end