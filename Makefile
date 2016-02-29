# Where are the Slurm include files?
SLURMINC=/usr/local/slurm/latest/include

PLUGINDIR=/usr/local/slurm/plugins
TMPDIRSPANKDIR=${PLUGINDIR}/tmpdir


all: hpc2n-tmpdir.so

hpc2n-tmpdir.so: hpc2n-tmpdir.c
	gcc -I$(SLURMINC) -std=gnu99 -Wall -o hpc2n-tmpdir.o -fPIC -c hpc2n-tmpdir.c
	gcc -shared -o hpc2n-tmpdir.so hpc2n-tmpdir.o 

clean:
	rm -f hpc2n-tmpdir.o hpc2n-tmpdir.so

install:	all
	mkdir -p ${TMPDIRSPANKDIR}
	install -m 755 hpc2n-tmpdir.so ${TMPDIRSPANKDIR}/
