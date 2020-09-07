.class Lcom/badlogic/gdx/backends/android/AndroidNet$1;
.super Ljava/lang/Object;
.source "AndroidNet.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/backends/android/AndroidNet;->openURI(Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/backends/android/AndroidNet;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/backends/android/AndroidNet;Landroid/net/Uri;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidNet$1;->this$0:Lcom/badlogic/gdx/backends/android/AndroidNet;

    iput-object p2, p0, Lcom/badlogic/gdx/backends/android/AndroidNet$1;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 83
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidNet$1;->val$uri:Landroid/net/Uri;

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v0, v2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 85
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidNet$1;->this$0:Lcom/badlogic/gdx/backends/android/AndroidNet;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidNet;->app:Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;

    invoke-interface {v1}, Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;->getContext()Landroid/content/Context;

    move-result-object v1

    instance-of v1, v1, Landroid/app/Activity;

    if-nez v1, :cond_0

    const/high16 v1, 0x10000000

    .line 86
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 87
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/backends/android/AndroidNet$1;->this$0:Lcom/badlogic/gdx/backends/android/AndroidNet;

    iget-object v1, v1, Lcom/badlogic/gdx/backends/android/AndroidNet;->app:Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
