//
//  CDLibLocalizedStringHelperPrivateHeader.h
//  CDLibrary
//
//  Created by Mehdi Mlala on 02/02/2016.
//  Copyright © 2016 CyberDandy. All rights reserved.
//

#import "CDLibLocalizedStringHelper.h"


@interface CDLibLocalizedStringHelper ()

+ (instancetype)shared;

+ (NSString*)localizedTargetStringForKey:(NSString*)key inTable:(NSString*)table inBundle:(NSBundle*)bundle;

- (NSAttributedString*)attributedStringWithCustomFontFromHTMLString:(NSString*)htmlString withSize:(CGFloat)size;
+ (NSAttributedString*)attributedStringWithSystemFromHTMLString:(NSString*)htmlString withSize:(CGFloat)size;
+ (NSAttributedString*)attributedStringWithSourceSansProFromHTMLString:(NSString*)htmlString withSize:(CGFloat)size;
+ (NSAttributedString*)attributedStringFromHTMLString:(NSString*)htmlString withDefaultFontName:(NSString*)defaultFontName boldFontName:(NSString*)boldFontName italicFontName:(NSString*)italicFontName andSize:(CGFloat)size;
+ (NSAttributedString*)attributedStringFromHTMLString:(NSString*)htmlString withDefaultFont:(UIFont*)defaultFont boldFont:(UIFont*)boldFont italicFont:(UIFont*)italicFont;
+ (NSAttributedString*)attributedString:(NSAttributedString*)attributedString byTrimmingCharactersInSet:(NSCharacterSet*)set;

@end