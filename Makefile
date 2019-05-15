#### Compiler and tool definitions shared by all build targets #####
CC = gcc
BASICOPTS =
CFLAGS = $(BASICOPTS)


# Define the target directories.
TARGETDIR_fs-ai_api_tester=.


all: fs-ai_api_tester

## Target: fs-ai_api_tester
OBJS_fs-ai_api_tester =  \
	$(TARGETDIR_fs-ai_api_tester)/fs-ai_api_tester.o
SYSLIBS_fs-ai_api_tester = -lpthread 
USERLIBS_fs-ai_api_tester = libfs-ai_api_amd64.a $(SYSLIBS_fs-ai_api_tester) 
DEPLIBS_fs-ai_api_tester = libfs-ai_api_amd64.a   
LDLIBS_fs-ai_api_tester = $(USERLIBS_fs-ai_api_tester)


# Link or archive
$(TARGETDIR_fs-ai_api_tester)/fs-ai_api_tester: $(TARGETDIR_fs-ai_api_tester) $(OBJS_fs-ai_api_tester) $(DEPLIBS_fs-ai_api_tester)
	$(LINK.c) $(CFLAGS_fs-ai_api_tester) $(CPPFLAGS_fs-ai_api_tester) -o $@ $(OBJS_fs-ai_api_tester) $(LDLIBS_fs-ai_api_tester)


# Compile source files into .o files
$(TARGETDIR_fs-ai_api_tester)/fs-ai_api_tester.o: $(TARGETDIR_fs-ai_api_tester) fs-ai_api_tester.c
	$(COMPILE.c) $(CFLAGS_fs-ai_api_tester) $(CPPFLAGS_fs-ai_api_tester) -o $@ fs-ai_api_tester.c



#### Clean target deletes all generated files ####
clean:
	rm -f \
		$(TARGETDIR_fs-ai_api_tester)/fs-ai_api_tester \
		$(TARGETDIR_fs-ai_api_tester)/fs-ai_api_tester.o
# Enable dependency checking
.KEEP_STATE:
.KEEP_STATE_FILE:.make.state.GNU-amd64-Linux

