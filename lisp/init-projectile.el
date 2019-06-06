;;; init-projectile.el --- Use Projectile for navigation within projects -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'projectile)
  (add-hook 'after-init-hook 'projectile-mode)

  ;; Shorter modeline
  (setq-default projectile-mode-line-prefix " Proj")
  (after-load 'projectile
    (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
    (projectile-register-project-type 'rails-rspec '("Gemfile" "app" "lib" "db" "config" "spec")
                                      :compile "bundle exec rails server"
                                      :src-dir "lib/"
                                      :test "bundle exec rspec"
                                      :test-dir "spec/"
                                      :test-suffix "_spec"))

  (maybe-require-package 'ibuffer-projectile))


(provide 'init-projectile)
;;; init-projectile.el ends here
