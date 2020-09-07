.class public abstract Lcom/badlogic/gdx/assets/loaders/ModelLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "ModelLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<P:",
        "Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;",
        ">",
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/g3d/Model;",
        "TP;>;"
    }
.end annotation


# instance fields
.field protected defaultParameters:Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;

.field protected items:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/utils/ObjectMap$Entry<",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    .line 40
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->items:Lcom/badlogic/gdx/utils/Array;

    .line 41
    new-instance p1, Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;

    invoke-direct {p1}, Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->defaultParameters:Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 35
    check-cast p3, Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "TP;)",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    .line 74
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 75
    invoke-virtual {p0, p2, p3}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->loadModelData(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;

    move-result-object p2

    if-nez p2, :cond_0

    return-object v0

    .line 78
    :cond_0
    new-instance v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    invoke-direct {v1}, Lcom/badlogic/gdx/utils/ObjectMap$Entry;-><init>()V

    .line 79
    iput-object p1, v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    .line 80
    iput-object p2, v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    .line 81
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->items:Lcom/badlogic/gdx/utils/Array;

    monitor-enter p1

    .line 82
    :try_start_0
    iget-object v2, p0, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 83
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz p3, :cond_1

    .line 85
    iget-object p1, p3, Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;->textureParameter:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;

    goto :goto_0

    :cond_1
    iget-object p1, p0, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->defaultParameters:Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;

    iget-object p1, p1, Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;->textureParameter:Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;

    .line 89
    :goto_0
    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;->materials:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p2}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_2
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_3

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;

    .line 90
    iget-object v1, p3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    if-eqz v1, :cond_2

    .line 91
    iget-object p3, p3, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelMaterial;->textures:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p3}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :goto_1
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;

    .line 92
    new-instance v2, Lcom/badlogic/gdx/assets/AssetDescriptor;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelTexture;->fileName:Ljava/lang/String;

    const-class v3, Lcom/badlogic/gdx/graphics/Texture;

    invoke-direct {v2, v1, v3, p1}, Lcom/badlogic/gdx/assets/AssetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    :cond_3
    return-object v0

    :catchall_0
    move-exception p2

    .line 83
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :goto_2
    throw p2

    :goto_3
    goto :goto_2
.end method

.method public bridge synthetic loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    .locals 0

    .line 35
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)V

    return-void
.end method

.method public loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/assets/AssetManager;",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "TP;)V"
        }
    .end annotation

    return-void
.end method

.method public loadModel(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 2

    .line 69
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->loadModel(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object p1

    return-object p1
.end method

.method public loadModel(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "TP;)",
            "Lcom/badlogic/gdx/graphics/g3d/Model;"
        }
    .end annotation

    .line 59
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$FileTextureProvider;-><init>()V

    invoke-virtual {p0, p1, v0, p2}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->loadModel(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object p1

    return-object p1
.end method

.method public loadModel(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 1

    const/4 v0, 0x0

    .line 64
    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->loadModel(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object p1

    return-object p1
.end method

.method public loadModel(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;",
            "TP;)",
            "Lcom/badlogic/gdx/graphics/g3d/Model;"
        }
    .end annotation

    .line 53
    invoke-virtual {p0, p1, p3}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->loadModelData(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 54
    :cond_0
    new-instance p3, Lcom/badlogic/gdx/graphics/g3d/Model;

    invoke-direct {p3, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/Model;-><init>(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)V

    move-object p1, p3

    :goto_0
    return-object p1
.end method

.method public loadModelData(Lcom/badlogic/gdx/files/FileHandle;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;
    .locals 1

    const/4 v0, 0x0

    .line 48
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->loadModelData(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;

    move-result-object p1

    return-object p1
.end method

.method public abstract loadModelData(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "TP;)",
            "Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;"
        }
    .end annotation
.end method

.method public loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/Model;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/assets/AssetManager;",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "TP;)",
            "Lcom/badlogic/gdx/graphics/g3d/Model;"
        }
    .end annotation

    .line 105
    iget-object p3, p0, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->items:Lcom/badlogic/gdx/utils/Array;

    monitor-enter p3

    const/4 p4, 0x0

    const/4 v0, 0x0

    move-object v1, v0

    .line 106
    :goto_0
    :try_start_0
    iget-object v2, p0, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->items:Lcom/badlogic/gdx/utils/Array;

    iget v2, v2, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge p4, v2, :cond_1

    .line 107
    iget-object v2, p0, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, p4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    iget-object v2, v2, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->key:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 108
    iget-object v1, p0, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, p4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;

    iget-object v1, v1, Lcom/badlogic/gdx/utils/ObjectMap$Entry;->value:Ljava/lang/Object;

    check-cast v1, Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;

    .line 109
    iget-object v2, p0, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->items:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, p4}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    :cond_0
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    .line 112
    :cond_1
    monitor-exit p3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_2

    return-object v0

    .line 114
    :cond_2
    new-instance p2, Lcom/badlogic/gdx/graphics/g3d/Model;

    new-instance p3, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$AssetTextureProvider;

    invoke-direct {p3, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider$AssetTextureProvider;-><init>(Lcom/badlogic/gdx/assets/AssetManager;)V

    invoke-direct {p2, v1, p3}, Lcom/badlogic/gdx/graphics/g3d/Model;-><init>(Lcom/badlogic/gdx/graphics/g3d/model/data/ModelData;Lcom/badlogic/gdx/graphics/g3d/utils/TextureProvider;)V

    .line 117
    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g3d/Model;->getManagedDisposables()Ljava/lang/Iterable;

    move-result-object p1

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 118
    :cond_3
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_4

    .line 119
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/utils/Disposable;

    .line 120
    instance-of p3, p3, Lcom/badlogic/gdx/graphics/Texture;

    if-eqz p3, :cond_3

    .line 121
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    :cond_4
    return-object p2

    :catchall_0
    move-exception p1

    .line 112
    :try_start_1
    monitor-exit p3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public bridge synthetic loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 35
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/ModelLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/ModelLoader$ModelParameters;)Lcom/badlogic/gdx/graphics/g3d/Model;

    move-result-object p1

    return-object p1
.end method
