.class public Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;
.super Ljava/lang/Object;
.source "GdxEglConfigChooser.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$EGLConfigChooser;


# static fields
.field public static final EGL_COVERAGE_BUFFERS_NV:I = 0x30e0

.field public static final EGL_COVERAGE_SAMPLES_NV:I = 0x30e1

.field private static final EGL_OPENGL_ES2_BIT:I = 0x4

.field private static final TAG:Ljava/lang/String; = "GdxEglConfigChooser"


# instance fields
.field protected mAlphaSize:I

.field protected mBlueSize:I

.field protected final mConfigAttribs:[I

.field protected mDepthSize:I

.field protected mGreenSize:I

.field protected mNumSamples:I

.field protected mRedSize:I

.field protected mStencilSize:I

.field private mValue:[I


# direct methods
.method public constructor <init>(IIIIIII)V
    .locals 1

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 41
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mValue:[I

    .line 44
    iput p1, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mRedSize:I

    .line 45
    iput p2, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mGreenSize:I

    .line 46
    iput p3, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mBlueSize:I

    .line 47
    iput p4, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mAlphaSize:I

    .line 48
    iput p5, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mDepthSize:I

    .line 49
    iput p6, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mStencilSize:I

    .line 50
    iput p7, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mNumSamples:I

    const/16 p1, 0x9

    .line 52
    new-array p1, p1, [I

    fill-array-data p1, :array_0

    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mConfigAttribs:[I

    return-void

    :array_0
    .array-data 4
        0x3024
        0x4
        0x3023
        0x4
        0x3022
        0x4
        0x3040
        0x4
        0x3038
    .end array-data
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 1

    .line 150
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mValue:[I

    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 151
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mValue:[I

    const/4 p2, 0x0

    aget p1, p1, p2

    return p1

    :cond_0
    return p5
.end method

.method private printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 9

    const/16 v0, 0x23

    .line 166
    new-array v1, v0, [I

    fill-array-data v1, :array_0

    .line 180
    new-array v0, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "EGL_BUFFER_SIZE"

    aput-object v3, v0, v2

    const/4 v3, 0x1

    const-string v4, "EGL_ALPHA_SIZE"

    aput-object v4, v0, v3

    const/4 v4, 0x2

    const-string v5, "EGL_BLUE_SIZE"

    aput-object v5, v0, v4

    const/4 v5, 0x3

    const-string v6, "EGL_GREEN_SIZE"

    aput-object v6, v0, v5

    const/4 v5, 0x4

    const-string v6, "EGL_RED_SIZE"

    aput-object v6, v0, v5

    const/4 v5, 0x5

    const-string v6, "EGL_DEPTH_SIZE"

    aput-object v6, v0, v5

    const/4 v5, 0x6

    const-string v6, "EGL_STENCIL_SIZE"

    aput-object v6, v0, v5

    const/4 v5, 0x7

    const-string v6, "EGL_CONFIG_CAVEAT"

    aput-object v6, v0, v5

    const/16 v5, 0x8

    const-string v6, "EGL_CONFIG_ID"

    aput-object v6, v0, v5

    const/16 v5, 0x9

    const-string v6, "EGL_LEVEL"

    aput-object v6, v0, v5

    const/16 v5, 0xa

    const-string v6, "EGL_MAX_PBUFFER_HEIGHT"

    aput-object v6, v0, v5

    const/16 v5, 0xb

    const-string v6, "EGL_MAX_PBUFFER_PIXELS"

    aput-object v6, v0, v5

    const/16 v5, 0xc

    const-string v6, "EGL_MAX_PBUFFER_WIDTH"

    aput-object v6, v0, v5

    const/16 v5, 0xd

    const-string v6, "EGL_NATIVE_RENDERABLE"

    aput-object v6, v0, v5

    const/16 v5, 0xe

    const-string v6, "EGL_NATIVE_VISUAL_ID"

    aput-object v6, v0, v5

    const/16 v5, 0xf

    const-string v6, "EGL_NATIVE_VISUAL_TYPE"

    aput-object v6, v0, v5

    const/16 v5, 0x10

    const-string v6, "EGL_PRESERVED_RESOURCES"

    aput-object v6, v0, v5

    const/16 v5, 0x11

    const-string v6, "EGL_SAMPLES"

    aput-object v6, v0, v5

    const/16 v5, 0x12

    const-string v6, "EGL_SAMPLE_BUFFERS"

    aput-object v6, v0, v5

    const/16 v5, 0x13

    const-string v6, "EGL_SURFACE_TYPE"

    aput-object v6, v0, v5

    const/16 v5, 0x14

    const-string v6, "EGL_TRANSPARENT_TYPE"

    aput-object v6, v0, v5

    const/16 v5, 0x15

    const-string v6, "EGL_TRANSPARENT_RED_VALUE"

    aput-object v6, v0, v5

    const/16 v5, 0x16

    const-string v6, "EGL_TRANSPARENT_GREEN_VALUE"

    aput-object v6, v0, v5

    const/16 v5, 0x17

    const-string v6, "EGL_TRANSPARENT_BLUE_VALUE"

    aput-object v6, v0, v5

    const/16 v5, 0x18

    const-string v6, "EGL_BIND_TO_TEXTURE_RGB"

    aput-object v6, v0, v5

    const/16 v5, 0x19

    const-string v6, "EGL_BIND_TO_TEXTURE_RGBA"

    aput-object v6, v0, v5

    const/16 v5, 0x1a

    const-string v6, "EGL_MIN_SWAP_INTERVAL"

    aput-object v6, v0, v5

    const/16 v5, 0x1b

    const-string v6, "EGL_MAX_SWAP_INTERVAL"

    aput-object v6, v0, v5

    const/16 v5, 0x1c

    const-string v6, "EGL_LUMINANCE_SIZE"

    aput-object v6, v0, v5

    const/16 v5, 0x1d

    const-string v6, "EGL_ALPHA_MASK_SIZE"

    aput-object v6, v0, v5

    const/16 v5, 0x1e

    const-string v6, "EGL_COLOR_BUFFER_TYPE"

    aput-object v6, v0, v5

    const/16 v5, 0x1f

    const-string v6, "EGL_RENDERABLE_TYPE"

    aput-object v6, v0, v5

    const/16 v5, 0x20

    const-string v6, "EGL_CONFORMANT"

    aput-object v6, v0, v5

    const/16 v5, 0x21

    const-string v6, "EGL_COVERAGE_BUFFERS_NV"

    aput-object v6, v0, v5

    const/16 v5, 0x22

    const-string v6, "EGL_COVERAGE_SAMPLES_NV"

    aput-object v6, v0, v5

    .line 188
    new-array v5, v3, [I

    const/4 v6, 0x0

    .line 189
    :goto_0
    array-length v7, v1

    if-ge v6, v7, :cond_1

    .line 190
    aget v7, v1, v6

    .line 191
    aget-object v8, v0, v6

    .line 192
    invoke-interface {p1, p2, p3, v7, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 193
    new-array v7, v4, [Ljava/lang/Object;

    aput-object v8, v7, v2

    aget v8, v5, v2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    const-string v8, "  %s: %d\n"

    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "GdxEglConfigChooser"

    invoke-static {v8, v7}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 196
    :cond_0
    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    :goto_1
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_1
    return-void

    :array_0
    .array-data 4
        0x3020
        0x3021
        0x3022
        0x3023
        0x3024
        0x3025
        0x3026
        0x3027
        0x3028
        0x3029
        0x302a
        0x302b
        0x302c
        0x302d
        0x302e
        0x302f
        0x3030
        0x3031
        0x3032
        0x3033
        0x3034
        0x3037
        0x3036
        0x3035
        0x3039
        0x303a
        0x303b
        0x303c
        0x303d
        0x303e
        0x303f
        0x3040
        0x3042
        0x30e0
        0x30e1
    .end array-data
.end method

.method private printConfigs(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 7

    .line 157
    array-length v0, p3

    const/4 v1, 0x1

    .line 158
    new-array v2, v1, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "%d configurations"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "GdxEglConfigChooser"

    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    .line 160
    new-array v5, v1, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v4

    const-string v6, "Configuration %d:\n"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v3, v5}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    aget-object v5, p3, v2

    invoke-direct {p0, p1, p2, v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 8

    const/4 v0, 0x1

    .line 59
    new-array v0, v0, [I

    .line 60
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mConfigAttribs:[I

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v6, v0

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    const/4 v1, 0x0

    .line 61
    aget v5, v0, v1

    if-lez v5, :cond_0

    .line 68
    new-array v7, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 69
    iget-object v3, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mConfigAttribs:[I

    move-object v1, p1

    move-object v2, p2

    move-object v4, v7

    move-object v6, v0

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 75
    invoke-virtual {p0, p1, p2, v7}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object p1

    return-object p1

    .line 64
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "No configs match configSpec"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 19

    move-object/from16 v6, p0

    move-object/from16 v7, p3

    .line 87
    array-length v8, v7

    const/4 v0, 0x0

    const/4 v1, 0x0

    move-object v10, v0

    move-object v11, v10

    move-object v12, v11

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v8, :cond_7

    aget-object v13, v7, v9

    const/16 v4, 0x3025

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v13

    .line 88
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v14

    const/16 v4, 0x3026

    .line 89
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    .line 92
    iget v1, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mDepthSize:I

    if-lt v14, v1, :cond_6

    iget v1, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mStencilSize:I

    if-ge v0, v1, :cond_0

    goto/16 :goto_2

    :cond_0
    const/16 v4, 0x3024

    const/4 v5, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v13

    .line 95
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v14

    const/16 v4, 0x3023

    .line 96
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v15

    const/16 v4, 0x3022

    .line 97
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v5

    const/16 v4, 0x3021

    const/16 v16, 0x0

    move v7, v5

    move/from16 v5, v16

    .line 98
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v5

    if-nez v10, :cond_1

    const/4 v0, 0x5

    if-ne v14, v0, :cond_1

    const/4 v1, 0x6

    if-ne v15, v1, :cond_1

    if-ne v7, v0, :cond_1

    if-nez v5, :cond_1

    move-object v10, v13

    :cond_1
    if-nez v11, :cond_3

    .line 106
    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mRedSize:I

    if-ne v14, v0, :cond_3

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mGreenSize:I

    if-ne v15, v0, :cond_3

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mBlueSize:I

    if-ne v7, v0, :cond_3

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mAlphaSize:I

    if-ne v5, v0, :cond_3

    .line 110
    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mNumSamples:I

    if-nez v0, :cond_2

    goto/16 :goto_4

    :cond_2
    move-object v11, v13

    :cond_3
    const/16 v4, 0x3032

    const/16 v16, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v13

    move/from16 v17, v8

    move v8, v5

    move/from16 v5, v16

    .line 116
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v5

    const/16 v4, 0x3031

    move-object/from16 v18, v10

    move v10, v5

    move/from16 v5, v16

    .line 117
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    const/4 v5, 0x1

    if-nez v12, :cond_4

    if-ne v10, v5, :cond_4

    .line 120
    iget v1, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mNumSamples:I

    if-lt v0, v1, :cond_4

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mRedSize:I

    if-ne v14, v0, :cond_4

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mGreenSize:I

    if-ne v15, v0, :cond_4

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mBlueSize:I

    if-ne v7, v0, :cond_4

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mAlphaSize:I

    if-ne v8, v0, :cond_4

    move-object/from16 v16, v11

    goto :goto_1

    :cond_4
    const/16 v4, 0x30e0

    const/4 v10, 0x0

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object v3, v13

    move-object/from16 v16, v11

    const/4 v11, 0x1

    move v5, v10

    .line 130
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v10

    const/16 v4, 0x30e1

    const/4 v5, 0x0

    .line 131
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v0

    if-nez v12, :cond_5

    if-ne v10, v11, :cond_5

    .line 134
    iget v1, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mNumSamples:I

    if-lt v0, v1, :cond_5

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mRedSize:I

    if-ne v14, v0, :cond_5

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mGreenSize:I

    if-ne v15, v0, :cond_5

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mBlueSize:I

    if-ne v7, v0, :cond_5

    iget v0, v6, Lcom/badlogic/gdx/backends/android/surfaceview/GdxEglConfigChooser;->mAlphaSize:I

    if-ne v8, v0, :cond_5

    :goto_1
    move-object v12, v13

    :cond_5
    move-object/from16 v11, v16

    move-object/from16 v10, v18

    goto :goto_3

    :cond_6
    :goto_2
    move/from16 v17, v8

    :goto_3
    add-int/lit8 v9, v9, 0x1

    move-object/from16 v7, p3

    move/from16 v8, v17

    goto/16 :goto_0

    :cond_7
    move-object v13, v11

    :goto_4
    if-eqz v12, :cond_8

    return-object v12

    :cond_8
    if-eqz v13, :cond_9

    return-object v13

    :cond_9
    return-object v10
.end method
