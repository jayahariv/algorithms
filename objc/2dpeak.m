#import<Foundation/Foundation.h>

void findLinear(NSMutableArray* input);
void findBinary(NSMutableArray* input);
int linearSearch(NSMutableArray* input);
int binarySearch(NSMutableArray* input);
void print(NSMutableArray* input);
int main(int argc, const char* argv[]) {
	printf("2D Peak Finding");
	printf("\n\n-----------------\n");
	NSMutableArray* input =  [[NSMutableArray alloc] init];
	int n = 10;
	for (int j = 0; j < n; j++) {
		NSMutableArray* temp = [[NSMutableArray alloc] init];
		for (int i = 0; i < n; i++) {
			int rand = arc4random_uniform(100);
			[temp addObject: [NSNumber numberWithInt: rand]];
		}
		[input addObject: temp];
	}
	print(input);

	NSTimeInterval first = [[NSDate date] timeIntervalSince1970];
	findBinary(input);
	NSTimeInterval second = [[NSDate date] timeIntervalSince1970];
	findLinear(input);
	NSTimeInterval third = [[NSDate date] timeIntervalSince1970];
	printf("\nfirst time: %f", second - first);
	printf("\nsecond time: %f", third - second);

	printf("\n-----------------\n\n");
	return 0;
}

void findBinary(NSMutableArray* input) {
	int start = 0; 
	int end = input.count - 1;
	int resRow = -1;
	int resCol = -1;
	while (start < end) {
		int midRow = start + (end - start)/2;
		int res = binarySearch(input[midRow]);
		if (midRow == 0 || midRow == input.count - 1) {
			resRow = midRow;
			resCol = res;
			break;
		} else if (midRow < input.count - 2 && input[midRow][res] < input[midRow + 1][res]) {
			start = midRow;
		} else if (midRow > 0 && input[midRow][res] < input[midRow - 1][res]) {
			end = midRow;
		} else {
			resRow = midRow;
			resCol = res;
			break;
		}
	}
		
	NSNumber* num = input[resRow][resCol];
	printf("\nresult: %d", [num intValue]);
}

void findLinear(NSMutableArray* input) {
	int start = 0; 
	int end = input.count - 1;
	int resRow = -1;
	int resCol = -1;
	while (start < end) {
		int midRow = start + (end - start)/2;
		int res = linearSearch(input[midRow]);
		if (midRow == 0 || midRow == input.count - 1) {
			resRow = midRow;
			resCol = res;
			break;
		} else if (midRow < input.count - 2 && input[midRow][res] < input[midRow + 1][res]) {
			start = midRow;
		} else if (midRow > 0 && input[midRow][res] < input[midRow - 1][res]) {
			end = midRow;
		} else {
			resRow = midRow;
			resCol = res;
			break;
		}
	}
		
	NSNumber* num = input[resRow][resCol];
	printf("\nresult: %d", [num intValue]);
}

int linearSearch(NSMutableArray* input) {
	int res = -1;
	if (input[0] > input[1]) {
		res = 0;
	} else if (input[input.count - 1] > input[input.count - 2]) {
		res = input.count - 1;
	} else {
		for (int i = 1; i < input.count - 1; i++) {
			if (input[i] > input[i - 1] && input[i] > input[i + 1]) {
				res = i;
				break;
			}
		}
	}
	return res;
}

int binarySearch(NSMutableArray* input) {
	int res = -1;
	int start = 0;
	int end = input.count - 1;

	while(start < end) {
		int mid = start + (end - start)/ 2;
		if (input[mid] < input[mid - 1]) {
			end = mid;
		} else if (input[mid] < input[mid + 1]) {
			start = mid;
		} else {
			res = mid;
			break;
		}
	}
	return res;
}

void print(NSMutableArray* input) {
	printf("\n");
	int n = input.count;
	printf("\n");
	for (int j = 0; j < n; j++) {
		for (int i = 0; i < n; i++) {
			NSNumber* num = input[j][i];
			printf("\t %d", [num intValue]);
		}
		printf("\n");
	}
	printf("\n");
}