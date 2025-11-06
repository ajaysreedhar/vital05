SRC_FILES := $(wildcard $(SRC_DIR)/hardware/**/*.c) \
			 $(wildcard $(SRC_DIR)/hardware/*.c)    \
			 $(wildcard $(SRC_DIR)/kernel/*.c)

OBJ_FILES := $(patsubst $(SRC_DIR)/%.c,$(OUT_DIR)/%.o,$(SRC_FILES))

GCC_FLAGS := -Wall -I$(SRC_DIR)/include -O2 -ffreestanding -nostdinc -nostdlib -nostartfiles
GCC_PATH := /opt/arm-toolchain-aarch64-elf/bin

all: $(DIST_DIR)/kernel8.img

$(OUT_DIR) $(DIST_DIR):
	@mkdir -p $@

$(OUT_DIR)/hardware/rpi4/boot.o: $(SRC_DIR)/hardware/rpi4/boot.S | $(OUT_DIR)
	@mkdir -p $(dir $@)
	$(GCC_PATH)/aarch64-none-elf-gcc $(GCC_FLAGS) -c $(SRC_DIR)/hardware/rpi4/boot.S -o $(OUT_DIR)/hardware/rpi4/boot.o

$(OUT_DIR)/%.o: $(SRC_DIR)/%.c
	@mkdir -p $(dir $@)
	$(GCC_PATH)/aarch64-none-elf-gcc $(GCC_FLAGS) -c $< -o $@

$(DIST_DIR)/kernel8.img: $(OUT_DIR)/hardware/rpi4/boot.o $(OBJ_FILES) | $(DIST_DIR)
	$(GCC_PATH)/aarch64-none-elf-ld -nostdlib $(OUT_DIR)/hardware/rpi4/boot.o $(OBJ_FILES) -T $(SRC_DIR)/linker.ld -o $(DIST_DIR)/kernel8.elf
	$(GCC_PATH)/aarch64-none-elf-objcopy -O binary $(DIST_DIR)/kernel8.elf $(DIST_DIR)/kernel8.img

clean:
	rm -rf $(OUT_DIR) $(DIST_DIR)

stats:
	$(info SRC_FILES="$(SRC_FILES)")
	$(info OBJ_FILES="$(OBJ_FILES)")

.PHONY: all stats clean
