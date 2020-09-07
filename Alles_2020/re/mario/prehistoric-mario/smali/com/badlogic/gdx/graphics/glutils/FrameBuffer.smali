.class public Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;
.super Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;
.source "FrameBuffer.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer<",
        "Lcom/badlogic/gdx/graphics/Texture;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 44
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

    .line 57
    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;-><init>(Lcom/badlogic/gdx/graphics/Pixmap$Format;IIZZ)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/Pixmap$Format;IIZZ)V
    .locals 1

    .line 68
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;-><init>()V

    .line 69
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferBuilder;

    invoke-direct {v0, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferBuilder;-><init>(II)V

    .line 70
    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferBuilder;->addBasicColorTextureAttachment(Lcom/badlogic/gdx/graphics/Pixmap$Format;)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    if-eqz p4, :cond_0

    .line 71
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferBuilder;->addBasicDepthRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    :cond_0
    if-eqz p5, :cond_1

    .line 72
    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferBuilder;->addBasicStencilRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    .line 73
    :cond_1
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->bufferBuilder:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    .line 75
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->build()V

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
            "Lcom/badlogic/gdx/graphics/Texture;",
            ">;>;)V"
        }
    .end annotation

    .line 52
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;-><init>(Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;)V

    return-void
.end method

.method public static unbind()V
    .locals 0

    .line 99
    invoke-static {}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;->unbind()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic attachFrameBufferColorTexture(Lcom/badlogic/gdx/graphics/GLTexture;)V
    .locals 0

    .line 42
    check-cast p1, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->attachFrameBufferColorTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    return-void
.end method

.method protected attachFrameBufferColorTexture(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 6

    .line 94
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->getTextureObjectHandle()I

    move-result v4

    const v1, 0x8d40

    const v2, 0x8ce0

    const/16 v3, 0xde1

    const/4 v5, 0x0

    invoke-interface/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/GL20;->glFramebufferTexture2D(IIIII)V

    return-void
.end method

.method protected bridge synthetic createTexture(Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;)Lcom/badlogic/gdx/graphics/GLTexture;
    .locals 0

    .line 42
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->createTexture(Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;)Lcom/badlogic/gdx/graphics/Texture;

    move-result-object p1

    return-object p1
.end method

.method protected createTexture(Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;)Lcom/badlogic/gdx/graphics/Texture;
    .locals 8

    .line 80
    new-instance v7, Lcom/badlogic/gdx/graphics/glutils/GLOnlyTextureData;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->bufferBuilder:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    iget v1, v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->width:I

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->bufferBuilder:Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    iget v2, v0, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->height:I

    iget v4, p1, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;->internalFormat:I

    iget v5, p1, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;->format:I

    iget v6, p1, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FrameBufferTextureAttachmentSpec;->type:I

    const/4 v3, 0x0

    move-object v0, v7

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/glutils/GLOnlyTextureData;-><init>(IIIIII)V

    .line 81
    new-instance p1, Lcom/badlogic/gdx/graphics/Texture;

    invoke-direct {p1, v7}, Lcom/badlogic/gdx/graphics/Texture;-><init>(Lcom/badlogic/gdx/graphics/TextureData;)V

    .line 82
    sget-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    sget-object v1, Lcom/badlogic/gdx/graphics/Texture$TextureFilter;->Linear:Lcom/badlogic/gdx/graphics/Texture$TextureFilter;

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/graphics/Texture;->setFilter(Lcom/badlogic/gdx/graphics/Texture$TextureFilter;Lcom/badlogic/gdx/graphics/Texture$TextureFilter;)V

    .line 83
    sget-object v0, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->ClampToEdge:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    sget-object v1, Lcom/badlogic/gdx/graphics/Texture$TextureWrap;->ClampToEdge:Lcom/badlogic/gdx/graphics/Texture$TextureWrap;

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/graphics/Texture;->setWrap(Lcom/badlogic/gdx/graphics/Texture$TextureWrap;Lcom/badlogic/gdx/graphics/Texture$TextureWrap;)V

    return-object p1
.end method

.method protected bridge synthetic disposeColorTexture(Lcom/badlogic/gdx/graphics/GLTexture;)V
    .locals 0

    .line 42
    check-cast p1, Lcom/badlogic/gdx/graphics/Texture;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/FrameBuffer;->disposeColorTexture(Lcom/badlogic/gdx/graphics/Texture;)V

    return-void
.end method

.method protected disposeColorTexture(Lcom/badlogic/gdx/graphics/Texture;)V
    .locals 0

    .line 89
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Texture;->dispose()V

    return-void
.end method
