.class Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener$1;
.super Ljava/lang/Object;
.source "AndroidVisibilityListener.java"

# interfaces
.implements Landroid/view/View$OnSystemUiVisibilityChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener;->createListener(Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener;

.field final synthetic val$application:Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;)V
    .locals 0

    .line 28
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener$1;->this$0:Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener;

    iput-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener$1;->val$application:Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSystemUiVisibilityChange(I)V
    .locals 1

    .line 31
    iget-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener$1;->val$application:Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;

    invoke-interface {p1}, Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;->getHandler()Landroid/os/Handler;

    move-result-object p1

    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener$1$1;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener$1$1;-><init>(Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener$1;)V

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
