.class public Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener;
.super Ljava/lang/Object;
.source "AndroidVisibilityListener.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createListener(Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;)V
    .locals 3

    .line 27
    :try_start_0
    invoke-interface {p1}, Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;->getApplicationWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 28
    new-instance v1, Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener$1;

    invoke-direct {v1, p0, p1}, Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener$1;-><init>(Lcom/badlogic/gdx/backends/android/AndroidVisibilityListener;Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnSystemUiVisibilityChangeListener(Landroid/view/View$OnSystemUiVisibilityChangeListener;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    const-string v1, "AndroidApplication"

    const-string v2, "Can\'t create OnSystemUiVisibilityChangeListener, unable to use immersive mode."

    .line 40
    invoke-interface {p1, v1, v2, v0}, Lcom/badlogic/gdx/backends/android/AndroidApplicationBase;->log(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :goto_0
    return-void
.end method
