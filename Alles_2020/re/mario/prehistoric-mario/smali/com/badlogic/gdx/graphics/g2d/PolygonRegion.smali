.class public Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;
.super Ljava/lang/Object;
.source "PolygonRegion.java"


# instance fields
.field final region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

.field final textureCoords:[F

.field final triangles:[S

.field final vertices:[F


# direct methods
.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;[F[S)V
    .locals 11

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    .line 35
    iput-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->vertices:[F

    .line 36
    iput-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->triangles:[S

    .line 38
    array-length p3, p2

    new-array p3, p3, [F

    iput-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->textureCoords:[F

    .line 39
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u:F

    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v:F

    .line 40
    iget v2, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->u2:F

    sub-float/2addr v2, v0

    .line 41
    iget v3, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->v2:F

    sub-float/2addr v3, v1

    .line 42
    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionWidth:I

    .line 43
    iget p1, p1, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->regionHeight:I

    .line 44
    array-length v5, p2

    const/4 v6, 0x0

    :goto_0
    if-ge v6, v5, :cond_0

    .line 45
    aget v7, p2, v6

    int-to-float v8, v4

    div-float/2addr v7, v8

    mul-float v7, v7, v2

    add-float/2addr v7, v0

    aput v7, p3, v6

    add-int/lit8 v7, v6, 0x1

    const/high16 v8, 0x3f800000    # 1.0f

    .line 46
    aget v9, p2, v7

    int-to-float v10, p1

    div-float/2addr v9, v10

    sub-float/2addr v8, v9

    mul-float v8, v8, v3

    add-float/2addr v8, v1

    aput v8, p3, v7

    add-int/lit8 v6, v6, 0x2

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public getRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 1

    .line 64
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->region:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    return-object v0
.end method

.method public getTextureCoords()[F
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->textureCoords:[F

    return-object v0
.end method

.method public getTriangles()[S
    .locals 1

    .line 56
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->triangles:[S

    return-object v0
.end method

.method public getVertices()[F
    .locals 1

    .line 52
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/PolygonRegion;->vertices:[F

    return-object v0
.end method
