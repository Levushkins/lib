script_name('Moon ImGui Example')
script_author('FYP')
script_description('Demonstrates Moon ImGui features')

local key = require 'vkeys'
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8

function apply_custom_style()
	imgui.SwitchContext()
	local style = imgui.GetStyle()
	local colors = style.Colors
	local clr = imgui.Col
	local ImVec4 = imgui.ImVec4

	style.WindowRounding = 2.0
	style.WindowTitleAlign = imgui.ImVec2(0.5, 0.84)
	style.ChildWindowRounding = 2.0
	style.FrameRounding = 2.0
	style.ItemSpacing = imgui.ImVec2(5.0, 4.0)
	style.ScrollbarSize = 13.0
	style.ScrollbarRounding = 0
	style.GrabMinSize = 8.0
	style.GrabRounding = 1.0
	-- style.Alpha =
	-- style.WindowPadding =
	-- style.WindowMinSize =
	-- style.FramePadding =
	-- style.ItemInnerSpacing =
	-- style.TouchExtraPadding =
	-- style.IndentSpacing =
	-- style.ColumnsMinSpacing = ?
	-- style.ButtonTextAlign =
	-- style.DisplayWindowPadding =
	-- style.DisplaySafeAreaPadding =
	-- style.AntiAliasedLines =
	-- style.AntiAliasedShapes =
	-- style.CurveTessellationTol =

	colors[clr.Text]                   = ImVec4(1.00, 1.00, 1.00, 1.00)
	colors[clr.TextDisabled]           = ImVec4(0.50, 0.50, 0.50, 1.00)
	colors[clr.WindowBg]               = ImVec4(0.06, 0.06, 0.06, 0.94)
	colors[clr.ChildWindowBg]          = ImVec4(1.00, 1.00, 1.00, 0.00)
	colors[clr.PopupBg]                = ImVec4(0.08, 0.08, 0.08, 0.94)
	colors[clr.ComboBg]                = colors[clr.PopupBg]
	colors[clr.Border]                 = ImVec4(0.43, 0.43, 0.50, 0.50)
	colors[clr.BorderShadow]           = ImVec4(0.00, 0.00, 0.00, 0.00)
	colors[clr.FrameBg]                = ImVec4(0.16, 0.29, 0.48, 0.54)
	colors[clr.FrameBgHovered]         = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.FrameBgActive]          = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.TitleBg]                = ImVec4(0.04, 0.04, 0.04, 1.00)
	colors[clr.TitleBgActive]          = ImVec4(0.16, 0.29, 0.48, 1.00)
	colors[clr.TitleBgCollapsed]       = ImVec4(0.00, 0.00, 0.00, 0.51)
	colors[clr.MenuBarBg]              = ImVec4(0.14, 0.14, 0.14, 1.00)
	colors[clr.ScrollbarBg]            = ImVec4(0.02, 0.02, 0.02, 0.53)
	colors[clr.ScrollbarGrab]          = ImVec4(0.31, 0.31, 0.31, 1.00)
	colors[clr.ScrollbarGrabHovered]   = ImVec4(0.41, 0.41, 0.41, 1.00)
	colors[clr.ScrollbarGrabActive]    = ImVec4(0.51, 0.51, 0.51, 1.00)
	colors[clr.CheckMark]              = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.SliderGrab]             = ImVec4(0.24, 0.52, 0.88, 1.00)
	colors[clr.SliderGrabActive]       = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Button]                 = ImVec4(0.26, 0.59, 0.98, 0.40)
	colors[clr.ButtonHovered]          = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ButtonActive]           = ImVec4(0.06, 0.53, 0.98, 1.00)
	colors[clr.Header]                 = ImVec4(0.26, 0.59, 0.98, 0.31)
	colors[clr.HeaderHovered]          = ImVec4(0.26, 0.59, 0.98, 0.80)
	colors[clr.HeaderActive]           = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.Separator]              = colors[clr.Border]
	colors[clr.SeparatorHovered]       = ImVec4(0.26, 0.59, 0.98, 0.78)
	colors[clr.SeparatorActive]        = ImVec4(0.26, 0.59, 0.98, 1.00)
	colors[clr.ResizeGrip]             = ImVec4(0.26, 0.59, 0.98, 0.25)
	colors[clr.ResizeGripHovered]      = ImVec4(0.26, 0.59, 0.98, 0.67)
	colors[clr.ResizeGripActive]       = ImVec4(0.26, 0.59, 0.98, 0.95)
	colors[clr.CloseButton]            = ImVec4(0.41, 0.41, 0.41, 0.50)
	colors[clr.CloseButtonHovered]     = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.CloseButtonActive]      = ImVec4(0.98, 0.39, 0.36, 1.00)
	colors[clr.PlotLines]              = ImVec4(0.61, 0.61, 0.61, 1.00)
	colors[clr.PlotLinesHovered]       = ImVec4(1.00, 0.43, 0.35, 1.00)
	colors[clr.PlotHistogram]          = ImVec4(0.90, 0.70, 0.00, 1.00)
	colors[clr.PlotHistogramHovered]   = ImVec4(1.00, 0.60, 0.00, 1.00)
	colors[clr.TextSelectedBg]         = ImVec4(0.26, 0.59, 0.98, 0.35)
	colors[clr.ModalWindowDarkening]   = ImVec4(0.80, 0.80, 0.80, 0.35)
