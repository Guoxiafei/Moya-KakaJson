echo "-------------START---------------"
echo "------------------------------------------------------------------------------------"
pwd
cd ./Example
pod update
cd ..
pwd
echo "------------------------------------------------------------------------------------"
#--verbose显示详细编译信息，—allow-warnings忽略警告，—sources编译时用到的源码地址，—use-libraries编译时加载依赖的其他静态库。
pod lib lint --verbose --no-clean --allow-warnings Moya-KakaJson.podspec
git add .
git commit -m "creat Moya-KakaJson"
git pull
git push
git tag 0.0.1
git push --tag

#发布到git服务器
pod trunk push Moya-KakaJson.podspec --allow-warnings

#更新本地仓库
#pod repo update
echo "-----------------------------------------END-------------------------------------------"
