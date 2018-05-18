#import<Foundation/Foundation.h>

int main(int argv, char* argc[]) {
	NSMutableArray* input =  [[NSMutableArray alloc] init];
	for (int i = 0; i < 10000; i++) {
		int rand = arc4random_uniform(10000);
		[input addObject: [NSNumber numberWithInt: rand]];
	}

	NSTimeInterval before = [[NSDate date] timeIntervalSince1970];
	printf("\n %f", before);
	for (int i = 1; i < input.count; i++) {
		NSNumber* num = [input objectAtIndex: i]; // 25, 13, 15
		for (int j = i - 1; j >= 0; j--) { 
			NSNumber* savedNum = [input objectAtIndex: j]; // {51}, {51, 25}, {}
			if ([savedNum intValue] > [num intValue]) {
				[input exchangeObjectAtIndex: j withObjectAtIndex:j+1];
			} else {
				break;
			}
		}
	}
	NSTimeInterval after = [[NSDate date] timeIntervalSince1970];
	printf("\n %f", after);
	printf("\n %f \n", (after-before));

	// for (int i = 0 ; i < input.count; i++) {
	// 	NSNumber* num = [input objectAtIndex: i];
	// 	printf("\n%d\n", [num intValue]);
	// }

	return 0;
}