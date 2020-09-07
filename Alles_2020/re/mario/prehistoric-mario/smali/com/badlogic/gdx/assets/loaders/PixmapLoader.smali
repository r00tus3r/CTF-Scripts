.class public Lcom/badlogic/gdx/assets/loaders/PixmapLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "PixmapLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/Pixmap;",
        "Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;",
        ">;"
    }
.end annotation


# instance fields
.field pixmap:Lcom/badlogic/gdx/graphics/Pixmap;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 28
    check-cast p3, Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/assets/loaders/PixmapLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;)Lcom/badlogic/gdx/utils/Array;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    .locals 0

    .line 28
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/PixmapLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;)V

    return-void
.end method

.method public loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;)V
    .locals 0

    const/4 p1, 0x0

    .line 37
    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/PixmapLoader;->pixmap:Lcom/badlogic/gdx/graphics/Pixmap;

    .line 38
    new-instance p1, Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-direct {p1, p3}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(Lcom/badlogic/gdx/files/FileHandle;)V

    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/PixmapLoader;->pixmap:Lcom/badlogic/gdx/graphics/Pixmap;

    return-void
.end method

.method public loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;)Lcom/badlogic/gdx/graphics/Pixmap;
    .locals 0

    .line 43
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/PixmapLoader;->pixmap:Lcom/badlogic/gdx/graphics/Pixmap;

    const/4 p2, 0x0

    .line 44
    iput-object p2, p0, Lcom/badlogic/gdx/assets/loaders/PixmapLoader;->pixmap:Lcom/badlogic/gdx/graphics/Pixmap;

    return-object p1
.end method

.method public bridge synthetic loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 28
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/PixmapLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/PixmapLoader$PixmapParameter;)Lcom/badlogic/gdx/graphics/Pixmap;

    move-result-object p1

    return-object p1
.end method
