Installing and setting up GNU Emacs 27.1 on Debian 10
=====================================================

::

  wget -c http://gnu.spinellicreations.com/emacs/emacs-27.1.tar.xz
  sudo chmod +x emacs-27.1.tar.xz 
  tar -xf emacs-27.1.tar.xz 
  cd emacs-27.1
  ./configure

The configure step complained about some missing dependencies and I need to install those with the following steps:
::
  sudo apt-get update
  sudo apt-get install libgtk-3-dev
  sudo apt -y install libjpeg-dev libpng-dev libtiff-dev libxpm-dev libgif-dev
  sudo apt -y install libgnutls28-dev
  sudo apt -y install libncurses-dev
  ./configure --with-mailutils
  make
  sudo make install

Install web-mode to use Emacs for Web development
-------------------------------------------------

Download `web-mode.el` from `web-mode.org` website
and move the `web-mode.el` file to a **directory inside** `~/.emacs.d`
I used the directory **auto-save-list** which was already present after installation.

`mv web-mode.el /home/tanzeem/.emacs.d/auto-save-list/`

After that I updated the content of my `.emacs` file in my home directory to enable web-mode
Be sure to specify the load path directory explicitly and avoid using ~

Content of my .emacs file
-------------------------

::

  (add-to-list 'load-path "/home/tanzeem/.emacs.d/auto-save-list")

  (setq inhibit-startup-message t
        inhibit-startup-echo-area-message t)

  (require 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

Restart GNU Emacs and you are done to use it for Web development.

You can now use M-x `web-mode` if you find any of your files are not rendered(syntax highlighted properly) 

I use the `M-x dired` for browsing my project files needed for web development.



