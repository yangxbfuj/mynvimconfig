local util = require 'lspconfig.util'
local function get_typescript_server_path(root_dir)

  local global_ts = '/Users/yangxuebin/.npm/lib/node_modules/typescript/lib'
  local found_ts = ''
  local function check_dir(path)
    found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

local function get_javascript_server_path(root_dir)

  local global_js = '/Users/yangxuebin/.npm/lib/node_modules/javascript/lib'
  local found_js = ''
  local function check_dir(path)
    found_js =  util.path.join(path, 'node_modules', 'javascript', 'lib')
    if util.path.exists(found_js) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_js
  else
    return global_js
  end
end

require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  on_new_config = function(new_config, new_root_dir)
    new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
    new_config.init_options.javacript.jsdk = get_javascript_server_path(new_root_dir)
  end,
}