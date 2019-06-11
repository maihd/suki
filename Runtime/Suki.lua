--
-- Suki Lua runtime for love2d
--

function table.deepcopy(orig)
    local copy
    if type(orig) == "table" then
        copy = {}
        for origKey, origValue in next, orig, nil do
            copy[table.deepcopy(origKey)] = table.deepcopy(origValue)
        end
    else
        copy = orig
    end
    return copy
end

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

-- main module
Suki = {
    Object                  = love.Object,
    Variant                 = love.Variant,
    GetVersion              = love.getVersion,
    IsVersionCompatible     = love.isVersionCompatible,
    HasDeprecationOutput    = love.hasDeprecationOutput,
    SetDeprecationOutput    = love.setDeprecationOutput,
}

-- handlers
Suki.handlers = {}

-- Arguments
Suki.Arguments = CloneModule(love.arg, {
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
Suki.Graphics = CloneModule(love.graphics, graphicsModule)

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
Suki.Math = CloneModule(love.math, mathModule)

-- video module
Suki.Video = CloneModule(love.video, {
    NewVideoStream = "newVideoStream",
})

-- sound module
Suki.Sound = CloneModule(love.sound, {
    NewDecoder      = "newDecoder", 
    NewSoundData    = "newSoundData",
});

-- filesystem module
Suki.FileSystem = CloneModule(love.filesystem, {
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
Suki.FileSystem.Exists = Suki.FileSystem.GetInfo;

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
Suki.Audio = CloneModule(love.audio, audioModule)

-- event module
Suki.Event = CloneModule(love.event, {
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
Suki.Mouse = CloneModule(love.mouse, mouseModule)

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
Suki.Keyboard = CloneModule(love.keyboard, keyboardModule)

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
Suki.Joystick = CloneModule(love.joystick, joystickModule)

-- touch module
local touchModule = {
    GetPosition   = "getPosition",
    GetPressure   = "getPressure",
    GetTouches    = "getTouches",
}
Suki.Touch = CloneModule(love.touch, touchModule)

-- data module
Suki.Buffer                 = {}
Suki.Buffer.NewByteData     = love.data.newByteData
Suki.Buffer.NewBufferView   = love.data.newDataView
Suki.Buffer.GetPackedSize   = love.data.getPackedSize

-- font module
local fontModule = {
    NewGlyphData          = "newGlyphData",  
    NewRasterizer         = "newRasterizer",  
    NewTtfRasterizer      = "newTrueTypeRasterizer",  
    NewBmfontRasterizer   = "newBMFontRasterizer",  
}
Suki.Font = CloneModule(love.font, fontModule)

-- image module
local imageModule = {
    IsCompressed          = "isCompressed",  
    NewCompressedData     = "newCompressedData",  
    NewImageData          = "newImageData",  
}
Suki.Image = CloneModule(love.image, imageModule)

-- Timer module
local timerModule = {
    Step              = "step",
    Sleep             = "sleep",

    GetAverageDelta   = "getAverageDelta",
    GetDelta          = "getDelta",
    GetFps            = "getFPS",
    GetTime           = "getTime",
}
Suki.Timer = CloneModule(love.timer, timerModule)

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
Suki.Window = CloneModule(love.window, windowModule)

-- system module
local systemModule = {
    Vibrate               = "Vibrate",
    GetClipboardText      = "getClipboardText",
    GetOS                 = "getOS",
    GetPowerInfo          = "getPowerInfo",
    GetProcessorCount     = "getProcessorCount",
    HasBackgroundMusic    = "hasBackgroundMusic",
    OpenUrl               = "openURL",
    SetClipboardText      = "setClipboardText",
}
Suki.System = CloneModule(love.system, systemModule)

-- thread module
local threadModule = {
    GetChannel   = "getChannel",
    NewChannel   = "newChannel",
    NewThread    = "newThread",
}
Suki.Thread = CloneModule(love.thread, threadModule)

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
Suki.Physics = CloneModule(love.physics, physicsModule)

local function LoadConfig(targetPath)
    local targetConfigFile = targetPath .. "/config.lua"
    local config, error = pcall(function () return require(targetConfigFile) end)

    -- Validate config
    config = config or {}

    -- Apply window config
    local windowConfig = config.window or {}
    Suki.Window.SetTitle(windowConfig.title or "Suki Game")
    Suki.Window.SetMode(windowConfig.width or 1280, windowConfig.height or 720, windowConfig.options)
end

-- customable engine loop
function Suki.Run()
    local args          = Suki.Arguments.ParseGameArguments(arg);
    local workingFolder = Suki.FileSystem.GetWorkingDirectory();
    local targetFolder  = args[1] or "Template"
    local fullPathTargetFolder = workingFolder .. "/" .. targetFolder

    -- Load config file
    LoadConfig(fullPathTargetFolder)

    -- Load main file
    local targetMainFile = fullPathTargetFolder .. "/main.lua"
    pcall(function () dofile(targetMainFile) end)

    --Suki.FileSystem.GetWorkingDirectory = function ()
    --    return fullPathTargetFolder;
    --end

    if Suki.Load then 
        Suki.Load(args, arg) 
    end

    -- We don't want the first frame's dt to include time taken by Suki.Load.
    if Suki.Timer then 
        Suki.Timer.Step() 
    end
 
    local dt = 0
    
	-- Main loop time.
	return function()
		-- Process events.
		if Suki.Event then
			Suki.Event.Pump()
			for name, a, b, c, d, e, f in Suki.Event.Poll() do
				if name == "quit" then
					if not Suki.Quit or not Suki.Quit() then
						return a or 0
					end
                end

                local handler
                if name == "keypressed" then
                    handler = Suki.OnKeyDown
                elseif name == "keyreleased" then
                    handler = Suki.OnKeyUp
                elseif name == "textedited" then
                    handler = Suki.OnTextEdited
                elseif name == "textinput" then
                    handler = Suki.OnTextInput
                elseif name == "mousemoved" then
                    handler = Suki.OnMouseMoved
                elseif name == "mousepressed" then
                    handler = Suki.OnMouseDown
                elseif name == "mouserelease" then
                    handler = Suki.OnMouseUp
                elseif name == "wheelmoved" then
                    handler = Suki.OnMouseWheel
                elseif name == "touchmoved" then
                    handler = Suki.OnTouchMoved
                elseif name == "touchpressed" then
                    handler = Suki.OnTouchBegan
                elseif name == "touchreleased" then
                    handler = Suki.OnTouchEnded
                end

                if handler then
                    handler(a, b, c, d, e, f)
                end
			end
		end
 
		-- Update dt, as we'll be passing it to update
        if Suki.Timer then 
            dt = Suki.Timer.Step() 
        end
 
		-- Call update and draw
        if Suki.Update then 
            Suki.Update(dt) 
        end -- will pass 0 if Suki.Timer is disabled
 
		if Suki.Graphics and Suki.Graphics.IsActive() then
			Suki.Graphics.Origin()
			Suki.Graphics.Clear(Suki.Graphics.GetBackgroundColor())
 
            if Suki.Render then 
                Suki.Render() 
            end
 
			Suki.Graphics.Present()
		end
 
        if Suki.Timer then 
            Suki.Timer.Sleep(0.001) 
        end
	end
end

-- application entry
function love.run()
    if Suki.Run then
        return Suki.Run()
    end

    return nil
end

-- export
return Suki