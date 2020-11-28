-- insprired from https://github.com/pandoc/lua-filters/blob/5686d96/diagram-generator/diagram-generator.lua

local dotPath = os.getenv("DOT") or "dot"
local plantumlPath = os.getenv("PLANTUML") or "plantuml"

local filetype = "svg"
local mimetype = "image/svg+xml"

local function graphviz(code, filetype)
    return pandoc.pipe(dotPath, {"-T" .. filetype}, code)
end

local function plantuml(code, filetype)
    return pandoc.pipe(plantumlPath, {"-t" .. filetype, "-pipe"}, code)
end

function CodeBlock(block)
    local converters = {
        graphviz = graphviz,
        plantuml = plantuml,
    }

    local img_converter = converters[block.classes[1]]
    if not img_converter then
      return nil
    end

    local success, img = pcall(img_converter, block.text, filetype)

    if not success then
        io.stderr:write(tostring(img))
        io.stderr:write('\n')
        error 'Image conversion failed. Aborting.'
    end

    local fname = pandoc.sha1(img) .. "." .. filetype
    pandoc.mediabag.insert(fname, mimetype, img)

    local imgObj = pandoc.Image({}, fname)

    return pandoc.Para{imgObj}
end

return {
    {CodeBlock = CodeBlock},
}
