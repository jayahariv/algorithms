#import "Print.h"

@implementation Print

+ (void)i: (int)i {
	printf("\t %d", i);
}

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

+ (void)inorder: (TreeNode*)root {
	NSMutableArray* stack = [[NSMutableArray alloc] init];

	TreeNode* node = [root mutableCopy];
	printf("\n\n -- InOrder tree -- \n");
	while(node != nil) {
		[stack addObject: node];
		node = node.left;
	}

	/*

				44
		      /
	       13  
		 /  \	
		4   22 
		 \	  \
		  13	36

	*/


	while(stack.count > 0) {
		TreeNode* least = [stack lastObject];
		printf("%ld ", least.data);
		[stack removeLastObject];
		if (least.right != nil) {
			TreeNode* next = least.right;
			while(next != nil) {
				[stack addObject: next];
				next = next.left;
			}
		}
	}	
	printf("\n ---- \n\n");
}


@end