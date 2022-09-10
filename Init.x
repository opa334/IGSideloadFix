#import <dlfcn.h>
#import <Foundation/Foundation.h>

%ctor
{
	dlopen([[[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"Frameworks/InstagramAppCoreFramework.framework/InstagramAppCoreFramework"] UTF8String], RTLD_NOW);

#ifndef TROLLSTORE
	extern void initSideloadedFixes();
	initSideloadedFixes();
#endif

#ifdef ADDITIONAL
	// some stuff I use in my private build, not relevant
	dlopen([[[NSBundle mainBundle].bundlePath stringByAppendingPathComponent:@"Frameworks/Rocket.dylib"] UTF8String], RTLD_NOW);
	extern void initAdditional(void);
	initAdditional();
#endif
}