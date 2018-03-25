//
//  main.m
//  testReadingFromFile
//
//  Created by Yana on 24.03.2018.
//  Copyright © 2018 Yana. All rights reserved.
//  Reading from the file and  writing to a file

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSDate *date = [NSDate date]; //  initializing a variable for a date
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init]; // initializing a variable to format a date
        [dateFormatter setDateStyle:NSDateFormatterFullStyle]; // selection style  for date description
        NSString *stringDate = [dateFormatter stringFromDate:date]; // formatting the date in a string
        
        // what is the date today
        NSLog(@"The string contains the following: %@",stringDate);
        
        // variable of the NSError to do query the NSError if the write failed
        NSError *error = nil;
        
        // writing string with date to file
        NSMutableString *str = [[NSMutableString alloc]init];
        [str appendString:stringDate];
        BOOL success = [str writeToFile:@"/tmp/date.txt"
                              atomically:YES
                                encoding:NSUTF8StringEncoding
                                   error:NULL];
        
        // check  whether the writing was successful, and query the NSError if the write failed
        if (success){
            NSLog(@"Writing string to the file was successful!");
        } else {
            NSLog(@"Writing string to the file failed: %@", [error localizedDescription]);
        }
        
        // reading file with NSString
        NSError *error2 = nil;
        NSString *str2 = [[NSString alloc] initWithContentsOfFile:@"/tmp/date.txt"
                                                        encoding:NSASCIIStringEncoding
                                                        error:&error2];
       
        // check  whether the reading was successful, and query the NSError if the write failed
        if (!str2){
            NSLog(@"Reading from the file failed: %@:", [error2 localizedDescription]);
        } else {
            NSLog(@"The file date.txt contants this: %@", str2);
        }
        
        
    
        
    }
    return 0;
}
