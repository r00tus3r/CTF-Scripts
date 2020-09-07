.class public Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;
.super Ljava/lang/Object;
.source "InstanceBufferObjectSubData.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/glutils/InstanceData;


# instance fields
.field final attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

.field final buffer:Ljava/nio/FloatBuffer;

.field bufferHandle:I

.field final byteBuffer:Ljava/nio/ByteBuffer;

.field isBound:Z

.field final isDirect:Z

.field isDirty:Z

.field final isStatic:Z

.field final usage:I


# direct methods
.method public constructor <init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 1

    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirty:Z

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isBound:Z

    .line 67
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isStatic:Z

    .line 68
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    .line 69
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget p3, p3, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    mul-int p3, p3, p2

    invoke-static {p3}, Lcom/badlogic/gdx/utils/BufferUtils;->newByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 p2, 0x1

    .line 70
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirect:Z

    if-eqz p1, :cond_0

    const p1, 0x88e4

    goto :goto_0

    :cond_0
    const p1, 0x88e8

    .line 72
    :goto_0
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->usage:I

    .line 73
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p1

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    .line 74
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->createBufferObject()I

    move-result p1

    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bufferHandle:I

    .line 75
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 76
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    return-void
.end method

.method public varargs constructor <init>(ZI[Lcom/badlogic/gdx/graphics/VertexAttribute;)V
    .locals 1

    .line 56
    new-instance v0, Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-direct {v0, p3}, Lcom/badlogic/gdx/graphics/VertexAttributes;-><init>([Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;-><init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V

    return-void
.end method

.method private bufferChanged()V
    .locals 5

    .line 119
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isBound:Z

    if-eqz v0, :cond_0

    .line 120
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    const/4 v2, 0x0

    iget v3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->usage:I

    const v4, 0x8892

    invoke-interface {v0, v4, v1, v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 121
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    const/4 v3, 0x0

    invoke-interface {v0, v4, v3, v1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glBufferSubData(IIILjava/nio/Buffer;)V

    .line 122
    iput-boolean v3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirty:Z

    :cond_0
    return-void
.end method

.method private createBufferObject()I
    .locals 6

    .line 80
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result v0

    .line 81
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const v2, 0x8892

    invoke-interface {v1, v2, v0}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 82
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v3

    iget v4, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->usage:I

    const/4 v5, 0x0

    invoke-interface {v1, v2, v3, v5, v4}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 83
    sget-object v1, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    return v0
.end method


# virtual methods
.method public bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    const/4 v0, 0x0

    .line 198
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    return-void
.end method

.method public bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 13

    .line 203
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    .line 205
    iget v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bufferHandle:I

    const v2, 0x8892

    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 206
    iget-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirty:Z

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    .line 207
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v4}, Ljava/nio/FloatBuffer;->limit()I

    move-result v4

    mul-int/lit8 v4, v4, 0x4

    invoke-virtual {v1, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 208
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->limit()I

    move-result v1

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v5, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->usage:I

    invoke-interface {v0, v2, v1, v4, v5}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    .line 209
    iput-boolean v3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirty:Z

    .line 212
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v0

    const/4 v1, 0x1

    if-nez p2, :cond_2

    :goto_0
    if-ge v3, v0, :cond_4

    .line 215
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {p2, v3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object p2

    .line 216
    iget-object v2, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->alias:Ljava/lang/String;

    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getAttributeLocation(Ljava/lang/String;)I

    move-result v2

    if-gez v2, :cond_1

    goto :goto_1

    .line 219
    :cond_1
    iget v4, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->unit:I

    add-int/2addr v2, v4

    .line 220
    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->enableVertexAttribute(I)V

    .line 222
    iget v7, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    iget v8, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->type:I

    iget-boolean v9, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->normalized:Z

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v10, v4, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    iget v11, p2, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    move-object v5, p1

    move v6, v2

    invoke-virtual/range {v5 .. v11}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setVertexAttribute(IIIZII)V

    .line 223
    sget-object p2, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    invoke-interface {p2, v2, v1}, Lcom/badlogic/gdx/graphics/GL30;->glVertexAttribDivisor(II)V

    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    if-ge v3, v0, :cond_4

    .line 227
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v2

    .line 228
    aget v4, p2, v3

    if-gez v4, :cond_3

    goto :goto_3

    .line 231
    :cond_3
    iget v5, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->unit:I

    add-int/2addr v4, v5

    .line 232
    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->enableVertexAttribute(I)V

    .line 234
    iget v8, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    iget v9, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->type:I

    iget-boolean v10, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->normalized:Z

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v11, v5, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    iget v12, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    move-object v6, p1

    move v7, v4

    invoke-virtual/range {v6 .. v12}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setVertexAttribute(IIIZII)V

    .line 235
    sget-object v2, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    invoke-interface {v2, v4, v1}, Lcom/badlogic/gdx/graphics/GL30;->glVertexAttribDivisor(II)V

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 238
    :cond_4
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isBound:Z

    return-void
.end method

.method public dispose()V
    .locals 3

    .line 291
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const/4 v1, 0x0

    const v2, 0x8892

    .line 292
    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 293
    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bufferHandle:I

    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/GL20;->glDeleteBuffer(I)V

    .line 294
    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bufferHandle:I

    return-void
.end method

.method public getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    return-object v0
.end method

.method public getBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    const/4 v0, 0x1

    .line 114
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirty:Z

    .line 115
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    return-object v0
.end method

.method public getBufferHandle()I
    .locals 1

    .line 303
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bufferHandle:I

    return v0
.end method

.method public getNumInstances()I
    .locals 2

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->limit()I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v1, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/2addr v0, v1

    return v0
.end method

.method public getNumMaxInstances()I
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v1, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/2addr v0, v1

    return v0
.end method

.method public invalidate()V
    .locals 1

    .line 282
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->createBufferObject()I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bufferHandle:I

    const/4 v0, 0x1

    .line 283
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirty:Z

    return-void
.end method

.method public setInstanceData(Ljava/nio/FloatBuffer;I)V
    .locals 2

    const/4 v0, 0x1

    .line 146
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirty:Z

    .line 147
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirect:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 148
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p1, v0, p2}, Lcom/badlogic/gdx/utils/BufferUtils;->copy(Ljava/nio/Buffer;Ljava/nio/Buffer;I)V

    .line 149
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 150
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->limit(I)Ljava/nio/Buffer;

    goto :goto_0

    .line 152
    :cond_0
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p2}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 153
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p2, p1}, Ljava/nio/FloatBuffer;->put(Ljava/nio/FloatBuffer;)Ljava/nio/FloatBuffer;

    .line 154
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 155
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 156
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p2}, Ljava/nio/FloatBuffer;->limit()I

    move-result p2

    shl-int/lit8 p2, p2, 0x2

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 159
    :goto_0
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bufferChanged()V

    return-void
.end method

.method public setInstanceData([FII)V
    .locals 2

    const/4 v0, 0x1

    .line 128
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirty:Z

    .line 129
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirect:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 130
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p1, v0, p3, p2}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([FLjava/nio/Buffer;II)V

    .line 131
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 132
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, p3}, Ljava/nio/FloatBuffer;->limit(I)Ljava/nio/Buffer;

    goto :goto_0

    .line 134
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->clear()Ljava/nio/Buffer;

    .line 135
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0, p1, p2, p3}, Ljava/nio/FloatBuffer;->put([FII)Ljava/nio/FloatBuffer;

    .line 136
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 137
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 138
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p2}, Ljava/nio/FloatBuffer;->limit()I

    move-result p2

    shl-int/lit8 p2, p2, 0x2

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 141
    :goto_0
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bufferChanged()V

    return-void
.end method

.method public unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    const/4 v0, 0x0

    .line 248
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    return-void
.end method

.method public unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 6

    .line 253
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    .line 254
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v1

    const/4 v2, 0x0

    if-nez p2, :cond_1

    const/4 p2, 0x0

    :goto_0
    if-ge p2, v1, :cond_3

    .line 257
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v3, p2}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v3

    .line 258
    iget-object v4, v3, Lcom/badlogic/gdx/graphics/VertexAttribute;->alias:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getAttributeLocation(Ljava/lang/String;)I

    move-result v4

    if-gez v4, :cond_0

    goto :goto_1

    .line 261
    :cond_0
    iget v3, v3, Lcom/badlogic/gdx/graphics/VertexAttribute;->unit:I

    add-int/2addr v4, v3

    .line 262
    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->disableVertexAttribute(I)V

    :goto_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    :goto_2
    if-ge v3, v1, :cond_3

    .line 266
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v4

    .line 267
    aget v5, p2, v3

    if-gez v5, :cond_2

    goto :goto_3

    .line 270
    :cond_2
    iget v4, v4, Lcom/badlogic/gdx/graphics/VertexAttribute;->unit:I

    add-int/2addr v5, v4

    .line 271
    invoke-virtual {p1, v5}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->enableVertexAttribute(I)V

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    :cond_3
    const p1, 0x8892

    .line 274
    invoke-interface {v0, p1, v2}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 275
    iput-boolean v2, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isBound:Z

    return-void
.end method

.method public updateInstanceData(ILjava/nio/FloatBuffer;II)V
    .locals 2

    const/4 v0, 0x1

    .line 178
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirty:Z

    .line 179
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirect:Z

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 181
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    mul-int/lit8 p1, p1, 0x4

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    mul-int/lit8 p3, p3, 0x4

    .line 182
    invoke-virtual {p2, p3}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 183
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p2, p1, p4}, Lcom/badlogic/gdx/utils/BufferUtils;->copy(Ljava/nio/Buffer;Ljava/nio/Buffer;I)V

    .line 184
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 188
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bufferChanged()V

    return-void

    .line 186
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Buffer must be allocated direct."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public updateInstanceData(I[FII)V
    .locals 2

    const/4 v0, 0x1

    .line 164
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirty:Z

    .line 165
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->isDirect:Z

    if-eqz v0, :cond_0

    .line 166
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 167
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    mul-int/lit8 p1, p1, 0x4

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 168
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p2, p3, p4, p1}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([FIILjava/nio/Buffer;)V

    .line 169
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 173
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/InstanceBufferObjectSubData;->bufferChanged()V

    return-void

    .line 171
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Buffer must be allocated direct."

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
