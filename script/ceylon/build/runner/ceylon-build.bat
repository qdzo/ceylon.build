@echo off
setlocal EnableDelayedExpansion

set "USAGE=[<compiler-option>...] [<module>/<version>] <goal>..."
set "DESCRIPTION=Runs your ceylon.build script"
set LONG_USAGE=This command compiles and runs your build project, ^
written for ceylon.build^

^

For running your build, you either need to provide the ^
module and version of your build script, or have the module ^
name and version as default 'build/1'. Furthermore you ^
need to provide the goals to run.^

^

Default source directory for the build script is ^
'./build-source'. You can also use the compiler options ^
described below for compiling the build module.^

^

Output directory of compiled build-module is currently fixed ^
to 'modules'.^

^

OPTIONS^

^

--cacherep=url^

Specifies the folder to use for caching downloaded modules. (^
default: '~/.ceylon/cache')^

^

--cwd=dir^

Specifies the current working directory for this tool. (default: ^
the directory where the tool is run from)^

^

--define=key=value^

Set a system property^

^

--encoding=encoding^

Sets the encoding used for reading source files (default: platform-^
specific).^

^

--javac=option^

Passes an option to the underlying java compiler.^

^

--maven-overrides=url^

Specifies the xml file to use to load Maven artifact overrides. See ^
http://ceylon-lang.org/documentation/current/reference/repository/^
maven/ for information. Experimental.^

^

--no-default-repositories^

Indicates that the default repositories should not be used.^

^

--offline^

Enables offline mode that will prevent connections to remote ^
repositories.^

^

--rep=url^

Specifies a module repository containing dependencies. Can be ^
specified multiple times. (default: 'modules', '~/.ceylon/repo', '^
http://modules.ceylon-lang.org/repo/1')^

^

--resource=dirs^

Path to directory containing resource files. Can be specified ^
multiple times; you can also specify several paths separated by ^
your operating system's 'PATH' separator. (default: './resource')^

^

--source=dirs^

An alias for '--src' (default: './build-ource')^

^

--src=dirs^

Path to directory containing build source files. Can be specified ^
multiple times; you can also specify several paths separated by ^
your operating system's 'PATH' separator. (default: ^
'./build-source')^

^

--suppress-warning[=warnings]^

Suppress the reporting of the given warnings. If no 'warnings' are ^
given then suppresss the reporting of all warnings, otherwise just ^
suppresss those which are present. Allowed flags include: '^
filenameNonAscii', 'filenameClaselessCollision', 'deprecation', '^
compilerAnnotation', 'doclink', 'expressionTypeNothing', '^
unusedDeclaration', 'unusedImport', 'ceylonNamespace', '^
javaNamespace', 'suppressedAlready', 'suppressesNothing'.^

^

--sysrep=url^

Specifies the system repository containing essential modules. (^
default: '$CEYLON_HOME/repo')^

^

--timeout=seconds^

Sets the timeout for connections to remote repositories, use 0 for ^
no timeout (default: 20)^

^

--verbose[=flags]^

Produce verbose output. If no 'flags' are given then be verbose ^
about everything, otherwise just be verbose about the flags which ^
are present. Allowed flags include: 'all', 'loader', 'ast', 'code', ^
'cmr', 'benchmark'.^


rem Two empty lines above required for batch file processor

call %CEYLON_HOME%\bin\ceylon-sh-setup %*

if "%errorlevel%" == "1" (
    exit /b 0
)

%CEYLON% run ceylon.build.runner/1.1.1 %*
