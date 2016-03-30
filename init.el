(add-to-list 'load-path "~/.emacs.d/emacs-goodies-el/")
(require 'emacs-goodies-el)

(setq make-backup-files nil)
(setq auto-save-list-file-name nil)
(setq auto-safe-default nil)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(color-theme-initialize)
(defun reload-config()
  "Перезагрузить файл конфигурации"
  (interactive)
  (load-file "~/.emacs.d/init.el"))
;;не показывть начальный экран
(setq inhibit-startup-message t)
;; табы по 4
(setq default-tab-width 4)
;; краткие ответы на вопрос
(fset 'yes-or-no-p 'y-or-n-p)
;;
(require 'color-theme)

(when (not (boundp 'custom-theme-load-path))
  (message "custome theme load path")
  (defvar custom-theme-load-path '() "variable for themes")
  (message "custome theme load path %s" custom-theme-load-path))

(if (not custom-theme-load-path)
	(setq custom-theme-load-path (expand-file-name "~/.emacs.d/theme/"))
  (add-to-list 'custom-theme-load-path (expand-file-name "~/.emacs.d/theme/")))

(condition-case nil
	(load-theme 'zenburn t)
  (error (load-theme 'zenburn)))

;; перемещение с использованием Alt
(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)
;; удаление пустых линий
(global-set-key (kbd "C-x C-o") 'delete-blank-lines)

;;макросы 
(global-set-key [f5] 'kmacro-start-macro)
(global-set-key [f6] 'kmacro-end-macro)
(global-set-key [f7] 'call-last-kbd-macro)

;;Закомментировать раскомментировать область
(global-set-key (kbd "\e\ec") 'comment-region)
;;показывать парные скобки
(global-set-key (kbd "\e\eu") 'uncomment-region)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; замена строк
(global-set-key (kbd "C-x C-m") 'replace-string)

;;показывать парные скобки
(show-paren-mode t)

