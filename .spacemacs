;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(html
     javascript
     sql
     yaml

     (python :variables
             python-test-runner 'pytest
             python-backend 'lsp
             python-formatter 'black
             python-format-on-save nil
             :packages (not live-py-mode))
     (conda :variables
            conda-anaconda-home "/Users/daniel/miniconda3")
     markdown
     restructuredtext

     helm

     (auto-completion :variables
                      ;; auto-completion-enable-sort-by-usage t
                      spacemacs-default-company-backends '(company-files company-capf company-yasnippet)
                      ;; ((company-semantic company-dabbrev-code company-gtags company-etags company-keywords) company-files company-dabbrev)
                      auto-completion-return-key-behavior nil
                      auto-completion-idle-delay nil
                      auto-completion-tab-key-behavior nil
                      auto-completion-complete-with-key-sequence "C-y"
                      auto-completion-private-snippets-directory nil
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-enable-help-tooltip 'manual)

     better-defaults
     emacs-lisp
     git

     (org :variables
          org-enable-org-journal-support t
          org-enable-github-support t
          org-projectile-file "TODOs.org")

     (shell :variables
            shell-default-shell 'vterm
            shell-default-height 30
            shell-default-position 'bottom)

     spell-checking
     syntax-checking

     version-control
     )
   dotspacemacs-additional-packages '(
                                      dockerfile-mode
                                      cython-mode
                                      (python :location elpa :min-version "0.26.1")
                                      )
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-mode-line-theme 'spacemacs
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Code Pro for Powerline"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
    dotspacemacs-leader-key "SPC"
    dotspacemacs-emacs-command-key "SPC"
    dotspacemacs-ex-command-key ":"
    dotspacemacs-emacs-leader-key "M-m"
    dotspacemacs-major-mode-leader-key ","
    dotspacemacs-major-mode-emacs-leader-key (concat "C-" dotspacemacs-leader-key)
    dotspacemacs-distinguish-gui-tab nil
    dotspacemacs-remap-Y-to-y$ nil
    dotspacemacs-retain-visual-state-on-shift t
    dotspacemacs-visual-line-move-text nil
    dotspacemacs-ex-substitute-global nil
    dotspacemacs-default-layout-name "Default"
    dotspacemacs-display-default-layout nil
    dotspacemacs-auto-resume-layouts t
    dotspacemacs-large-file-size 5
    dotspacemacs-auto-save-file-location 'cache
    dotspacemacs-max-rollback-slots 5
    dotspacemacs-helm-resize nil
    dotspacemacs-helm-no-header nil
    dotspacemacs-helm-position 'bottom
    dotspacemacs-helm-use-fuzzy 'always
    dotspacemacs-enable-paste-transient-state nil
    dotspacemacs-which-key-delay 0.4
    dotspacemacs-which-key-position 'bottom
    dotspacemacs-loading-progress-bar t
    dotspacemacs-fullscreen-at-startup nil
    dotspacemacs-fullscreen-use-non-native nil
    dotspacemacs-maximized-at-startup nil
    dotspacemacs-active-transparency 100
    dotspacemacs-inactive-transparency 100
    dotspacemacs-show-transient-state-title t
    dotspacemacs-show-transient-state-color-guide t
    dotspacemacs-mode-line-unicode-symbols t
    dotspacemacs-smooth-scrolling t
    dotspacemacs-line-numbers '(:relative nil
                                :enabled-for-modes prog-mode
                                text-mode
                                :disabled-for-modes dired-mode
                                doc-view-mode
                                markdown-mode
                                pdf-view-mode
                                xwidget-webkit-mode
                                edebug-mode
                                debugger-mode
                                :size-limit-kb 1000)
    dotspacemacs-folding-method 'evil
    dotspacemacs-smartparens-strict-mode nil
    dotspacemacs-smart-closing-parenthesis nil
    dotspacemacs-highlight-delimiters 'all
    dotspacemacs-persistent-server nil
    dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
    dotspacemacs-default-package-repository nil
    dotspacemacs-whitespace-cleanup nil
    dotspacemacs-enable-server t
    dotspacemacs-persistent-server nil
    ))

  (defun dotspacemacs/user-init ()
    "Initialization function for user code.
  It is called immediately after `dotspacemacs/init', before layer configuration
  executes.
  This function is mostly useful for variables that need to be set
  before packages are loaded. If you are unsure, you should try in setting them in
  `dotspacemacs/user-config' first."

    (setq-default bidi-display-reordering nil)
    (setq debugger-stack-frame-as-list t)
    (setq edebug-print-circle t)
    (setq edebug-print-level 20)
    (setq print-circle t)

    (when (> emacs-major-version 26)
      (defalias 'ert--print-backtrace 'backtrace-to-string))
    )

  (defun dotspacemacs/user-config ()
    ;; (setenv "WORKON_HOME" "/Users/daniel/miniconda3/envs/")
    (setenv "WORKON_HOME" "/Users/daniel/venv3")
    (setq-default fill-column 80)
    (add-hook 'text-mode-hook 'turn-on-auto-fill)
    (add-hook 'prog-mode-hook 'display-line-numbers-mode)

    ;; disable flyspell in programming modes
    (dolist (hook '(prog-mode-hook))
      (add-hook hook (lambda () (flyspell-mode -1))))
    ;; (setenv "WORKON_HOME" (concat (getenv "CONDA_PREFIX") "/envs"))
    )

  ;; Do not write anything past this comment. This is where Emacs will
  ;; auto-generate custom variable definitions.
  
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help unfill smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit git-commit with-editor transient diff-hl company-statistics company-anaconda company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete yaml-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic mmm-mode markdown-toc markdown-mode gh-md ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(safe-local-variable-values (quote ((python-backend quote anaconda)))))
  
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (web-mode tagedit slim-mode scss-mode sass-mode pug-mode impatient-mode helm-css-scss haml-mode emmet-mode counsel-css counsel swiper ivy company-web web-completion-data add-node-modules-path xterm-color shell-pop multi-term eshell-z eshell-prompt-extras esh-help unfill smeargle orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download mwim magit-gitflow magit-popup htmlize helm-gitignore helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit git-commit with-editor transient diff-hl company-statistics company-anaconda company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete yaml-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode dash-functional helm-pydoc cython-mode anaconda-mode pythonic mmm-mode markdown-toc markdown-mode gh-md ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hydra lv hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation helm-themes helm-swoop helm-projectile projectile pkg-info epl helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist highlight evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(safe-local-variable-values (quote ((python-backend quote anaconda)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
)
