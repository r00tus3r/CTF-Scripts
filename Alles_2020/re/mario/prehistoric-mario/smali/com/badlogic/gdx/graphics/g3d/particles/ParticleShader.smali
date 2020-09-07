.class public Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;
.super Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;
.source "ParticleShader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Setters;,
        Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Inputs;,
        Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;,
        Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;,
        Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$ParticleType;
    }
.end annotation


# static fields
.field static final TMP_VECTOR3:Lcom/badlogic/gdx/math/Vector3;

.field private static defaultFragmentShader:Ljava/lang/String;

.field private static defaultVertexShader:Ljava/lang/String;

.field protected static implementedFlags:J

.field private static final optionalAttributes:J


# instance fields
.field protected final config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

.field currentMaterial:Lcom/badlogic/gdx/graphics/g3d/Material;

.field private materialMask:J

.field private renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

.field private vertexMask:J


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 104
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/TextureAttribute;->Diffuse:J

    or-long/2addr v0, v2

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->implementedFlags:J

    .line 106
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->TMP_VECTOR3:Lcom/badlogic/gdx/math/Vector3;

    .line 195
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/IntAttribute;->CullFace:J

    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->Type:J

    or-long/2addr v0, v2

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->optionalAttributes:J

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V
    .locals 1

    .line 198
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;-><init>()V

    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;)V
    .locals 1

    .line 202
    invoke-static {p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->createPrefix(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 4

    .line 215
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;-><init>()V

    .line 216
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    .line 217
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 218
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    .line 219
    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g3d/Material;->getMask()J

    move-result-wide v0

    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->optionalAttributes:J

    or-long/2addr v0, v2

    iput-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->materialMask:J

    .line 220
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->getMask()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->vertexMask:J

    .line 222
    iget-boolean p1, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->ignoreUnimplemented:Z

    if-nez p1, :cond_1

    sget-wide p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->implementedFlags:J

    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->materialMask:J

    and-long/2addr p1, v0

    cmp-long p3, p1, v0

    if-nez p3, :cond_0

    goto :goto_0

    .line 223
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Some attributes not implemented yet ("

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->materialMask:J

    invoke-virtual {p2, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p3, ")"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 226
    :cond_1
    :goto_0
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Inputs;->viewTrans:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters;->viewTrans:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    .line 227
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Inputs;->projViewTrans:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters;->projViewTrans:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    .line 228
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Inputs;->projTrans:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters;->projTrans:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    .line 229
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Inputs;->screenWidth:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Setters;->screenWidth:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    .line 230
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Inputs;->cameraUp:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Setters;->cameraUp:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    .line 231
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Inputs;->cameraRight:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Setters;->cameraRight:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    .line 232
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Inputs;->cameraInvDirection:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Setters;->cameraInvDirection:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    .line 233
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Inputs;->cameraPosition:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Setters;->cameraPosition:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    .line 236
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Inputs;->diffuseTexture:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters;->diffuseTexture:Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->register(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Uniform;Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$Setter;)I

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;Ljava/lang/String;)V
    .locals 7

    .line 206
    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->vertexShader:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->vertexShader:Ljava/lang/String;

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->getDefaultVertexShader()Ljava/lang/String;

    move-result-object v0

    :goto_0
    move-object v5, v0

    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->fragmentShader:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->fragmentShader:Ljava/lang/String;

    goto :goto_1

    .line 207
    :cond_1
    invoke-static {}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->getDefaultFragmentShader()Ljava/lang/String;

    move-result-object v0

    :goto_1
    move-object v6, v0

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    .line 206
    invoke-direct/range {v1 .. v6}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 212
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

    invoke-direct {p0, p1, p2, v0}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;-><init>(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    return-void
.end method

.method public static createPrefix(Lcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;)Ljava/lang/String;
    .locals 2

    .line 249
    sget-object p0, Lcom/badlogic/gdx/Gdx;->app:Lcom/badlogic/gdx/Application;

    invoke-interface {p0}, Lcom/badlogic/gdx/Application;->getType()Lcom/badlogic/gdx/Application$ApplicationType;

    move-result-object p0

    sget-object v0, Lcom/badlogic/gdx/Application$ApplicationType;->Desktop:Lcom/badlogic/gdx/Application$ApplicationType;

    const-string v1, ""

    if-ne p0, v0, :cond_0

    .line 250
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "#version 120\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 252
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "#version 100\n"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 253
    :goto_0
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->type:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$ParticleType;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$ParticleType;->Billboard:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$ParticleType;

    if-ne v0, v1, :cond_2

    .line 254
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "#define billboard\n"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 255
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->align:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    sget-object v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;->Screen:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    if-ne v0, v1, :cond_1

    .line 256
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "#define screenFacing\n"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_1

    .line 257
    :cond_1
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->align:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;->ViewPoint:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$AlignMode;

    if-ne p1, v0, :cond_2

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "#define viewPointFacing\n"

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :cond_2
    :goto_1
    return-object p0
.end method

.method public static getDefaultFragmentShader()Ljava/lang/String;
    .locals 2

    .line 98
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->defaultFragmentShader:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 99
    sget-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    const-string v1, "com/badlogic/gdx/graphics/g3d/particles/particles.fragment.glsl"

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Files;->classpath(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    .line 100
    invoke-virtual {v0}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->defaultFragmentShader:Ljava/lang/String;

    .line 101
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->defaultFragmentShader:Ljava/lang/String;

    return-object v0
.end method

.method public static getDefaultVertexShader()Ljava/lang/String;
    .locals 2

    .line 90
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->defaultVertexShader:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 91
    sget-object v0, Lcom/badlogic/gdx/Gdx;->files:Lcom/badlogic/gdx/Files;

    const-string v1, "com/badlogic/gdx/graphics/g3d/particles/particles.vertex.glsl"

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/Files;->classpath(Ljava/lang/String;)Lcom/badlogic/gdx/files/FileHandle;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/files/FileHandle;->readString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->defaultVertexShader:Ljava/lang/String;

    .line 92
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->defaultVertexShader:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method public begin(Lcom/badlogic/gdx/graphics/Camera;Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;)V
    .locals 0

    .line 288
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->begin(Lcom/badlogic/gdx/graphics/Camera;Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;)V

    return-void
.end method

.method protected bindMaterial(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V
    .locals 12

    .line 308
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->currentMaterial:Lcom/badlogic/gdx/graphics/g3d/Material;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    if-ne v0, v1, :cond_0

    return-void

    .line 310
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->defaultCullFace:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const/16 v0, 0x405

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->defaultCullFace:I

    .line 311
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iget v2, v2, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->defaultDepthFunc:I

    if-ne v2, v1, :cond_2

    const/16 v1, 0x203

    goto :goto_1

    :cond_2
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iget v1, v1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->defaultDepthFunc:I

    :goto_1
    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    .line 316
    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->currentMaterial:Lcom/badlogic/gdx/graphics/g3d/Material;

    .line 317
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->currentMaterial:Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g3d/Material;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 v4, 0x1

    const/4 v5, 0x1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_6

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/Attribute;

    .line 318
    iget-wide v7, v6, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    .line 319
    invoke-static {v7, v8}, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->is(J)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 320
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;

    iget v8, v6, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->sourceFunction:I

    iget v6, v6, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->destFunction:I

    invoke-virtual {v7, v4, v8, v6}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->setBlending(ZII)V

    goto :goto_2

    .line 321
    :cond_3
    sget-wide v9, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->Type:J

    and-long/2addr v7, v9

    sget-wide v9, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->Type:J

    cmp-long v11, v7, v9

    if-nez v11, :cond_4

    .line 322
    check-cast v6, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;

    .line 323
    iget v1, v6, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthFunc:I

    .line 324
    iget v2, v6, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeNear:F

    .line 325
    iget v3, v6, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthRangeFar:F

    .line 326
    iget-boolean v5, v6, Lcom/badlogic/gdx/graphics/g3d/attributes/DepthTestAttribute;->depthMask:Z

    goto :goto_2

    .line 327
    :cond_4
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iget-boolean v7, v7, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->ignoreUnimplemented:Z

    if-eqz v7, :cond_5

    goto :goto_2

    :cond_5
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Unknown material attribute: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 330
    :cond_6
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->setCullFace(I)V

    .line 331
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    invoke-virtual {p1, v1, v2, v3}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->setDepthTest(IFF)V

    .line 332
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    invoke-virtual {p1, v5}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->setDepthMask(Z)V

    return-void
.end method

.method public canRender(Lcom/badlogic/gdx/graphics/g3d/Renderable;)Z
    .locals 6

    .line 266
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->materialMask:J

    iget-object v2, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g3d/Material;->getMask()J

    move-result-wide v2

    sget-wide v4, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->optionalAttributes:J

    or-long/2addr v2, v4

    cmp-long v4, v0, v2

    if-nez v4, :cond_0

    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->vertexMask:J

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->meshPart:Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/model/MeshPart;->mesh:Lcom/badlogic/gdx/graphics/Mesh;

    .line 267
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Mesh;->getVertexAttributes()Lcom/badlogic/gdx/graphics/VertexAttributes;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/VertexAttributes;->getMask()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public compareTo(Lcom/badlogic/gdx/graphics/g3d/Shader;)I
    .locals 1

    if-nez p1, :cond_0

    const/4 p1, -0x1

    return p1

    :cond_0
    const/4 v0, 0x0

    if-ne p1, p0, :cond_1

    :cond_1
    return v0
.end method

.method public dispose()V
    .locals 1

    .line 337
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->dispose()V

    .line 338
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->dispose()V

    return-void
.end method

.method public end()V
    .locals 1

    const/4 v0, 0x0

    .line 301
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->currentMaterial:Lcom/badlogic/gdx/graphics/g3d/Material;

    .line 302
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->end()V

    return-void
.end method

.method public equals(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;)Z
    .locals 0

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 1

    .line 279
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->equals(Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public getDefaultCullFace()I
    .locals 2

    .line 342
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->defaultCullFace:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/16 v0, 0x405

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->defaultCullFace:I

    :goto_0
    return v0
.end method

.method public getDefaultDepthFunc()I
    .locals 2

    .line 350
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->defaultDepthFunc:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    const/16 v0, 0x203

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iget v0, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->defaultDepthFunc:I

    :goto_0
    return v0
.end method

.method public init()V
    .locals 3

    .line 241
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    const/4 v1, 0x0

    .line 242
    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    .line 243
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    invoke-virtual {p0, v0, v2}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->init(Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;Lcom/badlogic/gdx/graphics/g3d/Renderable;)V

    .line 244
    iput-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->renderable:Lcom/badlogic/gdx/graphics/g3d/Renderable;

    return-void
.end method

.method public render(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V
    .locals 4

    .line 293
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g3d/Renderable;->material:Lcom/badlogic/gdx/graphics/g3d/Material;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/BlendingAttribute;->Type:J

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g3d/Material;->has(J)Z

    move-result v0

    if-nez v0, :cond_0

    .line 294
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->context:Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;

    const/4 v1, 0x0

    const/16 v2, 0x302

    const/16 v3, 0x303

    invoke-virtual {v0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/g3d/utils/RenderContext;->setBlending(ZII)V

    .line 295
    :cond_0
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->bindMaterial(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V

    .line 296
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->render(Lcom/badlogic/gdx/graphics/g3d/Renderable;)V

    return-void
.end method

.method public setDefaultCullFace(I)V
    .locals 1

    .line 346
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iput p1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->defaultCullFace:I

    return-void
.end method

.method public setDefaultDepthFunc(I)V
    .locals 1

    .line 354
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader;->config:Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;

    iput p1, v0, Lcom/badlogic/gdx/graphics/g3d/particles/ParticleShader$Config;->defaultDepthFunc:I

    return-void
.end method
