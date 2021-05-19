CC = gcc  # C compiler
CFLAGS = -fPIC -Wall -Wextra -O2 -g  # C flags
LDFLAGS = -shared  # linking flags
RM = rm -f   # rm command
TARGET_LIB = libCommon.so  # target lib
INCLUDE = Common.h
SRCS = Common.c  # source files
OBJS = $(SRCS:.c=.o)

.PHONY: all
all: ${TARGET_LIB}

$(TARGET_LIB): $(OBJS)
	$(CC) ${LDFLAGS} -o $@ $^

#$(SRCS:.c=.d):%.d:%.c
#	$(CC) $(CFLAGS) -MM $< >$@

#include $(SRCS:.c=.d)

.PHONY: clean

#install:
#	cp *.so $(INCLUDE) .

clean:
	-${RM} ${TARGET_LIB} ${OBJS} $(SRCS:.c=.d)
