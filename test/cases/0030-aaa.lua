--------------------------------------------------------------------------------
-- 0030-docker.lua: tests for pk-test/docker.lua
-- This file is a part of pk-test library
-- See file `COPYRIGHT` for the license
--------------------------------------------------------------------------------

local socket = require 'socket'

local do_with_docker
      = import 'pk-test/docker.lua'
      {
        'do_with_docker'
      }

local ensure_equals, ensure_fails_with_substring, ensure_has_substring
      = import 'lua-nucleo/ensure.lua'
      {
        'ensure_equals',
        'ensure_fails_with_substring',
        'ensure_has_substring'
      }

local fail
      = import 'lua-aplicado/error.lua'
      {
        'fail'
      }

--------------------------------------------------------------------------------

local CONTAINER_CFG_DIR = 'test/data/echoserv_container5'
local WRONG_DIR = 'nothing/nowhere/1856916550571289837'

--------------------------------------------------------------------------------

local log, dbg, spam, log_error
     = import 'lua-aplicado/log.lua' { 'make_loggers' } (
         "test/docker", "T003"
       )

--------------------------------------------------------------------------------

local test = (...)('do_with_docker')

--------------------------------------------------------------------------------

test:case 'run-successfull-handler' (function()
  xpcall(function()
    fail("aaa", "bbb")
  end,
  function(e)
    print(string.rep("-", 30))
    print("ERRRR", e)
    print(string.rep("-", 30))
    for k, v in pairs(e) do
      print("KV", k, v)
    end
    print(string.rep("-", 30))
  end
  )
end)

--[[
------------------------------
ERRRR	table: 0x18af320
------------------------------
KV	1	function: 0x18e85e0
KV	2	aaa
------------------------------
OK
Total tests in suite:	1
Successful:	1
OK
]]
