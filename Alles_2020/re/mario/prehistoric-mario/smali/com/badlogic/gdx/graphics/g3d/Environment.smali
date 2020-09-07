.class public Lcom/badlogic/gdx/graphics/g3d/Environment;
.super Lcom/badlogic/gdx/graphics/g3d/Attributes;
.source "Environment.java"


# instance fields
.field public shadowMap:Lcom/badlogic/gdx/graphics/g3d/environment/ShadowMap;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/Attributes;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 1

    .line 50
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;

    if-eqz v0, :cond_0

    .line 51
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->add(Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;

    goto :goto_0

    .line 52
    :cond_0
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;

    if-eqz v0, :cond_1

    .line 53
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->add(Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;

    goto :goto_0

    .line 54
    :cond_1
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;

    if-eqz v0, :cond_2

    .line 55
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->add(Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;

    :goto_0
    return-object p0

    .line 57
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Unknown light type"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public add(Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 2

    .line 62
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;

    if-nez v0, :cond_0

    .line 63
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;-><init>()V

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/Environment;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 64
    :cond_0
    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p0
.end method

.method public add(Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 2

    .line 69
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;

    if-nez v0, :cond_0

    .line 70
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;-><init>()V

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/Environment;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 71
    :cond_0
    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p0
.end method

.method public add(Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 2

    .line 76
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;

    if-nez v0, :cond_0

    .line 77
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;-><init>()V

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/Environment;->set(Lcom/badlogic/gdx/graphics/g3d/Attribute;)V

    .line 78
    :cond_0
    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object p0
.end method

.method public add(Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;",
            ">;)",
            "Lcom/badlogic/gdx/graphics/g3d/Environment;"
        }
    .end annotation

    .line 44
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;

    .line 45
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/Environment;->add(Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public varargs add([Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 3

    .line 38
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 39
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/graphics/g3d/Environment;->add(Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public remove(Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 1

    .line 95
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;

    if-eqz v0, :cond_0

    .line 96
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->remove(Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;

    goto :goto_0

    .line 97
    :cond_0
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;

    if-eqz v0, :cond_1

    .line 98
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->remove(Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;

    goto :goto_0

    .line 99
    :cond_1
    instance-of v0, p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;

    if-eqz v0, :cond_2

    .line 100
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->remove(Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;

    :goto_0
    return-object p0

    .line 102
    :cond_2
    new-instance p1, Lcom/badlogic/gdx/utils/GdxRuntimeException;

    const-string v0, "Unknown light type"

    invoke-direct {p1, v0}, Lcom/badlogic/gdx/utils/GdxRuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public remove(Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 3

    .line 107
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->has(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 108
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;

    .line 109
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 110
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez p1, :cond_0

    .line 111
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->remove(J)V

    :cond_0
    return-object p0
.end method

.method public remove(Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 3

    .line 117
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->has(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;

    .line 119
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 120
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez p1, :cond_0

    .line 121
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->remove(J)V

    :cond_0
    return-object p0
.end method

.method public remove(Lcom/badlogic/gdx/graphics/g3d/environment/SpotLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 3

    .line 127
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->has(J)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 128
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;

    .line 129
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    const/4 v2, 0x0

    invoke-virtual {v1, p1, v2}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 130
    iget-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    iget p1, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez p1, :cond_0

    .line 131
    sget-wide v0, Lcom/badlogic/gdx/graphics/g3d/attributes/SpotLightsAttribute;->Type:J

    invoke-virtual {p0, v0, v1}, Lcom/badlogic/gdx/graphics/g3d/Environment;->remove(J)V

    :cond_0
    return-object p0
.end method

.method public remove(Lcom/badlogic/gdx/utils/Array;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;",
            ">;)",
            "Lcom/badlogic/gdx/graphics/g3d/Environment;"
        }
    .end annotation

    .line 89
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;

    .line 90
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g3d/Environment;->remove(Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public varargs remove([Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;
    .locals 3

    .line 83
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    .line 84
    invoke-virtual {p0, v2}, Lcom/badlogic/gdx/graphics/g3d/Environment;->remove(Lcom/badlogic/gdx/graphics/g3d/environment/BaseLight;)Lcom/badlogic/gdx/graphics/g3d/Environment;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method
