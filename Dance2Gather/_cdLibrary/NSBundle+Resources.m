//
//  NSBundle+Resources.m
//  CDLibrary
//
//  Created by Mehdi Mlala on 02/02/2016.
//  Copyright © 2016 CyberDandy. All rights reserved.
//

#import "NSBundle+Resources.h"

@implementation NSBundle (Resources)

+ (NSBundle*)CDLibraryResourcesBundle
{
    static NSBundle* cyberDandyLibResourcesBundle;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cyberDandyLibResourcesBundle = [NSBundle bundleWithURL:[[NSBundle mainBundle] URLForResource:@"CDLibrary" withExtension:@"bundle"]];
    });
    
    return cyberDandyLibResourcesBundle;
}

@end
