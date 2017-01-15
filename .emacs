(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(windmove-default-keybindings)

;disable backup
(setq backup-inhibited t)
;disable auto save
(setq auto-save-default nil)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x l") 'magit-log-all-branches)
(global-set-key (kbd "C-x C-a") 'string-insert-rectangle)

(define-key text-mode-map (kbd "<tab>") 'tab-to-tab-stop)
(setq tab-stop-list (number-sequence 4 120 4))
(setq-default indent-tabs-mode nil) 

(setq c-default-style "java"
      c-basic-offset 4)

(global-set-key (kbd "<delete>") 'delete-char)
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-d") 'duplicate-line)

(defun comment-eclipse ()
  (interactive)
  (let ((start (line-beginning-position))
	(end (line-end-position)))
    (when (region-active-p)
      (setq start (save-excursion
		    (goto-char (region-beginning))
		    (beginning-of-line)
		    (point))
	    end (save-excursion
		  (goto-char (region-end))
		  (end-of-line)
		  (point))))
    (comment-or-uncomment-region start end)))
(global-set-key "\M-;" 'comment-eclipse)

(global-set-key (kbd "C-;") 'iedit-mode)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(global-linum-mode t)
(setq inhibit-startup-screen t)
;;(neotree-show)
;;(neotree-dir "~/workspace")

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

