cd docs
"../hugo.exe" server -w --bind="0.0.0.0" -p=4444 --baseUrl="http://localhost:4444/" --ignoreCache --disableFastRender --forceSyncStatic --gc --verbose > log.txt