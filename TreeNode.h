#import<Foundation/Foundation.h>

@interface TreeNode: NSObject <NSCopying>
@property (nonatomic, assign) NSInteger data;
@property (nonatomic, copy) TreeNode* left;
@property (nonatomic, copy) TreeNode* right;

- (id)initWithData: (NSInteger)d;
@end