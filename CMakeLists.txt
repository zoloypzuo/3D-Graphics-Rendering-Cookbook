cmake_minimum_required(VERSION 3.12)

project(RenderingCookbook CXX C)

# set output path
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/bin)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_BINARY_DIR}/lib)

option(BUILD_WITH_EASY_PROFILER "Enable EasyProfiler usage" OFF)
option(BUILD_WITH_OPTICK "Enable Optick usage" OFF)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

set(GLFW_BUILD_EXAMPLES OFF CACHE BOOL "")
set(GLFW_BUILD_TESTS OFF CACHE BOOL "")
set(GLFW_BUILD_DOCS OFF CACHE BOOL "")
set(GLFW_INSTALL OFF CACHE BOOL "")

set(EASY_PROFILER_NO_GUI ON CACHE BOOL "")
set(EASY_PROFILER_NO_SAMPLES ON CACHE BOOL "")

set(ASSIMP_NO_EXPORT ON CACHE BOOL "")
set(ASSIMP_BUILD_DRACO OFF CACHE BOOL "")
set(ASSIMP_BUILD_ASSIMP_TOOLS OFF CACHE BOOL "")
set(ASSIMP_BUILD_TESTS OFF CACHE BOOL "")
set(ASSIMP_INSTALL_PDB OFF CACHE BOOL "")
set(ASSIMP_BUILD_ALL_IMPORTERS_BY_DEFAULT OFF CACHE BOOL "")
set(ASSIMP_BUILD_OBJ_IMPORTER ON CACHE BOOL "")
set(ASSIMP_BUILD_GLTF_IMPORTER ON CACHE BOOL "")

set(MESHOPT_BUILD_DEMO OFF CACHE BOOL "")
set(MESHOPT_BUILD_TOOLS OFF CACHE BOOL "")
set(MESHOPT_BUILD_SHARED_LIBS OFF CACHE BOOL "")

add_subdirectory(deps/src/etc2comp)

if(WIN32)
	add_definitions(-D_CRT_SECURE_NO_WARNINGS)
endif()

#include_directories(deps/src/vulkan/include)

add_subdirectory(deps/src/glfw)
#if(BUILD_WITH_OPTICK)
#add_subdirectory(deps/src/optick)
#endif()
#add_subdirectory(deps/src/easy_sources)
add_subdirectory(deps/src/assimp)
add_subdirectory(deps/src/meshoptimizer)

include_directories(.)
include_directories(deps/src)
include_directories(deps/src/glfw/include)
include_directories(deps/src/glm)
include_directories(deps/src/gli)
include_directories(deps/glad/include)
include_directories(deps/src/assimp/include)
include_directories(deps/src/etc2comp/EtcLib/Etc)
include_directories(deps/src/etc2comp/EtcLib/EtcCodec)
include_directories(deps/src/glslang/glslang/Include)
include_directories(deps/src/taskflow)
include_directories(deps/src/rapidjson/include)
include_directories(${CMAKE_CURRENT_BINARY_DIR}/deps/src/assimp/include)
include_directories(deps/src/stb)
include_directories(deps/src/ImGuizmo/src)

add_subdirectory(deps/cmake/ImGuizmo)

set(GLAD_SOURCES deps/glad/src/gl.c)
if(WIN32)
	set(GLAD_SOURCES ${GLAD_SOURCES} deps/glad/src/wgl.c)
endif()

add_library(glad ${GLAD_SOURCES})

set_property(TARGET glfw          PROPERTY FOLDER "ThirdPartyLibraries")
set_property(TARGET assimp        PROPERTY FOLDER "ThirdPartyLibraries")
#set_property(TARGET EtcLib        PROPERTY FOLDER "ThirdPartyLibraries")
#set_property(TARGET EtcTool       PROPERTY FOLDER "ThirdPartyLibraries")
set_property(TARGET glad          PROPERTY FOLDER "ThirdPartyLibraries")
#set_property(TARGET IrrXML        PROPERTY FOLDER "ThirdPartyLibraries")
set_property(TARGET meshoptimizer PROPERTY FOLDER "ThirdPartyLibraries")
if(WIN32)
#set_property(TARGET zlib          PROPERTY FOLDER "ThirdPartyLibraries")
#set_property(TARGET zlibstatic    PROPERTY FOLDER "ThirdPartyLibraries")
#set_property(TARGET UpdateAssimpLibsDebugSymbolsAndDLLs PROPERTY FOLDER "ThirdPartyLibraries")
endif()
set_property(TARGET uninstall     PROPERTY FOLDER "ThirdPartyLibraries")

# shared utils code for GL and Vulkan
add_subdirectory(shared)

add_subdirectory(Chapter4/GL01_Camera)
add_subdirectory(Chapter4/GL02_FPS)

add_subdirectory(Chapter5/GL01_Grid)
add_subdirectory(Chapter5/GL02_Tessellation)
add_subdirectory(Chapter5/GL03_MeshRenderer)
add_subdirectory(Chapter5/MeshConvert)

add_subdirectory(Chapter6/GL01_PBR)

add_subdirectory(Chapter7/GL01_LargeScene)
add_subdirectory(Chapter7/SceneConverter)

add_subdirectory(Chapter8/GL01_ShadowMapping)
add_subdirectory(Chapter8/GL02_SSAO)
add_subdirectory(Chapter8/GL03_HDR)
add_subdirectory(Chapter8/GL04_HDR_Adaptation)


add_subdirectory(Chapter10/GL01_CullingCPU)
add_subdirectory(Chapter10/GL02_CullingGPU)
add_subdirectory(Chapter10/GL03_OITransparency)
add_subdirectory(Chapter10/GL04_LazyLoading)
add_subdirectory(Chapter10/GL05_Final)
