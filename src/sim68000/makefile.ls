#!/usr/bin/env lsc 

{ parse, add-plugin } = require('newmake')

parse ->

    @add-plugin 'clang',(g, deps) ->
        @process-files( (-> "clang++ -c --std=c++11 #{it.orig-complete} -o #{it.build-target}"), ".o", g, deps )

    @add-plugin 'clangPre',(g, deps) ->
        @compile-files( (-> "clang++ -E -I. -I../Framework -Ilib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ #{it.orig-complete} -o #{it.build-target}"), ".pre.cxx", g, deps )

    @add-plugin 'link', (files) ->
        @reduce-files( ("clang++ $^ ../Framework/libfw.a -o $@"), "linked", "x", files)

    @add-plugin 'derp', (g, deps) ->
        @process-files((-> "< #{it.orig-complete} derp - > #{it.build-target}"), ".post.cxx", g, deps)

    @collect "build", -> 
        @dest "./bin/frontend", ->
            @link ->  
                @clang -> 
                    @derp -> [
                         @clang-pre 'lib/docopt/docopt.cpp'
                         @clang-pre 'lib/json11/json11.cpp'
                         @clang-pre 'cpu/*.cxx'
                         @clang-pre 'devices/*.cxx'
                         @clang-pre 'loader/*.cxx'
                         @clang-pre 'src/*.cxx'
                         ]
        
    @collect "all", ->
        @command-seq -> [
            @make "build"
            ]

    @collect "clean", -> [
        @remove-all-targets()
        ]



        # @dest "./bin/frontend", -> 
        #         

