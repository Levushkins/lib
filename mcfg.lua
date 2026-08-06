Mcfg = {
	_VERSION	= "1.0.2",
	_AUTHOR		= "Double Tap Inside",
	_EMAIL		= "double.tap.inside@gmail.com"
	
	--[[
		Module mcfg				= require "mcfg"
		
		Bool result				= mcfg.update(Table original, Table update / Str update_filename,  [Bool rewrite=true])
		Bool result				= mcfg.save(Table updated, Str filename)
				
		nil						= mcfg.mkpath(Str filename)
		Table loaded / nil		= mcfg.load(Str filename)
		
		Bool result				= mcfg.append_pair(Str/Int key, value, Str filename)
		Bool result				= mcfg.append_value(value, Str filename)
	--]]
}
setmetatable(Mcfg, {
	__call = function(self)
		return self.__init()
	end
})
function Mcfg.__init()
	local self = {}
	local inspect = require "inspect"
	
	function self.mkpath(filename)
		assert(type(filename)=="string", ("bad argument #1 to 'mkpath' (string expected, got %s)"):format(type(filename)))
	
		local sep, pStr = package.config:sub(1, 1), ""
		local path = filename:match("(.+"..sep..").+$") or filename
		
		for dir in path:gmatch("[^" .. sep .. "]+") do
			pStr = pStr .. dir .. sep
			createDirectory(pStr)
		end
	end
	
	
	function self.load(filename)
		assert(type(filename)=="string", ("bad argument #1 to 'load' (string expected, got %s)"):format(type(filename)))
	
		local file = io.open(filename, "r")
		
		if file then 	
			local text = file:read("*all")
			file:close()
			local lua_code = loadstring("return {"..text.."}")
			
			if lua_code then
				local result = lua_code()
				
				if type(result) == "table" then
					return result
				end
			end
		end
	end
	
	
	function self.save(updated, filename)
		assert(type(updated)=="table", ("bad argument #1 to 'save' (table expected, got %s)"):format(type(updated)))
		assert(type(filename)=="string", ("bad argument #2 to 'save' (string expected, got %s)"):format(type(filename)))
	
		self.mkpath(filename)
		local file = io.open(filename, "w+")
		
		if file then
			local text = inspect(updated)
			text = text:gsub("[\n ]?}$", "")
			text = text:gsub("^{[\n ]?", "")
			if next(updated) then
				text = text..","
			end
			
			file:write(text)
			file:close()
			
			return true
			
		else
			return false
		end
	end
	
	
	function self.append_value(value, filename)
		assert(type(filename)=="string", ("bad argument #2 to 'save' (string expected, got %s)"):format(type(filename)))
		
		self.mkpath(filename)
		local file = io.open(filename, "a+")
		
		if file then
			file:write("\n  "..inspect(value)..",")
			file:close()
			
			return true
		else
			return false
		end
	end
	
	
	function self.append_pair(key, value, filename)
		assert(type(filename)=="string", ("bad argument #3 to 'append_pair' (string expected, got %s)"):format(type(filename)))
		assert(type(key)=="string" or type(key)=="number", ("bad argument #1 to 'append_pair' (string or number expected, got %s)"):format(type(key)))
		
		self.mkpath(filename)
		local file = io.open(filename, "a+")
		
		if file then
			local dict = {}
			dict[key] = value
			
			local text = inspect(dict)
			text = text:gsub("[\n ]?}$", "")
			text = text:gsub("^{[\n ]?", "")
			
			file:write("\n"..text..",")
			file:close()
			
			return true
		else
			return false
		end
	end
	
	function self.update(original, update, rewrite)
		assert(type(original)=="table", ("bad argument #1 to 'update' (table expected, got %s)"):format(type(original)))
		assert(type(update)=="string" or type(update)=="table", ("bad argument #2 to 'update' (string or table expected, got %s)"):format(type(update)))
		assert(type(rewrite)=="boolean" or type(rewrite)=="nil", ("bad argument #1 to 'update' (boolean or nil expected, got %s)"):format(type(rewrite)))
		
		if rewrite == nil then
			rewrite = true
		end
	
		if type(update) == "table" then
			if rewrite then
				for key, value in pairs(update) do
					original[key] = value
				end
				
			else
				for key, value in pairs(update) do
					if not original[key] then
						original[key] = value
					end
				end
			end
			
			return true
			
		elseif type(update) == "string" then
			local loaded = self.load(update)
			
			if loaded then
				if rewrite then
					for key, value in pairs(loaded) do
						original[key] = value
					end
					
				else
					for key, value in pairs(loaded) do
						if not original[key] then
							original[key] = value
						end
					end
				end
				
				return true
			end
		end
		
		return false
	end
	
	return self
end

return Mcfg()