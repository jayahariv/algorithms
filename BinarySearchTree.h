#import<Foundation/Foundation.h>
#import "TreeNode.h"

@interface BinarySearchTree: NSObject

- (TreeNode*)construct: (NSArray*)sortedArray;
- (TreeNode*)insert:(NSInteger)key root:(TreeNode*)root;
- (TreeNode*)removeNode: (TreeNode*)node root: (TreeNode*)root;

@end