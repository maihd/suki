--
-- Suki Lua runtime for love2d
--

require("Core.Table")
require("Core.Function")

local function CloneModule(module, conversionDefines)
    local newModule = table.deepcopy(module)
    
    for dst, src in pairs(conversionDefines) do
        newModule[dst] = newModule[src]
        newModule[src] = nil
    end

    return newModule
end

-- General module
--Buffer = Data
Object  = love.Object
Variant = love.Variant

-- Arguments
Arguments = CloneModule(love.arg, {
    GetLow              = "getLow",
    Options             = "options",
    OptionIndices       = "optionIndices",
    ParseOption         = "parseOption",
    ParseOptions        = "parseOptions",
    ParseGameArguments  = "parseGameArguments",
});

-- graphics module
local graphicsModule = {
    Clear                   = "clear",
    Print                   = "print",
    Origin                  = "origin",
    Present                 = "present",

    Arc                     = "arc", 
    Circle                  = "circle", 
    Discard                 = "discard", 
    Draw                    = "draw", 
    Drawq                   = "drawq", 
    Ellipse                 = "ellipse", 
    Line                    = "line", 
    Point                   = "point", 
    Points                  = "points", 
    Polygon                 = "polygon", 
    Present                 = "present", 
    Print                   = "print", 
    Printf                  = "printf", 
    Quad                    = "quad", 
    Rectangle               = "rectangle", 
    Stencil                 = "stencil", 
    Triangle                = "triangle", 

    Reset                   = "reset",
    Pop                     = "pop",
    Push                    = "push",
    Rotate                  = "rotate",
    Scale                   = "scale",
    Shear                   = "shear",
    Translate               = "translate",

    FlushBatch              = "flushBatch",
    DrawInstanced           = "drawInstanced",
    DrawLayer               = "drawLayer",

    CaptureScreenshot       = "captureScreenshot",
    NewArrayImage           = "newArrayImage",
    NewCanvas               = "newCanvas",
    NewCubeImage            = "newCubeImage",
    NewFont                 = "newFont",
    NewImage                = "newImage",
    NewImageFont            = "newImageFont",
    NewMesh                 = "newMesh",
    NewParticleSystem       = "newParticleSystem",
    NewQuad                 = "newQuad",
    NewShader               = "newShader",
    NewSpriteBatch          = "newSpriteBatch",
    NewText                 = "newText",
    NewVideo                = "newVideo",
    NewVolumeImage          = "newVolumeImage",
    SetNewFont              = "setNewFont",
    ValidateShader          = "validateShader",

    ApplyTransform          = "applyTransform",  
    InverseTransformPoint   = "inverseTransformPoint",
    ReplaceTransform        = "replaceTransform", 
    TransformPoint          = "transformPoint",  

    GetDpiScale             = "getDPIScale", 
    GetDimensions           = "getDimensions", 
    GetPixelDimensions      = "getPixelDimensions", 
    GetPixelHeight          = "getPixelHeight", 
    GetPixelWidth           = "getPixelWidth", 
    GetWidth                = "getWidth", 
    GetHeight               = "getHeight", 

    GetCanvasFormats        = "getCanvasFormats",
    GetImageFormats         = "getImageFormats",
    GetRendererInfo         = "getRendererInfo",
    GetStats                = "getStats",
    GetSupported            = "getSupported",
    GetSystemLimits         = "getSystemLimits",
    GetTextureTypes         = "getTextureTypes",

    GetBackgroundColor      = "getBackgroundColor",  
    GetBlendMode            = "getBlendMode",  
    GetCanvas               = "getCanvas",  
    GetColor                = "getColor",  
    GetColorMask            = "getColorMask",  
    GetDefaultFilter        = "getDefaultFilter",  
    GetDefaultImageFilter   = "getDefaultImageFilter",  
    GetDepthMode            = "getDepthMode",  
    GetFont                 = "getFont",  
    GetFrontFaceWinding     = "getFrontFaceWinding",  
    GetLineJoin             = "getLineJoin",  
    GetLineStyle            = "getLineStyle",  
    GetLineWidth            = "getLineWidth",  
    GetMeshCullmode         = "getMeshCullMode",  
    GetPointSize            = "getPointSize",  
    GetScissor              = "getScissor",  
    GetShader               = "getShader",  
    GetStackDepth           = "getStackDepth",  
    GetStencilTest          = "getStencilTest",  
    IntersectScissor        = "intersectScissor",  
    IsActive                = "isActive",  
    IsGammaCorrect          = "isGammaCorrect",  
    IsWireframe             = "isWireframe",  
    SetBackgroundColor      = "setBackgroundColor",  
    SetBlendMode            = "setBlendMode",  
    SetCanvas               = "setCanvas",  
    SetColor                = "setColor",  
    SetColorMask            = "setColorMask",  
    SetDefaultFilter        = "setDefaultFilter",  
    SetDepthMode            = "setDepthMode",  
    SetFont                 = "setFont",  
    SetFrontFaceWinding     = "setFrontFaceWinding",  
    SetLineJoin             = "setLineJoin",  
    SetLineStyle            = "setLineStyle",  
    SetLineWidth            = "setLineWidth",  
    SetMeshCullMode         = "setMeshCullMode",  
    SetPointSize            = "setPointSize",  
    SetScissor              = "setScissor",  
    SetShader               = "setShader",  
    SetStencilTest          = "setStencilTest",  
    SetWireframe            = "setWireframe",  
}
Graphics = CloneModule(love.graphics, graphicsModule)

