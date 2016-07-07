CC = $(CROSS_COMPILE)gcc
AR = $(CROSS_COMPILE)ar
RM = rm -f

CFLAGS = -O0 -g -Wall -c


TARGET_LIB = libVL53L0X_Rasp.a

INCLUDES = \
	-I. \
	-I${API_DIR}/Api/core/inc \
	-I${API_DIR}/Api/platform/inc

SRCS = \
	${API_DIR}/Api/core/src/vl53l0x_api_calibration.c \
	${API_DIR}/Api/core/src/vl53l0x_api_core.c \
	${API_DIR}/Api/core/src/vl53l0x_api_ranging.c \
	${API_DIR}/Api/core/src/vl53l0x_api_strings.c \
	${API_DIR}/Api/core/src/vl53l0x_api.c \
	${API_DIR}/Api/platform/src/vl53l0x_platform_log.c \
	${API_DIR}/Api/platform/src/vl53l0x_platform.c \
	vl53l0x_i2c_rasp.c

OBJS  = $(SRCS:.c=.o)



SRCS_TEST = vl53l0x_ContinuousRanging_Example-rasp.c

OBJS_TEST  = $(SRCS_TEST:.c=.o)



.PHONY: all
all: ${TARGET_LIB}

$(TARGET_LIB): $(OBJS)
	$(AR) -rcs $@ $^

test: ${TARGET_LIB} $(OBJS_TEST)
	$(CC) -L. $^ -lVL53L0X_Rasp -o $@

%.o:%.c
	$(CC) $(CFLAGS) $(INCLUDES) $< -o $@





.PHONY: clean
clean:
	-${RM} ${TARGET_LIB} ${OBJS} $(OBJS_TEST)


