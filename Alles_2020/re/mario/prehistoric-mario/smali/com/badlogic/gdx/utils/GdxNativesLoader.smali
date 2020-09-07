.class public Lcom/badlogic/gdx/utils/GdxNativesLoader;
.super Ljava/lang/Object;
.source "GdxNativesLoader.java"


# static fields
.field public static disableNativesLoading:Z = false

.field private static nativesLoaded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static declared-synchronized load()V
    .locals 3

    const-class v0, Lcom/badlogic/gdx/utils/GdxNativesLoader;

    monitor-enter v0

    .line 28
    :try_start_0
    sget-boolean v1, Lcom/badlogic/gdx/utils/GdxNativesLoader;->nativesLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    const/4 v1, 0x1

    .line 29
    :try_start_1
    sput-boolean v1, Lcom/badlogic/gdx/utils/GdxNativesLoader;->nativesLoaded:Z

    .line 31
    sget-boolean v1, Lcom/badlogic/gdx/utils/GdxNativesLoader;->disableNativesLoading:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v1, :cond_1

    monitor-exit v0

    return-void

    .line 33
    :cond_1
    :try_start_2
    new-instance v1, Lcom/badlogic/gdx/utils/SharedLibraryLoader;

    invoke-direct {v1}, Lcom/badlogic/gdx/utils/SharedLibraryLoader;-><init>()V

    const-string v2, "gdx"

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/SharedLibraryLoader;->load(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method
