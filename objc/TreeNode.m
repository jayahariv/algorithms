#import "TreeNode.h"

@implementation TreeNode

- (id)initWithData: (NSInteger)d {
	self = [super init];
	self.data = d;
	self.left = nil;
	self.right = nil;
	return self;
}

- (TreeNode*)copyWithZone: (NSZone*) zone {
	TreeNode* node = [[TreeNode alloc] initWithData: self.data];
	node.left = [node.left copyWithZone: zone];
	node.right = [node.right copyWithZone: zone];
	return node;
}

- (TreeNode*)mutableCopyWithZone: (NSZone*) zone {
	TreeNode* node = [[TreeNode alloc] initWithData: self.data];
	node.right = [self.right mutableCopyWithZone: zone];
	node.left = [self.left mutableCopyWithZone: zone];
	return node;
}

@end