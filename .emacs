(modify-frame-parameters nil '((wait-for-wm . nil)))
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(global-font-lock-mode t nil (font-lock))
 '(inhibit-startup-screen t)
 '(load-home-init-file t t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(global-set-key (kbd "M-s") 'goto-line)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
;(setq default-frame-alist
;       (append default-frame-alist
;              '((background-color . "black")
;                (foreground-color . "ivory2")))) 
(set-face-foreground 'region "black")
(set-face-background 'highlight "CadetBlue")
(set-face-background 'secondary-selection "MediumSeaGreen") 

(custom-set-faces
'(default ((t (:foreground "Wheat" :background "DarkSlateGray"))))
'(list-mode-item-selected ((t (:background "gray68"))) t)
'(font-lock-comment-face ((t (:foreground "Coral"))))
'(font-lock-reference-face ((t (:foreground "DodgerBlue"))))
'(font-lock-string-face ((t (:foreground "LimeGreen"))))
'(font-lock-keyword-face ((t (:foreground "aquamarine"))))
'(show-paren-mismatch-face ((((class color)) (:foreground "white" :background "red"))))
'(isearch ((t (:foreground "black" :background "paleturquoise"))) t)
'(paren-match ((t (:background "darkseagreen4"))) t)
'(widget-field-face ((((class grayscale color) (background light)) (:background "DarkBlue"))))
'(font-lock-preprocessor-face ((t (:italic nil :foreground "CornFlowerBlue"))) t)
'(font-lock-type-face ((t (:foreground "#9290ff"))))
'(highlight ((t (:foreground "black" :background "darkseagreen2"))))
'(show-paren-match-face ((((class color)) (:foreground "black" :background "yellow"))))
'(font-lock-variable-name-face ((t (:foreground "Khaki"))))
'(font-lock-doc-string-face ((t (:foreground "green2"))) t)
'(font-lock-function-name-face ((t (:foreground "deepskyblue1")))))
;(set-default-font "-adobe-courier-medium-r-normal--12-120-75-75-m-70-iso10646-1")

(put 'scroll-left 'disabled nil)
; Autosave every 500 typed characters
(setq auto-save-interval 5000)
; Autosave after 5 seconds of idle time
(setq auto-save-timeout 600)

(defun the-the ()
  "Search forward for for a duplicated word."
  (interactive)
  (message "Searching for for duplicated words ...")
  (push-mark)
  ;; This regexp is not perfect
  ;; but is fairly good over all:
  (if (re-search-forward
       "\\b\\([^@ \n\t]+\\)[ \n\t]+\\1\\b" nil 'move)
      (message "Found duplicated word.")
    (message "End of buffer")))
;; Bind `the-the' to  C-c \
(global-set-key "\C-c\\" 'the-the)
(global-set-key (kbd "M-s") 'goto-line)

(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
(define-key my-keys-minor-mode-map (kbd "M-s") 'goto-line)
(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)
(my-keys-minor-mode 1)
