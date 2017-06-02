//
//  main.m
//  PigLatin
//
//  Created by Harry Li on 2017-06-02.
//  Copyright © 2017 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+Pig.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSString *aString = @"a random string that is apple fsdf";
        
        NSLog(@"%@", [aString stringByPigLatinization]);
        
    }
    return 0;
}
