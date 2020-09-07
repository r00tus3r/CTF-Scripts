.class public Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;
.super Ljava/lang/Object;
.source "VertexBufferObjectWithVAO.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/glutils/VertexData;


# static fields
.field static final tmpHandle:Ljava/nio/IntBuffer;


# instance fields
.field final attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

.field final buffer:Ljava/nio/FloatBuffer;

.field bufferHandle:I

.field final byteBuffer:Ljava/nio/ByteBuffer;

.field cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

.field isBound:Z

.field isDirty:Z

.field final isStatic:Z

.field final ownsBuffer:Z

.field final usage:I

.field vaoHandle:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/4 v0, 0x1

    .line 36
    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->newIntBuffer(I)Ljava/nio/IntBuffer;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->tmpHandle:Ljava/nio/IntBuffer;

    return-void
.end method

.method public constructor <init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 1

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isDirty:Z

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isBound:Z

    const/4 v0, -0x1

    .line 47
    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->vaoHandle:I

    .line 48
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    .line 70
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isStatic:Z

    .line 71
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    .line 73
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget p3, p3, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    mul-int p3, p3, p2

    invoke-static {p3}, Lcom/badlogic/gdx/utils/BufferUtils;->newUnsafeByteBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 74
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->buffer:Ljava/nio/FloatBuffer;

    const/4 p2, 0x1

    .line 75
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->ownsBuffer:Z

    .line 76
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p2}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 77
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 78
    sget-object p2, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {p2}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result p2

    iput p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bufferHandle:I

    if-eqz p1, :cond_0

    const p1, 0x88e4

    goto :goto_0

    :cond_0
    const p1, 0x88e8

    .line 79
    :goto_0
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->usage:I

    .line 80
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->createVAO()V

    return-void
.end method

