.class public Lcom/badlogic/gdx/backends/android/AndroidInputFactory;
.super Ljava/lang/Object;
.source "AndroidInputFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static newAndroidInput(Lcom/badlogic/gdx/Application;Landroid/content/Context;Ljava/lang/Object;Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;)Lcom/badlogic/gdx/backends/android/AndroidInput;
    .locals 8

    .line 34
    :try_start_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xc

    if-lt v0, v1, :cond_0

    const-string v0, "com.badlogic.gdx.backends.android.AndroidInputThreePlus"

    .line 36
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    goto :goto_0

    :cond_0
    const-string v0, "com.badlogic.gdx.backends.android.AndroidInput"

    .line 38
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    :goto_0
    const/4 v1, 0x4

    .line 40
    new-array v2, v1, [Ljava/lang/Class;

    const-class v3, Lcom/badlogic/gdx/Application;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Landroid/content/Context;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-class v3, Ljava/lang/Object;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const-class v3, Lcom/badlogic/gdx/backends/android/AndroidApplicationConfiguration;

    const/4 v7, 0x3

    aput-object v3, v2, v7

    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    move-result-object v0

    .line 42
    new-array v1, v1, [Ljava/lang/Object;

    aput-object p0, v1, v4

    aput-object p1, v1, v5

    aput-object p2, v1, v6

    aput-object p3, v1, v7

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/badlogic/gdx/backends/android/AndroidInput;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 45
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "Couldn\'t construct AndroidInput, this should never happen"

    invoke-direct {p1, p2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p1
.end method