-- math module
local mathModule = {
    Noise               = "noise",
    Random              = "random",
    Triangulate         = "triangulate",
    
    GammaToLinear       = "gammaToLinear",
    GetRandomSeed       = "getRandomSeed",
    IsConvex            = "isConvex",
    LinearToGamma       = "linearToGamma",
    NewBezierCurve      = "newBezierCurve",
    NewRandomGenerator  = "newRandomGenerator",
    NewTransform        = "newTransform",

    RandomNormal        = "randomNormal",
    SetSandomSeed       = "setRandomSeed",
}
Math = CloneModule(love.math, mathModule)

-- video module
Video = CloneModule(love.video, {
    NewVideoStream = "newVideoStream",
})

-- sound module
Sound = CloneModule(love.sound, {
    NewDecoder      = "newDecoder", 
    NewSoundData    = "newSoundData",
});

-- filesystem module
FileSystem = CloneModule(love.filesystem, {
    Append                  = "append",
    AreSymlinksEnabled      = "areSymlinksEnabled",
    CreateDirectory         = "createDirectory",
    GetAppdataDirectory     = "getAppdataDirectory",
    GetCRequirePath         = "getCRequirePath",
    GetDirectoryItems       = "getDirectoryItems",
    GetIdentity             = "getIdentity",
    GetInfo                 = "getInfo",
    GetRealDirectory        = "getRealDirectory",
    GetRequirePath          = "getRequirePath",
    GetSaveDirectory        = "getSaveDirectory",
    GetSource               = "getSource",
    GetSourceBaseDirectory  = "getSourceBaseDirectory",
    GetUserDirectory        = "getUserDirectory",
    GetWorkingDirectory     = "getWorkingDirectory",
    Init                    = "init",
    IsFused                 = "isFused",
    Lines                   = "lines",
    Load                    = "load",
    Mount                   = "mount",
    NewFile                 = "newFile",
    NewFileData             = "newFileData",
    Read                    = "read",
    Remove                  = "remove",
    SetCRequirePath         = "setCRequirePath",
    SetIdentity             = "setIdentity",
    SetRequirePath          = "setRequirePath",
    SetSource               = "setSource",
    SetSymlinksEnabled      = "setSymlinksEnabled",
    Unmount                 = "unmount",
    Write                   = "write",
});
FileSystem.Exists = FileSystem.GetInfo;

