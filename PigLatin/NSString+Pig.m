//
//  NSString+Pig.m
//  PigLatin
//
//  Created by Harry Li on 2017-06-02.
//  Copyright © 2017 Harry. All rights reserved.
//

#import "NSString+Pig.h"

@implementation NSString (Pig)

-(NSString *)stringByPigLatinization{
    NSArray *words = [self componentsSeparatedByString:@" "];
    
    NSMutableArray *latinizedWords = [NSMutableArray array];
    
    for (NSString *word in words) {
        NSCharacterSet *characterSet = [NSCharacterSet characterSetWithCharactersInString:@"aeiou"];
        
        NSRange range = [word rangeOfCharacterFromSet:characterSet options:NSCaseInsensitiveSearch];
        
        if (range.location == NSNotFound) {
            //if no vowel
            NSString *pigged = [word stringByAppendingString:@"way"];
            [latinizedWords addObject:pigged];
        }else{
            NSMutableArray *consonants = [NSMutableArray array];
            for (int i =0; i < word.length; i++) {
                NSString *currentLetter = [NSString stringWithFormat:@"%c", [word characterAtIndex:i]];
                
                NSRange range = [currentLetter rangeOfCharacterFromSet:characterSet options:NSCaseInsensitiveSearch];
                if(range.location != NSNotFound){
                    //vowel
                    //remove consonants from the beginning
                    NSString *removedConsonants = [word substringFromIndex:i];
                    //Add them to the end
                    NSString *consonantsString = [consonants componentsJoinedByString:@""];
                    NSString *addedToEnd = [removedConsonants stringByAppendingString:consonantsString];
                    //add ay
                    NSString *pigged = [addedToEnd stringByAppendingString:@"ay"];
                    [latinizedWords addObject:pigged];
                    break;
                    
                }else{
                    [consonants addObject:currentLetter];
                }
            }
        }
    }
    //reconnect
    return [latinizedWords componentsJoinedByString:@" "];
    
}

@end
