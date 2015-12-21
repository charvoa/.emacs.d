;;
;; init.el for  in /home/carpen_t/.emacs.d
;;
;; Made by thibault carpentier
;; Login   <carpen_t@epitech.net>
;;
;; Started on  Mon Feb 27 11:53:31 2012 thibault carpentier
;; Last update Mon Dec 21 15:47:45 2015 Nicolas Charvoz
;;

;; doxymacs
;; C-c d ? will look up documentation for the symbol under the point.
;; C-c d r will rescan your Doxygen tags file.
;; C-c d f will insert a Doxygen comment for the next function.
;; C-c d i will insert a Doxygen comment for the current file.
;; C-c d ; will insert a Doxygen comment for a member variable on the current line (like M-;).
;; C-c d m will insert a blank multi-line Doxygen comment.
;; C-c d s will insert a blank single-line Doxygen comment.
;; C-c d @ will insert grouping comments around the current region.

;; (require 'doxymacs)
;; (add-hook 'c-mode-common-hook 'doxymacs-mode)
;; (defun my-doxymacs-font-lock-hook ()
;;     (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
;;         (doxymacs-font-lock)))
;; (add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)

;; fix emacs bug
(load "~/.emacs.d/fix_bug.el")

;; ocaml
(load "~/.emacs.d/tuareg.el")

;; eviter la bad autocompletion
;;(ac-ignore-case 'smart)


;; FONT MAGIC AUTO COMPLETE

;; (when (window-system)
;; (set-default-font "Fira Code"))
;; (let ((alist '((33 . ".\\(?:\\(?:==\\)\\|[!=]\\)")
;;                (35 . ".\\(?:[(?[_{]\\)")
;;                (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
;;                (42 . ".\\(?:\\(?:\\*\\*\\)\\|[*/]\\)")
;;                (43 . ".\\(?:\\(?:\\+\\+\\)\\|\\+\\)")
;;                (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
;; ;;               (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=]\\)")
;;                (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
;;                (58 . ".\\(?:[:=]\\)")
;;                (59 . ".\\(?:;\\)")
;;                (60 . ".\\(?:\\(?:!--\\)\\|\\(?:\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[/<=>|-]\\)")
;;                (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
;;                (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
;;                (63 . ".\\(?:[:=?]\\)")
;;                (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
;;                (94 . ".\\(?:=\\)")
;;                (123 . ".\\(?:-\\)")
;;                (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
;;                (126 . ".\\(?:[=@~-]\\)")
;;              )
;;       ))
;; (dolist (char-regexp alist)
;;   (set-char-table-range composition-function-table (car char-regexp)
;;                         `([,(cdr char-regexp) 0 font-shape-gstring]))))



;; school
(load "~/.emacs.d/std.el")
(load "~/.emacs.d/std_comment.el")
(load "~/.emacs.d/yaml-mode.el")
(load-file "~/.emacs.d/plugins/highlight-current-line.el")
(load "~/.emacs.d/plugins/flymake.el")

;; Go
(load-file "~/.emacs.d/go-mode-load.el")
(load-file "~/.emacs.d/go-mode.el")

(add-to-list 'load-path "~/.emacs.d/plugins/")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins//ac-dict")
(ac-config-default)
(require 'yasnippet-bundle)
(require 'highlight-current-line)

;; Bind alt pour aller de fenetres en fenetres
(windmove-default-keybindings 'meta)

;; highlight la parenthese correspondante
(show-paren-mode t)

;; Utlise ido pour la gestion du minibuffer
(ido-mode 1)

;; Bind shift-tab pour Yas/expand
(global-set-key [backtab] 'yas/expand)

;; Empeche laffichage du menu en haut de fenetre
; ...

;; yes > y | no > n
(fset 'yes-or-no-p 'y-or-n-p)

;; Enleve les espaces en trop dans les fichier c et c++
(add-hook 'c++-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))
(add-hook   'c-mode-hook '(lambda ()
  (add-hook 'write-contents-hooks 'delete-trailing-whitespace nil t)))

;; Lancer le man
(defun vectra-man-on-word ()
  "Appelle le man sur le mot pointe par le curseur"
  (interactive)
  (manual-entry (current-word)))
(global-set-key [f3] 'vectra-man-on-word)

;; Highligh la ligne courante
(highlight-current-line-on t)
(set-face-background 'highlight-current-line-face "#000")

;; Count lines
;; (require 'linum+)
;; (global-linum-mode 1)
;; (custom-set-faces '(linum ((t (:inherit (shadow default) :background "black" :foreground "white")))))
;; (setq linum-disabled-modes-list '(eshell-mode wl-summary-mode compilation-mode))
;; (defun linum-on ()
;;   (unless (or (minibufferp) (member major-mode linum-disabled-modes-list))
;;     (linum-mode 1)))

;; Affiche les espaces en fin de ligne
(setq-default indicate-empty-lines t)
(setq-default show-trailing-whitespace t)

;; Hack de la coloration syntaxique
(set-face-underline-p  'font-lock-type-face t)
;;(set-face-background   'show-paren-match "yellow") a changer pour la couleur

;; Empeche le menu de safficher
(menu-bar-mode -1)

;; Affiche la colonne du curseur
(column-number-mode 1)

;; bind auto-indentation
(defun indent-buffer ()
    (interactive)
    (save-excursion (indent-region (point-min) (point-max) nil))
)
(global-set-key [f2] 'indent-buffer)

;; Hack du mode css pour une meilleur indentation
(setq cssm-indent-level 4)
(setq cssm-newline-before-closing-bracket t)
(setq cssm-indent-function #'cssm-c-style-indenter)
(setq cssm-mirror-mode nil)

;; active le mode cperl pour les fichier perl
(defalias 'perl-mode 'cperl-mode)
(setq cperl-hairy t)

;; Electric buffer
(global-set-key "\C-x\C-b" 'electric-buffer-list)

;; f9 compil
(global-set-key [f9] 'compile)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
  )
