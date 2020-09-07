.class Lcom/badlogic/gdx/backends/android/AndroidInput$3$2;
.super Ljava/lang/Object;
.source "AndroidInput.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


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

    .line 245
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidInput$3$2;->this$1:Lcom/badlogic/gdx/backends/android/AndroidInput$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 0

    .line 247
    sget-object p1, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    new-instance p2, Lcom/badlogic/gdx/backends/android/AndroidInput$3$2$1;

    invoke-direct {p2, p0}, Lcom/badlogic/gdx/backends/android/AndroidInput$3$2$1;-><init>(Lcom/badlogic/gdx/backends/android/AndroidInput$3$2;)V

    invoke-interface {p1, p2}, Lcom/badlogic/gdx/Application;->postRunnable(Ljava/lang/Runnable;)V

    return-void
.end method
