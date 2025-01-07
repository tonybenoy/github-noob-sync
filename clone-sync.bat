@echo off
REM ---------------------------------------------------------------------
REM sync-or-clone.bat
REM ---------------------------------------------------------------------
REM Reads a list of repos from repos.txt in the format "owner/repo".
REM Checks if the local directory for each repo already exists.
REM    -> If it exists, runs "gh repo sync"
REM    -> Otherwise, runs "gh repo clone owner/repo"
REM ---------------------------------------------------------------------

for /f "tokens=1,2 delims=/" %%a in (repos.txt) do (
    REM %%a = owner, %%b = repo name

    if exist "%%b" (
        echo -----------------------------------------------------------
        echo The repo "%%b" already exists locally. Syncing...
        echo -----------------------------------------------------------
        pushd "%%b"
        gh repo sync
        popd
    ) else (
        echo -----------------------------------------------------------
        echo Cloning repo %%a/%%b...
        echo -----------------------------------------------------------
        gh repo clone %%a/%%b
    )
)

echo.
echo All done!
