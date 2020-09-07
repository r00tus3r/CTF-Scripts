.class public Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;
.super Ljava/lang/Object;
.source "IndexBufferObject.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/glutils/IndexData;


# instance fields
.field final buffer:Ljava/nio/ShortBuffer;

.field bufferHandle:I

.field final byteBuffer:Ljava/nio/ByteBuffer;

.field private final empty:Z

.field isBound:Z

.field final isDirect:Z

.field isDirty:Z

.field final ownsBuffer:Z

.field final usage:I


# direct methods
.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x1

    .line 64
    invoke-direct {p0, v0, p1}, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;-><init>(ZI)V

    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 2

    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 53
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    const/4 v1, 0x0

    .line 54
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isBound:Z

    if-nez p2, :cond_0

    const/4 v1, 0x1

    .line 73
    :cond_0
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->empty:Z

    .line 74
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->empty:Z

    if-eqz v1, :cond_1

    const/4 p2, 0x1

    :cond_1
    mul-int/lit8 p2, p2, 0x2

    .line 78
    invoke-static {p2}, Lcom/badlogic/gdx/utils/BufferUtils;->newUnsafeByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 79
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirect:Z

    .line 81
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    .line 82
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->ownsBuffer:Z

    .line 83
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {p2}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 84
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 85
    sget-object p2, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {p2}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result p2

    iput p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->bufferHandle:I

    if-eqz p1, :cond_2

    const p1, 0x88e4

    goto :goto_0

    :cond_2
    const p1, 0x88e8

    .line 86
    :goto_0
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->usage:I

    return-void
.end method

.method public constructor <init>(ZLjava/nio/ByteBuffer;)V
    .locals 3

    .line 89
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 53
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    const/4 v1, 0x0

    .line 54
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isBound:Z

    .line 91
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    if-nez v2, :cond_0

    const/4 v2, 0x1

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    iput-boolean v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->empty:Z

    .line 92
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 93
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirect:Z

    .line 95
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asShortBuffer()Ljava/nio/ShortBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    .line 96
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->ownsBuffer:Z

    .line 97
    sget-object p2, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {p2}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result p2

    iput p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->bufferHandle:I

    if-eqz p1, :cond_1

    const p1, 0x88e4

    goto :goto_1

    :cond_1
    const p1, 0x88e8

    .line 98
    :goto_1
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->usage:I

    return-void
.end method


# virtual methods
.method public bind()V
    .locals 5

    .line 181
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->bufferHandle:I

    if-eqz v0, :cond_1

    .line 183
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->bufferHandle:I

    const v2, 0x8893

    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 184
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    if-eqz v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v1}, Ljava/nio/ShortBuffer;->limit()I

    move-result v1

    mul-int/lit8 v1, v1, 0x2

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 186
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v4, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->usage:I

    invoke-interface {v0, v2, v1, v3, v4}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    const/4 v0, 0x0

    .line 187
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    :cond_0
    const/4 v0, 0x1

    .line 189
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isBound:Z

    return-void

    .line 181
    :cond_1
    new-instance v0, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v1, "No buffer allocated!"

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public dispose()V
    .locals 3

    .line 206
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x0

    const v2, 0x8893

    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 207
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->bufferHandle:I

    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDeleteBuffer(I)V

    .line 208
    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->bufferHandle:I

    .line 210
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->ownsBuffer:Z

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->disposeUnsafeByteBuffer(Ljava/nio/ByteBuffer;)V

    :cond_0
    return-void
.end method

.method public getBuffer()Ljava/nio/ShortBuffer;
    .locals 1

    const/4 v0, 0x1

    .line 175
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    .line 176
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    return-object v0
.end method

.method public getNumIndices()I
    .locals 1

    .line 103
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->empty:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->limit()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getNumMaxIndices()I
    .locals 1

    .line 108
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->empty:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v0}, Ljava/nio/ShortBuffer;->capacity()I

    move-result v0

    :goto_0
    return v0
.end method

.method public invalidate()V
    .locals 1

    .line 200
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->bufferHandle:I

    const/4 v0, 0x1

    .line 201
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    return-void
.end method

.method public setIndices(Ljava/nio/ShortBuffer;)V
    .locals 5

    const/4 v0, 0x1

    .line 138
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    .line 139
    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->position()I

    move-result v1

    .line 140
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 141
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v2, p1}, Ljava/nio/ShortBuffer;->put(Ljava/nio/ShortBuffer;)Ljava/nio/ShortBuffer;

    .line 142
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 143
    invoke-virtual {p1, v1}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 144
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 145
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v2}, Ljava/nio/ShortBuffer;->limit()I

    move-result v2

    shl-int/lit8 v0, v2, 0x1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 147
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isBound:Z

    if-eqz p1, :cond_0

    .line 148
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const v0, 0x8893

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v4, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->usage:I

    invoke-interface {p1, v0, v2, v3, v4}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 149
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    :cond_0
    return-void
.end method

.method public setIndices([SII)V
    .locals 3

    const/4 v0, 0x1

    .line 124
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    .line 125
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v1}, Ljava/nio/ShortBuffer;->clear()Ljava/nio/Buffer;

    .line 126
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {v1, p1, p2, p3}, Ljava/nio/ShortBuffer;->put([SII)Ljava/nio/ShortBuffer;

    .line 127
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    invoke-virtual {p1}, Ljava/nio/ShortBuffer;->flip()Ljava/nio/Buffer;

    .line 128
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 129
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    shl-int/2addr p3, v0

    invoke-virtual {p1, p3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 131
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isBound:Z

    if-eqz p1, :cond_0

    .line 132
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const p3, 0x8893

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->usage:I

    invoke-interface {p1, p3, v0, v1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 133
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    :cond_0
    return-void
.end method

.method public unbind()V
    .locals 3

    .line 194
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x0

    const v2, 0x8893

    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 195
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isBound:Z

    return-void
.end method

.method public updateIndices(I[SII)V
    .locals 2

    const/4 v0, 0x1

    .line 155
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    .line 156
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 157
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    mul-int/lit8 p1, p1, 0x2

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 158
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p2, p3, p1, p4}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([SILjava/nio/Buffer;I)V

    .line 159
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 160
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->buffer:Ljava/nio/ShortBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/ShortBuffer;->position(I)Ljava/nio/Buffer;

    .line 162
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isBound:Z

    if-eqz p1, :cond_0

    .line 163
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const p3, 0x8893

    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p4}, Ljava/nio/ByteBuffer;->limit()I

    move-result p4

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v1, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->usage:I

    invoke-interface {p1, p3, p4, v0, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 164
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/glutils/IndexBufferObject;->isDirty:Z

    :cond_0
    return-void
.end method
