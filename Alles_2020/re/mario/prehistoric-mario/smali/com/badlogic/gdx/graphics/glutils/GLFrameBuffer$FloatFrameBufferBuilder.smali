.class public Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FloatFrameBufferBuilder;
.super Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
.source "GLFrameBuffer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FloatFrameBufferBuilder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder<",
        "Lcom/badlogic/gdx/graphics/glutils/FloatFrameBuffer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(II)V
    .locals 0

    .line 541
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;-><init>(II)V

    return-void
.end method


# virtual methods
.method public bridge synthetic addBasicColorTextureAttachment(Lcom/badlogic/gdx/graphics/Pixmap$Format;)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 0

    .line 539
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addBasicColorTextureAttachment(Lcom/badlogic/gdx/graphics/Pixmap$Format;)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addBasicDepthRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1

    .line 539
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addBasicDepthRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic addBasicStencilDepthPackedRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1

    .line 539
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addBasicStencilDepthPackedRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic addBasicStencilRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 1

    .line 539
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addBasicStencilRenderBuffer()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic addColorTextureAttachment(III)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 0

    .line 539
    invoke-super {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addColorTextureAttachment(III)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addDepthRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 0

    .line 539
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addDepthRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addDepthTextureAttachment(II)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 0

    .line 539
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addDepthTextureAttachment(II)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addFloatAttachment(IIIZ)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 0

    .line 539
    invoke-super {p0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addFloatAttachment(IIIZ)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addStencilDepthPackedRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 0

    .line 539
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addStencilDepthPackedRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addStencilRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 0

    .line 539
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addStencilRenderBuffer(I)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic addStencilTextureAttachment(II)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;
    .locals 0

    .line 539
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;->addStencilTextureAttachment(II)Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;

    move-result-object p1

    return-object p1
.end method

.method public build()Lcom/badlogic/gdx/graphics/glutils/FloatFrameBuffer;
    .locals 1

    .line 546
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/FloatFrameBuffer;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/glutils/FloatFrameBuffer;-><init>(Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$GLFrameBufferBuilder;)V

    return-object v0
.end method

.method public bridge synthetic build()Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer;
    .locals 1

    .line 539
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/GLFrameBuffer$FloatFrameBufferBuilder;->build()Lcom/badlogic/gdx/graphics/glutils/FloatFrameBuffer;

    move-result-object v0

    return-object v0
.end method
