# Personnal env scripts

My personnal dev environment with common tools

- All :`curl -fLsS https://github.com/loic-roux-404/personnal-stack/raw/master/local-envs/personnal-osx.sh | bash -S all`

- Single component :

```bash
curl -fLsS https://github.com/loic-roux-404/personnal-stack/raw/master/local-envs/personnal-osx.sh > /tmp/personnal-osx.sh && chmod +x /tmp/personnal-osx.sh
source /tmp/personnal-osx.sh
p-excel
```

## Adobe

> From [this video](https://www.reddit.com/r/AdobeZii/comments/sdkt94/i_made_a_quick_tutorial_on_how_to_download_native/)

Compatibility
```
After effects v22.1.1
Photoshop v23.1.0
Illustrator 26.0.2
Indesign 17.0.1
Premiere V22.1.2
```

- Download creative cloud
- `./local-envs/adobe/packager.command`
- Adobe zii or [download](https://drive.google.com/u/0/uc?export=download&confirm=pdFa&id=12NVPuIE2I1vuyOJvgigpyxydbKnV_6I4)
- In : `sudo cp ./local-envs/adobe/InDesign_2022_17.0.1/* /Applications/Adobe\ InDesign\ 2022/Adobe\ InDesign\ 2022.app/Contents/MacOS`
- Ps : `sudo cp ./local-envs/adobe/Photoshop_2022_v23.1.0/* /Applications/Adobe\ InDesign\ 2022/Adobe\ InDesign\ 2022.app/Contents/MacOS`

Possible links to dl easily

- https://ccmdls.adobe.com/AdobeProducts/PHSP/23.1.0.143/macuniversal/cb350ad8-a5cd-4314-9d52-d1788251ac0d/AdobePhotoshop23-Core.zip