.method public varargs constructor <init>(ZI[Lcom/badlogic/gdx/graphics/VertexAttribute;)V
    .locals 1

    .line 59
    new-instance v0, Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-direct {v0, p3}, Lcom/badlogic/gdx/graphics/VertexAttributes;-><init>([Lcom/badlogic/gdx/graphics/VertexAttribute;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;-><init>(ZILcom/badlogic/gdx/graphics/VertexAttributes;)V

    return-void
.end method

.method public constructor <init>(ZLjava/nio/ByteBuffer;Lcom/badlogic/gdx/graphics/VertexAttributes;)V
    .locals 2

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isDirty:Z

    .line 46
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isBound:Z

    const/4 v1, -0x1

    .line 47
    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->vaoHandle:I

    .line 48
    new-instance v1, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v1}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    .line 84
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isStatic:Z

    .line 85
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    .line 87
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    .line 88
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->ownsBuffer:Z

    .line 89
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->asFloatBuffer()Ljava/nio/FloatBuffer;

    move-result-object p2

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->buffer:Ljava/nio/FloatBuffer;

    .line 90
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p2}, Ljava/nio/FloatBuffer;->flip()Ljava/nio/Buffer;

    .line 91
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 92
    sget-object p2, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    invoke-interface {p2}, Lcom/badlogic/gdx/graphics/GL20;->glGenBuffer()I

    move-result p2

    iput p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bufferHandle:I

    if-eqz p1, :cond_0

    const p1, 0x88e4

    goto :goto_0

    :cond_0
    const p1, 0x88e8

    .line 93
    :goto_0
    iput p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->usage:I

    .line 94
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->createVAO()V

    return-void
.end method

.method private bindAttributes(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 11

    .line 170
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 171
    :goto_0
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v3

    if-eqz v0, :cond_5

    if-nez p2, :cond_2

    const/4 v4, 0x0

    :goto_1
    if-eqz v0, :cond_5

    if-ge v4, v3, :cond_5

    .line 176
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0, v4}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    .line 177
    iget-object v0, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->alias:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getAttributeLocation(Ljava/lang/String;)I

    move-result v0

    .line 178
    iget-object v5, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v5, v4}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v5

    if-ne v0, v5, :cond_1

    const/4 v0, 0x1

    goto :goto_2

    :cond_1
    const/4 v0, 0x0

    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 181
    :cond_2
    array-length v0, p2

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    iget v4, v4, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-ne v0, v4, :cond_3

    const/4 v0, 0x1

    goto :goto_3

    :cond_3
    const/4 v0, 0x0

    :goto_3
    const/4 v4, 0x0

    :goto_4
    if-eqz v0, :cond_5

    if-ge v4, v3, :cond_5

    .line 183
    aget v0, p2, v4

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v5, v4}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v5

    if-ne v0, v5, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, 0x0

    :goto_5
    add-int/lit8 v4, v4, 0x1

    goto :goto_4

    :cond_5
    if-nez v0, :cond_8

    .line 189
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl:Lcom/badlogic/gdx/graphics/GL20;

    const v1, 0x8892

    iget v4, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bufferHandle:I

    invoke-interface {v0, v1, v4}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 190
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->unbindAttributes(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    .line 191
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    :goto_6
    if-ge v2, v3, :cond_8

    .line 194
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v0

    if-nez p2, :cond_6

    .line 196
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v4, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->alias:Ljava/lang/String;

    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getAttributeLocation(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    goto :goto_7

    .line 198
    :cond_6
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    aget v4, p2, v2

    invoke-virtual {v1, v4}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 201
    :goto_7
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v5

    if-gez v5, :cond_7

    goto :goto_8

    .line 206
    :cond_7
    invoke-virtual {p1, v5}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->enableVertexAttribute(I)V

    .line 207
    iget v6, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->numComponents:I

    iget v7, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->type:I

    iget-boolean v8, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->normalized:Z

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v9, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    iget v10, v0, Lcom/badlogic/gdx/graphics/VertexAttribute;->offset:I

    move-object v4, p1

    invoke-virtual/range {v4 .. v10}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setVertexAttribute(IIIZII)V

    :goto_8
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_8
    return-void
.end method

.method private bindData(Lcom/badlogic/gdx/graphics/GL20;)V
    .locals 4

    .line 227
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isDirty:Z

    if-eqz v0, :cond_0

    .line 228
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bufferHandle:I

    const v1, 0x8892

    invoke-interface {p1, v1, v0}, Lcom/badlogic/gdx/graphics/GL20;->glBindBuffer(II)V

    .line 229
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v2}, Ljava/nio/FloatBuffer;->limit()I

    move-result v2

    mul-int/lit8 v2, v2, 0x4

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 230
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v3, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->usage:I

    invoke-interface {p1, v1, v0, v2, v3}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    const/4 p1, 0x0

    .line 231
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isDirty:Z

    :cond_0
    return-void
.end method

.method private bufferChanged()V
    .locals 5

    .line 119
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isBound:Z

    if-eqz v0, :cond_0

    .line 120
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl20:Lcom/badlogic/gdx/graphics/GL20;

    const v1, 0x8892

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v2

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    iget v4, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->usage:I

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/graphics/GL20;->glBufferData(IILjava/nio/Buffer;I)V

    const/4 v0, 0x0

    .line 121
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isDirty:Z

    :cond_0
    return-void
.end method

.method private createVAO()V
    .locals 3

    .line 279
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->tmpHandle:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->clear()Ljava/nio/Buffer;

    .line 280
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->tmpHandle:Ljava/nio/IntBuffer;

    const/4 v2, 0x1

    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL30;->glGenVertexArrays(ILjava/nio/IntBuffer;)V

    .line 281
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->tmpHandle:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->get()I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->vaoHandle:I

    return-void
.end method

.method private deleteVAO()V
    .locals 4

    .line 285
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->vaoHandle:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 286
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->tmpHandle:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->clear()Ljava/nio/Buffer;

    .line 287
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->tmpHandle:Ljava/nio/IntBuffer;

    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->vaoHandle:I

    invoke-virtual {v0, v2}, Ljava/nio/IntBuffer;->put(I)Ljava/nio/IntBuffer;

    .line 288
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->tmpHandle:Ljava/nio/IntBuffer;

    invoke-virtual {v0}, Ljava/nio/IntBuffer;->flip()Ljava/nio/Buffer;

    .line 289
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    const/4 v2, 0x1

    sget-object v3, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->tmpHandle:Ljava/nio/IntBuffer;

    invoke-interface {v0, v2, v3}, Lcom/badlogic/gdx/graphics/GL30;->glDeleteVertexArrays(ILjava/nio/IntBuffer;)V

    .line 290
    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->vaoHandle:I

    :cond_0
    return-void
.end method

.method private unbindAttributes(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 3

    .line 213
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-nez v0, :cond_0

    return-void

    .line 216
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 218
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->cachedLocations:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v2

    if-gez v2, :cond_1

    goto :goto_1

    .line 222
    :cond_1
    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->disableVertexAttribute(I)V

    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method public bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    const/4 v0, 0x0

    .line 152
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    return-void
.end method

.method public bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 2

    .line 157
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    .line 159
    iget v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->vaoHandle:I

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/GL30;->glBindVertexArray(I)V

    .line 161
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bindAttributes(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    .line 164
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bindData(Lcom/badlogic/gdx/graphics/GL20;)V

    const/4 p1, 0x1

    .line 166
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isBound:Z

    return-void
.end method

.method public dispose()V
    .locals 3

    .line 267
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    const/4 v1, 0x0

    const v2, 0x8892

    .line 269
    invoke-interface {v0, v2, v1}, Lcom/badlogic/gdx/graphics/GL30;->glBindBuffer(II)V

    .line 270
    iget v2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bufferHandle:I

    invoke-interface {v0, v2}, Lcom/badlogic/gdx/graphics/GL30;->glDeleteBuffer(I)V

    .line 271
    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bufferHandle:I

    .line 272
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->ownsBuffer:Z

    if-eqz v0, :cond_0

    .line 273
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lcom/badlogic/gdx/utils/BufferUtils;->disposeUnsafeByteBuffer(Ljava/nio/ByteBuffer;)V

    .line 275
    :cond_0
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->deleteVAO()V

    return-void
.end method

.method public getAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    return-object v0
.end method

.method public getBuffer()Ljava/nio/FloatBuffer;
    .locals 1

    const/4 v0, 0x1

    .line 114
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isDirty:Z

    .line 115
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->buffer:Ljava/nio/FloatBuffer;

    return-object v0
.end method

.method public getNumMaxVertices()I
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v1, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/2addr v0, v1

    return v0
.end method

.method public getNumVertices()I
    .locals 2

    .line 104
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {v0}, Ljava/nio/FloatBuffer;->limit()I

    move-result v0

    mul-int/lit8 v0, v0, 0x4

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->attributes:Lcom/badlogic/gdx/graphics/VertexAttributes;

    iget v1, v1, Lcom/badlogic/gdx/graphics/VertexAttributes;->vertexSize:I

    div-int/2addr v0, v1

    return v0
.end method

.method public invalidate()V
    .locals 1

    .line 257
    sget-object v0, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/GL30;->glGenBuffer()I

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bufferHandle:I

    .line 258
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->createVAO()V

    const/4 v0, 0x1

    .line 259
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isDirty:Z

    return-void
.end method

.method public setVertices([FII)V
    .locals 1

    const/4 v0, 0x1

    .line 127
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isDirty:Z

    .line 128
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p1, v0, p3, p2}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([FLjava/nio/Buffer;II)V

    .line 129
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->buffer:Ljava/nio/FloatBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 130
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->buffer:Ljava/nio/FloatBuffer;

    invoke-virtual {p1, p3}, Ljava/nio/FloatBuffer;->limit(I)Ljava/nio/Buffer;

    .line 131
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bufferChanged()V

    return-void
.end method

.method public unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 1

    const/4 v0, 0x0

    .line 242
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    return-void
.end method

.method public unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V
    .locals 0

    .line 247
    sget-object p1, Lcom/badlogic/gdx/Gdx;->gl30:Lcom/badlogic/gdx/graphics/GL30;

    const/4 p2, 0x0

    .line 248
    invoke-interface {p1, p2}, Lcom/badlogic/gdx/graphics/GL30;->glBindVertexArray(I)V

    .line 249
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isBound:Z

    return-void
.end method

.method public updateVertices(I[FII)V
    .locals 2

    const/4 v0, 0x1

    .line 136
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->isDirty:Z

    .line 137
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    .line 138
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    mul-int/lit8 p1, p1, 0x4

    invoke-virtual {v1, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 139
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-static {p2, p3, p4, p1}, Lcom/badlogic/gdx/utils/BufferUtils;->copy([FIILjava/nio/Buffer;)V

    .line 140
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->byteBuffer:Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 141
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->buffer:Ljava/nio/FloatBuffer;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Ljava/nio/FloatBuffer;->position(I)Ljava/nio/Buffer;

    .line 142
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/glutils/VertexBufferObjectWithVAO;->bufferChanged()V

    return-void
.end method
