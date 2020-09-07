.class public Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader;
.super Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;
.source "FreetypeFontLoader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader<",
        "Lcom/badlogic/gdx/graphics/g2d/BitmapFont;",
        "Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V
    .locals 0

    .line 22
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/assets/loaders/AsynchronousAssetLoader;-><init>(Lcom/badlogic/gdx/assets/loaders/FileHandleResolver;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Lcom/badlogic/gdx/utils/Array;
    .locals 0

    .line 20
    check-cast p3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;

    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader;->getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;)Lcom/badlogic/gdx/utils/Array;

    move-result-object p1

    return-object p1
.end method

.method public getDependencies(Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;)Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/badlogic/gdx/files/FileHandle;",
            "Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;",
            ")",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/assets/AssetDescriptor;",
            ">;"
        }
    .end annotation

    .line 47
    new-instance p1, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {p1}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 48
    new-instance p2, Lcom/badlogic/gdx/assets/AssetDescriptor;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;->fontFileName:Ljava/lang/String;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ".gen"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-class v0, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    invoke-direct {p2, p3, v0}, Lcom/badlogic/gdx/assets/AssetDescriptor;-><init>(Ljava/lang/String;Ljava/lang/Class;)V

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p1
.end method

.method public bridge synthetic loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)V
    .locals 0

    .line 20
    check-cast p4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader;->loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;)V

    return-void
.end method

.method public loadAsync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;)V
    .locals 0

    if-eqz p4, :cond_0

    return-void

    .line 34
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "FreetypeFontParameter must be set in AssetManager#load to point at a TTF file!"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;
    .locals 0

    if-eqz p4, :cond_0

    .line 40
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;->fontFileName:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ".gen"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const-class p3, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    invoke-virtual {p1, p2, p3}, Lcom/badlogic/gdx/assets/AssetManager;->get(Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;

    .line 41
    iget-object p2, p4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;->fontParameters:Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator;->generateFont(Lcom/badlogic/gdx/graphics/g2d/freetype/FreeTypeFontGenerator$FreeTypeFontParameter;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object p1

    return-object p1

    .line 39
    :cond_0
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "FreetypeFontParameter must be set in AssetManager#load to point at a TTF file!"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public bridge synthetic loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/assets/AssetLoaderParameters;)Ljava/lang/Object;
    .locals 0

    .line 20
    check-cast p4, Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader;->loadSync(Lcom/badlogic/gdx/assets/AssetManager;Ljava/lang/String;Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/g2d/freetype/FreetypeFontLoader$FreeTypeFontLoaderParameter;)Lcom/badlogic/gdx/graphics/g2d/BitmapFont;

    move-result-object p1

    return-object p1
.end method