-- audio
local audioModule = {
    Pause                   = "pause",
    Play                    = "play",
    Resume                  = "resume",
    Rewind                  = "rewind",
    Stop                    = "stop",

    GetActiveFffects        = "getActiveEffects",
    GetActiveSourceCount    = "getActiveSourceCount",
    GetDistanceModel        = "getDistanceModel",
    GetDopplerScale         = "getDopplerScale",
    GetEffect               = "getEffect",
    GetMaxSceneEffects      = "getMaxSceneEffects",
    GetMaxSourceEffects     = "getMaxSourceEffects",
    GetOrientation          = "getOrientation",
    GetPosition             = "getPosition",
    GetRecordingDevices     = "getRecordingDevices",
    GetSourceCount          = "getSourceCount",
    GetVelocity             = "getVelocity",
    GetVolume               = "getVolume",
    IsEffectsSupported      = "isEffectsSupported",
    NewQueueableSource      = "newQueueableSource",
    NewSource               = "newSource",
    SetDistanceModel        = "setDistanceModel",
    SetDopplerScale         = "setDopplerScale",
    SetEffect               = "setEffect",
    SetMixWithSystem        = "setMixWithSystem",
    SetOrientation          = "setOrientation",
    SetPosition             = "setPosition",
    SetVelocity             = "setVelocity",
    SetVolume               = "setVolume",
}
Audio = CloneModule(love.audio, audioModule)

-- event module
Event = CloneModule(love.event, {
    Pump    = "pump",
    Poll    = "poll",
    Clear   = "clear",
    Push    = "push",
    Quit    = "quit",
    Wait    = "wait",
})

-- mouse module
local mouseModule = {
    GetCursor             = "getCursor",
    GetPosition           = "getPosition",
    GetRelativeMode       = "getRelativeMode",
    GetSystemCursor       = "getSystemCursor",
    GetX                  = "getX",
    GetY                  = "getY",
    HasCursor             = "hasCursor",
    IsCursorSupported     = "isCursorSupported",
    IsDown                = "isDown",
    IsGrabbed             = "isGrabbed",
    IsVisible             = "isVisible",
    NewCursor             = "newCursor",
    SetCursor             = "setCursor",
    SetGrabbed            = "setGrabbed",
    SetPosition           = "setPosition",
    SetRelativeMode       = "setRelativeMode",
    SetVisible            = "setVisible",
    SetX                  = "setX",
    SetY                  = "setY",
}
Mouse = CloneModule(love.mouse, mouseModule)

-- keyboard module
local keyboardModule = {
    GetKeyFromScancode    = "getKeyFromScancode",
    GetScancodeFromKey    = "getScancodeFromKey",
    HasKeyRepeat          = "hasKeyRepeat",
    HasTextInput          = "hasTextInput",
    IsDown                = "isDown",
    IsScancodeDown        = "isScancodeDown",
    SetKeyRepeat          = "setKeyRepeat",
    SetTextTnput          = "setTextInput",
}
Keyboard = CloneModule(love.keyboard, keyboardModule)

-- joystick module
local joystickModule = {
    Open                    = "Open",
    Close                   = "Close",
    GetJoystickCount        = "getJoystickCount",
    GetJoysticks            = "getJoysticks",
    LoadGamepadMappings     = "loadGamepadMappings",
    SaveGamepadMappings     = "saveGamepadMappings",
    SetGamepadMapping       = "setGamepadMapping",
}
Joystick = CloneModule(love.joystick, joystickModule)

-- touch module
local touchModule = {
    GetPosition   = "getPosition",
    GetPressure   = "getPressure",
    GetTouches    = "getTouches",
}
Touch = CloneModule(love.touch, touchModule)

