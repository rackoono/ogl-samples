if(NOT GLEW_PACKAGE_DIR)
	message("ERROR: GLEW_PACKAGE_DIR requires to be set")
endif(NOT GLEW_PACKAGE_DIR)

if(MSVC AND NOT CMAKE_CL_64)
	if(MSVC_VERSION EQUAL 1500)
		set(BINARY_DIRECTORY "win32-vc2008")
	endif(MSVC_VERSION EQUAL 1500)	
	if(MSVC_VERSION EQUAL 1600)
		set(BINARY_DIRECTORY "win32-vc2010")
	endif(MSVC_VERSION EQUAL 1600)
endif(MSVC AND NOT CMAKE_CL_64)

if(MSVC AND CMAKE_CL_64)
	if(MSVC_VERSION EQUAL 1500)
		set(BINARY_DIRECTORY "win64-vc2008")
	endif(MSVC_VERSION EQUAL 1500)	
	if(MSVC_VERSION EQUAL 1600)
		set(BINARY_DIRECTORY "win64-vc2010")
	endif(MSVC_VERSION EQUAL 1600)
endif(MSVC AND CMAKE_CL_64)

if(UNIX)
	set(BINARY_DIRECTORY )
endif(UNIX)

set(GLEW_INCLUDE_DIR ${GLEW_PACKAGE_DIR}/include)
set(GLEW_LIBRARY_DIR ${GLEW_PACKAGE_DIR}/lib/${BINARY_DIRECTORY})

if(WIN32)
	set(GLEW_LIBRARY glew32s)
elseif(UNIX)
	set(GLEW_LIBRARY GLEW)
endif(WIN32)

add_definitions(-DGLEW_STATIC)
include_directories(${GLEW_INCLUDE_DIR})
link_directories(${GLEW_LIBRARY_DIR})

if(GLEW_LIBRARY AND GLEW_LIBRARY_DIR AND GLEW_INCLUDE_DIR)
	set(GLEW_FOUND "YES")
endif()