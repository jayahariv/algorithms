#import<Foundation/Foundation.h>
#import "TreeNode.h"

@interface Print: NSObject

+ (void)array:(NSArray*)array;
+ (void)marray:(NSMutableArray*)marray;

+ (void)tree: (TreeNode*)root;

@end