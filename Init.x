#import <dlfcn.h>
#import <Foundation/Foundation.h>

extern void initSideloadedFixes();

%ctor
{
	dlopen([[[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"Frameworks/InstagramAppCoreFramework.framework/InstagramAppCoreFramework"] UTF8String], RTLD_NOW);
	initSideloadedFixes();
}
