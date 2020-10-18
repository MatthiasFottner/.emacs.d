(setq user-full-name    "Matthias Fottner"
      user-mail-address "matthiasfottner97@gmail.com")

(if (string= system-type "windows-nt")
    (setq build-script-name "build.bat")
  (setq build-script-name "build.sh"))

(setq doc-view-ghostscript-program "gs")

(setq org-agenda-files '("~/org"))
