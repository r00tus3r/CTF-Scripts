.class Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$1;
.super Ljava/lang/Object;
.source "AndroidFragmentApplication.java"

# interfaces
.implements Lcom/badlogic/gdx/LifecycleListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->initializeForView(Lcom/badlogic/gdx/ApplicationListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;


# direct methods
.method constructor <init>(Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;)V
    .locals 0

    .line 169
    iput-object p1, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$1;->this$0:Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 1

    .line 183
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$1;->this$0:Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidAudio;->dispose()V

    return-void
.end method

.method public pause()V
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$1;->this$0:Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidAudio;->pause()V

    return-void
.end method

.method public resume()V
    .locals 1

    .line 173
    iget-object v0, p0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication$1;->this$0:Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;

    iget-object v0, v0, Lcom/badlogic/gdx/backends/android/AndroidFragmentApplication;->audio:Lcom/badlogic/gdx/backends/android/AndroidAudio;

    invoke-virtual {v0}, Lcom/badlogic/gdx/backends/android/AndroidAudio;->resume()V

    return-void
.end method
