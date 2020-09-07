.class public Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "BitmapFontLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/g2d/BitmapFont;",
        "Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;",
        ">;"
    }
.end annotation


# instance fields
.field data:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 41
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 39
    check-cast p3, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;)Lcom/badlogic/gdx/utils/Array;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    .line 48
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    if-eqz p3, :cond_0

    .line 49
    iget-object v0, p3, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->bitmapFontData:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    if-eqz v0, :cond_0

    .line 50
    iget-object p2, p3, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->bitmapFontData:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    iput-object p2, p0, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->data:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    return-object p1

    .line 54
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    const/4 v1, 0x0

    if-eqz p3, :cond_1

    iget-boolean v2, p3, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->flip:Z

    if-eqz v2, :cond_1

    const/4 v2, 0x1

    goto :goto_0

    :cond_1
    const/4 v2, 0x0

    :goto_0
    invoke-direct {v0, p2, v2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;-><init>(Lcom/badlogic/gdx/files/FileHandle;Z)V

    iput-object v0, p0, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->data:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    if-eqz p3, :cond_2

    .line 55
    iget-object p2, p3, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->atlasName:Ljava/lang/String;

    if-eqz p2, :cond_2

    .line 56
    new-instance p2, Lcom/badlogic/gdx/assets/AssetDescriptor;

    iget-object p3, p3, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->atlasName:Ljava/lang/String;

    const-class v0, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    invoke-direct {p2, p3, v0}, Lcom/badlogic/gdx/assets/AssetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_2

    .line 58
    :cond_2
    :goto_1
    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->data:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->getImagePaths()[Ljava/lang/String;

    move-result-object p2

    array-length p2, p2

    if-ge v1, p2, :cond_4

    .line 59
    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->data:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->getImagePath(I)Ljava/lang/String;

    move-result-object p2

    .line 60
    invoke-virtual {p0, p2}, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->resolve(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p2

    .line 62
    new-instance v0, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;

    invoke-direct {v0}, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;-><init>()V

    if-eqz p3, :cond_3

    .line 65
    iget-boolean v2, p3, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->genMipMaps:Z

    iput-boolean v2, v0, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->genMipMaps:Z

    .line 66
    iget-object v2, p3, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iput-object v2, v0, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->minFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 67
    iget-object v2, p3, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    iput-object v2, v0, Lcom/badlogic/gdx/assets/loaders/TextureLoader$TextureParameter;->magFilter:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    .line 70
    :cond_3
    new-instance v2, Lcom/badlogic/gdx/assets/AssetDescriptor;

    const-class v3, Lcom/badlogic/gdx/graphics/Texture;

    invoke-direct {v2, p2, v3, v0}, Lcom/badlogic/gdx/assets/AssetDescriptor;-><init>(Lcom/badlogic/gdx/files/FileHandle;Ljava/lang/Class;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V

    .line 71
    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_4
    :goto_2
    return-object p1
.end method

.method public bridge synthetic loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    .locals 0

    .line 39
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;)V

    return-void
.end method

.method public loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;)V
    .locals 0

    return-void
.end method

.method public loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;
    .locals 3

    const/4 p2, 0x0

    if-eqz p4, :cond_1

    .line 84
    iget-object v0, p4, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->atlasName:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 85
    iget-object v0, p4, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->atlasName:Ljava/lang/String;

    const-class v1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/assets/AssetManager;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;

    .line 86
    iget-object v0, p0, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->data:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->imagePaths:[Ljava/lang/String;

    aget-object p2, v0, p2

    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/files/FileHandle;->sibling(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/files/FileHandle;->nameWithoutExtension()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object p2

    .line 87
    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/g2d/TextureAtlas;->findRegion(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/TextureAtlas$AtlasRegion;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 91
    new-instance p2, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    invoke-direct {p2, p3, p1}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;-><init>(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    return-object p2

    .line 90
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Could not find font region "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " in atlas "

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p2, p4, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;->atlasName:Ljava/lang/String;

    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 93
    :cond_1
    iget-object p3, p0, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->data:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->getImagePaths()[Ljava/lang/String;

    move-result-object p3

    array-length p3, p3

    .line 94
    new-instance p4, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p4, p3}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    :goto_0
    if-ge p2, p3, :cond_2

    .line 96
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    iget-object v1, p0, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->data:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    invoke-virtual {v1, p2}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;->getImagePath(I)Ljava/lang/String;

    move-result-object v1

    const-class v2, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p1, v1, v2}, Lcom/badlogic/gdx/assets/AssetManager;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/Texture;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;-><init>(Lcom/badlogic/gdx/graphics/Texture;)V

    invoke-virtual {p4, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 98
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    iget-object p2, p0, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->data:Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;

    const/4 p3, 0x1

    invoke-direct {p1, p2, p4, p3}, Lcom/badlogic/gdx/graphics/g2d/BitmapFont;-><init>(Lcom/badlogic/gdx/graphics/g2d/BitmapFont$BitmapFontData;Lcom/badlogic/gdx/utils/Array;Z)V

    return-object p1
.end method

.method public bridge synthetic loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 39
    check-cast p4, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/loaders/BitmapFontLoader$BitmapFontParameter;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object p1

    return-object p1
.end method
