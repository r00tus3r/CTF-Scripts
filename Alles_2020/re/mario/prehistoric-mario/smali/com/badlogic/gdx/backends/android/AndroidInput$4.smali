.class Lcom/badlogic/gdx/backends/android/AndroidInput$4;
.super Ljava/lang/Object;
.source "AndroidInput.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/backends/android/AndroidInput;->setOnscreenKeyboardVisible(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

.field final synthetic val$visible:Z


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/backends/android/AndroidInput;Z)V
    .locals 0

    .line 601
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$4;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iput-boolean p2, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$4;->val$visible:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 603
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$4;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidInput;->context:Landroid/content/Context;

    const-string v1, "input_method"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 604
    iget-boolean v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$4;->val$visible:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 605
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$4;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidInput;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v1}, Lcom/badlogic/gdx/Application;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v1}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->getView()Landroid/view/View;

    move-result-object v1

    const/4 v3, 0x1

    .line 606
    invoke-virtual {v1, v3}, Landroid/view/View;->setFocusable(Z)V

    .line 607
    invoke-virtual {v1, v3}, Landroid/view/View;->setFocusableInTouchMode(Z)V

    .line 608
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$4;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidInput;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v1}, Lcom/badlogic/gdx/Application;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v1}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    goto :goto_0

    .line 610
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$4;->this$0:Lcom/badlogic/gdx/backends/android/AndroidInput;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidInput;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {v1}, Lcom/badlogic/gdx/Application;->getGraphics()Lcom/badlogic/gdx/Graphics;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/backends/android/AndroidGraphics;

    invoke-virtual {v1}, Lcom/badlogic/gdx/backends/android/AndroidGraphics;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    :goto_0
    return-void
.end method
