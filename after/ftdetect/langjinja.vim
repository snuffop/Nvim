au BufNewFile,BufRead *.c.jinja2,*.c.j2,*.h.jinja2,*.h.j2 setf cjinja
au BufNewFile,BufRead *.cpp.jinja2,*.cpp.j2,*.cc.jinja2,*.cc.j2,*.cxx.jinja2,*.cxx.j2,*.C.jinja2,*.C.j2,*.hh.jinja2,*.hh.j2,*.hpp.jinja2,*.hpp.j2,*.hxx.jinja2,*.hxx.j2,*.H.jinja2,*.H.j2 setf cppjinja
au BufNewFile,BufRead *.cs.jinja2,*.cs.j2 setf csjinja
au BufNewFile,BufRead *.go.jinja2,*.go.j2 setf gojinja
au BufNewFile,BufRead *.hs.jinja2,*.hs.j2,*.hsc.jinja2,*.hsc.j2 setf haskelljinja
au BufNewFile,BufRead *.java.jinja2,*.java.j2 setf javajinja
au BufNewFile,BufRead *.js.jinja2,*.js.j2 setf javascriptjinja
au BufNewFile,BufRead *.lua.jinja2,*.lua.j2 setf luajinja
au BufNewFile,BufRead *.ml.jinja2,*.ml.j2,*.mli.jinja2,*.mli.j2 setf ocamljinja
au BufNewFile,BufRead *.pas.jinja2,*.pas.j2 setf pascaljinja
au BufNewFile,BufRead *.php.jinja2,*.php.j2 setf phpjinja
au BufNewFile,BufRead *.pl.jinja2,*.pl.j2 setf perljinja
au BufNewFile,BufRead *.pro.jinja2,*.pro.j2 setf prologjinja
au BufNewFile,BufRead *.py.jinja2,*.py.j2 setf python.jinja2
au BufNewFile,BufRead *.rb.jinja2,*.rb.j2 setf rubyjinja
au BufNewFile,BufRead *.rs.jinja2,*.rs.j2 setf rustjinja
au BufNewFile,BufRead *.service.jinja2,*.service.j2 setf systemdjinja
au BufNewFile,BufRead *.sh.jinja2,*.sh.j2 setf shjinja
au BufNewFile,BufRead *.sql.jinja2,*.sql.j2 setf sqljinja
au BufNewFile,BufRead *.yml.jinja2,*.yml.j2,*.yaml.j2 setf yamljinja
au BufNewFile,BufRead Makefile*.jinja2,Makefile*.j2,*.mk.jinja2,*.mk.j2 setf makejinja
au BufNewFile,BufRead *.cfg.j2 setf nagios.jinja2
" au BufNewFile,BufRead *.cfg.jinja2,*.cfg.j2,*.conf.j2 setf confjinja

au BufNewFile,BufRead hosts setf dosini