#!/bin/bash
# Testfile to produce lots of git commits
git rm mizar_cloudformation.yaml ; git commit -m"Removing Mizar"; git push origin dev
sleep 1
git rm deneb_web/ilius-cloudformation.yaml ; git commit -m"Removing Ilius"; git push origin dev
git rm deneb_web/vega-cloudformation.yaml ; git commit -m"Removing Vega"; git push origin dev
sleep 1
cp ../yaml.template/trialofconfig.yaml; git add trialofconfig.yaml; git commit -m"Added Trial of config file"
git rm redub-cloudformation.yaml; git commit -m"Removing broken redub-cloudformation.yaml"; git push origin dev
sleep 1
cp mizar_cloudformation.yaml_DELETE mizar_cloudformation.yaml; git add mizar_cloudformation.yaml; git commit -m"Adding Mizar"; git push origin dev
cp vega_cloudformation.yaml_DELETE deneb_web/vega-cloudformation.yaml; git add deneb_web; git commit -m"Adding Vega"; git push origin dev; 
sleep 1
cp ilius_cloudformation.yaml_DELETE deneb_web/ilius-cloudformation.yaml; git add deneb_web; git commit -m"Adding Ilius"; git push origin dev
sleep 1
git rm trialofconfig.yaml; git commit -m"Removing Trialofconfig file"
echo "" >> meta.yaml; git add meta.yaml; git commit -m"Editing deneb meta.yaml"; git push origin dev
echo "" >> deneb_web/meta.yaml; echo "" >> ../meta.yaml; git add deneb_web/meta.yaml ../meta.yaml; git commit -m"Trying multiple meta.yaml edits"; git push origin dev
cp mizar_cloudformation.yaml_DELETE completelynewfile.something; echo "schnarf" > completelynewfile2.yaml; git add completely*; git commit -m"Adding completelynewfiles"; git push origin dev
sleep 2
git rm completelynewfile.something completelynewfile2.yaml; git commit -m"Removing completelynewfiles"; echo "Red UB" >> redub-cloudformation.yaml; git add redub-cloudformation.yaml; git commit -m"Adding redub.yaml which contains errors and should fail in validation";  git push origin dev

