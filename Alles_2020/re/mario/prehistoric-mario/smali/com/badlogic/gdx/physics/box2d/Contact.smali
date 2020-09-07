.class public Lcom/badlogic/gdx/physics/box2d/Contact;
.super Ljava/lang/Object;
.source "Contact.java"


# instance fields
.field protected addr:J

.field private final tmp:[F

.field protected world:Lcom/badlogic/gdx/physics/box2d/World;

.field protected final worldManifold:Lcom/badlogic/gdx/physics/box2d/WorldManifold;


# direct methods
.method protected constructor <init>(Lcom/badlogic/gdx/physics/box2d/World;J)V
    .locals 1

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/WorldManifold;

    invoke-direct {v0}, Lcom/badlogic/gdx/physics/box2d/WorldManifold;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->worldManifold:Lcom/badlogic/gdx/physics/box2d/WorldManifold;

    const/16 v0, 0x8

    .line 44
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->tmp:[F

    .line 40
    iput-wide p2, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    .line 41
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->world:Lcom/badlogic/gdx/physics/box2d/World;

    return-void
.end method

.method private native jniGetChildIndexA(J)I
.end method

.method private native jniGetChildIndexB(J)I
.end method

.method private native jniGetFixtureA(J)J
.end method

.method private native jniGetFixtureB(J)J
.end method

.method private native jniGetFriction(J)F
.end method

.method private native jniGetRestitution(J)F
.end method

.method private native jniGetTangentSpeed(J)F
.end method

.method private native jniGetWorldManifold(J[F)I
.end method

.method private native jniIsEnabled(J)Z
.end method

.method private native jniIsTouching(J)Z
.end method

.method private native jniResetFriction(J)V
.end method

.method private native jniResetRestitution(J)V
.end method

.method private native jniSetEnabled(JZ)V
.end method

.method private native jniSetFriction(JF)V
.end method

.method private native jniSetRestitution(JF)V
.end method

.method private native jniSetTangentSpeed(JF)V
.end method


# virtual methods
.method public ResetRestitution()V
    .locals 2

    .line 208
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniResetRestitution(J)V

    return-void
.end method

.method public getChildIndexA()I
    .locals 2

    .line 136
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniGetChildIndexA(J)I

    move-result v0

    return v0
.end method

.method public getChildIndexB()I
    .locals 2

    .line 146
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniGetChildIndexB(J)I

    move-result v0

    return v0
.end method

.method public getFixtureA()Lcom/badlogic/gdx/physics/box2d/Fixture;
    .locals 3

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniGetFixtureA(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/LongMap;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/physics/box2d/Fixture;

    return-object v0
.end method

.method public getFixtureB()Lcom/badlogic/gdx/physics/box2d/Fixture;
    .locals 3

    .line 126
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->world:Lcom/badlogic/gdx/physics/box2d/World;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniGetFixtureB(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/LongMap;->get(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/physics/box2d/Fixture;

    return-object v0
.end method

.method public getFriction()F
    .locals 2

    .line 167
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniGetFriction(J)F

    move-result v0

    return v0
.end method

.method public getRestitution()F
    .locals 2

    .line 198
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniGetRestitution(J)F

    move-result v0

    return v0
.end method

.method public getTangentSpeed()F
    .locals 2

    .line 218
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniGetTangentSpeed(J)F

    move-result v0

    return v0
.end method

.method public getWorldManifold()Lcom/badlogic/gdx/physics/box2d/WorldManifold;
    .locals 8

    .line 48
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->tmp:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniGetWorldManifold(J[F)I

    move-result v0

    .line 50
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->worldManifold:Lcom/badlogic/gdx/physics/box2d/WorldManifold;

    iput v0, v1, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->numContactPoints:I

    .line 51
    iget-object v1, v1, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->normal:Lcom/badlogic/gdx/math/Vector2;

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->tmp:[F

    const/4 v3, 0x0

    aget v4, v2, v3

    const/4 v5, 0x1

    aget v2, v2, v5

    invoke-virtual {v1, v4, v2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 53
    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->worldManifold:Lcom/badlogic/gdx/physics/box2d/WorldManifold;

    iget-object v2, v2, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->points:[Lcom/badlogic/gdx/math/Vector2;

    aget-object v2, v2, v1

    .line 54
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->tmp:[F

    mul-int/lit8 v6, v1, 0x2

    add-int/lit8 v6, v6, 0x2

    aget v7, v4, v6

    iput v7, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-int/2addr v6, v5

    .line 55
    aget v4, v4, v6

    iput v4, v2, Lcom/badlogic/gdx/math/Vector2;->y:F

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 57
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->worldManifold:Lcom/badlogic/gdx/physics/box2d/WorldManifold;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->separations:[F

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->tmp:[F

    const/4 v2, 0x6

    aget v1, v1, v2

    aput v1, v0, v3

    .line 58
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->worldManifold:Lcom/badlogic/gdx/physics/box2d/WorldManifold;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/WorldManifold;->separations:[F

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->tmp:[F

    const/4 v2, 0x7

    aget v1, v1, v2

    aput v1, v0, v5

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->worldManifold:Lcom/badlogic/gdx/physics/box2d/WorldManifold;

    return-object v0
.end method

.method public isEnabled()Z
    .locals 2

    .line 106
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniIsEnabled(J)Z

    move-result v0

    return v0
.end method

.method public isTouching()Z
    .locals 2

    .line 85
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniIsTouching(J)Z

    move-result v0

    return v0
.end method

.method public resetFriction()V
    .locals 2

    .line 177
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniResetFriction(J)V

    return-void
.end method

.method public setEnabled(Z)V
    .locals 2

    .line 96
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniSetEnabled(JZ)V

    return-void
.end method

.method public setFriction(F)V
    .locals 2

    .line 157
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniSetFriction(JF)V

    return-void
.end method

.method public setRestitution(F)V
    .locals 2

    .line 188
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniSetRestitution(JF)V

    return-void
.end method

.method public setTangentSpeed(F)V
    .locals 2

    .line 228
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/Contact;->jniSetTangentSpeed(JF)V

    return-void
.end method
