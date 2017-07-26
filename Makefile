LDFLAGS = -Xlinker -lz -Xlinker -L/usr/local/opt/openssl/lib -Xlinker -lssl -Xlinker -lcrypto

CFLAGS = -Xcc -I/usr/local/opt/openssl/include

all:
	swift package generate-xcodeproj
	swift build $(CFLAGS) $(LDFLAGS)
	
test:
	swift build -v $(CFLAGS) $(LDFLAGS)
	swift test -v $(CFLAGS) $(LDFLAGS) 

clean:
	rm -rf Packages
	rm -rf .build
	rm -rf SwiftGRPC.xcodeproj
	rm -rf Package.pins
