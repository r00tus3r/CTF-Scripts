.class public abstract Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;
.super Ljava/lang/Object;
.source "BaseShader.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/Shader;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;,
        Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$LocalSetter;,
        Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$GlobalSetter;,
        Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;,
        Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;
    }
.end annotation


# instance fields
.field private final attributes:Lcom/badlogic/gdx/utils/IntIntMap;

.field public camera:Lcom/badlogic/gdx/graphics/Camera;

.field private combinedAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

.field public context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

.field private currentMesh:Lcom/badlogic/gdx/graphics/Mesh;

.field private final globalUniforms:Lcom/badlogic/gdx/utils/IntArray;

.field private final localUniforms:Lcom/badlogic/gdx/utils/IntArray;

.field private locations:[I

.field public program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

.field private final setters:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;",
            ">;"
        }
    .end annotation
.end field

.field private final tempArray:Lcom/badlogic/gdx/utils/IntArray;

.field private final uniforms:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final validators:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->uniforms:Lcom/badlogic/gdx/utils/Array;

    .line 103
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->validators:Lcom/badlogic/gdx/utils/Array;

    .line 104
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->setters:Lcom/badlogic/gdx/utils/Array;

    .line 106
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->globalUniforms:Lcom/badlogic/gdx/utils/IntArray;

    .line 107
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->localUniforms:Lcom/badlogic/gdx/utils/IntArray;

    .line 108
    new-instance v0, Lcom/badlogic/gdx/utils/IntIntMap;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntIntMap;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->attributes:Lcom/badlogic/gdx/utils/IntIntMap;

    .line 213
    new-instance v0, Lcom/badlogic/gdx/utils/IntArray;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/IntArray;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->tempArray:Lcom/badlogic/gdx/utils/IntArray;

    .line 225
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/Attributes;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/Attributes;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->combinedAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

    return-void
.end method

