#import<Foundation/Foundation.h>
#import "TreeNode.h"
#import "MergeSort.h"
#import "Print.h"
#import "BinarySearchTree.h"

int main(int argv, const char* argc[]) {
	printf("\nBinary Search Tree");
	printf("\n\n-----------------\n");
	NSMutableArray* input =  [[NSMutableArray alloc] init];
	TreeNode* root = nil;
	BinarySearchTree* tree = [[BinarySearchTree alloc] init];
	for (int i = 0; i < 11; i++) {
		int rand = arc4random_uniform(100);
		root = [tree insert: (NSInteger)rand root: root];
		[input addObject: [NSNumber numberWithInt: rand]];
	}

	// [Print visualize: root];

	[Print marray: input];
	NSArray* sortedArray = [MergeSort sort: input];
	[Print array: sortedArray];

	
	// TreeNode* node = [tree construct: sortedArray];
	[Print inorder: root];
	[Print preorder: root];

	return 0;
}