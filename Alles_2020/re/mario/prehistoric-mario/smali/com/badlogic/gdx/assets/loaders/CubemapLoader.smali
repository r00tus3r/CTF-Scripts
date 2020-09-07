.class public Lcom/badlogic/gdx/assets/loaders/CubemapLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "CubemapLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;,
        Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/Cubemap;",
        "Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;",
        ">;"
    }
.end annotation


# instance fields
.field info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    .line 45
    new-instance p1, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    invoke-direct {p1}, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 38
    check-cast p3, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;)Lcom/badlogic/gdx/utils/Array;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;",
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

    .line 38
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;)V

    return-void
.end method

.method public loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;)V
    .locals 2

    .line 53
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    iput-object p2, p1, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->filename:Ljava/lang/String;

    if-eqz p4, :cond_1

    .line 54
    iget-object p1, p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;->cubemapData:Lcom/badlogic/gdx/graphics/CubemapData;

    if-nez p1, :cond_0

    goto :goto_0

    .line 68
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    iget-object p2, p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;->cubemapData:Lcom/badlogic/gdx/graphics/CubemapData;

    iput-object p2, p1, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->data:Lcom/badlogic/gdx/graphics/CubemapData;

    .line 69
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    iget-object p2, p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;->cubemap:Lcom/badlogic/gdx/graphics/Cubemap;

    iput-object p2, p1, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->cubemap:Lcom/badlogic/gdx/graphics/Cubemap;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 57
    iget-object v0, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->cubemap:Lcom/badlogic/gdx/graphics/Cubemap;

    if-eqz p4, :cond_2

    .line 60
    iget-object v0, p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;->format:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    .line 61
    iget-object v0, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    iget-object p4, p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;->cubemap:Lcom/badlogic/gdx/graphics/Cubemap;

    iput-object p4, v0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->cubemap:Lcom/badlogic/gdx/graphics/Cubemap;

    :cond_2
    const-string p4, ".ktx"

    .line 64
    invoke-virtual {p2, p4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p4

    if-nez p4, :cond_3

    const-string p4, ".zktx"

    invoke-virtual {p2, p4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result p2

    if-eqz p2, :cond_4

    .line 65
    :cond_3
    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    new-instance p4, Lcom/badlogic/gdx/graphics/glutils/KTXTextureData;

    invoke-direct {p4, p3, p1}, Lcom/badlogic/gdx/graphics/glutils/KTXTextureData;-><init>(Lcom/badlogic/gdx/files/FileHandle;Z)V

    iput-object p4, p2, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->data:Lcom/badlogic/gdx/graphics/CubemapData;

    .line 71
    :cond_4
    :goto_1
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    iget-object p1, p1, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->data:Lcom/badlogic/gdx/graphics/CubemapData;

    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/CubemapData;->isPrepared()Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    iget-object p1, p1, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->data:Lcom/badlogic/gdx/graphics/CubemapData;

    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/CubemapData;->prepare()V

    :cond_5
    return-void
.end method

.method public loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;)Lcom/badlogic/gdx/graphics/Cubemap;
    .locals 0

    .line 76
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 77
    :cond_0
    iget-object p1, p1, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->cubemap:Lcom/badlogic/gdx/graphics/Cubemap;

    if-eqz p1, :cond_1

    .line 79
    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    iget-object p2, p2, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->data:Lcom/badlogic/gdx/graphics/CubemapData;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/Cubemap;->load(Lcom/badlogic/gdx/graphics/CubemapData;)V

    goto :goto_0

    .line 81
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/graphics/Cubemap;

    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->info:Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;

    iget-object p2, p2, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapLoaderInfo;->data:Lcom/badlogic/gdx/graphics/CubemapData;

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/graphics/Cubemap;-><init>(Lcom/badlogic/gdx/graphics/CubemapData;)V

    :goto_0
    if-eqz p4, :cond_2

    .line 84
    iget-object p2, p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iget-object p3, p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/graphics/Cubemap;->setFilter(Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;)V

    .line 85
    iget-object p2, p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;->wrapU:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    iget-object p3, p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;->wrapV:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/graphics/Cubemap;->setWrap(Lcom/badlogic/gdx/graphics/Texture$TextureWrap;Lcom/badlogic/gdx/graphics/Texture$TextureWrap;)V

    :cond_2
    return-object p1
.end method

.method public bridge synthetic loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 38
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/CubemapLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/CubemapLoader$CubemapParameter;)Lcom/badlogic/gdx/graphics/Cubemap;

    move-result-object p1

    return-object p1
.end method
