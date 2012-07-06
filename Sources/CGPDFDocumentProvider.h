//
//  CGPDFDocumentProvider.h
//  pdf-decrypt-test
//
//  Created by Vincent Fournié on 04.07.12.
//  Copyright (c) 2012 epyx SA. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CGPDFDocumentProvider

- (NSString *)pdfExtension;
- (NSString *)tumbExtension;

- (CGDataProviderRef)newCGPDFDataProviderWithURL:(NSURL *)url;
- (CGDataProviderRef)newCGThumbDataProviderWithURL:(NSURL *)url;
- (CGDataConsumerRef)newCGThumbDataConsumerWithURL:(NSURL *)url;

@end

@interface DefaultCGPDFDocumentProvider : NSObject <CGPDFDocumentProvider>

@end
