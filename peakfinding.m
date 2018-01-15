#import<Foundation/Foundation.h>

int linearSearch(NSMutableArray* input);
int binarySearch(NSMutableArray* input);
void print(NSMutableArray* input);
int main(int argv, const char* argc[]) {
	printf("Peak Finding");
	printf("\n\n-----------------\n");
	NSMutableArray* input =  [[NSMutableArray alloc] init];
	for (int i = 0; i < 100000000; i++) {
		int rand = arc4random_uniform(100);
		[input addObject: [NSNumber numberWithInt: rand]];
	}
	int res = -1;

	NSTimeInterval first = [[NSDate date] timeIntervalSince1970];
	res = linearSearch(input);
	NSTimeInterval middle = [[NSDate date] timeIntervalSince1970];
	printf("\nLinear search time: %f \n", (middle-first));
	res = binarySearch(input);
	NSTimeInterval last = [[NSDate date] timeIntervalSince1970];
	printf("\nBinary search time:  %f \n", (last - middle));
	// print(input);
	
	NSNumber* num = input[res];
	printf("\n result: %d", [num intValue]);

	printf("\n-----------------\n\n");
	return 0;
}

int linearSearch(NSMutableArray* input) {
	int res = -1;
	if (input[0] > input[1]) {
		res = 0;
	}

	if (input[input.count - 1] > input[input.count - 2]) {
		res = input.count - 1;
	}
	for (int i = 1; i < input.count - 1; i++) {
		if (input[i] > input[i-1] && input[i] > input[i+1]) {
			res = i;
			break;
		}
	}
	return res;
}

int binarySearch(NSMutableArray* input) {
	int start = 0;
	int end = input.count - 1;
	while(start < end) {
		int mid = start + (end - start)/2;
		if (input[mid] <= input[mid - 1]) {
			end = mid;
		} else if (input[mid] <= input[mid + 1]) {
			start = mid;
		} else {
			break;
		}
	}
	return start + (end - start)/2;
}

void print(NSMutableArray* input) {
	printf("\n");
	for (int i = 0; i < input.count ; i++) {
		NSNumber* num = [input objectAtIndex: i];
		printf("\t%d", [num intValue]);
	}
	printf("\n");
}