.method private final getAttributeLocations(Lcom/badlogic/gdx/graphics/VertexAttributes;)[I
    .locals 6

    .line 216
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->tempArray:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    .line 217
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 219
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->tempArray:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->attributes:Lcom/badlogic/gdx/utils/IntIntMap;

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v4

    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/VertexAttribute;->getKey()I

    move-result v4

    const/4 v5, -0x1

    invoke-virtual {v3, v4, v5}, Lcom/badlogic/gdx/utils/IntIntMap;->get(II)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 221
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->tempArray:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/IntArray;->shrink()[I

    .line 222
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->tempArray:Lcom/badlogic/gdx/utils/IntArray;

    iget-object p1, p1, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    return-object p1
.end method


# virtual methods
.method public begin(Lcom/badlogic/gdx/graphics/Camera;Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;)V
    .locals 2

    .line 205
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->camera:Lcom/badlogic/gdx/graphics/Camera;

    .line 206
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    .line 207
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->begin()V

    const/4 p1, 0x0

    .line 208
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->currentMesh:Lcom/badlogic/gdx/graphics/Mesh;

    const/4 p2, 0x0

    .line 209
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->globalUniforms:Lcom/badlogic/gdx/utils/IntArray;

    iget v0, v0, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-ge p2, v0, :cond_1

    .line 210
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->setters:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->globalUniforms:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v1, p2}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->setters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-interface {v0, p0, v1, p1, p1}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;->set(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;ILcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V

    :cond_0
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public dispose()V
    .locals 2

    const/4 v0, 0x0

    .line 258
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 259
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->uniforms:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 260
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->validators:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 261
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->setters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 262
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->localUniforms:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    .line 263
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->globalUniforms:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/IntArray;->clear()V

    .line 264
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    return-void
.end method

.method public end()V
    .locals 3

    .line 249
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->currentMesh:Lcom/badlogic/gdx/graphics/Mesh;

    if-eqz v0, :cond_0

    .line 250
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->tempArray:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v2, v2, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/Mesh;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    const/4 v0, 0x0

    .line 251
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->currentMesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 253
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->end()V

    return-void
.end method

.method public getUniformAlias(I)Ljava/lang/String;
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->uniforms:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getUniformID(Ljava/lang/String;)I
    .locals 3

    .line 153
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->uniforms:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_1

    .line 155
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->uniforms:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public final has(I)Z
    .locals 2

    if-ltz p1, :cond_0

    .line 269
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    array-length v1, v0

    if-ge p1, v1, :cond_0

    aget p1, v0, p1

    if-ltz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public init(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;Lcom/badlogic/gdx/graphics/g3d/Renderable;)V
    .locals 6

    .line 166
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    if-nez v0, :cond_8

    .line 167
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->isCompiled()Z

    move-result v0

    if-eqz v0, :cond_7

    .line 168
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 170
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->uniforms:Lcom/badlogic/gdx/utils/Array;

    iget v0, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    .line 171
    new-array v1, v0, [I

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_4

    .line 173
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->uniforms:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 174
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->validators:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v4, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;

    .line 175
    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->setters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v5, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    if-eqz v4, :cond_0

    .line 176
    invoke-interface {v4, p0, v2, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;->validate(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;ILcom/badlogic/gdx/graphics/g3d/Renderable;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 177
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    const/4 v4, -0x1

    aput v4, v3, v2

    goto :goto_1

    .line 179
    :cond_0
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    invoke-virtual {p1, v3, v1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->fetchUniformLocation(Ljava/lang/String;Z)I

    move-result v3

    aput v3, v4, v2

    .line 180
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v3, v3, v2

    if-ltz v3, :cond_2

    if-eqz v5, :cond_2

    .line 181
    invoke-interface {v5, p0, v2}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;->isGlobal(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 182
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->globalUniforms:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    goto :goto_1

    .line 184
    :cond_1
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->localUniforms:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v3, v2}, Lcom/badlogic/gdx/utils/IntArray;->add(I)V

    .line 187
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v3, v3, v2

    if-gez v3, :cond_3

    .line 188
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->validators:Lcom/badlogic/gdx/utils/Array;

    const/4 v4, 0x0

    invoke-virtual {v3, v2, v4}, Lcom/badlogic/gdx/utils/Array;->set(ILjava/lang/Object;)V

    .line 189
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->setters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v2, v4}, Lcom/badlogic/gdx/utils/Array;->set(ILjava/lang/Object;)V

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_4
    if-eqz p2, :cond_6

    .line 193
    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object p2

    .line 194
    invoke-virtual {p2}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v0

    :goto_2
    if-ge v1, v0, :cond_6

    .line 196
    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v2

    .line 197
    iget-object v3, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->alias:Ljava/lang/String;

    invoke-virtual {p1, v3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getAttributeLocation(Ljava/lang/String;)I

    move-result v3

    if-ltz v3, :cond_5

    .line 198
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->attributes:Lcom/badlogic/gdx/utils/IntIntMap;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/VertexAttribute;->getKey()I

    move-result v2

    invoke-virtual {v4, v2, v3}, Lcom/badlogic/gdx/utils/IntIntMap;->put(II)V

    :cond_5
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_6
    return-void

    .line 167
    :cond_7
    new-instance p2, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->getLog()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 166
    :cond_8
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Already initialized"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public final loc(I)I
    .locals 2

    if-ltz p1, :cond_0

    .line 273
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    array-length v1, v0

    if-ge p1, v1, :cond_0

    aget p1, v0, p1

    goto :goto_0

    :cond_0
    const/4 p1, -0x1

    :goto_0
    return p1
.end method

.method public register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;)I
    .locals 1

    const/4 v0, 0x0

    .line 148
    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    move-result p1

    return p1
.end method

.method public register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I
    .locals 1

    .line 144
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;->alias:Ljava/lang/String;

    invoke-virtual {p0, v0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->register(Ljava/lang/String;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    move-result p1

    return p1
.end method

.method public register(Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x0

    .line 140
    invoke-virtual {p0, p1, v0, v0}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->register(Ljava/lang/String;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    move-result p1

    return p1
.end method

.method public register(Ljava/lang/String;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I
    .locals 1

    const/4 v0, 0x0

    .line 136
    invoke-virtual {p0, p1, v0, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->register(Ljava/lang/String;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    move-result p1

    return p1
.end method

.method public register(Ljava/lang/String;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;)I
    .locals 1

    const/4 v0, 0x0

    .line 132
    invoke-virtual {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->register(Ljava/lang/String;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    move-result p1

    return p1
.end method

.method public register(Ljava/lang/String;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Validator;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I
    .locals 1

    .line 118
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    if-nez v0, :cond_1

    .line 119
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->getUniformID(Ljava/lang/String;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 121
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->validators:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0, p2}, Lcom/badlogic/gdx/utils/Array;->set(ILjava/lang/Object;)V

    .line 122
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->setters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v0, p3}, Lcom/badlogic/gdx/utils/Array;->set(ILjava/lang/Object;)V

    return v0

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->uniforms:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 126
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->validators:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 127
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->setters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 128
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->uniforms:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    add-int/lit8 p1, p1, -0x1

    return p1

    .line 118
    :cond_1
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Cannot register an uniform after initialization"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public render(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V
    .locals 2

    .line 229
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->worldTransform:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Matrix4;->det3x3()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-nez v0, :cond_0

    return-void

    .line 230
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->combinedAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->clear()V

    .line 231
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->combinedAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->set(Ljava/lang/Iterable;)V

    .line 232
    :cond_1
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->combinedAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->set(Ljava/lang/Iterable;)V

    .line 233
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->combinedAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

    invoke-virtual {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->render(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V

    return-void
.end method

.method public render(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V
    .locals 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 237
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->localUniforms:Lcom/badlogic/gdx/utils/IntArray;

    iget v2, v2, Lcom/badlogic/gdx/utils/IntArray;->size:I

    if-ge v1, v2, :cond_1

    .line 238
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->setters:Lcom/badlogic/gdx/utils/Array;

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->localUniforms:Lcom/badlogic/gdx/utils/IntArray;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/utils/IntArray;->get(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->setters:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-interface {v2, p0, v3, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;->set(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;ILcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 239
    :cond_1
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->currentMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v1, v1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    if-eq p2, v1, :cond_3

    .line 240
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->currentMesh:Lcom/badlogic/gdx/graphics/Mesh;

    if-eqz p2, :cond_2

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->tempArray:Lcom/badlogic/gdx/utils/IntArray;

    iget-object v2, v2, Lcom/badlogic/gdx/utils/IntArray;->items:[I

    invoke-virtual {p2, v1, v2}, Lcom/badlogic/gdx/graphics/Mesh;->unbind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    .line 241
    :cond_2
    iget-object p2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->currentMesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 242
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->currentMesh:Lcom/badlogic/gdx/graphics/Mesh;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    iget-object v2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v2

    invoke-direct {p0, v2}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->getAttributeLocations(Lcom/badlogic/gdx/graphics/VertexAttributes;)[I

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Lcom/badlogic/gdx/graphics/Mesh;->bind(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;[I)V

    .line 244
    :cond_3
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->render(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;Z)V

    return-void
.end method

.method public final set(IF)Z
    .locals 2

    .line 307
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 308
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(IF)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(IFF)Z
    .locals 2

    .line 313
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 314
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(IFF)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(IFFF)Z
    .locals 2

    .line 319
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 320
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(IFFF)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(IFFFF)Z
    .locals 6

    .line 325
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 326
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    move-object v0, v1

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(IFFFF)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(II)Z
    .locals 2

    .line 331
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 332
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(II)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(III)Z
    .locals 2

    .line 337
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 338
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(III)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(IIII)Z
    .locals 2

    .line 343
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 344
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(IIII)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(IIIII)Z
    .locals 6

    .line 349
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 350
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    move-object v0, v1

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(IIIII)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(ILcom/badlogic/gdx/graphics/Color;)Z
    .locals 2

    .line 301
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 302
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(ILcom/badlogic/gdx/graphics/Color;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(ILcom/badlogic/gdx/graphics/GLTexture;)Z
    .locals 2

    .line 361
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 362
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->textureBinder:Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;

    invoke-interface {v0, p2}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;->bind(Lcom/badlogic/gdx/graphics/GLTexture;)I

    move-result p2

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(II)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(ILcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;)Z
    .locals 2

    .line 355
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 356
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->textureBinder:Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;

    invoke-interface {v0, p2}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureBinder;->bind(Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;)I

    move-result p2

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformi(II)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(ILcom/badlogic/gdx/math/Matrix3;)Z
    .locals 2

    .line 283
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 284
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(ILcom/badlogic/gdx/math/Matrix3;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(ILcom/badlogic/gdx/math/Matrix4;)Z
    .locals 2

    .line 277
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 278
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformMatrix(ILcom/badlogic/gdx/math/Matrix4;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(ILcom/badlogic/gdx/math/Vector2;)Z
    .locals 2

    .line 295
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 296
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(ILcom/badlogic/gdx/math/Vector2;)V

    const/4 p1, 0x1

    return p1
.end method

.method public final set(ILcom/badlogic/gdx/math/Vector3;)Z
    .locals 2

    .line 289
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->locations:[I

    aget v1, v0, p1

    if-gez v1, :cond_0

    const/4 p1, 0x0

    return p1

    .line 290
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    aget p1, v0, p1

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniformf(ILcom/badlogic/gdx/math/Vector3;)V

    const/4 p1, 0x1

    return p1
.end method