end
apply_custom_style()

do

show_main_window = imgui.ImBool(false)
local show_imgui_example = imgui.ImBool(false)
local slider_float = imgui.ImFloat(0.0)
local clear_color = imgui.ImVec4(0.45, 0.55, 0.60, 1.00)
local show_test_window = imgui.ImBool(false)
local show_another_window = imgui.ImBool(false)
local show_moon_imgui_tutorial = {imgui.ImBool(false), imgui.ImBool(false), imgui.ImBool(false)}
local moonimgui_text_buffer = imgui.ImBuffer('test', 256)
local sampgui_texture = nil
local cb_render_in_menu = imgui.ImBool(imgui.RenderInMenu)
local cb_lock_player = imgui.ImBool(imgui.LockPlayer)
local cb_show_cursor = imgui.ImBool(imgui.ShowCursor)
local font_changed = false
local glyph_ranges_cyrillic = nil
function imgui.OnDrawFrame()
	-- Main Window
	if show_main_window.v then
		local sw, sh = getScreenResolution()
		-- center
		imgui.SetNextWindowPos(imgui.ImVec2(sw / 2, sh / 2), imgui.Cond.FirstUseEver, imgui.ImVec2(0.5, 0.5))
		imgui.SetNextWindowSize(imgui.ImVec2(300, 300), imgui.Cond.FirstUseEver)
		imgui.Begin('Main Window', show_main_window)
		local btn_size = imgui.ImVec2(-0.1, 0)
		if imgui.Button('ImGui Example', btn_size) then
			show_imgui_example.v = not show_imgui_example.v
		end
		for i = 1, 3 do
			if imgui.Button('Moon ImGui Tutorial #' .. i, btn_size) then
				show_moon_imgui_tutorial[i].v = not show_moon_imgui_tutorial[i].v
			end
		end
		if imgui.Button('ImGui Demo', btn_size) then
			show_test_window.v = not show_test_window.v
		end
		if not font_changed and imgui.Button('Change Font', btn_size) then
			font_changed = true
			lua_thread.create(function()
				-- Fonts' texture cannot be rebuilt within OnDrawFrame, so we doing it in a separate script-thread
				wait(0) -- delay here is necessary
				imgui.SwitchContext()
				imgui.GetIO().Fonts:Clear()
				glyph_ranges_cyrillic = imgui.GetIO().Fonts:GetGlyphRangesCyrillic()
				imgui.GetIO().Fonts:AddFontFromFileTTF(getFolderPath(0x14) .. '\\impact.ttf', 15.0, nil, glyph_ranges_cyrillic)
				imgui.RebuildFonts()
			end)
		end
		if not sampgui_texture and imgui.Button('Show Texture', btn_size) then
			if doesFileExist(getGameDirectory() .. '\\sampgui.png') then
				sampgui_texture = imgui.CreateTextureFromFile(getGameDirectory() .. '\\sampgui.png')
				if not sampgui_texture then
					imgui.OpenPopup('Texture Loading Error')
				end
			else
				imgui.OpenPopup('Texture Loading Error')
			end
		elseif sampgui_texture and imgui.CollapsingHeader('Texture') then
			imgui.Image(sampgui_texture, imgui.ImVec2(250, 200))
		end
		if imgui.BeginPopupModal('Texture Loading Error', nil, imgui.WindowFlags.AlwaysAutoResize) then
			imgui.Text('Texture "sampgui.png" couldn\'t be loaded.')
			imgui.Separator()
			if imgui.Button('OK') then
				imgui.CloseCurrentPopup()
			end
			imgui.EndPopup()
		end
		if imgui.CollapsingHeader('Options') then
			if imgui.Checkbox('Render in menu', cb_render_in_menu) then
				imgui.RenderInMenu = cb_render_in_menu.v
			end
			if imgui.Checkbox('Lock player controls', cb_lock_player) then
				imgui.LockPlayer = cb_lock_player.v
			end
			if imgui.Checkbox('Show cursor', cb_show_cursor) then
				imgui.ShowCursor = cb_show_cursor.v
			end
		end
		imgui.End()
	end

	-- Moon ImGui tutorial
	if show_moon_imgui_tutorial[1].v then
		imgui.Begin('My window##w1')
		imgui.Text('Hello world')
		imgui.End()
	end

	if show_moon_imgui_tutorial[2].v then
		imgui.SetNextWindowSize(imgui.ImVec2(150, 200), imgui.Cond.FirstUseEver)
		imgui.Begin('My window##w2', show_moon_imgui_tutorial[2])
		imgui.Text('Hello world')
		if imgui.Button('Press me') then
			printStringNow('Button pressed!', 1000)
		end
		imgui.End()
	end

	if show_moon_imgui_tutorial[3].v then
		imgui.Begin(u8'Основное окно')
		if imgui.InputText(u8'Вводить текст сюда', moonimgui_text_buffer) then
			print('Введённый текст:', u8:decode(moonimgui_text_buffer.v))
		end
		imgui.Text(u8'Введённый текст: ' .. moonimgui_text_buffer.v)
		imgui.Text(u8(string.format('Текущая дата: %s', os.date())))
		imgui.End()
	end

	-- Standard ImGui example
	if show_imgui_example.v then
		imgui.Begin('ImGui example', show_imgui_example)
		imgui.Text('Hello, world!')
		imgui.SliderFloat('float', slider_float, 0.0, 1.0)
		imgui.ColorEdit3('clear color', clear_color)
		if imgui.Button('Test Window') then
			show_test_window.v = not show_test_window.v
		end
		if imgui.Button('Another Window') then
			show_another_window.v = not show_another_window.v
		end
		local framerate = imgui.GetIO().Framerate
		imgui.Text(string.format('Application average %.3f ms/frame (%.1f FPS)', 1000.0 / framerate, framerate))
		imgui.End()
	end

	if show_another_window.v then
		imgui.Begin('Another Window', show_another_window)
		imgui.Text('Hello from another window!')
		imgui.End()
	end

	if show_test_window.v then
		imgui.SetNextWindowPos(imgui.ImVec2(650, 20), imgui.Cond.FirstUseEver)
		imgui.ShowTestWindow(show_test_window)
	end
end

end

function main()
	while true do
		wait(0)
		if wasKeyPressed(key.VK_X) then
			show_main_window.v = not show_main_window.v
		end
		imgui.Process = show_main_window.v
	end
end
