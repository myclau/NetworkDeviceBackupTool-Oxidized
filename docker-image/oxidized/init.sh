sed -i 's#${oxidized_git_username}#'${oxidized_git_username}'#g' /root/.config/oxidized/config
sed -i 's#${oxidized_git_password}#'${oxidized_git_password}'#g' /root/.config/oxidized/config
sed -i 's#${oxidized_git_username}#'${oxidized_git_username}'#g' /root/.config/oxidized/hookscript/git_ver.sh
sed -i 's#${oxidized_git_password}#'${oxidized_git_password}'#g' /root/.config/oxidized/hookscript/git_ver.sh
