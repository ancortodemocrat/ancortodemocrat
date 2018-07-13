CORE_JAR_SRC=./ancortodemocrat-core/ancor2.jar
CORE_JAR_DST=./ancor2.jar

GUI_JAR_SRC=./ancortodemocrat-gui/ancor2-gui.jar
GUI_JAR_DST=./ancor2-gui.jar


update-sub:
	git submodule init
	git submodule update

recompile:
	$(MAKE) -C ancortodemocrat-core dev-install
	$(MAKE) -C ancortodemocrat-gui package
	$(MAKE) copy-jars

all: update-sub
	$(MAKE) copy-jars

copy-jars:
	cp $(CORE_JAR_SRC) $(CORE_JAR_DST)
	cp $(GUI_JAR_SRC) $(GUI_JAR_DST)
	chmod u+x *.jar

test-prepare:
	$(MAKE) -C ancortodemocrat-core T6-prepare-light

test:
	$(MAKE) -C ancortodemocrat-gui concord-test
