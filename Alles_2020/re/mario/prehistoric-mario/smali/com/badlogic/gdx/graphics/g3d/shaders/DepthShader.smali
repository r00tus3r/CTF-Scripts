.class public Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;
.super Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader;
.source "DepthShader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;
    }
.end annotation


# static fields
.field private static defaultFragmentShader:Ljava/lang/String;

.field private static defaultVertexShader:Ljava/lang/String;

.field private static final tmpAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;


# instance fields
.field private final alphaTestAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;

.field public final numBones:I

.field public final weights:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 156
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/Attributes;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/Attributes;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->tmpAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V
    .locals 1

    .line 74
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;)V
    .locals 1

    .line 78
    invoke-static {p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->createPrefix(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 5

    .line 92
    invoke-direct {p0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    .line 93
    invoke-static {p1}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->combineAttributes(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Attributes;

    .line 94
    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->bones:[Lcom/badlogic/gdx/math/Matrix4;

    const/4 v0, 0x0

    if-nez p3, :cond_0

    const/4 p3, 0x0

    goto :goto_0

    :cond_0
    iget p3, p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;->numBones:I

    :goto_0
    iput p3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->numBones:I

    .line 96
    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p3, p3, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object p3

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result p3

    const/4 v1, 0x0

    :goto_1
    if-ge v0, p3, :cond_2

    .line 98
    iget-object v2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v2

    .line 99
    iget v3, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->usage:I

    const/16 v4, 0x40

    if-ne v3, v4, :cond_1

    iget v2, v2, Lcom/badlogic/gdx/graphics/VertexAttribute;->unit:I

    const/4 v3, 0x1

    shl-int v2, v3, v2

    or-int/2addr v1, v2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 101
    :cond_2
    iput v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->weights:I

    .line 102
    new-instance p1, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;

    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->AlphaTest:J

    iget p2, p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;->defaultAlphaTest:F

    invoke-direct {p1, v0, v1, p2}, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;-><init>(JF)V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->alphaTestAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;Ljava/lang/String;)V
    .locals 7

    .line 82
    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;->vertexShader:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;->vertexShader:Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->getDefaultVertexShader()Ljava/lang/String;

    move-result-object v0

    :goto_0
    move-object v5, v0

    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;->fragmentShader:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;->fragmentShader:Ljava/lang/String;

    goto :goto_1

    .line 83
    :cond_1
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->getDefaultFragmentShader()Ljava/lang/String;

    move-result-object v0

    :goto_1
    move-object v6, v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    .line 82
    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 88
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {v0, p4, p3}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    return-void
.end method

.method private static final combineAttributes(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Attributes;
    .locals 2

    .line 159
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->tmpAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->clear()V

    .line 160
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->tmpAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->set(Ljava/lang/Iterable;)V

    .line 161
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    if-eqz v0, :cond_1

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->tmpAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

    iget-object p0, p0, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-virtual {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->set(Ljava/lang/Iterable;)V

    .line 162
    :cond_1
    sget-object p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->tmpAttributes:Lcom/badlogic/gdx/graphics/g3d/Attributes;

    return-object p0
.end method

.method public static createPrefix(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;)Ljava/lang/String;
    .locals 0

    .line 64
    invoke-static {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader;->createPrefix(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Config;)Ljava/lang/String;

    move-result-object p0

    .line 65
    iget-boolean p1, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader$Config;->depthBufferOnly:Z

    if-nez p1, :cond_0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "#define PackedDepthFlag\n"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static final getDefaultFragmentShader()Ljava/lang/String;
    .locals 2

    .line 58
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->defaultFragmentShader:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 59
    sget-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    const-string v1, "com/badlogic/gdx/graphics/g3d/shaders/depth.fragment.glsl"

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Files;->classpath(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->defaultFragmentShader:Ljava/lang/String;

    .line 60
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->defaultFragmentShader:Ljava/lang/String;

    return-object v0
.end method

.method public static final getDefaultVertexShader()Ljava/lang/String;
    .locals 2

    .line 50
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->defaultVertexShader:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 51
    sget-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    const-string v1, "com/badlogic/gdx/graphics/g3d/shaders/depth.vertex.glsl"

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Files;->classpath(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->defaultVertexShader:Ljava/lang/String;

    .line 52
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->defaultVertexShader:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public begin(Lcom/badlogic/gdx/graphics/Camera;Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;)V
    .locals 0

    .line 107
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader;->begin(Lcom/badlogic/gdx/graphics/Camera;Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;)V

    return-void
.end method

.method public canRender(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Z
    .locals 8

    .line 120
    invoke-static {p1}, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->combineAttributes(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Lcom/badlogic/gdx/graphics/g3d/Attributes;

    move-result-object v0

    .line 121
    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->has(J)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    .line 122
    iget-wide v4, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->attributesMask:J

    sget-wide v6, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    and-long/2addr v4, v6

    sget-wide v6, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    cmp-long v1, v4, v6

    if-eqz v1, :cond_0

    return v3

    .line 124
    :cond_0
    sget-wide v4, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Diffuse:J

    invoke-virtual {v0, v4, v5}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->has(J)Z

    move-result v0

    iget-wide v4, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->attributesMask:J

    sget-wide v6, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Diffuse:J

    and-long/2addr v4, v6

    sget-wide v6, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Diffuse:J

    cmp-long v1, v4, v6

    if-nez v1, :cond_1

    const/4 v1, 0x1

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    if-eq v0, v1, :cond_2

    return v3

    .line 127
    :cond_2
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/VertexAttributes;->getMask()J

    move-result-wide v0

    const-wide/16 v4, 0x40

    and-long/2addr v0, v4

    cmp-long v6, v0, v4

    if-nez v6, :cond_3

    const/4 v0, 0x1

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    .line 128
    :goto_1
    iget v1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->numBones:I

    if-lez v1, :cond_4

    const/4 v1, 0x1

    goto :goto_2

    :cond_4
    const/4 v1, 0x0

    :goto_2
    if-eq v0, v1, :cond_5

    return v3

    :cond_5
    if-nez v0, :cond_6

    return v2

    .line 131
    :cond_6
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/VertexAttributes;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v4, 0x0

    :goto_3
    if-ge v1, v0, :cond_8

    .line 133
    iget-object v5, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object v5, v5, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->get(I)Lcom/badlogic/gdx/graphics/VertexAttribute;

    move-result-object v5

    .line 134
    iget v6, v5, Lcom/badlogic/gdx/graphics/VertexAttribute;->usage:I

    const/16 v7, 0x40

    if-ne v6, v7, :cond_7

    iget v5, v5, Lcom/badlogic/gdx/graphics/VertexAttribute;->unit:I

    shl-int v5, v2, v5

    or-int/2addr v4, v5

    :cond_7
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 136
    :cond_8
    iget p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->weights:I

    if-ne v4, p1, :cond_9

    goto :goto_4

    :cond_9
    const/4 v2, 0x0

    :goto_4
    return v2
.end method

.method public end()V
    .locals 0

    .line 114
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader;->end()V

    return-void
.end method

.method public render(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V
    .locals 5

    .line 141
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    invoke-virtual {p2, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->has(J)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 142
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    invoke-virtual {p2, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    .line 143
    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    invoke-virtual {p2, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->remove(J)V

    .line 144
    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->AlphaTest:J

    invoke-virtual {p2, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->has(J)Z

    move-result v1

    if-nez v1, :cond_0

    .line 146
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DepthShader;->alphaTestAttribute:Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;

    invoke-virtual {p2, v2}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 147
    :cond_0
    iget v2, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->opacity:F

    sget-wide v3, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->AlphaTest:J

    invoke-virtual {p2, v3, v4}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;

    iget v3, v3, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->value:F

    cmpl-float v2, v2, v3

    if-ltz v2, :cond_1

    .line 148
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader;->render(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V

    :cond_1
    if-nez v1, :cond_2

    .line 150
    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/FloatAttribute;->AlphaTest:J

    invoke-virtual {p2, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->remove(J)V

    .line 151
    :cond_2
    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    goto :goto_0

    .line 153
    :cond_3
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader;->render(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V

    :goto_0
    return-void
.end method
