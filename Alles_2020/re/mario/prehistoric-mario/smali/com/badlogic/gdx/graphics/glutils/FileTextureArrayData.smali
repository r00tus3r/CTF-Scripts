.class public Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;
.super Ljava/lang/Object;
.source "FileTextureArrayData.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/TextureArrayData;


# instance fields
.field private depth:I

.field private format:Lcom/badlogic/gdx/graphics/Pixmap$Format;

.field private prepared:Z

.field private textureDatas:[Lcom/badlogic/gdx/graphics/TextureData;

.field useMipMaps:Z


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/Pixmap$Format;Z[Lcom/badlogic/gdx/files/FileHandle;)V
    .locals 3

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->format:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    .line 38
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->useMipMaps:Z

    .line 39
    array-length v0, p3

    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->depth:I

    .line 40
    array-length v0, p3

    new-array v0, v0, [Lcom/badlogic/gdx/graphics/TextureData;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->textureDatas:[Lcom/badlogic/gdx/graphics/TextureData;

    const/4 v0, 0x0

    .line 41
    :goto_0
    array-length v1, p3

    if-ge v0, v1, :cond_0

    .line 42
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->textureDatas:[Lcom/badlogic/gdx/graphics/TextureData;

    aget-object v2, p3, v0

    invoke-static {v2, p1, p2}, Lcom/badlogic/gdx/graphics/TextureData$Factory;->loadFromFile(Lcom/badlogic/gdx/files/FileHandle;Lcom/badlogic/gdx/graphics/Pixmap$Format;Z)Lcom/badlogic/gdx/graphics/TextureData;

    move-result-object v2

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public consumeTextureArrayData()V
    .locals 15

    const/4 v0, 0x0

    .line 71
    :goto_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->textureDatas:[Lcom/badlogic/gdx/graphics/TextureData;

    array-length v2, v1

    if-ge v0, v2, :cond_4

    .line 72
    aget-object v1, v1, v0

    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/TextureData;->getType()Lcom/badlogic/gdx/graphics/TextureData$TextureDataType;

    move-result-object v1

    sget-object v2, Lcom/badlogic/gdx/graphics/TextureData$TextureDataType;->Custom:Lcom/badlogic/gdx/graphics/TextureData$TextureDataType;

    if-ne v1, v2, :cond_0

    .line 73
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->textureDatas:[Lcom/badlogic/gdx/graphics/TextureData;

    aget-object v1, v1, v0

    const v2, 0x8c1a

    invoke-interface {v1, v2}, Lcom/badlogic/gdx/graphics/TextureData;->consumeCustomData(I)V

    goto/16 :goto_2

    .line 75
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->textureDatas:[Lcom/badlogic/gdx/graphics/TextureData;

    aget-object v1, v1, v0

    .line 76
    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/TextureData;->consumePixmap()Lcom/badlogic/gdx/graphics/Pixmap;

    move-result-object v10

    .line 77
    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/TextureData;->disposePixmap()Z

    move-result v2

    .line 78
    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/TextureData;->getFormat()Lcom/badlogic/gdx/graphics/Pixmap$Format;

    move-result-object v3

    invoke-virtual {v10}, Lcom/badlogic/gdx/graphics/Pixmap;->getFormat()Lcom/badlogic/gdx/graphics/Pixmap$Format;

    move-result-object v4

    if-eq v3, v4, :cond_2

    .line 79
    new-instance v11, Lcom/badlogic/gdx/graphics/Pixmap;

    invoke-virtual {v10}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v2

    invoke-virtual {v10}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v3

    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/TextureData;->getFormat()Lcom/badlogic/gdx/graphics/Pixmap$Format;

    move-result-object v4

    invoke-direct {v11, v2, v3, v4}, Lcom/badlogic/gdx/graphics/Pixmap;-><init>(IILcom/badlogic/gdx/graphics/Pixmap$Format;)V

    .line 80
    sget-object v2, Lcom/badlogic/gdx/graphics/Pixmap$Blending;->None:Lcom/badlogic/gdx/graphics/Pixmap$Blending;

    invoke-virtual {v11, v2}, Lcom/badlogic/gdx/graphics/Pixmap;->setBlending(Lcom/badlogic/gdx/graphics/Pixmap$Blending;)V

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    .line 81
    invoke-virtual {v10}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v8

    invoke-virtual {v10}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v9

    move-object v2, v11

    move-object v3, v10

    invoke-virtual/range {v2 .. v9}, Lcom/badlogic/gdx/graphics/Pixmap;->drawPixmap(Lcom/badlogic/gdx/graphics/Pixmap;IIIIII)V

    .line 82
    invoke-interface {v1}, Lcom/badlogic/gdx/graphics/TextureData;->disposePixmap()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 83
    invoke-virtual {v10}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    :cond_1
    const/4 v2, 0x1

    move-object v13, v11

    const/4 v14, 0x1

    goto :goto_1

    :cond_2
    move v14, v2

    move-object v13, v10

    .line 88
    :goto_1
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    const v2, 0x8c1a

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/Pixmap;->getWidth()I

    move-result v7

    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/Pixmap;->getHeight()I

    move-result v8

    const/4 v9, 0x1

    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLInternalFormat()I

    move-result v10

    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/Pixmap;->getGLType()I

    move-result v11

    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/Pixmap;->getPixels()Ljava/nio/ByteBuffer;

    move-result-object v12

    move v6, v0

    invoke-interface/range {v1 .. v12}, Lcom/badlogic/gdx/graphics/GL30;->glTexSubImage3D(IIIIIIIIIILjava/nio/Buffer;)V

    if-eqz v14, :cond_3

    .line 89
    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/Pixmap;->dispose()V

    :cond_3
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_4
    return-void
.end method

.method public getDepth()I
    .locals 1

    .line 106
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->depth:I

    return v0
.end method

.method public getGLType()I
    .locals 1

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->format:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/Pixmap$Format;->toGlType(Lcom/badlogic/gdx/graphics/Pixmap$Format;)I

    move-result v0

    return v0
.end method

.method public getHeight()I
    .locals 2

    .line 101
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->textureDatas:[Lcom/badlogic/gdx/graphics/TextureData;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/TextureData;->getHeight()I

    move-result v0

    return v0
.end method

.method public getInternalFormat()I
    .locals 1

    .line 111
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->format:Lcom/badlogic/gdx/graphics/Pixmap$Format;

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/Pixmap$Format;->toGlFormat(Lcom/badlogic/gdx/graphics/Pixmap$Format;)I

    move-result v0

    return v0
.end method

.method public getWidth()I
    .locals 2

    .line 96
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->textureDatas:[Lcom/badlogic/gdx/graphics/TextureData;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/TextureData;->getWidth()I

    move-result v0

    return v0
.end method

.method public isManaged()Z
    .locals 5

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->textureDatas:[Lcom/badlogic/gdx/graphics/TextureData;

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 122
    invoke-interface {v4}, Lcom/badlogic/gdx/graphics/TextureData;->isManaged()Z

    move-result v4

    if-nez v4, :cond_0

    return v2

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    return v0
.end method

.method public isPrepared()Z
    .locals 1

    .line 48
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->prepared:Z

    return v0
.end method

.method public prepare()V
    .locals 8

    .line 55
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->textureDatas:[Lcom/badlogic/gdx/graphics/TextureData;

    array-length v1, v0

    const/4 v2, -0x1

    const/4 v3, 0x0

    const/4 v4, -0x1

    const/4 v5, -0x1

    :goto_0
    if-ge v3, v1, :cond_2

    aget-object v6, v0, v3

    .line 56
    invoke-interface {v6}, Lcom/badlogic/gdx/graphics/TextureData;->prepare()V

    if-ne v4, v2, :cond_0

    .line 58
    invoke-interface {v6}, Lcom/badlogic/gdx/graphics/TextureData;->getWidth()I

    move-result v4

    .line 59
    invoke-interface {v6}, Lcom/badlogic/gdx/graphics/TextureData;->getHeight()I

    move-result v5

    goto :goto_1

    .line 62
    :cond_0
    invoke-interface {v6}, Lcom/badlogic/gdx/graphics/TextureData;->getWidth()I

    move-result v7

    if-ne v4, v7, :cond_1

    invoke-interface {v6}, Lcom/badlogic/gdx/graphics/TextureData;->getHeight()I

    move-result v6

    if-ne v5, v6, :cond_1

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 63
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "Error whilst preparing TextureArray: TextureArray Textures must have equal dimensions."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    const/4 v0, 0x1

    .line 66
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/FileTextureArrayData;->prepared:Z

    return-void
.end method
