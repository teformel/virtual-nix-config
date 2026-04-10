{ config, pkgs, ... }:

{
  # 注意：这里必须是你真实的用户名和家目录路径
  home.username = "maorila";
  home.homeDirectory = "/home/maorila";

  # 1. 软件安装：这里安装的软件只有 maorila 能用
  home.packages = with pkgs; [
    fastfetch
    # 你可以在这里继续添加你想用的工具，比如 ripgrep, fzf 等
  ];

  # 明确启用 Bash 管理，这样 Home Manager 会自动把 direnv 注入到你的 .bashrc 中
  programs.bash.enable = true;
 
  programs.direnv = {
    enable = true;
    # 这一行极其重要，它是闪电加载的核心（nix-direnv 缓存机制）
    nix-direnv.enable = true; 
  };

  # 3. 开发工具配置：接管 Git
  programs.git = {
  	enable = true;
  	settings.user.email = "maorila@qq.com"; # 换成你真实提交代码的邮箱
  	settings.user.name = "maorila";
  };

  # 🌟 这一行不要改，它与系统版本的含义类似，用于兼容性控制
  home.stateVersion = "25.11"; 

  # 让 Home Manager 能够管理自己
  programs.home-manager.enable = true;
}
