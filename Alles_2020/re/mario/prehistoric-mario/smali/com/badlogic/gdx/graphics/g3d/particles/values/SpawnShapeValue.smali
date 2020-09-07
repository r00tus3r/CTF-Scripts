.class public abstract Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;
.super Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;
.source "SpawnShapeValue.java"

# interfaces
.implements Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData$Configurable;
.implements Lcom/badlogic/gdx/utils/Json$Serializable;


# instance fields
.field public xOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

.field public yOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

.field public zOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;-><init>()V

    .line 32
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->xOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    .line 33
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->yOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    .line 34
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->zOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract copy()Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;
.end method

.method public init()V
    .locals 0

    return-void
.end method

.method public load(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    .locals 0

    return-void
.end method

.method public load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V
    .locals 2

    .line 59
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;)V

    .line 60
    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;

    .line 61
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->xOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->xOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;)V

    .line 62
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->yOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->yOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;)V

    .line 63
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->zOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iget-object p1, p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->zOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->load(Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;)V

    return-void
.end method

.method public read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V
    .locals 2

    .line 78
    invoke-super {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;->read(Lcom/badlogic/gdx/utils/Json;Lcom/badlogic/gdx/utils/JsonValue;)V

    .line 79
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const-string v1, "xOffsetValue"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->xOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    .line 80
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const-string v1, "yOffsetValue"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->yOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    .line 81
    const-class v0, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const-string v1, "zOffsetValue"

    invoke-virtual {p1, v1, v0, p2}, Lcom/badlogic/gdx/utils/Json;->readValue(Ljava/lang/String;Ljava/lang/Class;Lcom/badlogic/gdx/utils/JsonValue;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->zOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    return-void
.end method

.method public save(Lcom/badlogic/gdx/assets/AssetManager;Lcom/badlogic/gdx/graphics/g3d/particles/ResourceData;)V
    .locals 0

    return-void
.end method

.method public final spawn(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 44
    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->spawnAux(Lcom/badlogic/gdx/math/Vector3;F)V

    .line 45
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->xOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iget-boolean p2, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->active:Z

    if-eqz p2, :cond_0

    iget p2, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->xOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->newLowValue()F

    move-result v0

    add-float/2addr p2, v0

    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    .line 46
    :cond_0
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->yOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iget-boolean p2, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->active:Z

    if-eqz p2, :cond_1

    iget p2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->yOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->newLowValue()F

    move-result v0

    add-float/2addr p2, v0

    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    .line 47
    :cond_1
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->zOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    iget-boolean p2, p2, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->active:Z

    if-eqz p2, :cond_2

    iget p2, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->zOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;->newLowValue()F

    move-result v0

    add-float/2addr p2, v0

    iput p2, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    :cond_2
    return-object p1
.end method

.method public abstract spawnAux(Lcom/badlogic/gdx/math/Vector3;F)V
.end method

.method public start()V
    .locals 0

    return-void
.end method

.method public write(Lcom/badlogic/gdx/utils/Json;)V
    .locals 2

    .line 70
    invoke-super {p0, p1}, Lcom/badlogic/gdx/graphics/g3d/particles/values/ParticleValue;->write(Lcom/badlogic/gdx/utils/Json;)V

    .line 71
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->xOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const-string v1, "xOffsetValue"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->yOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const-string v1, "yOffsetValue"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    .line 73
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/particles/values/SpawnShapeValue;->zOffsetValue:Lcom/badlogic/gdx/graphics/g3d/particles/values/RangedNumericValue;

    const-string v1, "zOffsetValue"

    invoke-virtual {p1, v1, v0}, Lcom/badlogic/gdx/utils/Json;->writeValue(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method
