# Makefile for compiling Zelda 2 Redux
SHELL := /bin/bash
#-------------------------------------
.PHONY: all verify-name prepare verify-sha apply-patch
#-------------------------------------
# Confi
FILE_BASE = Zelda2_Redux
OUT_FOLDER = out
PATCHES_FOLDER = patches
BASE_ROM = rom/Zelda II - The Adventure of Link (USA).nes
CLEAN_ROM = rom/Zelda2.nes
PATCHED_ROM = $(OUT_FOLDER)/$(FILE_BASE).nes
ASM_FILE = code/main.asm
ASAR = bin/asar
XKAS = bin/xkas
FLIPS = bin/flips
CHECKSUM = 353489a57f24a429572e76bd455bc51d821f7036
#-------------------------------------
all: verify-name prepare verify-sha prepare compile-asm create-bps
#-------------------------------------
verify-name:
	@if [ -e "$(BASE_ROM)" ]; then \
		echo "ROM detected. Verifying name..."; \
	else \
		echo "ROM name is incorrect. Please, rename the ROM to Zelda II - The Adventure of Link (USA).nes' for the patching process to begin."; \
	fi
#-------------------------------------
prepare:
	@cp "$(BASE_ROM)" "$(CLEAN_ROM)"
	@mkdir -p "$(OUT_FOLDER)"
	@if [ -f "$(PATCHED_ROM)" ]; then rm "$(PATCHED_ROM)"; fi
#-------------------------------------
verify-sha:
	@if [ -f "$(CLEAN_ROM)" ]; then \
		echo "Base ROM detected with proper name. Checking SHA-1..."; \
	else \
		echo "Base ROM was not found. Place the 'Zelda II - The Adventure of Link (USA).nes' ROM inside the 'rom' folder."; \
	fi
	@sha1=$$(sha1sum "$(CLEAN_ROM)" | awk '{print $$1}'); \
	if [ "$$sha1" = "$(CHECKSUM)" ]; then \
		echo "Base ROM SHA-1 checksum verified. Patching Zelda 2 with Redux hack..."; \
	else \
		echo "Base ROM checksum is incorrect. Use a Zelda 2 ROM with the proper SHA-1 checksum for patching."; \
	fi
#-------------------------------------
# Compile: Run Asar on the main assembly code
compile-asm:
	@echo "Beginning main assembly code compilation with Asar..."
	@cp "$(CLEAN_ROM)" "$(PATCHED_ROM)"
	@"$(ASAR)" --no-title-check --fix-checksum=off $(ASM_FILE) $(PATCHED_ROM)
#	@"$(ASAR)" --no-title-check "$(ASM_FILE)" "$(PATCHED_ROM)"
#	@"$(XKAS)" -o "$(PATCHED_ROM)" "$(ASM_FILE)"
	@echo ""
	@echo "Main assembly code compilation succeeded!"
	@echo ""
#-------------------------------------------------------------
# Create BPS patch
create-bps:
	@echo "Creating $(FILE_BASE).bps patch..."
	@"$(FLIPS)" --create --bps "$(CLEAN_ROM)" "$(PATCHED_ROM)" "$(PATCHES_FOLDER)/Zelda2_Redux.bps"
# Uncomment the following line if you want to create an IPS patch as well
#	"$(FLIPS)" --create --ips "$(CLEAN_ROM)" "$(PATCHED_ROM)" "$(PATCHES_FOLDER)/Zelda2_Redux.ips"
#-------------------------------------
clean:
	@echo "Cleaning up generated files..."
	@rm -f "$(CLEAN_ROM)" "$(PATCHED_ROM)" "$(PATCHES_FOLDER)/Zelda2_Redux.bps"
# Uncomment the following line if you want to clean up the IPS patch as well
#	@rm -f "$(CLEAN_ROM)" "$(PATCHED_ROM)" "$(PATCHES_FOLDER)/Zelda2_Redux.ips"
	@echo "Clean complete."
#-------------------------------------
# Convenience target to only build patched ROM (skips checksum)
.PHONY: quick
quick: prepare apply-patch clean
	@echo "Quick build complete."
#-------------------------------------
