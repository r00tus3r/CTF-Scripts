.class public Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;
.super Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18;
.source "GLSurfaceView20API18.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$ConfigChooser;,
        Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$ContextFactory;
    }
.end annotation


# static fields
.field private static final DEBUG:Z = false

.field static TAG:Ljava/lang/String; = "GL2JNIView"


# instance fields
.field final resolutionStrategy:Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;)V
    .locals 0

    .line 51
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18;-><init>(Landroid/content/Context;)V

    .line 52
    iput-object p2, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->resolutionStrategy:Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;

    const/4 p1, 0x0

    const/16 p2, 0x10

    .line 53
    invoke-direct {p0, p1, p2, p1}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->init(ZII)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ZIILcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;)V
    .locals 0

    .line 57
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18;-><init>(Landroid/content/Context;)V

    .line 58
    iput-object p5, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->resolutionStrategy:Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;

    .line 59
    invoke-direct {p0, p2, p3, p4}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->init(ZII)V

    return-void
.end method

.method static checkEglError(Ljava/lang/String;Ljavax/microedition/khronos/egl/EGL10;)V
    .locals 4

    .line 151
    :goto_0
    invoke-interface {p1}, Ljavax/microedition/khronos/egl/EGL10;->eglGetError()I

    move-result v0

    const/16 v1, 0x3000

    if-eq v0, v1, :cond_0

    .line 152
    sget-object v1, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->TAG:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v2, v3

    const-string v0, "%s: EGL error: 0x%x"

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :cond_0
    return-void
.end method

.method private init(ZII)V
    .locals 14

    move-object v0, p0

    if-eqz p1, :cond_0

    .line 114
    invoke-virtual {p0}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v1

    const/4 v2, -0x3

    invoke-interface {v1, v2}, Landroid/view/SurfaceHolder;->setFormat(I)V

    .line 120
    :cond_0
    new-instance v1, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$ContextFactory;

    invoke-direct {v1}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$ContextFactory;-><init>()V

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->setEGLContextFactory(Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceViewAPI18$EGLContextFactory;)V

    if-eqz p1, :cond_1

    .line 126
    new-instance v1, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$ConfigChooser;

    const/16 v3, 0x8

    const/16 v4, 0x8

    const/16 v5, 0x8

    const/16 v6, 0x8

    move-object v2, v1

    move/from16 v7, p2

    move/from16 v8, p3

    invoke-direct/range {v2 .. v8}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$ConfigChooser;-><init>(IIIIII)V

    goto :goto_0

    :cond_1
    new-instance v1, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$ConfigChooser;

    const/4 v8, 0x5

    const/4 v9, 0x6

    const/4 v10, 0x5

    const/4 v11, 0x0

    move-object v7, v1

    move/from16 v12, p2

    move/from16 v13, p3

    invoke-direct/range {v7 .. v13}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$ConfigChooser;-><init>(IIIIII)V

    :goto_0
    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->setEGLConfigChooser(Landroid/opengl/GLSurfaceView$EGLConfigChooser;)V

    return-void
.end method


# virtual methods
.method public onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
    .locals 2

    if-eqz p1, :cond_0

    .line 74
    iget v0, p1, Landroid/view/inputmethod/EditorInfo;->imeOptions:I

    const/high16 v1, 0x10000000

    or-int/2addr v0, v1

    iput v0, p1, Landroid/view/inputmethod/EditorInfo;->imeOptions:I

    .line 77
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$1;

    const/4 v0, 0x0

    invoke-direct {p1, p0, p0, v0}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$1;-><init>(Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;Landroid/view/View;Z)V

    return-object p1
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 65
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->resolutionStrategy:Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;

    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy;->calcMeasures(II)Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy$MeasuredDimension;

    move-result-object p1

    .line 66
    iget p2, p1, Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy$MeasuredDimension;->width:I

    iget p1, p1, Lcom/badlogic/gdx/backends/android/surfaceview/ResolutionStrategy$MeasuredDimension;->height:I

    invoke-virtual {p0, p2, p1}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->setMeasuredDimension(II)V

    return-void
.end method
