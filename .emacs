(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a622aaf6377fe1cd14e4298497b7b2cae2efc9e0ce362dade3a58c16c89e089c" "7f89ec3c988c398b88f7304a75ed225eaac64efa8df3638c815acc563dfd3b55" default)))
 '(flymake-google-cpplint-command "/home/salaheddineghamri/miniconda3/bin/cpplint")
 '(package-archives
   (quote
    (("gnu" . "https://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.milkbox.net/packages/"))))
 '(package-selected-packages
   (quote
    (evil powerline flycheck-clangcheck flymake-cursor flymake-google-cpplint iedit yasnippet-snippets auto-compile flycheck-clang-analyzer auto-complete-clang auto-complete-c-headers yasnippet minimap avy python org))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;package
(require 'package)
(package-initialize)
;;auto complete
(require 'auto-complete)
(require 'auto-complete-clang)
(require 'auto-complete-config)
(ac-config-default)
;;yasineppet
(require 'yasnippet)
(yas-global-mode 1)
;; use tab for autocomple and c-tab for yasnippet
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "<C-tab>") 'yas-expand)
;;flycheck
(require 'flycheck-clang-analyzer)
;;c-headers
(defun my:ac-c-headers-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers 'ac-source-clang)
  (setq achead:include-directories
	(append '( "/usr/bin/../lib64/gcc/x86_64-pc-linux-gnu/8.2.1/../../../../include/c++/8.2.1"
		   "/usr/bin/../lib64/gcc/x86_64-pc-linux-gnu/8.2.1/../../../../include/c++/8.2.1/x86_64-pc-linux-gnu"
		   "/usr/bin/../lib64/gcc/x86_64-pc-linux-gnu/8.2.1/../../../../include/c++/8.2.1/backward"
		   "/usr/local/include"
		   "/usr/lib/clang/7.0.0/include"
		   "/usr/include")
		   achead:include-directories)))

(add-hook 'c++-mode-hook 'my:ac-c-headers-init)
(add-hook 'c-mode-hook 'my:ac-c-headers-init)

;;iedit key remap
(define-key global-map (kbd "C-c ;") 'iedit-mode)

;;flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)
;;flycheck-clangcheck
(require 'flycheck-clangcheck)

(defun my-select-clangcheck-for-checker()
  "Select clang-check for flycheck's checker."
  (flycheck-set-checker-executable 'c/c++-clangcheck"/usr/bin/clang-check")
  (flycheck-select-checker 'c/c++-clangcheck))

(add-hook 'c-mode-hook 'my-select-clangcheck-for-checker)
(add-hook 'c++-mode-hook 'my-select-clangcheck-for-checker)

(setq flycheck-clangcheck-analyze t)

;;powerline
(require 'powerline)
(powerline-center-evil-theme)


(add-hook 'prog-mode-hook 'linum-mode)
(setq global-linum-mode t)

(load-theme 'gruvbox-dark-soft t)

;;font change source-code-pro
;; Set default font
(set-frame-font "Mononoki 13")
(menu-bar-mode -1)

;;evil mode always
(require 'evil)
(evil-mode 1)
(custom-set-variables '(linum-format (quote " %2d ")))

;;minimap
(require 'minimap)
