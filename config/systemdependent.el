(setq user-full-name    "Matthias Fottner"
      user-mail-address "matthiasfottner97@gmail.com")

(if (string= system-type "windows-nt")
    (setq build-script-name "build.bat")
  (setq build-script-name "build.sh"))

(setq doc-view-ghostscript-program "/usr/bin/gs")

(add-to-list 'exec-path "D:/Daten/Coding/Go/Library/bin/")

(setq org-reveal-root "file:///d:/Programme/revealjs/reveal.js-3.6.0/")
(setq company-clang-executable "c:/Languages/LLVM/bin/clang.exe")
(setq org-agenda-files '("~/org"))
