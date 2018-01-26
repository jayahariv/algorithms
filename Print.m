#import "Print.h"

@implementation Print

+ (void)i: (int)i {
	printf("\t %d", i);
}

+ (void)start: (NSString*)title {
	printf("\n\n -- %s -- \n", [title UTF8String]);
}

+ (void)end {
	printf("\n -- \n\n");
}

+ (void)debug: (TreeNode*)node {
	printf("node: %ld left: %ld right %ld", node.data, node.left.data, node.right.data);
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

	[Print start: @"inorder tree"];
	
	NSMutableArray* stack = [[NSMutableArray alloc] init];
	TreeNode* node = [root mutableCopy];
	
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
		[Print i: (int)least.data];
		[stack removeLastObject];
		if (least.right != nil) {
			TreeNode* next = least.right;
			while(next != nil) {
				[stack addObject: next];
				next = next.left;
			}
		}
	}	
	[Print end];
}


+ (void)preorder: (TreeNode*)root {
	
	[Print start: @"preorder tree"];
	
	NSMutableArray* stack = [[NSMutableArray alloc] init];
	[stack addObject: root];
	while (stack.count > 0) {
		TreeNode* node = [stack lastObject];
		[stack removeLastObject];
		[Print i: (int)node.data];
		if (node.right != nil) {
			[stack addObject: node.right];
		}
		if (node.left != nil) {
			[stack addObject: node.left];
		}
	}
	[Print end];
}


@end