.class public Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;
.super Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;
.source "FrameBufferCubemap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer<",
        "Lcom/badlogic/gdx/graphics/Cubemap;",
        ">;"
    }
.end annotation


# static fields
.field private static final cubemapSides:[Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;


# instance fields
.field private currentSide:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 68
    invoke-static {}, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->values()[Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->cubemapSides:[Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 70
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Pixmap$Format;IIZ)V
    .locals 6

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    .line 88
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;-><init>(Lcom/badlogic/gdx/graphics/Pixmap$Format;IIZZ)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Pixmap$Format;IIZZ)V
    .locals 1

    .line 100
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;-><init>()V

    .line 101
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferCubemapBuilder;

    invoke-direct {v0, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferCubemapBuilder;-><init>(II)V

    .line 102
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferCubemapBuilder;->addBasicColorTextureAttachment(Lcom/badlogic/gdx/graphics/Pixmap$Format;)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    if-eqz p4, :cond_0

    .line 103
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferCubemapBuilder;->addBasicDepthRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    :cond_0
    if-eqz p5, :cond_1

    .line 104
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferCubemapBuilder;->addBasicStencilRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    .line 105
    :cond_1
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->bufferBuilder:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    .line 107
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->build()V

    return-void
.end method

.method protected constructor <init>(Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
            "+",
            "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer<",
            "Lcom/badlogic/gdx/graphics/Cubemap;",
            ">;>;)V"
        }
    .end annotation

    .line 78
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;-><init>(Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;)V

    return-void
.end method


# virtual methods
.method protected attachFrameBufferColorTexture(Lcom/badlogic/gdx/graphics/Cubemap;)V
    .locals 10

    .line 127
    sget-object v6, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    .line 128
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Cubemap;->getTextureObjectHandle()I

    move-result p1

    .line 129
    invoke-static {}, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->values()[Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    move-result-object v7

    .line 130
    array-length v8, v7

    const/4 v0, 0x0

    const/4 v9, 0x0

    :goto_0
    if-ge v9, v8, :cond_0

    aget-object v0, v7, v9

    const v1, 0x8d40

    const v2, 0x8ce0

    .line 131
    iget v3, v0, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->glEnum:I

    const/4 v5, 0x0

    move-object v0, v6

    move v4, p1

    invoke-interface/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/GL20;->glFramebufferTexture2D(IIIII)V

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected bridge synthetic attachFrameBufferColorTexture(Lcom/badlogic/gdx/graphics/GLTexture;)V
    .locals 0

    .line 62
    check-cast p1, Lcom/badlogic/gdx/graphics/Cubemap;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->attachFrameBufferColorTexture(Lcom/badlogic/gdx/graphics/Cubemap;)V

    return-void
.end method

.method public bind()V
    .locals 1

    const/4 v0, -0x1

    .line 140
    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->currentSide:I

    .line 141
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;->bind()V

    return-void
.end method

.method protected bindSide(Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;)V
    .locals 6

    .line 161
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget v3, p1, Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;->glEnum:I

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->getColorBufferTexture()Lcom/badlogic/gdx/graphics/GLTexture;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/Cubemap;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Cubemap;->getTextureObjectHandle()I

    move-result v4

    const v1, 0x8d40

    const v2, 0x8ce0

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/GL20;->glFramebufferTexture2D(IIIII)V

    return-void
.end method

.method protected createTexture(Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;)Lcom/badlogic/gdx/graphics/Cubemap;
    .locals 8

    .line 113
    new-instance v7, Lcom/badlogic/gdx/graphics/glutils/GLOnlyTextureData;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->bufferBuilder:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    iget v1, v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->width:I

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->bufferBuilder:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    iget v2, v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->height:I

    iget v4, p1, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;->internalFormat:I

    iget v5, p1, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;->format:I

    iget v6, p1, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;->type:I

    const/4 v3, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/glutils/GLOnlyTextureData;-><init>(IIIIII)V

    .line 114
    new-instance p1, Lcom/badlogic/gdx/graphics/Cubemap;

    move-object v0, p1

    move-object v1, v7

    move-object v2, v7

    move-object v3, v7

    move-object v4, v7

    move-object v5, v7

    move-object v6, v7

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/Cubemap;-><init>(Lcom/badlogic/gdx/graphics/TextureData;Lcom/badlogic/gdx/graphics/TextureData;Lcom/badlogic/gdx/graphics/TextureData;Lcom/badlogic/gdx/graphics/TextureData;Lcom/badlogic/gdx/graphics/TextureData;Lcom/badlogic/gdx/graphics/TextureData;)V

    .line 115
    sget-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    sget-object v1, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/graphics/Cubemap;->setFilter(Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;)V

    .line 116
    sget-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->ClampToEdge:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    sget-object v1, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->ClampToEdge:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/graphics/Cubemap;->setWrap(Lcom/badlogic/gdx/graphics/Texture$TextureWrap;Lcom/badlogic/gdx/graphics/Texture$TextureWrap;)V

    return-object p1
.end method

.method protected bridge synthetic createTexture(Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;)Lcom/badlogic/gdx/graphics/GLTexture;
    .locals 0

    .line 62
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->createTexture(Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;)Lcom/badlogic/gdx/graphics/Cubemap;

    move-result-object p1

    return-object p1
.end method

.method protected disposeColorTexture(Lcom/badlogic/gdx/graphics/Cubemap;)V
    .locals 0

    .line 122
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Cubemap;->dispose()V

    return-void
.end method

.method protected bridge synthetic disposeColorTexture(Lcom/badlogic/gdx/graphics/GLTexture;)V
    .locals 0

    .line 62
    check-cast p1, Lcom/badlogic/gdx/graphics/Cubemap;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->disposeColorTexture(Lcom/badlogic/gdx/graphics/Cubemap;)V

    return-void
.end method

.method public getSide()Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;
    .locals 2

    .line 166
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->currentSide:I

    if-gez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->cubemapSides:[Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    aget-object v0, v1, v0

    :goto_0
    return-object v0
.end method

.method public nextSide()Z
    .locals 2

    .line 147
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->currentSide:I

    const/4 v1, 0x5

    if-gt v0, v1, :cond_1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v1, 0x1

    add-int/2addr v0, v1

    .line 153
    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->currentSide:I

    .line 154
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->getSide()Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/glutils/FrameBufferCubemap;->bindSide(Lcom/badlogic/gdx/graphics/Cubemap$CubemapSide;)V

    return v1

    .line 148
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "No remaining sides."

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
