//
//  CGPDFDocumentCenter.m
//  pdf-decrypt-test
//
//  Created by Vincent Fournié on 04.07.12.
//  Copyright (c) 2012 epyx SA. All rights reserved.
//

#import "CGPDFDocumentCenter.h"
#import "CGPDFDocumentProvider.h"

#define DEFAULT_PDF_EXTENSION @"pdf"
#define DEFAULT_THUMB_EXTENSION @"png"

@interface CGPDFDocumentCenter ()

@property (nonatomic, strong) NSMutableDictionary *providers;

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
        [self registerProvider:defaultProvider forPdfExtension:DEFAULT_PDF_EXTENSION thumbExtension:DEFAULT_THUMB_EXTENSION];
    }
    return self;
}

- (void)registerProvider:(id<CGPDFDocumentProvider>)provider
         forPdfExtension:(NSString *)pdfExtension
          thumbExtension:(NSString *)thumbExtension
{
    [self.providers setValue:provider forKey:pdfExtension];
    [self.providers setValue:provider forKey:thumbExtension];
}

// Will return the default provider if a provider for the provided 'extension' is not found
- (id<CGPDFDocumentProvider>)getProviderForExtension:(NSString *)extension
{
    id<CGPDFDocumentProvider> provider = [self.providers valueForKey:extension];
    if ( provider == nil ) {
        // Unable to find the provider for the specified extension. Let's use the default one.
        NSLog( @"CGPDFDocumentCenter: Unable to find the CGPDFDocumentProvider for extension ['%@']", extension );
        provider = [self.providers valueForKey:DEFAULT_PDF_EXTENSION];
    }
    return provider;
}

@end
