.class public Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;
.super Lcom/badlogic/gdx/graphics/g3d/Attribute;
.source "DirectionalLightsAttribute.java"


# static fields
.field public static final Alias:Ljava/lang/String; = "directionalLights"

.field public static final Type:J


# instance fields
.field public final lights:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-string v0, "directionalLights"

    .line 15
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->register(Ljava/lang/String;)J

    move-result-wide v0

    sput-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->Type:J

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 24
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->Type:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Attribute;-><init>(J)V

    .line 25
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;)V
    .locals 1

    .line 29
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;-><init>()V

    .line 30
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->addAll(Lcom/badlogic/gdx/utils/Array;)V

    return-void
.end method

.method public static final is(J)Z
    .locals 3

    .line 18
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->Type:J

    and-long/2addr v0, p0

    cmp-long v2, v0, p0

    if-nez v2, :cond_0

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

    .line 48
    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->type:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    cmp-long v4, v0, v2

    if-eqz v4, :cond_1

    iget-wide v0, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->type:J

    iget-wide v2, p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;->type:J

    cmp-long p1, v0, v2

    if-gez p1, :cond_0

    const/4 p1, -0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x1

    :goto_0
    return p1

    :cond_1
    const/4 p1, 0x0

    return p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 0

    .line 13
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/Attribute;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->compareTo(Lcom/badlogic/gdx/graphics/g3d/Attribute;)I

    move-result p1

    return p1
.end method

.method public bridge synthetic copy()Lcom/badlogic/gdx/graphics/g3d/Attribute;
    .locals 1

    .line 13
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->copy()Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;

    move-result-object v0

    return-object v0
.end method

.method public copy()Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;
    .locals 1

    .line 35
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;-><init>(Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;)V

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .line 40
    invoke-super {p0}, Lcom/badlogic/gdx/graphics/g3d/Attribute;->hashCode()I

    move-result v0

    .line 41
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;

    mul-int/lit16 v0, v0, 0x4cd

    if-nez v2, :cond_0

    const/4 v2, 0x0

    goto :goto_1

    .line 42
    :cond_0
    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    :goto_1
    add-int/2addr v0, v2

    goto :goto_0

    :cond_1
    return v0
.end method
