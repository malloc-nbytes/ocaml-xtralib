# Directories
SRC_DIR := .
XLIST_DIR := XList
XSTRING_DIR := XString
XFILEIO_DIR := XFileIO
XCHAR_DIR := XChar

# Source files
SRC_FILES := $(wildcard $(SRC_DIR)/*.ml)
XLIST_FILES := $(wildcard $(XLIST_DIR)/*.ml)
XSTRING_FILES := $(wildcard $(XSTRING_DIR)/*.ml)
XFILEIO_FILES := $(wildcard $(XFILEIO_DIR)/*.ml)
XCHAR_FILES := $(wildcard $(XCHAR_DIR)/*.ml)

# Compiler options
OCAMLOPT := ocamlopt
OCAMLOPT_FLAGS := -I $(XLIST_DIR) -I $(XSTRING_DIR) -I $(XFILEIO_DIR) -I $(XCHAR_DIR)

# Target
TARGET := main

# Build rule
$(TARGET): $(SRC_FILES) $(XLIST_FILES) $(XSTRING_FILES) $(XFILEIO_FILES) $(XCHAR_FILES)
	$(OCAMLOPT) $(OCAMLOPT_FLAGS) -o $(TARGET) $(XLIST_FILES) $(XSTRING_FILES) $(XFILEIO_FILES) $(XCHAR_FILES) $(SRC_FILES)



