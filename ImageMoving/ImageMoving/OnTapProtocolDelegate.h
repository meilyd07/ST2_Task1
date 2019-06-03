//
//  OnTapProtocolDelegate.h
//  ImageMoving
//
//  Created by Hanna Rybakova on 6/4/19.
//  Copyright © 2019 None. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OnTapProtocolDelegate <NSObject>
@required
- (void)setTitleToNavigationController:(NSString*)Description;
@end
