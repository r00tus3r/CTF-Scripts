.class Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$1;
.super Landroid/view/inputmethod/BaseInputConnection;
.source "GLSurfaceView20API18.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;->onCreateInputConnection(Landroid/view/inputmethod/EditorInfo;)Landroid/view/inputmethod/InputConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;Landroid/view/View;Z)V
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$1;->this$0:Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18;

    invoke-direct {p0, p2, p3}, Landroid/view/inputmethod/BaseInputConnection;-><init>(Landroid/view/View;Z)V

    return-void
.end method

.method private sendDownUpKeyEventForBackwardCompatibility(I)V
    .locals 16
    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    move-object/from16 v0, p0

    .line 96
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v13

    .line 97
    new-instance v15, Landroid/view/KeyEvent;

    const/4 v6, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, -0x1

    const/4 v11, 0x0

    const/4 v12, 0x6

    move-object v1, v15

    move-wide v2, v13

    move-wide v4, v13

    move/from16 v7, p1

    invoke-direct/range {v1 .. v12}, Landroid/view/KeyEvent;-><init>(JJIIIIIII)V

    invoke-super {v0, v15}, Landroid/view/inputmethod/BaseInputConnection;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    .line 99
    new-instance v15, Landroid/view/KeyEvent;

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    const/4 v6, 0x1

    move-object v1, v15

    invoke-direct/range {v1 .. v12}, Landroid/view/KeyEvent;-><init>(JJIIIIIII)V

    invoke-super {v0, v15}, Landroid/view/inputmethod/BaseInputConnection;->sendKeyEvent(Landroid/view/KeyEvent;)Z

    return-void
.end method


# virtual methods
.method public deleteSurroundingText(II)Z
    .locals 2

    .line 80
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    if-nez p2, :cond_0

    const/16 p1, 0x43

    .line 87
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/backends/android/surfaceview/GLSurfaceView20API18$1;->sendDownUpKeyEventForBackwardCompatibility(I)V

    return v0

    .line 91
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/inputmethod/BaseInputConnection;->deleteSurroundingText(II)Z

    move-result p1

    return p1
.end method
