#import<Foundation/Foundation.h>

void print(NSMutableArray* input);
int main(int argv, const char* argc[]) {
	printf("Peak Finding");
	printf("\n\n-----------------\n");
	NSMutableArray* input =  [[NSMutableArray alloc] init];
	for (int i = 0; i < 10; i++) {
		int rand = arc4random_uniform(100);
		[input addObject: [NSNumber numberWithInt: rand]];
	}
	print(input);
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

	int res = start + (end - start)/2;
	NSNumber* num = input[res];
	printf("\n result: %d", [num intValue]);

	printf("\n-----------------\n\n");
	return 0;
}

void print(NSMutableArray* input) {
	printf("\n");
	for (int i = 0; i < input.count ; i++) {
		NSNumber* num = [input objectAtIndex: i];
		printf("\t%d", [num intValue]);
	}
	printf("\n");
}

