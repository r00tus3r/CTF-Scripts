.class public Lcom/badlogic/gdx/graphics/g3d/decals/Decal;
.super Ljava/lang/Object;
.source "Decal.java"


# static fields
.field public static final C1:I = 0x3

.field public static final C2:I = 0x9

.field public static final C3:I = 0xf

.field public static final C4:I = 0x15

.field public static final SIZE:I = 0x18

.field public static final U1:I = 0x4

.field public static final U2:I = 0xa

.field public static final U3:I = 0x10

.field public static final U4:I = 0x16

.field public static final V1:I = 0x5

.field public static final V2:I = 0xb

.field public static final V3:I = 0x11

.field public static final V4:I = 0x17

.field private static final VERTEX_SIZE:I = 0x6

.field public static final X1:I = 0x0

.field public static final X2:I = 0x6

.field public static final X3:I = 0xc

.field public static final X4:I = 0x12

.field public static final Y1:I = 0x1

.field public static final Y2:I = 0x7

.field public static final Y3:I = 0xd

.field public static final Y4:I = 0x13

.field public static final Z1:I = 0x2

.field public static final Z2:I = 0x8

.field public static final Z3:I = 0xe

.field public static final Z4:I = 0x14

.field static final dir:Lcom/badlogic/gdx/math/Vector3;

.field protected static rotator:Lcom/badlogic/gdx/math/Quaternion;

.field private static tmp:Lcom/badlogic/gdx/math/Vector3;

.field private static tmp2:Lcom/badlogic/gdx/math/Vector3;


# instance fields
.field protected color:Lcom/badlogic/gdx/graphics/Color;

.field protected dimensions:Lcom/badlogic/gdx/math/Vector2;

.field protected material:Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;

.field protected position:Lcom/badlogic/gdx/math/Vector3;

.field protected rotation:Lcom/badlogic/gdx/math/Quaternion;

.field protected scale:Lcom/badlogic/gdx/math/Vector2;

.field public transformationOffset:Lcom/badlogic/gdx/math/Vector2;

.field protected updated:Z

.field public value:I

.field protected vertices:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 41
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp:Lcom/badlogic/gdx/math/Vector3;

    .line 42
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp2:Lcom/badlogic/gdx/math/Vector3;

    .line 579
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dir:Lcom/badlogic/gdx/math/Vector3;

    .line 615
    new-instance v0, Lcom/badlogic/gdx/math/Quaternion;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/badlogic/gdx/math/Quaternion;-><init>(FFFF)V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotator:Lcom/badlogic/gdx/math/Quaternion;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x18

    .line 47
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    .line 48
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/math/Quaternion;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Quaternion;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    .line 50
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->color:Lcom/badlogic/gdx/graphics/Color;

    const/4 v0, 0x0

    .line 55
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->transformationOffset:Lcom/badlogic/gdx/math/Vector2;

    .line 56
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    const/4 v0, 0x0

    .line 59
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    .line 62
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->material:Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;)V
    .locals 2

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x18

    .line 47
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    .line 48
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/math/Quaternion;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Quaternion;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    .line 50
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v1}, Lcom/badlogic/gdx/math/Vector2;-><init>(FF)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/graphics/Color;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/Color;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->color:Lcom/badlogic/gdx/graphics/Color;

    const/4 v0, 0x0

    .line 55
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->transformationOffset:Lcom/badlogic/gdx/math/Vector2;

    .line 56
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    const/4 v0, 0x0

    .line 59
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    .line 66
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->material:Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;

    return-void
.end method

.method public static newDecal(FFLcom/badlogic/gdx/graphics/g2d/TextureRegion;)Lcom/badlogic/gdx/graphics/g3d/decals/Decal;
    .locals 1

    const/4 v0, -0x1

    .line 646
    invoke-static {p0, p1, p2, v0, v0}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->newDecal(FFLcom/badlogic/gdx/graphics/g2d/TextureRegion;II)Lcom/badlogic/gdx/graphics/g3d/decals/Decal;

    move-result-object p0

    return-object p0
.end method

.method public static newDecal(FFLcom/badlogic/gdx/graphics/g2d/TextureRegion;II)Lcom/badlogic/gdx/graphics/g3d/decals/Decal;
    .locals 1

    .line 670
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;-><init>()V

    .line 671
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->setTextureRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 672
    invoke-virtual {v0, p3, p4}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->setBlending(II)V

    .line 673
    iget-object p2, v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    iput p0, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 674
    iput p1, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/high16 p0, 0x3f800000    # 1.0f

    .line 675
    invoke-virtual {v0, p0, p0, p0, p0}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->setColor(FFFF)V

    return-object v0
