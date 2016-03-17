//
//  CDLibLocalizedStringHelper.m
//  CDLibrary
//
//  Created by Mehdi Mlala on 02/02/2016.
//  Copyright © 2016 CyberDandy. All rights reserved.
//

#import "CDLibLocalizedStringHelper.h"

@implementation CDLibLocalizedStringHelper
@synthesize customAttributedStringDefaultFont = _customAttributedStringDefaultFont;
@synthesize customAttributedStringBoldFont = _customAttributedStringBoldFont;
@synthesize customAttributedStringItalicFont = _customAttributedStringItalicFont;


+ (instancetype)shared
{
    static CDLibLocalizedStringHelper* shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[CDLibLocalizedStringHelper alloc] init];
    });
    
    return shared;
}


#pragma mark -
#pragma mark String Functions

+ (NSString*)localizedTargetStringForKey:(NSString*)key inTable:(NSString*)table inBundle:(NSBundle*)bundle
{
    NSString* defaultValue = NSLocalizedString(key, NSStringFromClass(self.class));
    return [bundle localizedStringForKey:key
                                   value:defaultValue
                                   table:table];
}


#pragma mark -
#pragma mark AttributedString Functions

- (NSAttributedString*)attributedStringWithCustomFontFromHTMLString:(NSString*)htmlString withSize:(CGFloat)size
{
    UIFont* normalFont = _customAttributedStringDefaultFont ? _customAttributedStringDefaultFont :[UIFont systemFontOfSize:size];
    UIFont* boldFont = _customAttributedStringBoldFont ? _customAttributedStringBoldFont :[UIFont boldSystemFontOfSize:size];
    UIFont* italicFont = _customAttributedStringItalicFont ? _customAttributedStringItalicFont :[UIFont italicSystemFontOfSize:size];
    
    return [CDLibLocalizedStringHelper attributedStringFromHTMLString:htmlString
                                                      withDefaultFont:normalFont
                                                             boldFont:boldFont
                                                           italicFont:italicFont];
}

+ (NSAttributedString*)attributedStringWithSystemFromHTMLString:(NSString*)htmlString withSize:(CGFloat)size
{
    UIFont* defaultFont = [UIFont systemFontOfSize:size];
    UIFont* boldFont = [UIFont boldSystemFontOfSize:size];
    UIFont* italicFont = [UIFont italicSystemFontOfSize: size];
    
    return [self attributedStringFromHTMLString:htmlString withDefaultFont:defaultFont boldFont:boldFont italicFont:italicFont];
}

+ (NSAttributedString*)attributedStringWithSourceSansProFromHTMLString:(NSString*)htmlString withSize:(CGFloat)size
{
    return [self attributedStringFromHTMLString:htmlString withDefaultFontName:@"SourceSansPro-Light" boldFontName:@"SourceSansPro-Regular" italicFontName:@"SourceSansPro-LightIt" andSize:size];
}


+ (NSAttributedString*)attributedStringFromHTMLString:(NSString*)htmlString withDefaultFontName:(NSString*)defaultFontName boldFontName:(NSString*)boldFontName italicFontName:(NSString*)italicFontName andSize:(CGFloat)size
{
    UIFont* defaultFont = [UIFont fontWithName:defaultFontName size:size];
    UIFont* boldFont = [UIFont fontWithName:boldFontName size:size];
    UIFont* italicFont = [UIFont fontWithName:italicFontName size:size];
    
    return [self attributedStringFromHTMLString:htmlString withDefaultFont:defaultFont boldFont:boldFont italicFont:italicFont];
}

+ (NSAttributedString*)attributedStringFromHTMLString:(NSString*)htmlString withDefaultFont:(UIFont*)defaultFont boldFont:(UIFont*)boldFont italicFont:(UIFont*)italicFont
{
    
    NSMutableAttributedString* mutableAttributedString = [[NSMutableAttributedString alloc] initWithData:[htmlString dataUsingEncoding:NSUTF8StringEncoding]
                                                                                                 options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType,
                                                                                                           NSCharacterEncodingDocumentAttribute:[NSNumber numberWithInt:NSUTF8StringEncoding],
                                                                                                           NSFontAttributeName:defaultFont}
                                                                                      documentAttributes:nil
                                                                                                   error:nil];
    
    NSRange range = (NSRange){0,mutableAttributedString.length};
    
    [mutableAttributedString beginEditing];
    
    [mutableAttributedString enumerateAttribute:NSFontAttributeName
                                        inRange:range
                                        options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired
                                     usingBlock:^(id value, NSRange range, BOOL *stop) {
                                         UIFont* currentFont = value;
                                         UIFont* replacementFont = nil;
                                         if ([currentFont.fontName rangeOfString:@"bold" options:NSCaseInsensitiveSearch].location != NSNotFound)
                                             replacementFont = boldFont;
                                         else if ([currentFont.fontName rangeOfString:@"italic" options:NSCaseInsensitiveSearch].location != NSNotFound)
                                             replacementFont = italicFont;
                                         else
                                             replacementFont = defaultFont;
                                         [mutableAttributedString addAttribute:NSFontAttributeName value:replacementFont range:range];
                                     }];
    
    [mutableAttributedString endEditing];
    
    // return after trimming unnecessary whitespaces and linebreaks
    return [self attributedString:mutableAttributedString byTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

+ (NSAttributedString*)attributedString:(NSAttributedString*)attributedString byTrimmingCharactersInSet:(NSCharacterSet*)set
{
    NSCharacterSet *invertedSet = [set invertedSet];
    NSString *str = attributedString.string;
    NSUInteger loc, len;
    
    NSRange range = [str rangeOfCharacterFromSet:invertedSet];
    loc = (range.length > 0) ? range.location : 0;
    
    range = [str rangeOfCharacterFromSet:invertedSet options:NSBackwardsSearch];
    len = (range.length > 0) ? NSMaxRange(range) - loc :
    [str length]-loc;
    
    return [attributedString attributedSubstringFromRange:NSMakeRange(loc,len)];
}

@end
