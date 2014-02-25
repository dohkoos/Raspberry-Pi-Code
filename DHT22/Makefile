CC = gcc
CFLAGS = -std=c99 -I. -lbcm2835
DEPS =
OBJ = dht.o

dht: $(OBJ)
	gcc -o $@ $^ $(CFLAGS)

%.o: %.c $(DEPS)
	$(CC) -c -o $@ $< $(CFLAGS)

clean:
	rm -rf *.o dht
