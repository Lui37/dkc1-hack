u1.0:
	cp sfc/dkc1_u1.0.sfc target/dkc1hack_u1.0.sfc && cd src && asar -Drom_revision=0 main.asm ../target/dkc1hack_u1.0.sfc && cd -

u1.1:
	cp sfc/dkc1_u1.1.sfc target/dkc1hack_u1.1.sfc && cd src && asar -Drom_revision=1 main.asm ../target/dkc1hack_u1.1.sfc && cd -

u1.2:
	cp sfc/dkc1_u1.2.sfc target/dkc1hack_u1.2.sfc && cd src && asar -Drom_revision=2 main.asm ../target/dkc1hack_u1.2.sfc && cd -

j1.0:
	cp sfc/dkc1_j1.0.sfc target/dkc1hack_j1.0.sfc && cd src && asar -Drom_revision=3 main.asm ../target/dkc1hack_j1.0.sfc && cd -

j1.1:
	cp sfc/dkc1_j1.1.sfc target/dkc1hack_j1.1.sfc && cd src && asar -Drom_revision=4 main.asm ../target/dkc1hack_j1.1.sfc && cd -


all: u1.0 u1.1 u1.2 j1.0 j1.1

clean:
	rm -f target/*.sfc
