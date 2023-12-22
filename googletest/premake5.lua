project "GTest"
	kind "StaticLib"
	language "C++"

	targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{ 
		"src/*.cc",
	}
 
    includedirs
	{ 
        "include/",
        "src/",
        ".",
    }

    filter "system:windows"
		systemversion "latest"
		staticruntime "On"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter { "not action:vs*" }
		-- Set the tools explicitly
		toolset "clang"
