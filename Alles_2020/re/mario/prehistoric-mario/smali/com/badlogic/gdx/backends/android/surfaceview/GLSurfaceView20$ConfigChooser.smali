.class Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;
.super Ljava/lang/Object;
.source "GLSurfaceView20.java"

# interfaces
.implements Landroid/opengl/GLSurfaceView$EGLConfigChooser;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ConfigChooser"
.end annotation


# static fields
.field private static EGL_OPENGL_ES2_BIT:I = 0x4

.field private static s_configAttribs2:[I


# instance fields
.field protected mAlphaSize:I

.field protected mBlueSize:I

.field protected mDepthSize:I

.field protected mGreenSize:I

.field protected mRedSize:I

.field protected mStencilSize:I

.field private mValue:[I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const/16 v0, 0x9

    .line 187
    new-array v0, v0, [I

    const/4 v1, 0x0

    const/16 v2, 0x3024

    aput v2, v0, v1

    const/4 v1, 0x4

    const/4 v2, 0x1

    aput v1, v0, v2

    const/4 v2, 0x2

    const/16 v3, 0x3023

    aput v3, v0, v2

    const/4 v2, 0x3

    aput v1, v0, v2

    const/16 v2, 0x3022

    aput v2, v0, v1

    const/4 v2, 0x5

    aput v1, v0, v2

    const/4 v1, 0x6

    const/16 v2, 0x3040

    aput v2, v0, v1

    sget v1, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->EGL_OPENGL_ES2_BIT:I

    const/4 v2, 0x7

    aput v1, v0, v2

    const/16 v1, 0x8

    const/16 v2, 0x3038

    aput v2, v0, v1

    sput-object v0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->s_configAttribs2:[I

    return-void
.end method

.method public constructor <init>(IIIIII)V
    .locals 1

    .line 173
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 296
    new-array v0, v0, [I

    iput-object v0, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mValue:[I

    .line 174
    iput p1, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mRedSize:I

    .line 175
    iput p2, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mGreenSize:I

    .line 176
    iput p3, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mBlueSize:I

    .line 177
    iput p4, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mAlphaSize:I

    .line 178
    iput p5, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mDepthSize:I

    .line 179
    iput p6, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mStencilSize:I

    return-void
.end method

.method private findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I
    .locals 1

    .line 240
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mValue:[I

    invoke-interface {p1, p2, p3, p4, v0}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 241
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mValue:[I

    const/4 p2, 0x0

    aget p1, p1, p2

    return p1

    :cond_0
    return p5
.end method

.method private printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 10

    const/16 v0, 0x21

    .line 256
    new-array v1, v0, [I

    fill-array-data v1, :array_0

    .line 268
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

    .line 275
    new-array v5, v3, [I

    const/4 v6, 0x0

    .line 276
    :goto_0
    array-length v7, v1

    if-ge v6, v7, :cond_2

    .line 277
    aget v7, v1, v6

    .line 278
    aget-object v8, v0, v6

    .line 279
    invoke-interface {p1, p2, p3, v7, v5}, Ljavax/microedition/khronos/egl/EGL10;->eglGetConfigAttrib(Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 280
    sget-object v7, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20;->TAG:Ljava/lang/String;

    new-array v9, v4, [Ljava/lang/Object;

    aput-object v8, v9, v2

    aget v8, v5, v2

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v9, v3

    const-string v8, "  %s: %d\n"

    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 283
    :cond_0
    :goto_1
    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v7

    const/16 v8, 0x3000

    if-eq v7, v8, :cond_1

    goto :goto_1

    :cond_1
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    :cond_2
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
    .end array-data
.end method

.method private printConfigs(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)V
    .locals 7

    .line 247
    array-length v0, p3

    .line 248
    sget-object v1, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20;->TAG:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "%d configurations"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 250
    sget-object v3, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20;->TAG:Ljava/lang/String;

    new-array v4, v2, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v5

    const-string v6, "Configuration %d:\n"

    invoke-static {v6, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 251
    aget-object v3, p3, v1

    invoke-direct {p0, p1, p2, v3}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->printConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 8

    const/4 v0, 0x1

    .line 195
    new-array v0, v0, [I

    .line 196
    sget-object v3, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->s_configAttribs2:[I

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v6, v0

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    const/4 v1, 0x0

    .line 198
    aget v5, v0, v1

    if-lez v5, :cond_0

    .line 207
    new-array v7, v5, [Ljavax/microedition/khronos/egl/EGLConfig;

    .line 208
    sget-object v3, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->s_configAttribs2:[I

    move-object v1, p1

    move-object v2, p2

    move-object v4, v7

    move-object v6, v0

    invoke-interface/range {v1 .. v6}, Ljavax/microedition/khronos/egl/EGL10;->eglChooseConfig(Ljavax/microedition/khronos/egl/EGLDisplay;[I[Ljavax/microedition/khronos/egl/EGLConfig;I[I)Z

    .line 216
    invoke-virtual {p0, p1, p2, v7}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;

    move-result-object p1

    return-object p1

    .line 201
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "No configs match configSpec"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public chooseConfig(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;[Ljavax/microedition/khronos/egl/EGLConfig;)Ljavax/microedition/khronos/egl/EGLConfig;
    .locals 12

    .line 220
    array-length v0, p3

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    aget-object v8, p3, v1

    const/16 v6, 0x3025

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, v8

    .line 221
    invoke-direct/range {v2 .. v7}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v9

    const/16 v6, 0x3026

    .line 222
    invoke-direct/range {v2 .. v7}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v2

    .line 225
    iget v3, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mDepthSize:I

    if-lt v9, v3, :cond_1

    iget v3, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mStencilSize:I

    if-ge v2, v3, :cond_0

    goto :goto_1

    :cond_0
    const/16 v6, 0x3024

    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, v8

    .line 228
    invoke-direct/range {v2 .. v7}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v9

    const/16 v6, 0x3023

    .line 229
    invoke-direct/range {v2 .. v7}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v10

    const/16 v6, 0x3022

    .line 230
    invoke-direct/range {v2 .. v7}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v11

    const/16 v6, 0x3021

    .line 231
    invoke-direct/range {v2 .. v7}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->findConfigAttrib(Ljavax/microedition/khronos/egl/EGL10;Ljavax/microedition/khronos/egl/EGLDisplay;Ljavax/microedition/khronos/egl/EGLConfig;II)I

    move-result v2

    .line 233
    iget v3, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mRedSize:I

    if-ne v9, v3, :cond_1

    iget v3, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mGreenSize:I

    if-ne v10, v3, :cond_1

    iget v3, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mBlueSize:I

    if-ne v11, v3, :cond_1

    iget v3, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20$ConfigChooser;->mAlphaSize:I

    if-ne v2, v3, :cond_1

    return-object v8

    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method
