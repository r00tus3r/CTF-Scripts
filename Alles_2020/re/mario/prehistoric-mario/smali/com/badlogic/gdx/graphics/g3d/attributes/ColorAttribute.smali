.class public Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;
.super Lcom/badlogic/gdx/graphics/g3d/Attribute;
.source "ColorAttribute.java"


# static fields
.field public static final Ambient:J

.field public static final AmbientAlias:Ljava/lang/String; = "ambientColor"

.field public static final AmbientLight:J

.field public static final AmbientLightAlias:Ljava/lang/String; = "ambientLightColor"

.field public static final Diffuse:J

.field public static final DiffuseAlias:Ljava/lang/String; = "diffuseColor"

.field public static final Emissive:J

.field public static final EmissiveAlias:Ljava/lang/String; = "emissiveColor"

.field public static final Fog:J

.field public static final FogAlias:Ljava/lang/String; = "fogColor"

.field protected static Mask:J = 0x0L

.field public static final Reflection:J

.field public static final ReflectionAlias:Ljava/lang/String; = "reflectionColor"

.field public static final Specular:J

.field public static final SpecularAlias:Ljava/lang/String; = "specularColor"


# instance fields
.field public final color:Lcom/badlogic/gdx/graphics/Color;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-string v0, "diffuseColor"

    .line 25
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Diffuse:J

    const-string v0, "specularColor"

    .line 27
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Specular:J

    const-string v0, "ambientColor"

    .line 29
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Ambient:J

    const-string v0, "emissiveColor"

    .line 31
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Emissive:J

    const-string v0, "reflectionColor"

    .line 33
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Reflection:J

    const-string v0, "ambientLightColor"

    .line 35
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->AmbientLight:J

    const-string v0, "fogColor"

    .line 37
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Fog:J

    .line 39
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Ambient:J

    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Diffuse:J

    or-long/2addr v0, v2

    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Specular:J

    or-long/2addr v0, v2

    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Emissive:J

    or-long/2addr v0, v2

    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Reflection:J

    or-long/2addr v0, v2

    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->AmbientLight:J

    or-long/2addr v0, v2

    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Fog:J

    or-long/2addr v0, v2

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Mask:J

    return-void
.end method

.method public constructor <init>(J)V
    .locals 1

    .line 80
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/Attribute;-><init>(J)V

    .line 77
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    .line 81
    invoke-static {p1, p2}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->is(J)Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Invalid type specified"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(JFFFF)V
    .locals 0

    .line 90
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(J)V

    .line 91
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1, p3, p4, p5, p6}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public constructor <init>(JLcom/badlogic/gdx/graphics/Color;)V
    .locals 0

    .line 85
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(J)V

    if-eqz p3, :cond_0

    .line 86
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    :cond_0
    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;)V
    .locals 2

    .line 95
    iget-wide v0, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->type:J

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JLcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public static final createAmbient(FFFF)Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;
    .locals 8

    .line 50
    new-instance v7, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Ambient:J

    move-object v0, v7

    move v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JFFFF)V

    return-object v7
.end method

.method public static final createAmbient(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;
    .locals 3

    .line 46
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Ambient:J

    invoke-direct {v0, v1, v2, p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JLcom/badlogic/gdx/graphics/Color;)V

    return-object v0
.end method

.method public static final createDiffuse(FFFF)Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;
    .locals 8

    .line 58
    new-instance v7, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Diffuse:J

    move-object v0, v7

    move v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JFFFF)V

    return-object v7
.end method

.method public static final createDiffuse(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;
    .locals 3

    .line 54
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Diffuse:J

    invoke-direct {v0, v1, v2, p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JLcom/badlogic/gdx/graphics/Color;)V

    return-object v0
.end method

.method public static final createReflection(FFFF)Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;
    .locals 8

    .line 74
    new-instance v7, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Reflection:J

    move-object v0, v7

    move v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JFFFF)V

    return-object v7
.end method

.method public static final createReflection(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;
    .locals 3

    .line 70
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Reflection:J

    invoke-direct {v0, v1, v2, p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JLcom/badlogic/gdx/graphics/Color;)V

    return-object v0
.end method

.method public static final createSpecular(FFFF)Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;
    .locals 8

    .line 66
    new-instance v7, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Specular:J

    move-object v0, v7

    move v3, p0

    move v4, p1

    move v5, p2

    move v6, p3

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JFFFF)V

    return-object v7
.end method

.method public static final createSpecular(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;
    .locals 3

    .line 62
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    sget-wide v1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Specular:J

    invoke-direct {v0, v1, v2, p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(JLcom/badlogic/gdx/graphics/Color;)V

    return-object v0
.end method

.method public static final is(J)Z
    .locals 3

    .line 42
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->Mask:J

    and-long/2addr p0, v0

    const-wide/16 v0, 0x0

    cmp-long v2, p0, v0

    if-eqz v2, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method


# virtual methods
.method public compareTo(Lcom/badlogic/gdx/graphics/g3d/Attribute;)I
    .locals 5

    .line 112
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->type:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->type:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    sub-long/2addr v0, v2

    long-to-int p1, v0

    return p1

    .line 113
    :cond_0
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toIntBits()I

    move-result p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toIntBits()I

    move-result v0

    sub-int/2addr p1, v0

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 23
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->compareTo(Lcom/badlogic/gdx/graphics/g3d/Attribute;)I

    move-result p1

    return p1
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/Attribute;
    .locals 1

    .line 100
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;-><init>(Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;)V

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 105
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->hashCode()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3b9

    .line 106
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/Color;->toIntBits()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
