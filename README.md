# agentrouter-fix

A small local helper that sits between opencode and AgentRouter so long
tool sessions stop failing with HTTP 400.

## You need
- Python 3 (type `python --version` in a terminal to check)
- opencode
- Your own AgentRouter account and API key

## Steps
1. Download this repo (green Code button > Download ZIP) and unzip it anywhere, or use git clone.
2. Add your AgentRouter key to opencode: run `opencode auth login`,
   choose "Other", enter `agentrouter` as the provider id, paste your key.
3. Windows: double-click start.bat, or run `start.bat` in a terminal.
   Mac/Linux: run `bash start.sh` in this folder.
4. In opencode, pick the model "DeepSeek V4 Flash" (provider: agentrouter).

## Notes
- proxy.py runs only on your own computer (127.0.0.1:8787) and forwards
  to agentrouter.org. It writes proxy.log in this folder.
- The proxy keeps running in the background after you close opencode.
  That is fine. start.bat only starts it again if it is not running.
- Your key stays in your own opencode settings, never in this folder.
- If something fails, open an issue and paste the last 40 lines of proxy.log.
  Read the log first: it may contain parts of your requests.
- start.bat is untested on Windows. If it fails, open an issue with the exact error text.

## Using a different agent (not opencode)
Give this folder to your agent and ask it to adapt the setup.
- Run `python proxy.py` (listens on 127.0.0.1:8787, forwards to agentrouter.org).
- Point the agent's AgentRouter provider at http://127.0.0.1:8787/v1 using the
  Anthropic-style /v1/messages route, with model deepseek-v4-flash.
- The fix was only tested with that route. Other routes may still give HTTP 400.
- oc.json, start.sh and start.bat are opencode-only and can be ignored.
