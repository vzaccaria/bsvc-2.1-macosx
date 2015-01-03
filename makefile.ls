#!/usr/bin/env lsc 

{ parse, add-plugin } = require('newmake')

parse ->

    @add-plugin 'gcc', (g, deps) ->
        @compile-files( (-> "clang   -c #{it.orig-complete} -o #{it.build-target}"), ".o", g, deps)

    @add-plugin 'gccLink', (files) ->
        @reduce-files( ("clang $^  -o $@"), "linkedc", "x", files)

    @add-plugin 'clangPre',(g, deps) ->
        @compile-files( (-> "clang++ -c -Isim68k-src/lib -Isim68k-src/lib/json11 -Isim68k-src -Isim68k-src/Framework -Isim68k-src/lib/docopt --std=c++11 -DUSE_STD --stdlib=libc++ #{it.orig-complete} -o #{it.build-target}"), ".o", g, deps )

    @add-plugin 'link', (files) ->
        @reduce-files( ("clang++ $^  -o $@"), "linked", "x", files)

    @collect "build", -> [

        @dest "./bin/sim68k", ->
            @link -> [
                         @clang-pre 'sim68k-src/lib/docopt/docopt.cpp'
                         @clang-pre 'sim68k-src/lib/json11/json11.cpp'
                         @clang-pre 'sim68k-src/cpu/*.cxx', 'sim68k-src/cpu/*.hxx'
                         @clang-pre 'sim68k-src/devices/*.cxx'
                         @clang-pre 'sim68k-src/loader/*.cxx'
                         @clang-pre 'sim68k-src/src/*.cxx'
                         @clang-pre 'sim68k-src/Framework/*.cxx', 'sim68k-src/Framework/*.hxx'
                         ]

        @dest "./bin/asm68k", -> 
            @link -> [
                @gcc 'asm68k-src/*.c'                           , '**/*.h*'
                @clang-pre 'asm68k-src/*.cxx'                   , '**/*.h*'
                @clang-pre 'sim68k-src/lib/docopt/docopt.cpp'   , '**/*.h*'
                @clang-pre 'sim68k-src/lib/json11/json11.cpp'   , '**/*.h*'
                ]


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

