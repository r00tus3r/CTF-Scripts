.class public Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;
.super Lcom/badlogic/gdx/graphics/g3d/Attribute;
.source "CubemapAttribute.java"


# static fields
.field public static final EnvironmentMap:J

.field public static final EnvironmentMapAlias:Ljava/lang/String; = "environmentCubemap"

.field protected static Mask:J


# instance fields
.field public final textureDescription:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor<",
            "Lcom/badlogic/gdx/graphics/Cubemap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "environmentCubemap"

    .line 26
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->EnvironmentMap:J

    .line 28
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->EnvironmentMap:J

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->Mask:J

    return-void
.end method

.method public constructor <init>(J)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/Attribute;-><init>(J)V

    .line 38
    invoke-static {p1, p2}, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->is(J)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 39
    new-instance p1, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    invoke-direct {p1}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;-><init>()V

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->textureDescription:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    return-void

    .line 38
    :cond_0
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string p2, "Invalid type specified"

    invoke-direct {p1, p2}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public constructor <init>(JLcom/badlogic/gdx/graphics/Cubemap;)V
    .locals 0

    .line 48
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;-><init>(J)V

    .line 49
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->textureDescription:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    iput-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->texture:Lcom/badlogic/gdx/graphics/GLTexture;

    return-void
.end method

.method public constructor <init>(JLcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/badlogic/gdx/graphics/Cubemap;",
            ">(J",
            "Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor<",
            "TT;>;)V"
        }
    .end annotation

    .line 43
    invoke-direct {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;-><init>(J)V

    .line 44
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->textureDescription:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->set(Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;)V
    .locals 2

    .line 53
    iget-wide v0, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->type:J

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->textureDescription:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;-><init>(JLcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;)V

    return-void
.end method

.method public static final is(J)Z
    .locals 3

    .line 31
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->Mask:J

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

    .line 70
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->type:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->type:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    sub-long/2addr v0, v2

    long-to-int p1, v0

    return p1

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->textureDescription:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->textureDescription:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->compareTo(Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 24
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->compareTo(Lcom/badlogic/gdx/graphics/g3d/Attribute;)I

    move-result p1

    return p1
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/Attribute;
    .locals 1

    .line 58
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;-><init>(Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;)V

    return-object v0
.end method

.method public hashCode()I
    .locals 2

    .line 63
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->hashCode()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3c7

    .line 64
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/CubemapAttribute;->textureDescription:Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g3d/utils/TextureDescriptor;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method
