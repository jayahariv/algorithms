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
	printf("\nnode: %ld left: %ld right %ld", node.data, node.left.data, node.right.data);
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

/*

Different styles of tree printing in console.

                 1
            -----------
           /           \
          /             \
         2               3
       -----           -----
      /     \         /     \
     4       5       6       7
    / \     / \     / \     / \
   8   9   10 12   13 14   23 45



1
|_ _ _ _ _ _2
|_|_ _ _ _ _3
  | |
  |_|_ _ _ _ _4
  |_|_|_ _ _ _5
    | | |
    |_|_|_ _ _ _6
    |_|_|_|_ _ _7
      | | | |
      |_|_|_|_ _ _8
      |_|_|_|_ _ _9
        | | |
        |_|_|_ _ _ _()
        |_|_|_ _ _ _10
          | |
          |_|_ _ _ _ _11
          |_|_ _ _ _ _12
            |
            |_ _ _ _ _ _13
            |_ _ _ _ _ _14

*/

+ (void)visualize: (TreeNode*)root {
	[Print start: @"visualize"];

	NSMutableArray* queue = [[NSMutableArray alloc] init];
	NSMutableArray* next = [[NSMutableArray alloc] init];
	[queue addObject: root];
	BOOL flag = false;
	while(queue.count > 0) {
		TreeNode* node = [queue firstObject];
		[queue removeObjectAtIndex: 0];
		[Print i: (int) node.data];
		printf("%s", flag ? "/" : "\\");
		if (node.left != nil) {
			[next addObject: node.left];
		}

		if (node.right != nil) {
			[next addObject: node.right];
		}

		if (queue.count == 0) {
			printf("\n");
			queue = next;//[ mutableCopy];
			next = [[NSMutableArray alloc] init];
		}
	}

	[Print end];
}



@end