#import<Foundation/Foundation.h>
#import "TreeNode.h"

@interface Print: NSObject

+ (void)i: (int)i;
+ (void)debug: (TreeNode*)node;

+ (void)array:(NSArray*)array;
+ (void)marray:(NSMutableArray*)marray;

// tree
+ (void)inorder: (TreeNode*)root;
+ (void)preorder: (TreeNode*)root;

@end