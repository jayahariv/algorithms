#import "BinarySearchTree.h"
#import "Print.h"

@interface BinarySearchTree (Private)
@property(nonatomic, retain) TreeNode* root;
@end

@implementation BinarySearchTree

- (TreeNode*)construct: (NSArray*)sortedArray {
	printf("\n");
	return [self build: sortedArray start: 0 end: sortedArray.count - 1];
}

- (TreeNode*)build: (NSArray*)array start: (int) start end: (int)end {
	if (start > end) {
		return nil;
	}
	int mid = start + (end - start) / 2;
	TreeNode* node = [[TreeNode alloc] initWithData: [array[mid] integerValue]];
	node.left = [self build: array start: start end: mid - 1];
	node.right = [self build: array start: mid + 1 end: end];
	return node;
}

- (TreeNode*)insert:(NSInteger)key root:(TreeNode*)root {
	if (root == nil) {
		return [[TreeNode alloc] initWithData: key];
	}

	TreeNode* node = root;
	while (node.left != nil || node.right != nil) {
		if (key < node.data) {
			if (node.left != nil) {
				node = node.left;
			} else {
				break;
			}
		} else if (key > node.data) {
			if (node.right != nil) {
				node = node.right;
			} else {
				break;
			}
		}
	}

	if (key < node.data) {
		node.left = [[TreeNode alloc] initWithData: key];
	} else {
		node.right = [[TreeNode alloc] initWithData: key];
	}
	return root;
}

@end