-- data module
Buffer                 = {}
Buffer.NewByteData     = love.data.newByteData
Buffer.NewBufferView   = love.data.newDataView
Buffer.GetPackedSize   = love.data.getPackedSize

-- font module
local fontModule = {
    NewGlyphData          = "newGlyphData",  
    NewRasterizer         = "newRasterizer",  
    NewTtfRasterizer      = "newTrueTypeRasterizer",  
    NewBmfontRasterizer   = "newBMFontRasterizer",  
}
Font = CloneModule(love.font, fontModule)

-- image module
local imageModule = {
    IsCompressed          = "isCompressed",  
    NewCompressedData     = "newCompressedData",  
    NewImageData          = "newImageData",  
}
Image = CloneModule(love.image, imageModule)

-- Timer module
local timerModule = {
    Step              = "step",
    Sleep             = "sleep",

    GetAverageDelta   = "getAverageDelta",
    GetDelta          = "getDelta",
    GetFps            = "getFPS",
    GetTime           = "getTime",
}
Time = CloneModule(love.timer, timerModule)

-- window module
local windowModule = {
    Close                   = "close",
    Maximize                = "maximize",
    Minimize                = "minimize",
    Restore                 = "restore",
    FromPixels              = "fromPixels",  
    GetDpiScale             = "getDPIScale",  
    GetDesktopDimensions    = "getDesktopDimensions",  
    GetDisplayCount         = "getDisplayCount",  
    GetDisplayName          = "getDisplayName",  
    GetFullscreen           = "getFullscreen",  
    GetFullscreenModes      = "getFullscreenModes",  
    GetIcon                 = "getIcon",  
    GetMode                 = "getMode",  
    GetPosition             = "getPosition",  
    GetTitle                = "getTitle",  
    HasFocus                = "hasFocus",  
    HasMouseFocus           = "hasMouseFocus",  
    IsDisplaySleepEnabled   = "isDisplaySleepEnabled",  
    IsMaximized             = "isMaximized",  
    IsMinimized             = "isMinimized",  
    IsOpen                  = "isOpen",  
    IsVisible               = "isVisible",  
    RequestAttention        = "requestAttention",  
    SetDisplaySleepEnabled  = "setDisplaySleepEnabled",  
    SetFullscreen           = "setFullscreen",  
    SetIcon                 = "setIcon",  
    SetMode                 = "setMode",  
    SetPosition             = "setPosition",  
    SetTitle                = "setTitle",  
    ShowMessageBox          = "showMessageBox",  
    ToPixels                = "toPixels",  
    UpdateMode              = "updateMode",  
}
Window = CloneModule(love.window, windowModule)

-- system module
local systemModule = {
    Vibrate               = "vibrate",
    GetClipboardText      = "getClipboardText",
    GetOS                 = "getOS",
    GetPowerInfo          = "getPowerInfo",
    GetProcessorCount     = "getProcessorCount",
    HasBackgroundMusic    = "hasBackgroundMusic",
    OpenUrl               = "openURL",
    SetClipboardText      = "setClipboardText",
}
System = CloneModule(love.system, systemModule)

System.GetVersion           = love.getVersion
System.IsVersionCompatible  = love.isVersionCompatible
System.HasDeprecationOutput = love.hasDeprecationOutput
System.SetDeprecationOutput = love.setDeprecationOutput

-- thread module
local threadModule = {
    GetChannel   = "getChannel",
    NewChannel   = "newChannel",
    NewThread    = "newThread",
}
Thread = CloneModule(love.thread, threadModule)

