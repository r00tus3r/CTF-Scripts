.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeBuild;
.super Ljava/lang/Object;
.source "FreetypeBuild.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static main([Ljava/lang/String;)V
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    const/4 v0, 0x1

    .line 28
    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "freetype-2.5.5/include"

    aput-object v3, v1, v2

    const/16 v3, 0x2c

    .line 29
    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "freetype-2.5.5/src/base/ftsystem.c"

    aput-object v4, v3, v2

    const-string v4, "freetype-2.5.5/src/base/ftinit.c"

    aput-object v4, v3, v0

    const/4 v4, 0x2

    const-string v5, "freetype-2.5.5/src/base/ftdebug.c"

    aput-object v5, v3, v4

    const/4 v5, 0x3

    const-string v6, "freetype-2.5.5/src/base/ftbase.c"

    aput-object v6, v3, v5

    const/4 v6, 0x4

    const-string v7, "freetype-2.5.5/src/base/ftbbox.c"

    aput-object v7, v3, v6

    const/4 v7, 0x5

    const-string v8, "freetype-2.5.5/src/base/ftglyph.c"

    aput-object v8, v3, v7

    const/4 v8, 0x6

    const-string v9, "freetype-2.5.5/src/base/ftbdf.c"

    aput-object v9, v3, v8

    const/4 v9, 0x7

    const-string v10, "freetype-2.5.5/src/base/ftbitmap.c"

    aput-object v10, v3, v9

    const/16 v10, 0x8

    const-string v11, "freetype-2.5.5/src/base/ftcid.c"

    aput-object v11, v3, v10

    const/16 v11, 0x9

    const-string v12, "freetype-2.5.5/src/base/ftfstype.c"

    aput-object v12, v3, v11

    const/16 v12, 0xa

    const-string v13, "freetype-2.5.5/src/base/ftgasp.c"

    aput-object v13, v3, v12

    const/16 v12, 0xb

    const-string v13, "freetype-2.5.5/src/base/ftgxval.c"

    aput-object v13, v3, v12

    const/16 v12, 0xc

    const-string v13, "freetype-2.5.5/src/base/ftlcdfil.c"

    aput-object v13, v3, v12

    const/16 v12, 0xd

    const-string v13, "freetype-2.5.5/src/base/ftmm.c"

    aput-object v13, v3, v12

    const/16 v12, 0xe

    const-string v13, "freetype-2.5.5/src/base/ftotval.c"

    aput-object v13, v3, v12

    const/16 v12, 0xf

    const-string v13, "freetype-2.5.5/src/base/ftpatent.c"

    aput-object v13, v3, v12

    const/16 v12, 0x10

    const-string v13, "freetype-2.5.5/src/base/ftpfr.c"

    aput-object v13, v3, v12

    const/16 v12, 0x11

    const-string v13, "freetype-2.5.5/src/base/ftstroke.c"

    aput-object v13, v3, v12

    const/16 v12, 0x12

    const-string v13, "freetype-2.5.5/src/base/ftsynth.c"

    aput-object v13, v3, v12

    const/16 v12, 0x13

    const-string v13, "freetype-2.5.5/src/base/fttype1.c"

    aput-object v13, v3, v12

    const/16 v12, 0x14

    const-string v13, "freetype-2.5.5/src/base/ftwinfnt.c"

    aput-object v13, v3, v12

    const/16 v12, 0x15

    const-string v13, "freetype-2.5.5/src/base/ftxf86.c"

    aput-object v13, v3, v12

    const/16 v12, 0x16

    const-string v13, "freetype-2.5.5/src/bdf/bdf.c"

    aput-object v13, v3, v12

    const/16 v12, 0x17

    const-string v13, "freetype-2.5.5/src/cff/cff.c"

    aput-object v13, v3, v12

    const/16 v12, 0x18

    const-string v13, "freetype-2.5.5/src/cid/type1cid.c"

    aput-object v13, v3, v12

    const/16 v12, 0x19

    const-string v13, "freetype-2.5.5/src/pcf/pcf.c"

    aput-object v13, v3, v12

    const/16 v12, 0x1a

    const-string v13, "freetype-2.5.5/src/pfr/pfr.c"

    aput-object v13, v3, v12

    const/16 v12, 0x1b

    const-string v13, "freetype-2.5.5/src/sfnt/sfnt.c"

    aput-object v13, v3, v12

    const/16 v12, 0x1c

    const-string v13, "freetype-2.5.5/src/truetype/truetype.c"

    aput-object v13, v3, v12

    const/16 v12, 0x1d

    const-string v13, "freetype-2.5.5/src/type1/type1.c"

    aput-object v13, v3, v12

    const/16 v12, 0x1e

    const-string v13, "freetype-2.5.5/src/type42/type42.c"

    aput-object v13, v3, v12

    const/16 v12, 0x1f

    const-string v13, "freetype-2.5.5/src/winfonts/winfnt.c"

    aput-object v13, v3, v12

    const/16 v12, 0x20

    const-string v13, "freetype-2.5.5/src/raster/raster.c"

    aput-object v13, v3, v12

    const/16 v12, 0x21

    const-string v13, "freetype-2.5.5/src/smooth/smooth.c"

    aput-object v13, v3, v12

    const/16 v12, 0x22

    const-string v13, "freetype-2.5.5/src/autofit/autofit.c"

    aput-object v13, v3, v12

    const/16 v12, 0x23

    const-string v13, "freetype-2.5.5/src/cache/ftcache.c"

    aput-object v13, v3, v12

    const/16 v12, 0x24

    const-string v13, "freetype-2.5.5/src/gzip/ftgzip.c"

    aput-object v13, v3, v12

    const/16 v12, 0x25

    const-string v13, "freetype-2.5.5/src/lzw/ftlzw.c"

    aput-object v13, v3, v12

    const/16 v12, 0x26

    const-string v13, "freetype-2.5.5/src/bzip2/ftbzip2.c"

    aput-object v13, v3, v12

    const/16 v12, 0x27

    const-string v13, "freetype-2.5.5/src/gxvalid/gxvalid.c"

    aput-object v13, v3, v12

    const/16 v12, 0x28

    const-string v13, "freetype-2.5.5/src/otvalid/otvalid.c"

    aput-object v13, v3, v12

    const/16 v12, 0x29

    const-string v13, "freetype-2.5.5/src/psaux/psaux.c"

    aput-object v13, v3, v12

    const/16 v12, 0x2a

    const-string v13, "freetype-2.5.5/src/pshinter/pshinter.c"

    aput-object v13, v3, v12

    const/16 v12, 0x2b

    const-string v13, "freetype-2.5.5/src/psnames/psnames.c"

    aput-object v13, v3, v12

    .line 71
    sget-object v12, Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;->Windows:Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;

    invoke-static {v12, v2}, Lcom/badlogic/gdx/jnigen/BuildTarget;->newDefaultTarget(Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;Z)Lcom/badlogic/gdx/jnigen/BuildTarget;

    move-result-object v12

    const-string v13, ""

    .line 72
    iput-object v13, v12, Lcom/badlogic/gdx/jnigen/BuildTarget;->compilerPrefix:Ljava/lang/String;

    const-string v13, "build-windows32home.xml"

    .line 73
    iput-object v13, v12, Lcom/badlogic/gdx/jnigen/BuildTarget;->buildFileName:Ljava/lang/String;

    .line 74
    iput-boolean v0, v12, Lcom/badlogic/gdx/jnigen/BuildTarget;->excludeFromMasterBuildFile:Z

    .line 75
    iput-object v1, v12, Lcom/badlogic/gdx/jnigen/BuildTarget;->headerDirs:[Ljava/lang/String;

    .line 76
    iput-object v3, v12, Lcom/badlogic/gdx/jnigen/BuildTarget;->cIncludes:[Ljava/lang/String;

    .line 77
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v12, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, " -std=c99 -DFT2_BUILD_LIBRARY"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v12, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    .line 78
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v12, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    invoke-virtual {v13, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    iput-object v13, v12, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    .line 80
    sget-object v13, Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;->Windows:Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;

    invoke-static {v13, v2}, Lcom/badlogic/gdx/jnigen/BuildTarget;->newDefaultTarget(Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;Z)Lcom/badlogic/gdx/jnigen/BuildTarget;

    move-result-object v13

    .line 81
    iput-object v1, v13, Lcom/badlogic/gdx/jnigen/BuildTarget;->headerDirs:[Ljava/lang/String;

    .line 82
    iput-object v3, v13, Lcom/badlogic/gdx/jnigen/BuildTarget;->cIncludes:[Ljava/lang/String;

    .line 83
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, v13, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    invoke-virtual {v15, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v13, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    .line 84
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v13, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    invoke-virtual {v10, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    iput-object v10, v13, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    .line 86
    sget-object v10, Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;->Windows:Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;

    invoke-static {v10, v0}, Lcom/badlogic/gdx/jnigen/BuildTarget;->newDefaultTarget(Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;Z)Lcom/badlogic/gdx/jnigen/BuildTarget;

    move-result-object v10

    .line 87
    iput-object v1, v10, Lcom/badlogic/gdx/jnigen/BuildTarget;->headerDirs:[Ljava/lang/String;

    .line 88
    iput-object v3, v10, Lcom/badlogic/gdx/jnigen/BuildTarget;->cIncludes:[Ljava/lang/String;

    .line 89
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v10, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    invoke-virtual {v15, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v10, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    .line 90
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v10, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    iput-object v9, v10, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    .line 92
    sget-object v9, Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;->Linux:Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;

    invoke-static {v9, v2}, Lcom/badlogic/gdx/jnigen/BuildTarget;->newDefaultTarget(Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;Z)Lcom/badlogic/gdx/jnigen/BuildTarget;

    move-result-object v9

    .line 93
    iput-object v1, v9, Lcom/badlogic/gdx/jnigen/BuildTarget;->headerDirs:[Ljava/lang/String;

    .line 94
    iput-object v3, v9, Lcom/badlogic/gdx/jnigen/BuildTarget;->cIncludes:[Ljava/lang/String;

    .line 95
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, v9, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    invoke-virtual {v15, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v9, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    .line 96
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v9, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    invoke-virtual {v8, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    iput-object v8, v9, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    .line 98
    sget-object v8, Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;->Linux:Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;

    invoke-static {v8, v0}, Lcom/badlogic/gdx/jnigen/BuildTarget;->newDefaultTarget(Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;Z)Lcom/badlogic/gdx/jnigen/BuildTarget;

    move-result-object v8

    .line 99
    iput-object v1, v8, Lcom/badlogic/gdx/jnigen/BuildTarget;->headerDirs:[Ljava/lang/String;

    .line 100
    iput-object v3, v8, Lcom/badlogic/gdx/jnigen/BuildTarget;->cIncludes:[Ljava/lang/String;

    .line 101
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, v8, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    invoke-virtual {v15, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v8, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    .line 102
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v8, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v8, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    .line 104
    sget-object v7, Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;->MacOsX:Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;

    invoke-static {v7, v2}, Lcom/badlogic/gdx/jnigen/BuildTarget;->newDefaultTarget(Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;Z)Lcom/badlogic/gdx/jnigen/BuildTarget;

    move-result-object v7

    .line 105
    iput-object v1, v7, Lcom/badlogic/gdx/jnigen/BuildTarget;->headerDirs:[Ljava/lang/String;

    .line 106
    iput-object v3, v7, Lcom/badlogic/gdx/jnigen/BuildTarget;->cIncludes:[Ljava/lang/String;

    .line 107
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v6, v7, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " -DFT2_BUILD_LIBRARY"

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    iput-object v15, v7, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    .line 108
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v5, v7, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v7, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    .line 109
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v7, Lcom/badlogic/gdx/jnigen/BuildTarget;->linkerFlags:Ljava/lang/String;

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, " -framework CoreServices -framework Carbon"

    invoke-virtual {v5, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v7, Lcom/badlogic/gdx/jnigen/BuildTarget;->linkerFlags:Ljava/lang/String;

    .line 111
    sget-object v5, Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;->MacOsX:Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;

    invoke-static {v5, v0}, Lcom/badlogic/gdx/jnigen/BuildTarget;->newDefaultTarget(Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;Z)Lcom/badlogic/gdx/jnigen/BuildTarget;

    move-result-object v5

    .line 112
    iput-object v1, v5, Lcom/badlogic/gdx/jnigen/BuildTarget;->headerDirs:[Ljava/lang/String;

    .line 113
    iput-object v3, v5, Lcom/badlogic/gdx/jnigen/BuildTarget;->cIncludes:[Ljava/lang/String;

    .line 114
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v5, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v5, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v5, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v5, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    .line 116
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v5, Lcom/badlogic/gdx/jnigen/BuildTarget;->linkerFlags:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, v5, Lcom/badlogic/gdx/jnigen/BuildTarget;->linkerFlags:Ljava/lang/String;

    .line 118
    sget-object v0, Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;->Android:Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;

    invoke-static {v0, v2}, Lcom/badlogic/gdx/jnigen/BuildTarget;->newDefaultTarget(Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;Z)Lcom/badlogic/gdx/jnigen/BuildTarget;

    move-result-object v0

    .line 119
    iput-object v1, v0, Lcom/badlogic/gdx/jnigen/BuildTarget;->headerDirs:[Ljava/lang/String;

    .line 120
    iput-object v3, v0, Lcom/badlogic/gdx/jnigen/BuildTarget;->cIncludes:[Ljava/lang/String;

    .line 121
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v0, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    .line 122
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v0, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    .line 124
    sget-object v4, Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;->IOS:Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;

    invoke-static {v4, v2}, Lcom/badlogic/gdx/jnigen/BuildTarget;->newDefaultTarget(Lcom/badlogic/gdx/jnigen/BuildTarget$TargetOs;Z)Lcom/badlogic/gdx/jnigen/BuildTarget;

    move-result-object v4

    .line 125
    iput-object v1, v4, Lcom/badlogic/gdx/jnigen/BuildTarget;->headerDirs:[Ljava/lang/String;

    .line 126
    iput-object v3, v4, Lcom/badlogic/gdx/jnigen/BuildTarget;->cIncludes:[Ljava/lang/String;

    .line 127
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v4, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v4, Lcom/badlogic/gdx/jnigen/BuildTarget;->cFlags:Ljava/lang/String;

    .line 128
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, v4, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v4, Lcom/badlogic/gdx/jnigen/BuildTarget;->cppFlags:Ljava/lang/String;

    .line 130
    new-instance v1, Lcom/badlogic/gdx/jnigen/NativeCodeGenerator;

    invoke-direct {v1}, Lcom/badlogic/gdx/jnigen/NativeCodeGenerator;-><init>()V

    invoke-virtual {v1}, Lcom/badlogic/gdx/jnigen/NativeCodeGenerator;->generate()V

    .line 131
    new-instance v1, Lcom/badlogic/gdx/jnigen/AntScriptGenerator;

    invoke-direct {v1}, Lcom/badlogic/gdx/jnigen/AntScriptGenerator;-><init>()V

    new-instance v3, Lcom/badlogic/gdx/jnigen/BuildConfig;

    const-string v6, "gdx-freetype"

    invoke-direct {v3, v6}, Lcom/badlogic/gdx/jnigen/BuildConfig;-><init>(Ljava/lang/String;)V

    new-array v6, v11, [Lcom/badlogic/gdx/jnigen/BuildTarget;

    aput-object v12, v6, v2

    const/4 v2, 0x1

    aput-object v13, v6, v2

    const/4 v2, 0x2

    aput-object v10, v6, v2

    const/4 v2, 0x3

    aput-object v9, v6, v2

    const/4 v2, 0x4

    aput-object v8, v6, v2

    const/4 v2, 0x5

    aput-object v7, v6, v2

    const/4 v2, 0x6

    aput-object v5, v6, v2

    const/4 v2, 0x7

    aput-object v0, v6, v2

    const/16 v0, 0x8

    aput-object v4, v6, v0

    invoke-virtual {v1, v3, v6}, Lcom/badlogic/gdx/jnigen/AntScriptGenerator;->generate(Lcom/badlogic/gdx/jnigen/BuildConfig;[Lcom/badlogic/gdx/jnigen/BuildTarget;)V

    return-void
.end method
