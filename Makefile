u1.0:
	cp sfc/dkc1_u1.0.sfc target/dkc1hack_u1.0.sfc && cd src && asar -Drom_revision=0 main.asm ../target/dkc1hack_u1.0.sfc && cd -

all: u1.0

clean:
	rm -f target/*.sfc
