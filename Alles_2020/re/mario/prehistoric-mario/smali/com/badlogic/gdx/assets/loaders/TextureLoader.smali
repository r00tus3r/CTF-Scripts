.class public Lcom/badlogic/gdx/assets/loaders/TextureLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "TextureLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;,
        Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/Texture;",
        "Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;",
        ">;"
    }
.end annotation


# instance fields
.field info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 45
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    .line 42
    new-instance p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    invoke-direct {p1}, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 35
    check-cast p3, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;)Lcom/badlogic/gdx/utils/Array;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;",
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

    .line 35
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;)V

    return-void
.end method

.method public loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;)V
    .locals 1

    .line 50
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    iput-object p2, p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->filename:Ljava/lang/String;

    if-eqz p4, :cond_1

    .line 51
    iget-object p1, p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->textureData:Lcom/badlogic/gdx/graphics/TextureData;

    if-nez p1, :cond_0

    goto :goto_0

    .line 64
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    iget-object p2, p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->textureData:Lcom/badlogic/gdx/graphics/TextureData;

    iput-object p2, p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->data:Lcom/badlogic/gdx/graphics/TextureData;

    .line 65
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    iget-object p2, p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->texture:Lcom/badlogic/gdx/graphics/Texture;

    iput-object p2, p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->texture:Lcom/badlogic/gdx/graphics/Texture;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 54
    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    const/4 v0, 0x0

    iput-object v0, p2, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->texture:Lcom/badlogic/gdx/graphics/Texture;

    if-eqz p4, :cond_2

    .line 57
    iget-object v0, p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->format:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    .line 58
    iget-boolean p1, p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->genMipMaps:Z

    .line 59
    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    iget-object p4, p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->texture:Lcom/badlogic/gdx/graphics/Texture;

    iput-object p4, p2, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->texture:Lcom/badlogic/gdx/graphics/Texture;

    .line 62
    :cond_2
    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    invoke-static {p3, v0, p1}, Lcom/badlogic/gdx/graphics/TextureData$Factory;->loadFromFile(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/Pixmap$Format;Z)Lcom/badlogic/gdx/graphics/TextureData;

    move-result-object p1

    iput-object p1, p2, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->data:Lcom/badlogic/gdx/graphics/TextureData;

    .line 67
    :goto_1
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    iget-object p1, p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->data:Lcom/badlogic/gdx/graphics/TextureData;

    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/TextureData;->isPrepared()Z

    move-result p1

    if-nez p1, :cond_3

    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    iget-object p1, p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->data:Lcom/badlogic/gdx/graphics/TextureData;

    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/TextureData;->prepare()V

    :cond_3
    return-void
.end method

.method public loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;)Lcom/badlogic/gdx/graphics/Texture;
    .locals 0

    .line 72
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 73
    :cond_0
    iget-object p1, p1, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->texture:Lcom/badlogic/gdx/graphics/Texture;

    if-eqz p1, :cond_1

    .line 75
    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    iget-object p2, p2, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->data:Lcom/badlogic/gdx/graphics/TextureData;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/Texture;->load(Lcom/badlogic/gdx/graphics/TextureData;)V

    goto :goto_0

    .line 77
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/graphics/Texture;

    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->info:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;

    iget-object p2, p2, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureLoaderInfo;->data:Lcom/badlogic/gdx/graphics/TextureData;

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Lcom/badlogic/gdx/graphics/TextureData;)V

    :goto_0
    if-eqz p4, :cond_2

    .line 80
    iget-object p2, p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iget-object p3, p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/graphics/Texture;->setFilter(Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;)V

    .line 81
    iget-object p2, p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->wrapU:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    iget-object p3, p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->wrapV:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/graphics/Texture;->setWrap(Lcom/badlogic/gdx/graphics/Texture$TextureWrap;Lcom/badlogic/gdx/graphics/Texture$TextureWrap;)V

    :cond_2
    return-object p1
.end method

.method public bridge synthetic loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 35
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/TextureLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;)Lcom/badlogic/gdx/graphics/Texture;

    move-result-object p1

    return-object p1
.end method
