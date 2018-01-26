#import<Foundation/Foundation.h>

@interface TreeNode: NSObject <NSCopying>
@property (nonatomic, assign) NSInteger data;
@property (nonatomic, retain) TreeNode* left;
@property (nonatomic, retain) TreeNode* right;

- (id)initWithData: (NSInteger)d;
@end