.end method

.method public static newDecal(FFLcom/badlogic/gdx/graphics/g2d/TextureRegion;IILcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;)Lcom/badlogic/gdx/graphics/g3d/decals/Decal;
    .locals 1

    .line 690
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;

    invoke-direct {v0, p5}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;-><init>(Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;)V

    .line 691
    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->setTextureRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 692
    invoke-virtual {v0, p3, p4}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->setBlending(II)V

    .line 693
    iget-object p2, v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    iput p0, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 694
    iput p1, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/high16 p0, 0x3f800000    # 1.0f

    .line 695
    invoke-virtual {v0, p0, p0, p0, p0}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->setColor(FFFF)V

    return-object v0
.end method

.method public static newDecal(FFLcom/badlogic/gdx/graphics/g2d/TextureRegion;Z)Lcom/badlogic/gdx/graphics/g3d/decals/Decal;
    .locals 2

    const/4 v0, -0x1

    if-eqz p3, :cond_0

    const/16 v1, 0x302

    goto :goto_0

    :cond_0
    const/4 v1, -0x1

    :goto_0
    if-eqz p3, :cond_1

    const/16 v0, 0x303

    .line 657
    :cond_1
    invoke-static {p0, p1, p2, v1, v0}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->newDecal(FFLcom/badlogic/gdx/graphics/g2d/TextureRegion;II)Lcom/badlogic/gdx/graphics/g3d/decals/Decal;

    move-result-object p0

    return-object p0
.end method

.method public static newDecal(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)Lcom/badlogic/gdx/graphics/g3d/decals/Decal;
    .locals 3

    .line 622
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, -0x1

    invoke-static {v0, v1, p0, v2, v2}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->newDecal(FFLcom/badlogic/gdx/graphics/g2d/TextureRegion;II)Lcom/badlogic/gdx/graphics/g3d/decals/Decal;

    move-result-object p0

    return-object p0
.end method

.method public static newDecal(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;Z)Lcom/badlogic/gdx/graphics/g3d/decals/Decal;
    .locals 4

    .line 632
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getRegionHeight()I

    move-result v1

    int-to-float v1, v1

    const/4 v2, -0x1

    if-eqz p1, :cond_0

    const/16 v3, 0x302

    goto :goto_0

    :cond_0
    const/4 v3, -0x1

    :goto_0
    if-eqz p1, :cond_1

    const/16 v2, 0x303

    :cond_1
    invoke-static {v0, v1, p0, v3, v2}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->newDecal(FFLcom/badlogic/gdx/graphics/g2d/TextureRegion;II)Lcom/badlogic/gdx/graphics/g3d/decals/Decal;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 288
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getHeight()F
    .locals 1

    .line 364
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    return v0
.end method

.method public getMaterial()Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;
    .locals 1

    .line 568
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->material:Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;

    return-object v0
.end method

.method public getPosition()Lcom/badlogic/gdx/math/Vector3;
    .locals 1

    .line 295
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    return-object v0
.end method

.method public getRotation()Lcom/badlogic/gdx/math/Quaternion;
    .locals 1

    .line 186
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    return-object v0
.end method

.method public getScaleX()F
    .locals 1

    .line 308
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    return v0
.end method

.method public getScaleY()F
    .locals 1

    .line 321
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    return v0
.end method

.method public getTextureRegion()Lcom/badlogic/gdx/graphics/g2d/TextureRegion;
    .locals 1

    .line 555
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->material:Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;->textureRegion:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    return-object v0
.end method

