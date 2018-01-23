#import "Print.h"

@implementation Print

+ (void)array:(NSArray*)array {
	printf("\n");
	for (int i = 0; i < array.count ; i++) {
		NSNumber* num = [array objectAtIndex: i];
		printf("\t%d", [num intValue]);
	}
	printf("\n");
}

+ (void)marray:(NSMutableArray*)marray {
	[Print array: [NSArray arrayWithArray: marray]];
}

+ (void)tree: (TreeNode*)root {
	TreeNode* node = root;//[root copy];
	NSMutableArray* stack = [[NSMutableArray alloc] init];
	[stack addObject: node];
	while(stack.count > 0) {
		TreeNode* poped = [stack lastObject];
		[stack removeLastObject];
		printf("\n%ld", poped.data);
		if (poped.right != nil) {
			[stack addObject: poped.right];
		}

		if (poped.left != nil) {
			[stack addObject: poped.left];
		}
	}	
}


@end