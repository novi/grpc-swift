LDFLAGS =

CFLAGS =

all: genxcode
	swift build $(CFLAGS) $(LDFLAGS)
	
test:
	swift build $(CFLAGS) $(LDFLAGS)
	swift test $(CFLAGS) $(LDFLAGS) 

clean:
	rm -rf Packages
	rm -rf .build
	rm -rf SwiftGRPC.xcodeproj
	rm -rf Package.resolved

genxcode:
	swift package generate-xcodeproj --xcconfig-overrides=Config.xcconfig