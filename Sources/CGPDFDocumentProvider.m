//
//  CGPDFDocumentProvider.m
//  pdf-decrypt-test
//
//  Created by Vincent Fournié on 04.07.12.
//  Copyright (c) 2012 epyx SA. All rights reserved.
//

#import "CGPDFDocumentProvider.h"

@implementation DefaultCGPDFDocumentProvider

- (NSString *)extension
{
    return @"pdf";
}

- (CGDataProviderRef)newCGDataProviderWithURL:(NSURL *)docUrl
{
    return CGDataProviderCreateWithURL( (CFURLRef)docUrl );
}

@end
