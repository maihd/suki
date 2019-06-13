local ROOT_DIR = path.getabsolute(".")
local BUILD_DIR = path.join(ROOT_DIR, "Build")

workspace "Suki"
do
    language "C"
    location (BUILD_DIR)

    configurations { "Debug", "Release" }
    platforms { "x32", "x64" }

    filter {}
end

project "Suki"
do
    kind "SharedLib"

    includedirs {
        path.join(ROOT_DIR, "Include"),
    }

    files {
        path.join(ROOT_DIR, "Include/Suki/*.h"),
        path.join(ROOT_DIR, "Include/Suki/**/*.h"),

        path.join(ROOT_DIR, "Source/*.h"),
        path.join(ROOT_DIR, "Source/*.c"),
    }

    filter {}
end