.method public getVertices()[F
    .locals 1

    .line 381
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    return-object v0
.end method

.method public getWidth()F
    .locals 1

    .line 351
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    return v0
.end method

.method public getX()F
    .locals 1

    .line 207
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    return v0
.end method

.method public getY()F
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    return v0
.end method

.method public getZ()F
    .locals 1

    .line 249
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    return v0
.end method

.method public lookAt(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 1

    .line 585
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dir:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Vector3;->sub(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 586
    sget-object p1, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dir:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1, p2}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->setRotation(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V

    return-void
.end method

.method protected resetVertices()V
    .locals 8

    .line 503
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    neg-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    .line 504
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector2;->x:F

    add-float/2addr v2, v0

    .line 505
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector2;->y:F

    div-float/2addr v3, v1

    .line 506
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    sub-float v1, v3, v1

    .line 509
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/4 v5, 0x0

    aput v0, v4, v5

    const/4 v6, 0x1

    .line 510
    aput v3, v4, v6

    const/4 v6, 0x0

    const/4 v7, 0x2

    .line 511
    aput v6, v4, v7

    const/4 v7, 0x6

    .line 513
    aput v2, v4, v7

    const/4 v7, 0x7

    .line 514
    aput v3, v4, v7

    const/16 v3, 0x8

    .line 515
    aput v6, v4, v3

    const/16 v3, 0xc

    .line 517
    aput v0, v4, v3

    const/16 v0, 0xd

    .line 518
    aput v1, v4, v0

    const/16 v0, 0xe

    .line 519
    aput v6, v4, v0

    const/16 v0, 0x12

    .line 521
    aput v2, v4, v0

    const/16 v0, 0x13

    .line 522
    aput v1, v4, v0

    const/16 v0, 0x14

    .line 523
    aput v6, v4, v0

    .line 525
    iput-boolean v5, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public rotateX(F)V
    .locals 2

    .line 133
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotator:Lcom/badlogic/gdx/math/Quaternion;

    sget-object v1, Lcom/badlogic/gdx/math/Vector3;->X:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Quaternion;

    .line 134
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotator:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Quaternion;->mul(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    const/4 p1, 0x0

    .line 135
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public rotateY(F)V
    .locals 2

    .line 142
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotator:Lcom/badlogic/gdx/math/Quaternion;

    sget-object v1, Lcom/badlogic/gdx/math/Vector3;->Y:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Quaternion;

    .line 143
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotator:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Quaternion;->mul(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    const/4 p1, 0x0

    .line 144
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public rotateZ(F)V
    .locals 2

    .line 151
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotator:Lcom/badlogic/gdx/math/Quaternion;

    sget-object v1, Lcom/badlogic/gdx/math/Vector3;->Z:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Quaternion;

    .line 152
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotator:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Quaternion;->mul(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    const/4 p1, 0x0

    .line 153
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setBlending(II)V
    .locals 1

    .line 563
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->material:Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;

    iput p1, v0, Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;->srcBlendFactor:I

    .line 564
    iput p2, v0, Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;->dstBlendFactor:I

    return-void
.end method

.method public setColor(FFFF)V
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p4, p4, v0

    float-to-int p4, p4

    shl-int/lit8 p4, p4, 0x18

    mul-float p3, p3, v0

    float-to-int p3, p3

    shl-int/lit8 p3, p3, 0x10

    or-int/2addr p3, p4

    mul-float p2, p2, v0

    float-to-int p2, p2

    shl-int/lit8 p2, p2, 0x8

    or-int/2addr p2, p3

    mul-float p1, p1, v0

    float-to-int p1, p1

    or-int/2addr p1, p2

    .line 78
    invoke-static {p1}, Lcom/badlogic/gdx/utils/NumberUtils;->intToFloatColor(I)F

    move-result p1

    .line 79
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/4 p3, 0x3

    aput p1, p2, p3

    const/16 p3, 0x9

    .line 80
    aput p1, p2, p3

    const/16 p3, 0xf

    .line 81
    aput p1, p2, p3

    const/16 p3, 0x15

    .line 82
    aput p1, p2, p3

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    .line 88
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p1

    .line 89
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/4 v1, 0x3

    aput p1, v0, v1

    const/16 v1, 0x9

    .line 90
    aput p1, v0, v1

    const/16 v1, 0xf

    .line 91
    aput p1, v0, v1

    const/16 v1, 0x15

    .line 92
    aput p1, v0, v1

    return-void
.end method

.method public setDimensions(FF)V
    .locals 1

    .line 372
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    const/4 p1, 0x0

    .line 373
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setHeight(F)V
    .locals 1

    .line 358
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    iput p1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/4 p1, 0x0

    .line 359
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setMaterial(Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;)V
    .locals 0

    .line 576
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->material:Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;

    return-void
.end method

.method public setPackedColor(F)V
    .locals 2

    .line 98
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-static {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->abgr8888ToColor(Lcom/badlogic/gdx/graphics/Color;F)V

    .line 99
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/4 v1, 0x3

    aput p1, v0, v1

    const/16 v1, 0x9

    .line 100
    aput p1, v0, v1

    const/16 v1, 0xf

    .line 101
    aput p1, v0, v1

    const/16 v1, 0x15

    .line 102
    aput p1, v0, v1

    return-void
.end method

.method public setPosition(FFF)V
    .locals 1

    .line 274
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    const/4 p1, 0x0

    .line 275
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setPosition(Lcom/badlogic/gdx/math/Vector3;)V
    .locals 1

    .line 280
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    const/4 p1, 0x0

    .line 281
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setRotation(FFF)V
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Quaternion;->setEulerAngles(FFF)Lcom/badlogic/gdx/math/Quaternion;

    const/4 p1, 0x0

    .line 162
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setRotation(Lcom/badlogic/gdx/math/Quaternion;)V
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    const/4 p1, 0x0

    .line 179
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setRotation(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 10

    .line 169
    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 170
    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp2:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 171
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp:Lcom/badlogic/gdx/math/Vector3;

    iget v1, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp2:Lcom/badlogic/gdx/math/Vector3;

    iget v2, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp:Lcom/badlogic/gdx/math/Vector3;

    iget v4, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp2:Lcom/badlogic/gdx/math/Vector3;

    iget v5, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v6, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp:Lcom/badlogic/gdx/math/Vector3;

    iget v7, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->tmp2:Lcom/badlogic/gdx/math/Vector3;

    iget v8, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v9, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-virtual/range {v0 .. v9}, Lcom/badlogic/gdx/math/Quaternion;->setFromAxes(FFFFFFFFF)Lcom/badlogic/gdx/math/Quaternion;

    const/4 p1, 0x0

    .line 172
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setRotationX(F)V
    .locals 2

    .line 109
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    sget-object v1, Lcom/badlogic/gdx/math/Vector3;->X:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Quaternion;

    const/4 p1, 0x0

    .line 110
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setRotationY(F)V
    .locals 2

    .line 117
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    sget-object v1, Lcom/badlogic/gdx/math/Vector3;->Y:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Quaternion;

    const/4 p1, 0x0

    .line 118
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setRotationZ(F)V
    .locals 2

    .line 125
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    sget-object v1, Lcom/badlogic/gdx/math/Vector3;->Z:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, v1, p1}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Quaternion;

    const/4 p1, 0x0

    .line 126
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setScale(F)V
    .locals 1

    .line 337
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, p1, p1}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    const/4 p1, 0x0

    .line 338
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setScale(FF)V
    .locals 1

    .line 329
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    const/4 p1, 0x0

    .line 330
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setScaleX(F)V
    .locals 1

    .line 302
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iput p1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 p1, 0x0

    .line 303
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setScaleY(F)V
    .locals 1

    .line 315
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iput p1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    const/4 p1, 0x0

    .line 316
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setTextureRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V
    .locals 1

    .line 549
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->material:Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;

    iput-object p1, v0, Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;->textureRegion:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    .line 550
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updateUVs()V

    return-void
.end method

.method public setWidth(F)V
    .locals 1

    .line 345
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->dimensions:Lcom/badlogic/gdx/math/Vector2;

    iput p1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 p1, 0x0

    .line 346
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setX(F)V
    .locals 1

    .line 201
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iput p1, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 p1, 0x0

    .line 202
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setY(F)V
    .locals 1

    .line 222
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iput p1, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 p1, 0x0

    .line 223
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public setZ(F)V
    .locals 1

    .line 243
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iput p1, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 p1, 0x0

    .line 244
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method protected transformVertices()V
    .locals 13

    .line 404
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->transformationOffset:Lcom/badlogic/gdx/math/Vector2;

    if-eqz v0, :cond_0

    .line 405
    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    neg-float v0, v0

    .line 406
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->transformationOffset:Lcom/badlogic/gdx/math/Vector2;

    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    neg-float v1, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 412
    :goto_0
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/4 v3, 0x0

    aget v2, v2, v3

    add-float/2addr v2, v0

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v2, v2, v4

    .line 413
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/4 v5, 0x1

    aget v4, v4, v5

    add-float/2addr v4, v1

    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v4, v4, v6

    .line 414
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/4 v7, 0x2

    aget v8, v6, v7

    .line 416
    iget-object v9, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v9, v9, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v9, v9, v2

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v10, v10, v8

    add-float/2addr v9, v10

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v10, v10, v4

    sub-float/2addr v9, v10

    aput v9, v6, v3

    .line 417
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v9, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v9, v9, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v9, v9, v4

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v10, v10, v2

    add-float/2addr v9, v10

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v10, v10, v8

    sub-float/2addr v9, v10

    aput v9, v6, v5

    .line 418
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v9, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v9, v9, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v9, v9, v8

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v10, v10, v4

    add-float/2addr v9, v10

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v10, v10, v2

    sub-float/2addr v9, v10

    aput v9, v6, v7

    .line 419
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v6, v6, Lcom/badlogic/gdx/math/Quaternion;->x:F

    neg-float v6, v6

    mul-float v6, v6, v2

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v2, v2, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v2, v2, v4

    sub-float/2addr v6, v2

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v2, v2, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v2, v2, v8

    sub-float/2addr v6, v2

    .line 420
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v2}, Lcom/badlogic/gdx/math/Quaternion;->conjugate()Lcom/badlogic/gdx/math/Quaternion;

    .line 421
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v4, v2, v3

    .line 422
    aget v8, v2, v5

    .line 423
    aget v9, v2, v7

    .line 424
    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v10, v10, v6

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v11, v11, v4

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v11, v11, v8

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v11, v11, v9

    sub-float/2addr v10, v11

    aput v10, v2, v3

    .line 425
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v10, v10, v6

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v11, v11, v8

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v11, v11, v9

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v11, v11, v4

    sub-float/2addr v10, v11

    aput v10, v2, v5

    .line 426
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v6, v6, v10

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v9, v9, v10

    add-float/2addr v6, v9

    iget-object v9, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v9, v9, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v4, v4, v9

    add-float/2addr v6, v4

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v4, v4, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v8, v8, v4

    sub-float/2addr v6, v8

    aput v6, v2, v7

    .line 427
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v2}, Lcom/badlogic/gdx/math/Quaternion;->conjugate()Lcom/badlogic/gdx/math/Quaternion;

    .line 429
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v4, v2, v3

    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v6, v6, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v6, v0

    add-float/2addr v4, v6

    aput v4, v2, v3

    .line 430
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v3, v2, v5

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v4, v1

    add-float/2addr v3, v4

    aput v3, v2, v5

    .line 431
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v3, v2, v7

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v3, v4

    aput v3, v2, v7

    .line 434
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/4 v3, 0x6

    aget v2, v2, v3

    add-float/2addr v2, v0

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v2, v2, v4

    .line 435
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/4 v6, 0x7

    aget v4, v4, v6

    add-float/2addr v4, v1

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v4, v4, v7

    .line 436
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/16 v8, 0x8

    aget v9, v7, v8

    .line 438
    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v2

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v11, v11, v9

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v11, v11, v4

    sub-float/2addr v10, v11

    aput v10, v7, v3

    .line 439
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v4

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v11, v11, v2

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v11, v11, v9

    sub-float/2addr v10, v11

    aput v10, v7, v6

    .line 440
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v9

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v11, v11, v4

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v11, v11, v2

    sub-float/2addr v10, v11

    aput v10, v7, v8

    .line 441
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v7, v7, Lcom/badlogic/gdx/math/Quaternion;->x:F

    neg-float v7, v7

    mul-float v7, v7, v2

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v2, v2, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v2, v2, v4

    sub-float/2addr v7, v2

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v2, v2, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v2, v2, v9

    sub-float/2addr v7, v2

    .line 442
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v2}, Lcom/badlogic/gdx/math/Quaternion;->conjugate()Lcom/badlogic/gdx/math/Quaternion;

    .line 443
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v4, v2, v3

    .line 444
    aget v9, v2, v6

    .line 445
    aget v10, v2, v8

    .line 446
    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v11, v11, v7

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v12, v12, v4

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v12, v12, v9

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v12, v12, v10

    sub-float/2addr v11, v12

    aput v11, v2, v3

    .line 447
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v11, v11, v7

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v12, v12, v9

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v12, v12, v10

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v12, v12, v4

    sub-float/2addr v11, v12

    aput v11, v2, v6

    .line 448
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v7, v7, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v11

    add-float/2addr v7, v10

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v4, v4, v10

    add-float/2addr v7, v4

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v4, v4, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v9, v9, v4

    sub-float/2addr v7, v9

    aput v7, v2, v8

    .line 449
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v2}, Lcom/badlogic/gdx/math/Quaternion;->conjugate()Lcom/badlogic/gdx/math/Quaternion;

    .line 451
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v4, v2, v3

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v7, v0

    add-float/2addr v4, v7

    aput v4, v2, v3

    .line 452
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v3, v2, v6

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v4, v1

    add-float/2addr v3, v4

    aput v3, v2, v6

    .line 453
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v3, v2, v8

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v3, v4

    aput v3, v2, v8

    .line 456
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/16 v3, 0xc

    aget v2, v2, v3

    add-float/2addr v2, v0

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v2, v2, v4

    .line 457
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/16 v6, 0xd

    aget v4, v4, v6

    add-float/2addr v4, v1

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v4, v4, v7

    .line 458
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/16 v8, 0xe

    aget v9, v7, v8

    .line 460
    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v2

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v11, v11, v9

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v11, v11, v4

    sub-float/2addr v10, v11

    aput v10, v7, v3

    .line 461
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v4

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v11, v11, v2

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v11, v11, v9

    sub-float/2addr v10, v11

    aput v10, v7, v6

    .line 462
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v9

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v11, v11, v4

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v11, v11, v2

    sub-float/2addr v10, v11

    aput v10, v7, v8

    .line 463
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v7, v7, Lcom/badlogic/gdx/math/Quaternion;->x:F

    neg-float v7, v7

    mul-float v7, v7, v2

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v2, v2, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v2, v2, v4

    sub-float/2addr v7, v2

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v2, v2, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v2, v2, v9

    sub-float/2addr v7, v2

    .line 464
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v2}, Lcom/badlogic/gdx/math/Quaternion;->conjugate()Lcom/badlogic/gdx/math/Quaternion;

    .line 465
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v4, v2, v3

    .line 466
    aget v9, v2, v6

    .line 467
    aget v10, v2, v8

    .line 468
    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v11, v11, v7

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v12, v12, v4

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v12, v12, v9

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v12, v12, v10

    sub-float/2addr v11, v12

    aput v11, v2, v3

    .line 469
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v11, v11, v7

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v12, v12, v9

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v12, v12, v10

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v12, v12, v4

    sub-float/2addr v11, v12

    aput v11, v2, v6

    .line 470
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v7, v7, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v11

    add-float/2addr v7, v10

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v4, v4, v10

    add-float/2addr v7, v4

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v4, v4, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v9, v9, v4

    sub-float/2addr v7, v9

    aput v7, v2, v8

    .line 471
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v2}, Lcom/badlogic/gdx/math/Quaternion;->conjugate()Lcom/badlogic/gdx/math/Quaternion;

    .line 473
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v4, v2, v3

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v7, v0

    add-float/2addr v4, v7

    aput v4, v2, v3

    .line 474
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v3, v2, v6

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v4, v1

    add-float/2addr v3, v4

    aput v3, v2, v6

    .line 475
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v3, v2, v8

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v3, v4

    aput v3, v2, v8

    .line 478
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/16 v3, 0x12

    aget v2, v2, v3

    add-float/2addr v2, v0

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v2, v2, v4

    .line 479
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/16 v6, 0x13

    aget v4, v4, v6

    add-float/2addr v4, v1

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->scale:Lcom/badlogic/gdx/math/Vector2;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v4, v4, v7

    .line 480
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    const/16 v8, 0x14

    aget v9, v7, v8

    .line 482
    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v2

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v11, v11, v9

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v11, v11, v4

    sub-float/2addr v10, v11

    aput v10, v7, v3

    .line 483
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v4

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v11, v11, v2

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v11, v11, v9

    sub-float/2addr v10, v11

    aput v10, v7, v6

    .line 484
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v9

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v11, v11, v4

    add-float/2addr v10, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v11, v11, v2

    sub-float/2addr v10, v11

    aput v10, v7, v8

    .line 485
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v7, v7, Lcom/badlogic/gdx/math/Quaternion;->x:F

    neg-float v7, v7

    mul-float v7, v7, v2

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v2, v2, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v2, v2, v4

    sub-float/2addr v7, v2

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v2, v2, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v2, v2, v9

    sub-float/2addr v7, v2

    .line 486
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v2}, Lcom/badlogic/gdx/math/Quaternion;->conjugate()Lcom/badlogic/gdx/math/Quaternion;

    .line 487
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v4, v2, v3

    .line 488
    aget v9, v2, v6

    .line 489
    aget v10, v2, v8

    .line 490
    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v11, v11, v7

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v12, v12, v4

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v12, v12, v9

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v12, v12, v10

    sub-float/2addr v11, v12

    aput v11, v2, v3

    .line 491
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v11, v11, v7

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v12, v12, v9

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v12, v12, v10

    add-float/2addr v11, v12

    iget-object v12, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v12, v12, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v12, v12, v4

    sub-float/2addr v11, v12

    aput v11, v2, v6

    .line 492
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->z:F

    mul-float v7, v7, v11

    iget-object v11, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v11, v11, Lcom/badlogic/gdx/math/Quaternion;->w:F

    mul-float v10, v10, v11

    add-float/2addr v7, v10

    iget-object v10, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v10, v10, Lcom/badlogic/gdx/math/Quaternion;->y:F

    mul-float v4, v4, v10

    add-float/2addr v7, v4

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    iget v4, v4, Lcom/badlogic/gdx/math/Quaternion;->x:F

    mul-float v9, v9, v4

    sub-float/2addr v7, v9

    aput v7, v2, v8

    .line 493
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->rotation:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v2}, Lcom/badlogic/gdx/math/Quaternion;->conjugate()Lcom/badlogic/gdx/math/Quaternion;

    .line 495
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v4, v2, v3

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector3;->x:F

    sub-float/2addr v7, v0

    add-float/2addr v4, v7

    aput v4, v2, v3

    .line 496
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v2, v0, v6

    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v3, v3, Lcom/badlogic/gdx/math/Vector3;->y:F

    sub-float/2addr v3, v1

    add-float/2addr v2, v3

    aput v2, v0, v6

    .line 497
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    aget v1, v0, v8

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v2, v2, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v1, v2

    aput v1, v0, v8

    .line 498
    iput-boolean v5, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public translate(FFF)V
    .locals 1

    .line 258
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Vector3;->add(FFF)Lcom/badlogic/gdx/math/Vector3;

    const/4 p1, 0x0

    .line 259
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public translate(Lcom/badlogic/gdx/math/Vector3;)V
    .locals 1

    .line 264
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    const/4 p1, 0x0

    .line 265
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public translateX(F)V
    .locals 2

    .line 193
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v1, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v1, p1

    iput v1, v0, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 p1, 0x0

    .line 194
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public translateY(F)V
    .locals 2

    .line 214
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v1, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v1, p1

    iput v1, v0, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 p1, 0x0

    .line 215
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method public translateZ(F)V
    .locals 2

    .line 235
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->position:Lcom/badlogic/gdx/math/Vector3;

    iget v1, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v1, p1

    iput v1, v0, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/4 p1, 0x0

    .line 236
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    return-void
.end method

