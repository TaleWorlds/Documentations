# Official repository for TaleWorlds Entertainment documentations.

## Getting Started

### Run server on Windows Locally
Execute run.bat, and access to http://localhost:4444 from your web browser.

### Run server on Mac/Linux Locally

Install [Hugo](https://gohugo.io/getting-started/installing/)
Then go to `docs` folder:
```bash
cd docs
hugo server -w --bind="0.0.0.0" -p=4444 --baseUrl="http://localhost:4444/" --ignoreCache --disableFastRender --forceSyncStatic --gc --verbose > log.txt% 
# Or simply hugo server -D
```
Then access to http://localhost:4444 or http://localhost:1313 (By Default) from your web browser.

## Contributing

We accept a lot of different contributions including, but not limit to :beetle: Issues, :hammer_and_wrench: Pull Request, :question: Support, :earth_asia: Localization.

### Localization
Localization contributions are welcomed.    
Copy and paste `docs/content/english` folder alongside english folder as `docs/content/<LanguageName>`.    
Then add your language in config.toml using english as example.

```toml
[languages]
    [languages.en]
        contentDir = "content/english"
        languageName = "English"
    [languages.zh_cn]
        contentDir = "content/simplified_chinese"
        languageName = "简体中文"
```
