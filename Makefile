APP := app
BOARD ?= esp32c3_devkitm
BUILD_DIR ?= build/$(BOARD)

.PHONY: help setup update build pristine flash clean menuconfig guiconfig

help:
	@echo "R.I.D.E Mk1 Zephyr commands"
	@echo ""
	@echo "  make setup              Init west workspace + install deps"
	@echo "  make update             Update Zephyr modules"
	@echo "  make build              Build app for BOARD=$(BOARD)"
	@echo "  make pristine           Clean rebuild"
	@echo "  make flash              Flash app"
	@echo "  make clean              Delete build folder"
	@echo "  make menuconfig         Open Kconfig menu"
	@echo ""
	@echo "Examples:"
	@echo "  make build"
	@echo "  make build BOARD=esp32c3_devkitm"
	@echo "  make flash"

setup:
	@if [ ! -d .west ]; then west init -l $(APP); else echo ".west already exists"; fi
	west update
	west zephyr-export
	west packages pip --install

update:
	west update
	west packages pip --install

build:
	west build -b $(BOARD) $(APP) -d $(BUILD_DIR)

pristine:
	west build -p always -b $(BOARD) $(APP) -d $(BUILD_DIR)

flash:
	west flash -d $(BUILD_DIR)

clean:
	rm -rf build

menuconfig:
	west build -t menuconfig -d $(BUILD_DIR)

guiconfig:
	west build -t guiconfig -d $(BUILD_DIR)

format:
	find app -name '*.[ch]' | xargs clang-format -i

lint:
	cppcheck --enable=all --inconclusive --std=c99 app/src