.method protected update()V
    .locals 1

    .line 386
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->updated:Z

    if-nez v0, :cond_0

    .line 387
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->resetVertices()V

    .line 388
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->transformVertices()V

    :cond_0
    return-void
.end method

.method protected updateUVs()V
    .locals 4

    .line 530
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->material:Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/decals/DecalMaterial;->textureRegion:Lcom/badlogic/gdx/graphics/g2d/TextureRegion;

    .line 532
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v2

    const/4 v3, 0x4

    aput v2, v1, v3

    .line 533
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v2

    const/4 v3, 0x5

    aput v2, v1, v3

    .line 535
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU2()F

    move-result v2

    const/16 v3, 0xa

    aput v2, v1, v3

    .line 536
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV()F

    move-result v2

    const/16 v3, 0xb

    aput v2, v1, v3

    .line 538
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU()F

    move-result v2

    const/16 v3, 0x10

    aput v2, v1, v3

    .line 539
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV2()F

    move-result v2

    const/16 v3, 0x11

    aput v2, v1, v3

    .line 541
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getU2()F

    move-result v2

    const/16 v3, 0x16

    aput v2, v1, v3

    .line 542
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g3d/decals/Decal;->vertices:[F

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/TextureRegion;->getV2()F

    move-result v0

    const/16 v2, 0x17

    aput v0, v1, v2

    return-void
.end method
