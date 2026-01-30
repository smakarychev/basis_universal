project "basis_universal"
    kind "StaticLib"
    language "C++"
    cppdialect "C++20"
    systemversion "latest"
         
	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
    
    defines {
        "BASISD_SUPPORT_KTX2_ZSTD=1",
        "BASISU_SUPPORT_SSE=1",
        "BASISU_SUPPORT_OPENCL=1",
        "_LARGEFILE64_SOURCE=1",
        "_FILE_OFFSET_BITS=64",
    }
    
    files {
        "encoder/**.cpp",
        "encoder/**.h",
        "encoder/**.hpp",
        "encoder/3rdparty/**.cpp",
        "encoder/3rdparty/**.h",
        "transcoder/**.cpp",
        "transcoder/**.h",
        "zstd/zstd.c", 
    }
    
    includedirs {
        "transcoder",
        "zstd",
        "OpenCL", 
    }
    
    libdirs { "OpenCL/lib" } 
    
    links {
        "OpenCL64.lib"
    }
    
    filter "configurations:Debug"
            runtime "Debug"
            symbols "on"
    
    filter "configurations:Release"
        runtime "Release"
        optimize "on" 