//
//  CGPDFDocumentProvider.m
//  pdf-decrypt-test
//
//  Created by Vincent Fournié on 04.07.12.
//  Copyright (c) 2012 epyx SA. All rights reserved.
//

#import "CGPDFDocumentProvider.h"

@implementation DefaultCGPDFDocumentProvider

- (NSString *)pdfExtension
{
    return @"pdf";
}

- (NSString *)tumbExtension
{
    return @"png";
}

- (CGDataProviderRef)newCGPDFDataProviderWithURL:(NSURL *)url;
{
    return CGDataProviderCreateWithURL( (CFURLRef)url );
}

- (CGDataProviderRef)newCGThumbDataProviderWithURL:(NSURL *)url
{
    return CGDataProviderCreateWithURL( (CFURLRef)url );
}

- (CGDataConsumerRef)newCGThumbDataConsumerWithURL:(NSURL *)url
{
    return CGDataConsumerCreateWithURL( (CFURLRef)url );
}

@end