-- physics module
local physicsModule = {
    GetDistance           = "getDistance",
    GetMeter              = "getMeter",
    NewBody               = "newBody",
    NewChainShape         = "newChainShape",
    NewCircleShape        = "newCircleShape",
    NewDistanceSoint      = "newDistanceJoint",
    NewEdgeShape          = "newEdgeShape",
    NewFixture            = "newFixture",
    NewFrictionJoint      = "newFrictionJoint",
    NewGearJoint          = "newGearJoint",
    NewMotorJoint         = "newMotorJoint",
    NewMouseJoint         = "newMouseJoint",
    NewPolygonShape       = "newPolygonShape",
    NewPrismaticJoint     = "newPrismaticJoint",
    NewPulleyJoint        = "newPulleyJoint",
    NewRectangleShape     = "newRectangleShape",
    NewRevoluteJoint      = "newRevoluteJoint",
    NewRopeJoint          = "newRopeJoint",
    NewWeldJoint          = "newWeldJoint",
    NewWheelJoint         = "newWheelJoint",
    NewWorld              = "newWorld",
    SetMeter              = "setMeter",
}
Physics = CloneModule(love.physics, physicsModule)

local function LoadConfig(targetPath)
    local config

    local path = targetPath .. "/config.lua"
    local temp = io.open(path)
    if temp then
        io.close(temp)

        config = dofile(path)
    end

    -- Validate config
    config = config or {}

    -- Apply general config
    if config.identity then
        FileSystem.SetIdentity(config.identity)
    end

    -- Apply window config
    local windowConfig = config.window or {}
    Window.SetTitle(windowConfig.title or "Suki Game")
    Window.SetMode(windowConfig.width or 1280, windowConfig.height or 720, windowConfig.options)
end

-- Game module
Game = {}

-- customable engine loop
function Game.Run()
    local args = Arguments.ParseGameArguments(arg);

    if args[1] == "--version" then
        print("Suki v1.0")

        return nil 
    end

    local workingFolder = FileSystem.GetWorkingDirectory();
    local targetFolder  = args[1] or "Template"
    local fullPathTargetFolder = workingFolder .. "/" .. targetFolder

    -- Load config file
    LoadConfig(fullPathTargetFolder)

    -- Load main file
    local targetMainFile = fullPathTargetFolder .. "/main.lua"
    local temp = io.open(targetMainFile)
    if temp then
        io.close(temp)

        dofile(targetMainFile)
    end

    if Game.Load then 
        Game.Load(args, arg) 
    end

    -- We don't want the first frame's dt to include time taken by Load.
    Time.Step()
 
    local dt = 0
    
	-- Main loop time.
	return function()
		-- Process events.
        Event.Pump()
        for name, a, b, c, d, e, f in Event.Poll() do
            if name == "quit" then
                if not Game.Quit or not Suki.Quit() then
                    return a or 0
                end
            end

            local handler
            if name == "keypressed" then
                handler = Game.OnKeyDown
            elseif name == "keyreleased" then
                handler = Game.OnKeyUp
            elseif name == "textedited" then
                handler = Game.OnTextEdited
            elseif name == "textinput" then
                handler = Game.OnTextInput
            elseif name == "mousemoved" then
                handler = Game.OnMouseMoved
            elseif name == "mousepressed" then
                handler = Game.OnMouseDown
            elseif name == "mouserelease" then
                handler = Game.OnMouseUp
            elseif name == "wheelmoved" then
                handler = Game.OnMouseWheel
            elseif name == "touchmoved" then
                handler = Game.OnTouchMoved
            elseif name == "touchpressed" then
                handler = Game.OnTouchBegan
            elseif name == "touchreleased" then
                handler = Game.OnTouchEnded
            end

            if handler then
                handler(a, b, c, d, e, f)
            end
        end
 
		-- Update dt, as we'll be passing it to update\
        dt = Time.Step() 
 
		-- Call update and draw
        if Game.Update then 
            Game.Update(dt) 
        end
 
		if Graphics.IsActive() then
			Graphics.Origin()
			Graphics.Clear(Graphics.GetBackgroundColor())
 
            if Game.Render then 
                Game.Render() 
            end
 
			Graphics.Present()
		end
 
        Time.Sleep(0.001) 
	end
end

-- application entry
function love.run()
    if Game.Run then
        return Game.Run()
    end

    return nil
end