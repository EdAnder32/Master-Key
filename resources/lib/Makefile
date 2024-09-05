# Nome do compilador
CC = gcc
# Flags de compilação
CFLAGS = `pkg-config --cflags gtk+-3.0`

LIB_NAME = libsf.a

OBSJ = lib_sf.c 

SRC = $(OBSJ)
OBJ = $(SRC:.c=.o)

INCLUDES = -I.

GTKFLAGS = `pkg-config --libs gtk+-3.0`

all: $(LIB_NAME)

$(LIB_NAME): $(OBJ)
	ar rcs $(LIB_NAME) $(OBJ)

%.o: %.c
	$(CC) $(CFLAGS) $(INCLUDES) -c $< -o $@
clean:
	rm -f $(OBJ)
fclean: clean
	rm -f $(LIB_NAME)
re: fclean all

.PHONY: all clean fclean re test


# test gcc -o programa test.c -I./libsf-s -L./libsf-s -lsf `pkg-config --cflags --libs gtk+-3.0`
