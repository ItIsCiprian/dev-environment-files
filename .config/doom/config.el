;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Load the theme
(setq doom-theme 'catppuccin-macchiato)

;; Ensure the Catppuccin theme package is loaded correctly
(after! catppuccin-theme
  (setq catppuccin-flavor 'macchiato) ;; Select the flavor
  (catppuccin-reload)) ;; Reload the theme with the selected flavor
