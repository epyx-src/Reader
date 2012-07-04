//
//  CGPDFDocumentCenter.m
//  pdf-decrypt-test
//
//  Created by Vincent Fournié on 04.07.12.
//  Copyright (c) 2012 epyx SA. All rights reserved.
//

#import "CGPDFDocumentCenter.h"
#import "CGPDFDocumentProvider.h"

#define DEFAULT_EXTENSION @"pdf"


@interface CGPDFDocumentCenter ()

@property (nonatomic, retain) NSMutableDictionary *providers;

@end


@implementation CGPDFDocumentCenter

@synthesize providers = _providers;

+ (CGPDFDocumentCenter *)sharedCenter
{
	static CGPDFDocumentCenter *center;

	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
        center = [[CGPDFDocumentCenter alloc] init];
    });

    return center;
}

- (id)init
{
    self = [super init];
    if (self) {
        _providers = [[NSMutableDictionary alloc] init];
        // Register the default provider (for standard .pdf files)
        DefaultCGPDFDocumentProvider *defaultProvider = [[DefaultCGPDFDocumentProvider alloc] init];
        [self registerProvider:defaultProvider forExtension:DEFAULT_EXTENSION];
        [defaultProvider release];
    }
    return self;
}

- (void)dealloc
{
    [_providers release], _providers = nil;

    [super dealloc];
}

- (void)registerProvider:(id<CGPDFDocumentProvider>)provider forExtension:(NSString *)extension
{
    [self.providers setValue:provider forKey:extension];
}

- (id<CGPDFDocumentProvider>)getProviderForExtension:(NSString *)extension
{
    return [self.providers valueForKey:extension];
}

- (id<CGPDFDocumentProvider>)getDefaultProvider
{
   return [self.providers valueForKey:DEFAULT_EXTENSION];
}

@end
