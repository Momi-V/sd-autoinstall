# 1111
Install on OpenSUSE-Tumbleweed

## As root:
### Automated:
```
curl -O https://raw.githubusercontent.com/Momi-V/sd-autoinstall/main/scripts/setup.bash
chmod +x
./setup.bash
```

### Manual:
https://github.com/Momi-V/sd-autoinstall/blob/main/manual/setup.md

## As user:
### Automated:
```
curl -O https://raw.githubusercontent.com/Momi-V/sd-autoinstall/main/scripts/automatic.bash
bash setup.bash
```

### Manual:
https://github.com/Momi-V/sd-autoinstall/blob/main/manual/automatic.md

### Get_Modifiers:
Optional, see https://github.com/Momi-V/sd-autoinstall/tree/main/inspiration:
```
IFS=$'\n'
cd inspiration
rm -rf `ls | grep -v 'avatars.yaml'`
VAR="$(curl https://raw.githubusercontent.com/easydiffusion/easydiffusion/main/ui/modifiers.json)"
for c in $(echo "$VAR" | jq '.[].category'); do
  words=$(echo "$VAR" | jq ".[] | select (.category==$c).modifiers[].modifier" | sed 's+"++g')
  category="$(echo $c | sed 's+"++g')"
  echo "$words" > "$category.txt"
  echo "$category:" >> tags.yaml
  echo "  $category:" >> tags.yaml
  for i in $(cat $category.txt); do
    echo "    $i:" >> tags.yaml
    echo "      value: \"$i\"" >> tags.yaml
  done
  echo >> tags.yaml
done
```
