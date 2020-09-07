.class Lcom/badlogic/gdx/backends/android/AndroidInput$3$3;
.super Ljava/lang/Object;
.source "AndroidInput.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/backends/android/AndroidInput$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/badlogic/gdx/backends/android/AndroidInput$3;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/backends/android/AndroidInput$3;)V
    .locals 0

    .line 255
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$3$3;->this$1:Lcom/badlogic/gdx/backends/android/AndroidInput$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1

    .line 258
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    new-instance v0, Lcom/badlogic/gdx/backends/android/AndroidInput$3$3$1;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/backends/android/AndroidInput$3$3$1;-><init>(Lcom/badlogic/gdx/backends/android/AndroidInput$3$3;)V

    invoke-interface {p1, v0}, Lcom/badlogic/gdx/Application;->postRunnable(Ljava/lang/Runnable;)V

    return-void
.end method
