.class public Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;
.super Ljava/lang/Object;
.source "ShapeRenderer.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;
    }
.end annotation


# instance fields
.field private autoShapeType:Z

.field private final color:Lcom/badlogic/gdx/graphics/Color;

.field private final combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

.field private defaultRectLineWidth:F

.field private matrixDirty:Z

.field private final projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

.field private final renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

.field private shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

.field private final tmp:Lcom/badlogic/gdx/math/Vector2;

.field private final transformMatrix:Lcom/badlogic/gdx/math/Matrix4;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x1388

    .line 107
    invoke-direct {p0, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    const/4 v0, 0x0

    .line 111
    invoke-direct {p0, p1, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;-><init>(ILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    return-void
.end method

.method public constructor <init>(ILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V
    .locals 8

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 96
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    .line 97
    new-instance v1, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 98
    new-instance v1, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 99
    new-instance v1, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    .line 100
    new-instance v1, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v1}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->tmp:Lcom/badlogic/gdx/math/Vector2;

    .line 101
    new-instance v1, Lcom/badlogic/gdx/graphics/Color;

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v1, v2, v2, v2, v2}, Lcom/badlogic/gdx/graphics/Color;-><init>(FFFF)V

    iput-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    const/high16 v1, 0x3f400000    # 0.75f

    .line 104
    iput v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->defaultRectLineWidth:F

    const/4 v1, 0x1

    if-nez p2, :cond_0

    .line 116
    new-instance p2, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer20;

    invoke-direct {p2, p1, v0, v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer20;-><init>(IZZI)V

    iput-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    goto :goto_0

    .line 118
    :cond_0
    new-instance v0, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer20;

    const/4 v4, 0x0

    const/4 v5, 0x1

    const/4 v6, 0x0

    move-object v2, v0

    move v3, p1

    move-object v7, p2

    invoke-direct/range {v2 .. v7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer20;-><init>(IZZILcom/badlogic/gdx/graphics/glutils/ShaderProgram;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    .line 120
    :goto_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    sget-object p2, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {p2}, Lcom/badlogic/gdx/Graphics;->getWidth()I

    move-result p2

    int-to-float p2, p2

    sget-object v0, Lcom/badlogic/gdx/Gdx;->graphics:Lcom/badlogic/gdx/Graphics;

    invoke-interface {v0}, Lcom/badlogic/gdx/Graphics;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const/4 v2, 0x0

    invoke-virtual {p1, v2, v2, p2, v0}, Lcom/badlogic/gdx/math/Matrix4;->setToOrtho2D(FFFF)Lcom/badlogic/gdx/math/Matrix4;

    .line 121
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    return-void
.end method

.method private check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V
    .locals 3

    .line 1170
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    if-eqz v0, :cond_5

    if-eq v0, p1, :cond_2

    if-eq v0, p2, :cond_2

    .line 1174
    iget-boolean p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->autoShapeType:Z

    if-nez p3, :cond_1

    const-string p3, ")."

    const-string v0, "Must call begin(ShapeType."

    if-nez p2, :cond_0

    .line 1176
    new-instance p2, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 1178
    :cond_0
    new-instance v1, Ljava/lang/IllegalStateException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p1, ") or begin(ShapeType."

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1180
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->end()V

    .line 1181
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->begin(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V

    goto :goto_0

    .line 1182
    :cond_2
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    if-eqz p1, :cond_3

    .line 1184
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    .line 1185
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->end()V

    .line 1186
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->begin(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V

    goto :goto_0

    .line 1187
    :cond_3
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p1}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->getMaxVertices()I

    move-result p1

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->getNumVertices()I

    move-result p2

    sub-int/2addr p1, p2

    if-ge p1, p3, :cond_4

    .line 1189
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    .line 1190
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->end()V

    .line 1191
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->begin(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V

    :cond_4
    :goto_0
    return-void

    .line 1170
    :cond_5
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "begin must be called first."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public arc(FFFFF)V
    .locals 9

    float-to-double v0, p3

    .line 830
    invoke-static {v0, v1}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    const/high16 v1, 0x40c00000    # 6.0f

    mul-float v0, v0, v1

    const/high16 v1, 0x43b40000    # 360.0f

    div-float v1, p5, v1

    mul-float v0, v0, v1

    float-to-int v0, v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v8

    move-object v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-virtual/range {v2 .. v8}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->arc(FFFFFI)V

    return-void
.end method

.method public arc(FFFFFI)V
    .locals 7

    if-lez p6, :cond_3

    .line 836
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v0

    const v1, 0x40c90fdb

    const/high16 v2, 0x43b40000    # 360.0f

    div-float/2addr p5, v2

    mul-float p5, p5, v1

    int-to-float v1, p6

    div-float/2addr p5, v1

    .line 838
    invoke-static {p5}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v1

    .line 839
    invoke-static {p5}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p5

    const v2, 0x3c8efa35

    mul-float p4, p4, v2

    .line 840
    invoke-static {p4}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v2

    mul-float v2, v2, p3

    .line 841
    invoke-static {p4}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result p4

    mul-float p3, p3, p4

    .line 843
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v3, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-ne p4, v3, :cond_1

    .line 844
    sget-object p4, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v3, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    mul-int/lit8 v6, p6, 0x2

    add-int/lit8 v6, v6, 0x2

    invoke-direct {p0, p4, v3, v6}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 846
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 847
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, p1, p2, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 848
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 849
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v3, p1, v2

    add-float v6, p2, p3

    invoke-interface {p4, v3, v6, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    :goto_0
    if-ge v4, p6, :cond_0

    .line 851
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 852
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v3, p1, v2

    add-float v6, p2, p3

    invoke-interface {p4, v3, v6, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    mul-float p4, v1, v2

    mul-float v3, p5, p3

    sub-float/2addr p4, v3

    mul-float v2, v2, p5

    mul-float p3, p3, v1

    add-float/2addr p3, v2

    .line 856
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v2, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 857
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v3, p1, p4

    add-float v6, p2, p3

    invoke-interface {v2, v3, v6, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    add-int/lit8 v4, v4, 0x1

    move v2, p4

    goto :goto_0

    .line 859
    :cond_0
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 860
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr v2, p1

    add-float/2addr p3, p2

    invoke-interface {p4, v2, p3, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_2

    .line 862
    :cond_1
    sget-object p4, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v3, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    mul-int/lit8 v6, p6, 0x3

    add-int/lit8 v6, v6, 0x3

    invoke-direct {p0, p4, v3, v6}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    :goto_1
    if-ge v4, p6, :cond_2

    .line 865
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 866
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, p1, p2, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 867
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 868
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v3, p1, v2

    add-float v6, p2, p3

    invoke-interface {p4, v3, v6, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    mul-float p4, v1, v2

    mul-float v3, p5, p3

    sub-float/2addr p4, v3

    mul-float v2, v2, p5

    mul-float p3, p3, v1

    add-float/2addr p3, v2

    .line 872
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v2, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 873
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v3, p1, p4

    add-float v6, p2, p3

    invoke-interface {v2, v3, v6, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    add-int/lit8 v4, v4, 0x1

    move v2, p4

    goto :goto_1

    .line 875
    :cond_2
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 876
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, p1, p2, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 877
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 878
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr v2, p1

    add-float/2addr p3, p2

    invoke-interface {p4, v2, p3, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 884
    :goto_2
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 885
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p1, v5

    add-float/2addr p2, v5

    invoke-interface {p3, p1, p2, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    return-void

    .line 835
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "segments must be > 0."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public begin()V
    .locals 2

    .line 198
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->autoShapeType:Z

    if-eqz v0, :cond_0

    .line 199
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->begin(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V

    return-void

    .line 198
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "autoShapeType must be true to use this method."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public begin(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V
    .locals 2

    .line 206
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    if-nez v0, :cond_1

    .line 207
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    .line 208
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    if-eqz p1, :cond_0

    .line 209
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 210
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v0, v0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    invoke-static {p1, v0}, Lcom/badlogic/gdx/math/Matrix4;->mul([F[F)V

    const/4 p1, 0x0

    .line 211
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    .line 213
    :cond_0
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->combinedMatrix:Lcom/badlogic/gdx/math/Matrix4;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->getGlType()I

    move-result v1

    invoke-interface {p1, v0, v1}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->begin(Lcom/badlogic/gdx/math/Matrix4;I)V

    return-void

    .line 206
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Call end() before beginning a new shape batch."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public box(FFFFFF)V
    .locals 4

    neg-float p6, p6

    .line 658
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v0

    .line 659
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v2, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    if-ne v1, v2, :cond_0

    .line 660
    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v2, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/16 v3, 0x18

    invoke-direct {p0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 662
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 663
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 664
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 665
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p4, p1

    invoke-interface {v1, p4, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 667
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 668
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 669
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 670
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p6, p3

    invoke-interface {v1, p4, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 672
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 673
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 674
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 675
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 677
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 678
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 679
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 680
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 682
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 683
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 684
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 685
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p5, p2

    invoke-interface {v1, p1, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 687
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 688
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 689
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 690
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 692
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 693
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 694
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 695
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 697
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 698
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 699
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 700
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 702
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 703
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 704
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 705
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 707
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 708
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 709
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 710
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 712
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 713
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p4, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 714
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 715
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p4, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 717
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 718
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 719
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p2, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 720
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p2, p1, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto/16 :goto_0

    .line 722
    :cond_0
    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v2, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/16 v3, 0x24

    invoke-direct {p0, v1, v2, v3}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 725
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 726
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 727
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 728
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p4, p1

    invoke-interface {v1, p4, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 729
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 730
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p5, p2

    invoke-interface {v1, p4, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 732
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 733
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 734
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 735
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 736
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 737
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 740
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 741
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p6, p3

    invoke-interface {v1, p4, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 742
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 743
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 744
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 745
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 747
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 748
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 749
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 750
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 751
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 752
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 755
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 756
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 757
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 758
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 759
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 760
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 762
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 763
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 764
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 765
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 766
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 767
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 770
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 771
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 772
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 773
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 774
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 775
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 777
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 778
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 779
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 780
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 781
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 782
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 785
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 786
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 787
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 788
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 789
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 790
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 792
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 793
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 794
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 795
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p4, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 796
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 797
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 800
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 801
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p1, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 802
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 803
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p4, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 804
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 805
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p4, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 807
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 808
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p1, p2, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 809
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 810
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p4, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 811
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 812
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    :goto_0
    return-void
.end method

.method public circle(FFF)V
    .locals 2

    float-to-double v0, p3

    .line 890
    invoke-static {v0, v1}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    const/high16 v1, 0x40c00000    # 6.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->circle(FFFI)V

    return-void
.end method

.method public circle(FFFI)V
    .locals 10

    if-lez p4, :cond_3

    .line 896
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v0

    const v1, 0x40c90fdb

    int-to-float v2, p4

    div-float/2addr v1, v2

    .line 898
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v2

    .line 899
    invoke-static {v1}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v1

    .line 901
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v4, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v5, 0x0

    const/4 v6, 0x0

    if-ne v3, v4, :cond_1

    .line 902
    sget-object v3, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v4, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    mul-int/lit8 v7, p4, 0x2

    add-int/lit8 v7, v7, 0x2

    invoke-direct {p0, v3, v4, v7}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    move v3, p3

    const/4 v4, 0x0

    :goto_0
    if-ge v5, p4, :cond_0

    .line 904
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v7, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 905
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v8, p1, v3

    add-float v9, p2, v4

    invoke-interface {v7, v8, v9, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    mul-float v7, v2, v3

    mul-float v8, v1, v4

    sub-float/2addr v7, v8

    mul-float v3, v3, v1

    mul-float v4, v4, v2

    add-float/2addr v4, v3

    .line 909
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 910
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v8, p1, v7

    add-float v9, p2, v4

    invoke-interface {v3, v8, v9, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    add-int/lit8 v5, v5, 0x1

    move v3, v7

    goto :goto_0

    .line 913
    :cond_0
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 914
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr v3, p1

    add-float/2addr v4, p2

    invoke-interface {p4, v3, v4, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_2

    .line 916
    :cond_1
    sget-object v3, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v4, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    mul-int/lit8 v7, p4, 0x3

    add-int/lit8 v7, v7, 0x3

    invoke-direct {p0, v3, v4, v7}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    add-int/lit8 p4, p4, -0x1

    move v3, p3

    const/4 v4, 0x0

    :goto_1
    if-ge v5, p4, :cond_2

    .line 919
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v7, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 920
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v7, p1, p2, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 921
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v7, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 922
    iget-object v7, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v8, p1, v3

    add-float v9, p2, v4

    invoke-interface {v7, v8, v9, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    mul-float v7, v2, v3

    mul-float v8, v1, v4

    sub-float/2addr v7, v8

    mul-float v3, v3, v1

    mul-float v4, v4, v2

    add-float/2addr v4, v3

    .line 926
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 927
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v8, p1, v7

    add-float v9, p2, v4

    invoke-interface {v3, v8, v9, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    add-int/lit8 v5, v5, 0x1

    move v3, v7

    goto :goto_1

    .line 930
    :cond_2
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 931
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, p1, p2, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 932
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 933
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr v3, p1

    add-float/2addr v4, p2

    invoke-interface {p4, v3, v4, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 939
    :goto_2
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 940
    iget-object p4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p1, p3

    add-float/2addr p2, v6

    invoke-interface {p4, p1, p2, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    return-void

    .line 895
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "segments must be > 0."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw p1

    :goto_4
    goto :goto_3
.end method

.method public cone(FFFFF)V
    .locals 9

    float-to-double v0, p4

    .line 1030
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    const/high16 v1, 0x40800000    # 4.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v8

    move-object v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-virtual/range {v2 .. v8}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->cone(FFFFFI)V

    return-void
.end method

.method public cone(FFFFFI)V
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p6

    if-lez v4, :cond_4

    .line 1036
    sget-object v5, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v6, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    mul-int/lit8 v7, v4, 0x4

    add-int/lit8 v7, v7, 0x2

    invoke-direct {v0, v5, v6, v7}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 1037
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v5

    const v6, 0x40c90fdb

    int-to-float v7, v4

    div-float/2addr v6, v7

    .line 1039
    invoke-static {v6}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v7

    .line 1040
    invoke-static {v6}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v6

    .line 1042
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v9, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v10, 0x0

    if-ne v8, v9, :cond_1

    move/from16 v8, p4

    const/4 v9, 0x0

    :goto_0
    if-ge v10, v4, :cond_0

    .line 1044
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v12, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1045
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v13, v1, v8

    add-float v14, v2, v9

    invoke-interface {v12, v13, v14, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1046
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v12, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1047
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v15, v3, p5

    invoke-interface {v12, v1, v2, v15}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1048
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v12, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1049
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v12, v13, v14, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    mul-float v12, v7, v8

    mul-float v13, v6, v9

    sub-float/2addr v12, v13

    mul-float v8, v8, v6

    mul-float v9, v9, v7

    add-float/2addr v9, v8

    .line 1053
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v8, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1054
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v13, v1, v12

    add-float v14, v2, v9

    invoke-interface {v8, v13, v14, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    add-int/lit8 v10, v10, 0x1

    move v8, v12

    goto :goto_0

    .line 1057
    :cond_0
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1058
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v6, v1, v8

    add-float v7, v2, v9

    invoke-interface {v4, v6, v7, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_2

    :cond_1
    add-int/lit8 v4, v4, -0x1

    move/from16 v8, p4

    const/4 v9, 0x0

    :goto_1
    if-ge v10, v4, :cond_2

    .line 1062
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v12, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1063
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v12, v1, v2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1064
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v12, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1065
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v13, v1, v8

    add-float v14, v2, v9

    invoke-interface {v12, v13, v14, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    mul-float v12, v7, v8

    mul-float v15, v6, v9

    sub-float/2addr v12, v15

    mul-float v8, v8, v6

    mul-float v9, v9, v7

    add-float/2addr v9, v8

    .line 1070
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v8, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1071
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v15, v1, v12

    add-float v11, v2, v9

    invoke-interface {v8, v15, v11, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1073
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v8, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1074
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v8, v13, v14, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1075
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v8, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1076
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v8, v15, v11, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1077
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v8, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1078
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v11, v3, p5

    invoke-interface {v8, v1, v2, v11}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    add-int/lit8 v10, v10, 0x1

    move v8, v12

    goto :goto_1

    .line 1081
    :cond_2
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1082
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v1, v2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1083
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1084
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v6, v1, v8

    add-float v7, v2, v9

    invoke-interface {v4, v6, v7, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1090
    :goto_2
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1091
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v6, v1, p4

    const/4 v7, 0x0

    add-float/2addr v7, v2

    invoke-interface {v4, v6, v7, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1092
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v10, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    if-eq v4, v10, :cond_3

    .line 1093
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1094
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr v8, v1

    add-float/2addr v9, v2

    invoke-interface {v4, v8, v9, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1095
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1096
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v6, v7, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1097
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1098
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v3, v3, p5

    invoke-interface {v4, v1, v2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    :cond_3
    return-void

    .line 1035
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "segments must be > 0."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_4

    :goto_3
    throw v1

    :goto_4
    goto :goto_3
.end method

.method public curve(FFFFFFFFI)V
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p7

    move/from16 v2, p8

    move/from16 v3, p9

    .line 281
    sget-object v4, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    mul-int/lit8 v5, v3, 0x2

    add-int/lit8 v5, v5, 0x2

    const/4 v6, 0x0

    invoke-direct {v0, v4, v6, v5}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 282
    iget-object v4, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v4}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v4

    int-to-float v5, v3

    const/high16 v6, 0x3f800000    # 1.0f

    div-float/2addr v6, v5

    mul-float v5, v6, v6

    mul-float v7, v5, v6

    const/high16 v8, 0x40400000    # 3.0f

    mul-float v6, v6, v8

    mul-float v9, v5, v8

    const/high16 v10, 0x40c00000    # 6.0f

    mul-float v5, v5, v10

    mul-float v10, v10, v7

    const/high16 v11, 0x40000000    # 2.0f

    mul-float v12, p3, v11

    sub-float v12, p1, v12

    add-float v12, v12, p5

    mul-float v11, v11, p4

    sub-float v11, p2, v11

    add-float v11, v11, p6

    sub-float v13, p3, p5

    mul-float v13, v13, v8

    sub-float v13, v13, p1

    add-float/2addr v13, v1

    sub-float v14, p4, p6

    mul-float v14, v14, v8

    sub-float v14, v14, p2

    add-float/2addr v14, v2

    sub-float v8, p3, p1

    mul-float v8, v8, v6

    mul-float v15, v12, v9

    add-float/2addr v8, v15

    mul-float v15, v13, v7

    add-float/2addr v8, v15

    sub-float v15, p4, p2

    mul-float v15, v15, v6

    mul-float v9, v9, v11

    add-float/2addr v15, v9

    mul-float v7, v7, v14

    add-float/2addr v15, v7

    mul-float v12, v12, v5

    mul-float v13, v13, v10

    add-float/2addr v12, v13

    mul-float v11, v11, v5

    mul-float v14, v14, v10

    add-float/2addr v11, v14

    move/from16 v5, p1

    move/from16 v6, p2

    :goto_0
    add-int/lit8 v7, v3, -0x1

    const/4 v9, 0x0

    if-lez v3, :cond_0

    .line 313
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 314
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v3, v5, v6, v9}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    add-float/2addr v5, v8

    add-float/2addr v6, v15

    add-float/2addr v8, v12

    add-float/2addr v15, v11

    add-float/2addr v12, v13

    add-float/2addr v11, v14

    .line 321
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 322
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v3, v5, v6, v9}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    move v3, v7

    goto :goto_0

    .line 324
    :cond_0
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 325
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v3, v5, v6, v9}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 326
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 327
    iget-object v3, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v3, v1, v2, v9}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    return-void
.end method

.method public dispose()V
    .locals 1

    .line 1223
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->dispose()V

    return-void
.end method

.method public ellipse(FFFF)V
    .locals 8

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float v1, p3, v0

    mul-float v0, v0, p4

    .line 945
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    const/high16 v1, 0x41400000    # 12.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v7

    move-object v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    invoke-virtual/range {v2 .. v7}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->ellipse(FFFFI)V

    return-void
.end method

.method public ellipse(FFFFF)V
    .locals 9

    const/high16 v0, 0x3f000000    # 0.5f

    mul-float v1, p3, v0

    mul-float v0, v0, p4

    .line 982
    invoke-static {v1, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->cbrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    const/high16 v1, 0x41400000    # 12.0f

    mul-float v0, v0, v1

    float-to-int v0, v0

    const/4 v1, 0x1

    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    move-result v8

    move-object v2, p0

    move v3, p1

    move v4, p2

    move v5, p3

    move v6, p4

    move v7, p5

    invoke-virtual/range {v2 .. v8}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->ellipse(FFFFFI)V

    return-void
.end method

.method public ellipse(FFFFFI)V
    .locals 19

    move-object/from16 v0, p0

    move/from16 v1, p6

    if-lez v1, :cond_2

    .line 988
    sget-object v2, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v3, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    mul-int/lit8 v4, v1, 0x3

    invoke-direct {v0, v2, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 989
    iget-object v2, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v2

    const v3, 0x40c90fdb

    int-to-float v4, v1

    div-float/2addr v3, v4

    const v4, 0x40490fdb    # (float)Math.PI

    mul-float v4, v4, p5

    const/high16 v5, 0x43340000    # 180.0f

    div-float/2addr v4, v5

    .line 993
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v5

    .line 994
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v4

    const/high16 v6, 0x40000000    # 2.0f

    div-float v7, p3, v6

    add-float v7, p1, v7

    div-float v6, p4, v6

    add-float v6, p2, v6

    const/high16 v8, 0x3f000000    # 0.5f

    mul-float v9, p3, v8

    .line 999
    iget-object v10, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v11, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v12, 0x0

    const/4 v13, 0x0

    if-ne v10, v11, :cond_0

    move v10, v9

    const/4 v11, 0x0

    :goto_0
    if-ge v12, v1, :cond_1

    .line 1001
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v14, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1002
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    mul-float v15, v4, v10

    add-float/2addr v15, v7

    mul-float v16, v5, v11

    sub-float v15, v15, v16

    mul-float v10, v10, v5

    add-float/2addr v10, v6

    mul-float v11, v11, v4

    add-float/2addr v10, v11

    invoke-interface {v14, v15, v10, v13}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    add-int/lit8 v12, v12, 0x1

    int-to-float v10, v12

    mul-float v10, v10, v3

    .line 1004
    invoke-static {v10}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v11

    mul-float v11, v11, v9

    mul-float v14, p4, v8

    .line 1005
    invoke-static {v10}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v10

    mul-float v10, v10, v14

    .line 1007
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v14, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1008
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    mul-float v15, v4, v11

    add-float/2addr v15, v7

    mul-float v16, v5, v10

    sub-float v15, v15, v16

    mul-float v16, v5, v11

    add-float v16, v6, v16

    mul-float v17, v4, v10

    add-float v8, v16, v17

    invoke-interface {v14, v15, v8, v13}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    const/high16 v8, 0x3f000000    # 0.5f

    move/from16 v18, v11

    move v11, v10

    move/from16 v10, v18

    goto :goto_0

    :cond_0
    move v8, v9

    const/4 v10, 0x0

    :goto_1
    if-ge v12, v1, :cond_1

    .line 1012
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v11, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1013
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    mul-float v14, v4, v8

    add-float/2addr v14, v7

    mul-float v15, v5, v10

    sub-float/2addr v14, v15

    mul-float v8, v8, v5

    add-float/2addr v8, v6

    mul-float v10, v10, v4

    add-float/2addr v8, v10

    invoke-interface {v11, v14, v8, v13}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1015
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v8, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1016
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v8, v7, v6, v13}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    add-int/lit8 v12, v12, 0x1

    int-to-float v8, v12

    mul-float v8, v8, v3

    .line 1018
    invoke-static {v8}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v10

    mul-float v10, v10, v9

    const/high16 v11, 0x3f000000    # 0.5f

    mul-float v14, p4, v11

    .line 1019
    invoke-static {v8}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v8

    mul-float v8, v8, v14

    .line 1021
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v14, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1022
    iget-object v14, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    mul-float v15, v4, v10

    add-float/2addr v15, v7

    mul-float v16, v5, v8

    sub-float v15, v15, v16

    mul-float v16, v5, v10

    add-float v16, v6, v16

    mul-float v17, v4, v8

    add-float v11, v16, v17

    invoke-interface {v14, v15, v11, v13}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    move/from16 v18, v10

    move v10, v8

    move/from16 v8, v18

    goto :goto_1

    :cond_1
    return-void

    .line 987
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "segments must be > 0."

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw v1

    :goto_3
    goto :goto_2
.end method

.method public ellipse(FFFFI)V
    .locals 10

    if-lez p5, :cond_2

    .line 951
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    mul-int/lit8 v2, p5, 0x3

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 952
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v0

    const v1, 0x40c90fdb

    int-to-float v2, p5

    div-float/2addr v1, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float v3, p3, v2

    add-float/2addr p1, v3

    div-float v2, p4, v2

    add-float/2addr p2, v2

    .line 956
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v3, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v4, 0x0

    const/high16 v5, 0x3f000000    # 0.5f

    const/4 v6, 0x0

    if-ne v2, v3, :cond_0

    :goto_0
    if-ge v4, p5, :cond_1

    .line 958
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v2, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 959
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    mul-float v3, p3, v5

    int-to-float v7, v4

    mul-float v7, v7, v1

    invoke-static {v7}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v8

    mul-float v8, v8, v3

    add-float/2addr v8, p1

    mul-float v9, p4, v5

    invoke-static {v7}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v7

    mul-float v7, v7, v9

    add-float/2addr v7, p2

    invoke-interface {v2, v8, v7, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 961
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v2, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 962
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-int/lit8 v4, v4, 0x1

    int-to-float v7, v4

    mul-float v7, v7, v1

    invoke-static {v7}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v8

    mul-float v3, v3, v8

    add-float/2addr v3, p1

    .line 963
    invoke-static {v7}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v7

    mul-float v9, v9, v7

    add-float/2addr v9, p2

    .line 962
    invoke-interface {v2, v3, v9, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_0

    :cond_0
    :goto_1
    if-ge v4, p5, :cond_1

    .line 967
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v2, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 968
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    mul-float v3, p3, v5

    int-to-float v7, v4

    mul-float v7, v7, v1

    invoke-static {v7}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v8

    mul-float v8, v8, v3

    add-float/2addr v8, p1

    mul-float v9, p4, v5

    invoke-static {v7}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v7

    mul-float v7, v7, v9

    add-float/2addr v7, p2

    invoke-interface {v2, v8, v7, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 970
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v2, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 971
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v2, p1, p2, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 973
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v2, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 974
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-int/lit8 v4, v4, 0x1

    int-to-float v7, v4

    mul-float v7, v7, v1

    invoke-static {v7}, Lcom/badlogic/gdx/math/MathUtils;->cos(F)F

    move-result v8

    mul-float v3, v3, v8

    add-float/2addr v3, p1

    .line 975
    invoke-static {v7}, Lcom/badlogic/gdx/math/MathUtils;->sin(F)F

    move-result v7

    mul-float v9, v9, v7

    add-float/2addr v9, p2

    .line 974
    invoke-interface {v2, v3, v9, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_1

    :cond_1
    return-void

    .line 950
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "segments must be > 0."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public end()V
    .locals 1

    .line 1197
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->end()V

    const/4 v0, 0x0

    .line 1198
    iput-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    return-void
.end method

.method public flush()V
    .locals 1

    .line 1202
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    if-nez v0, :cond_0

    return-void

    .line 1204
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->end()V

    .line 1205
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->begin(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V

    return-void
.end method

.method public getColor()Lcom/badlogic/gdx/graphics/Color;
    .locals 1

    .line 135
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    return-object v0
.end method

.method public getCurrentType()Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;
    .locals 1

    .line 1210
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    return-object v0
.end method

.method public getProjectionMatrix()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 151
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method

.method public getRenderer()Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;
    .locals 1

    .line 1214
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    return-object v0
.end method

.method public getTransformMatrix()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 161
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    return-object v0
.end method

.method public identity()V
    .locals 1

    .line 166
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    const/4 v0, 0x1

    .line 167
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    return-void
.end method

.method public isDrawing()Z
    .locals 1

    .line 1219
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public final line(FFFF)V
    .locals 9

    .line 252
    iget-object v8, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move-object v7, v8

    invoke-virtual/range {v0 .. v8}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->line(FFFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public final line(FFFFFF)V
    .locals 9

    .line 242
    iget-object v8, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    move-object v7, v8

    invoke-virtual/range {v0 .. v8}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->line(FFFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public line(FFFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V
    .locals 9

    move-object v8, p0

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    .line 268
    iget-object v0, v8, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    if-ne v0, v1, :cond_0

    .line 269
    iget v5, v8, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->defaultRectLineWidth:F

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p4

    move v4, p5

    move-object/from16 v6, p7

    move-object/from16 v7, p8

    invoke-virtual/range {v0 .. v7}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->rectLine(FFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V

    return-void

    .line 272
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 273
    iget-object v0, v8, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, v6, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, v6, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, v6, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v4, v6, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 274
    iget-object v0, v8, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    move v1, p1

    move v2, p2

    move v3, p3

    invoke-interface {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 275
    iget-object v0, v8, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, v7, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, v7, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, v7, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v4, v7, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v2, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 276
    iget-object v0, v8, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    move v1, p4

    move v2, p5

    move v3, p6

    invoke-interface {v0, p4, p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    return-void
.end method

.method public final line(FFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V
    .locals 9

    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v4, p3

    move v5, p4

    move-object v7, p5

    move-object v8, p6

    .line 262
    invoke-virtual/range {v0 .. v8}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->line(FFFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public final line(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 9

    .line 257
    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v4, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v5, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v8, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    const/4 v3, 0x0

    const/4 v6, 0x0

    move-object v0, p0

    move-object v7, v8

    invoke-virtual/range {v0 .. v8}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->line(FFFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public final line(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 9

    .line 247
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v4, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v5, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v6, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget-object v8, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    move-object v0, p0

    move-object v7, v8

    invoke-virtual/range {v0 .. v8}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->line(FFFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public point(FFF)V
    .locals 10

    .line 226
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/high16 v2, 0x3f000000    # 0.5f

    if-ne v0, v1, :cond_0

    .line 227
    iget v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->defaultRectLineWidth:F

    mul-float v0, v0, v2

    sub-float v2, p1, v0

    sub-float v3, p2, v0

    add-float v5, p1, v0

    add-float v6, p2, v0

    move-object v1, p0

    move v4, p3

    move v7, p3

    .line 228
    invoke-virtual/range {v1 .. v7}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->line(FFFFFF)V

    return-void

    .line 230
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    if-ne v0, v1, :cond_1

    .line 231
    iget v9, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->defaultRectLineWidth:F

    mul-float v2, v2, v9

    sub-float v4, p1, v2

    sub-float v5, p2, v2

    sub-float v6, p3, v2

    move-object v3, p0

    move v7, v9

    move v8, v9

    .line 232
    invoke-virtual/range {v3 .. v9}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->box(FFFFFF)V

    return-void

    .line 235
    :cond_1
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Point:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 236
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-interface {v0, v1}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(Lcom/badlogic/gdx/graphics/Color;)V

    .line 237
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v0, p1, p2, p3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    return-void
.end method

.method public polygon([F)V
    .locals 2

    .line 1136
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->polygon([FII)V

    return-void
.end method

.method public polygon([FII)V
    .locals 10

    const/4 v0, 0x6

    if-lt p3, v0, :cond_3

    .line 1105
    rem-int/lit8 v0, p3, 0x2

    if-nez v0, :cond_2

    .line 1107
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p3}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 1108
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v0

    const/4 v1, 0x0

    .line 1109
    aget v1, p1, v1

    const/4 v2, 0x1

    .line 1110
    aget v2, p1, v2

    add-int v3, p2, p3

    :goto_0
    if-ge p2, v3, :cond_1

    .line 1113
    aget v4, p1, p2

    add-int/lit8 v5, p2, 0x1

    .line 1114
    aget v5, p1, v5

    add-int/lit8 v6, p2, 0x2

    if-lt v6, p3, :cond_0

    move v7, v1

    move p2, v2

    goto :goto_1

    .line 1123
    :cond_0
    aget v7, p1, v6

    add-int/lit8 p2, p2, 0x3

    .line 1124
    aget p2, p1, p2

    .line 1127
    :goto_1
    iget-object v8, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v8, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1128
    iget-object v8, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    const/4 v9, 0x0

    invoke-interface {v8, v4, v5, v9}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1129
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1130
    iget-object v4, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v4, v7, p2, v9}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    move p2, v6

    goto :goto_0

    :cond_1
    return-void

    .line 1105
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Polygons must have an even number of vertices."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1104
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Polygons must contain at least 3 points."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_3

    :goto_2
    throw p1

    :goto_3
    goto :goto_2
.end method

.method public polyline([F)V
    .locals 2

    .line 1165
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->polyline([FII)V

    return-void
.end method

.method public polyline([FII)V
    .locals 7

    const/4 v0, 0x4

    if-lt p3, v0, :cond_2

    .line 1142
    rem-int/lit8 v0, p3, 0x2

    if-nez v0, :cond_1

    .line 1144
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p3}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 1145
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v0

    add-int/2addr p3, p2

    add-int/lit8 p3, p3, -0x2

    :goto_0
    if-ge p2, p3, :cond_0

    .line 1147
    aget v1, p1, p2

    add-int/lit8 v2, p2, 0x1

    .line 1148
    aget v2, p1, v2

    add-int/lit8 v3, p2, 0x2

    .line 1153
    aget v4, p1, v3

    add-int/lit8 p2, p2, 0x3

    .line 1154
    aget p2, p1, p2

    .line 1156
    iget-object v5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1157
    iget-object v5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    const/4 v6, 0x0

    invoke-interface {v5, v1, v2, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 1158
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 1159
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v4, p2, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    move p2, v3

    goto :goto_0

    :cond_0
    return-void

    .line 1142
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Polylines must have an even number of vertices."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 1141
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Polylines must contain at least 2 points."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    goto :goto_2

    :goto_1
    throw p1

    :goto_2
    goto :goto_1
.end method

.method public rect(FFFF)V
    .locals 4

    .line 389
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/16 v2, 0x8

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 390
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v0

    .line 391
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v2, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    .line 392
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 393
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 394
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 395
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p3, p1

    invoke-interface {v1, p3, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 397
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 398
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p3, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 399
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 400
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p4, p2

    invoke-interface {v1, p3, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 402
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 403
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p3, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 404
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 405
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 407
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 408
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 409
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 410
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_0

    .line 412
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 413
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 414
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 415
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p3, p1

    invoke-interface {v1, p3, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 416
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 417
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p4, p2

    invoke-interface {v1, p3, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 419
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 420
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p3, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 421
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 422
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 423
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 424
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    :goto_0
    return-void
.end method

.method public rect(FFFFFFFFF)V
    .locals 15

    move-object v14, p0

    .line 478
    iget-object v13, v14, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    move-object v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    move-object v10, v13

    move-object v11, v13

    move-object v12, v13

    invoke-virtual/range {v0 .. v13}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->rect(FFFFFFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V

    return-void
.end method

.method public rect(FFFFFFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V
    .locals 16

    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    move-object/from16 v3, p10

    move-object/from16 v4, p11

    move-object/from16 v5, p12

    move-object/from16 v6, p13

    .line 489
    sget-object v7, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v8, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/16 v9, 0x8

    invoke-direct {v0, v7, v8, v9}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 491
    invoke-static/range {p9 .. p9}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v7

    .line 492
    invoke-static/range {p9 .. p9}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v8

    neg-float v9, v1

    neg-float v10, v2

    sub-float v11, p5, v1

    sub-float v12, p6, v2

    const/high16 v13, 0x3f800000    # 1.0f

    cmpl-float v14, p7, v13

    if-nez v14, :cond_0

    cmpl-float v13, p8, v13

    if-eqz v13, :cond_1

    :cond_0
    mul-float v9, v9, p7

    mul-float v10, v10, p8

    mul-float v11, v11, p7

    mul-float v12, v12, p8

    :cond_1
    add-float v1, p1, v1

    add-float v2, p2, v2

    mul-float v13, v7, v9

    mul-float v14, v8, v10

    sub-float/2addr v13, v14

    add-float/2addr v13, v1

    mul-float v9, v9, v8

    mul-float v10, v10, v7

    add-float/2addr v9, v10

    add-float/2addr v9, v2

    mul-float v15, v7, v11

    sub-float v14, v15, v14

    add-float/2addr v14, v1

    mul-float v11, v11, v8

    add-float/2addr v10, v11

    add-float/2addr v10, v2

    mul-float v8, v8, v12

    sub-float/2addr v15, v8

    add-float/2addr v15, v1

    mul-float v7, v7, v12

    add-float/2addr v11, v7

    add-float/2addr v11, v2

    sub-float v1, v15, v14

    add-float/2addr v1, v13

    sub-float v2, v10, v9

    sub-float v2, v11, v2

    .line 520
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v8, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    if-ne v7, v8, :cond_2

    .line 521
    iget-object v7, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v8, v3, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v12, v3, Lcom/badlogic/gdx/graphics/Color;->g:F

    move/from16 p2, v1

    iget v1, v3, Lcom/badlogic/gdx/graphics/Color;->b:F

    move/from16 p3, v2

    iget v2, v3, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v7, v8, v12, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 522
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    const/4 v2, 0x0

    invoke-interface {v1, v13, v9, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 523
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v7, v4, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v8, v4, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v12, v4, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v2, v4, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v7, v8, v12, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 524
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    const/4 v2, 0x0

    invoke-interface {v1, v14, v10, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 526
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v7, v4, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v8, v4, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v12, v4, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v4, v4, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v7, v8, v12, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 527
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v14, v10, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 528
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v4, v5, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v7, v5, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v8, v5, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v10, v5, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v4, v7, v8, v10}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 529
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v15, v11, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 531
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v4, v5, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v7, v5, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v8, v5, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v5, v5, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v4, v7, v8, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 532
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v15, v11, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 533
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v4, v6, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v5, v6, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v7, v6, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v8, v6, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v4, v5, v7, v8}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 534
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    move/from16 v7, p2

    move/from16 v8, p3

    invoke-interface {v1, v7, v8, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 536
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v4, v6, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v5, v6, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v10, v6, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v6, v6, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v4, v5, v10, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 537
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v7, v8, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 538
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v4, v3, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v5, v3, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v6, v3, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v3, v3, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v4, v5, v6, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 539
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v13, v9, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto/16 :goto_0

    :cond_2
    move v7, v1

    move v8, v2

    const/4 v2, 0x0

    .line 541
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v12, v3, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v2, v3, Lcom/badlogic/gdx/graphics/Color;->g:F

    move/from16 p2, v7

    iget v7, v3, Lcom/badlogic/gdx/graphics/Color;->b:F

    move/from16 p3, v8

    iget v8, v3, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v12, v2, v7, v8}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 542
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    const/4 v2, 0x0

    invoke-interface {v1, v13, v9, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 543
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v7, v4, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v8, v4, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v12, v4, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v4, v4, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v7, v8, v12, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 544
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v14, v10, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 545
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v4, v5, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v7, v5, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v8, v5, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v10, v5, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v4, v7, v8, v10}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 546
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v15, v11, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 548
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v4, v5, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v7, v5, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v8, v5, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v5, v5, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v4, v7, v8, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 549
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v15, v11, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 550
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v4, v6, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v5, v6, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v7, v6, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v6, v6, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v4, v5, v7, v6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 551
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    move/from16 v4, p2

    move/from16 v11, p3

    invoke-interface {v1, v4, v11, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 552
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v4, v3, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v5, v3, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v6, v3, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v3, v3, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v1, v4, v5, v6, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 553
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v13, v9, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    :goto_0
    return-void
.end method

.method public rect(FFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V
    .locals 6

    .line 435
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/16 v2, 0x8

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 437
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 438
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, p5, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, p5, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, p5, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v5, p5, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v3, v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 439
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v0, p1, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 440
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, p6, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, p6, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, p6, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v5, p6, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v3, v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 441
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p3, p1

    invoke-interface {v0, p3, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 443
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, p6, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, p6, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, p6, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p6, p6, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v3, v4, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 444
    iget-object p6, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p6, p3, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 445
    iget-object p6, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v0, p7, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p7, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, p7, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v4, p7, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p6, v0, v1, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 446
    iget-object p6, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p4, p2

    invoke-interface {p6, p3, p4, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 448
    iget-object p6, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v0, p7, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p7, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, p7, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p7, p7, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p6, v0, v1, v3, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 449
    iget-object p6, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p6, p3, p4, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 450
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget p6, p8, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget p7, p8, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v0, p8, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v1, p8, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p3, p6, p7, v0, v1}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 451
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p4, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 453
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget p6, p8, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget p7, p8, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v0, p8, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p8, p8, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p3, p6, p7, v0, p8}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 454
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p4, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 455
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget p4, p5, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget p6, p5, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget p7, p5, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p5, p5, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p3, p4, p6, p7, p5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 456
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_0

    .line 458
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, p5, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, p5, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, p5, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v5, p5, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v3, v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 459
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v0, p1, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 460
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, p6, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, p6, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, p6, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p6, p6, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v3, v4, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 461
    iget-object p6, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p3, p1

    invoke-interface {p6, p3, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 462
    iget-object p6, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v0, p7, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p7, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, p7, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v4, p7, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p6, v0, v1, v3, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 463
    iget-object p6, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float/2addr p4, p2

    invoke-interface {p6, p3, p4, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 465
    iget-object p6, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v0, p7, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v1, p7, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v3, p7, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p7, p7, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p6, v0, v1, v3, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 466
    iget-object p6, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p6, p3, p4, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 467
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget p6, p8, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget p7, p8, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v0, p8, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p8, p8, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p3, p6, p7, v0, p8}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 468
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p4, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 469
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget p4, p5, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget p6, p5, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget p7, p5, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p5, p5, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p3, p4, p6, p7, p5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 470
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    :goto_0
    return-void
.end method

.method public rectLine(FFFFF)V
    .locals 8

    .line 560
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/16 v2, 0x8

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 561
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v0

    .line 562
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->tmp:Lcom/badlogic/gdx/math/Vector2;

    sub-float v2, p4, p2

    sub-float v3, p1, p3

    invoke-virtual {v1, v2, v3}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    invoke-virtual {v1}, Lcom/badlogic/gdx/math/Vector2;->nor()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v1

    const/high16 v2, 0x3f000000    # 0.5f

    mul-float p5, p5, v2

    .line 564
    iget v2, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v2, v2, p5

    .line 565
    iget v1, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v1, v1, p5

    .line 566
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v3, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v4, 0x0

    if-ne p5, v3, :cond_0

    .line 567
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 568
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v3, p1, v2

    add-float v5, p2, v1

    invoke-interface {p5, v3, v5, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 569
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 570
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    sub-float/2addr p1, v2

    sub-float/2addr p2, v1

    invoke-interface {p5, p1, p2, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 572
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 573
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v6, p3, v2

    add-float v7, p4, v1

    invoke-interface {p5, v6, v7, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 574
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 575
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    sub-float/2addr p3, v2

    sub-float/2addr p4, v1

    invoke-interface {p5, p3, p4, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 577
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 578
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v6, v7, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 579
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 580
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v3, v5, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 582
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 583
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p3, p4, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 584
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 585
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_0

    .line 587
    :cond_0
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 588
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v3, p1, v2

    add-float v5, p2, v1

    invoke-interface {p5, v3, v5, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 589
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 590
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    sub-float/2addr p1, v2

    sub-float/2addr p2, v1

    invoke-interface {p5, p1, p2, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 591
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 592
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v3, p3, v2

    add-float v5, p4, v1

    invoke-interface {p5, v3, v5, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 594
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 595
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    sub-float/2addr p3, v2

    sub-float/2addr p4, v1

    invoke-interface {p5, p3, p4, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 596
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 597
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v3, v5, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 598
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 599
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, v4}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    :goto_0
    return-void
.end method

.method public rectLine(FFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V
    .locals 7

    .line 605
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/16 v2, 0x8

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 606
    invoke-virtual {p6}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p6

    .line 607
    invoke-virtual {p7}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result p7

    .line 608
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->tmp:Lcom/badlogic/gdx/math/Vector2;

    sub-float v1, p4, p2

    sub-float v2, p1, p3

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/math/Vector2;->set(FF)Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Vector2;->nor()Lcom/badlogic/gdx/math/Vector2;

    move-result-object v0

    const/high16 v1, 0x3f000000    # 0.5f

    mul-float p5, p5, v1

    .line 610
    iget v1, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    mul-float v1, v1, p5

    .line 611
    iget v0, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    mul-float v0, v0, p5

    .line 612
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v2, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v3, 0x0

    if-ne p5, v2, :cond_0

    .line 613
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 614
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v2, p1, v1

    add-float v4, p2, v0

    invoke-interface {p5, v2, v4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 615
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 616
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    sub-float/2addr p1, v1

    sub-float/2addr p2, v0

    invoke-interface {p5, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 618
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 619
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v5, p3, v1

    add-float v6, p4, v0

    invoke-interface {p5, v5, v6, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 620
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 621
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    sub-float/2addr p3, v1

    sub-float/2addr p4, v0

    invoke-interface {p5, p3, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 623
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 624
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v5, v6, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 625
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 626
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, v2, v4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 628
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 629
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p3, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 630
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 631
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_0

    .line 633
    :cond_0
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 634
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v2, p1, v1

    add-float v4, p2, v0

    invoke-interface {p5, v2, v4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 635
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 636
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    sub-float/2addr p1, v1

    sub-float/2addr p2, v0

    invoke-interface {p5, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 637
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 638
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    add-float v2, p3, v1

    add-float v4, p4, v0

    invoke-interface {p5, v2, v4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 640
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p5, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 641
    iget-object p5, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    sub-float/2addr p3, v1

    sub-float/2addr p4, v0

    invoke-interface {p5, p3, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 642
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 643
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v2, v4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 644
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p6}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 645
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    :goto_0
    return-void
.end method

.method public rectLine(Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;F)V
    .locals 6

    .line 651
    iget v1, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v3, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v4, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-object v0, p0

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->rectLine(FFFFF)V

    return-void
.end method

.method public rotate(FFFF)V
    .locals 1

    .line 178
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Matrix4;->rotate(FFFF)Lcom/badlogic/gdx/math/Matrix4;

    const/4 p1, 0x1

    .line 179
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    return-void
.end method

.method public scale(FFF)V
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Matrix4;->scale(FFF)Lcom/badlogic/gdx/math/Matrix4;

    const/4 p1, 0x1

    .line 185
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    return-void
.end method

.method public set(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V
    .locals 1

    .line 217
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    if-eqz v0, :cond_2

    .line 219
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->autoShapeType:Z

    if-eqz v0, :cond_1

    .line 220
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->end()V

    .line 221
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->begin(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;)V

    return-void

    .line 219
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "autoShapeType must be enabled."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 218
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "begin must be called first."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setAutoShapeType(Z)V
    .locals 0

    .line 192
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->autoShapeType:Z

    return-void
.end method

.method public setColor(FFFF)V
    .locals 1

    .line 131
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/graphics/Color;->set(FFFF)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public setColor(Lcom/badlogic/gdx/graphics/Color;)V
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/Color;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/Color;

    return-void
.end method

.method public setProjectionMatrix(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 145
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->projectionMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    const/4 p1, 0x1

    .line 146
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    return-void
.end method

.method public setTransformMatrix(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    const/4 p1, 0x1

    .line 156
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    return-void
.end method

.method public translate(FFF)V
    .locals 1

    .line 172
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->transformMatrix:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Matrix4;->translate(FFF)Lcom/badlogic/gdx/math/Matrix4;

    const/4 p1, 0x1

    .line 173
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    return-void
.end method

.method public triangle(FFFFFF)V
    .locals 4

    .line 332
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v2, 0x6

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 333
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/Color;->toFloatBits()F

    move-result v0

    .line 334
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v2, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v3, 0x0

    if-ne v1, v2, :cond_0

    .line 335
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 336
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 337
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 338
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p3, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 340
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 341
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p3, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 342
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 343
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p5, p6, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 345
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 346
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p5, p6, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 347
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 348
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_0

    .line 350
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 351
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v1, p1, p2, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 352
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 353
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p1, p3, p4, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 354
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p1, v0}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(F)V

    .line 355
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p1, p5, p6, v3}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    :goto_0
    return-void
.end method

.method public triangle(FFFFFFLcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/graphics/Color;)V
    .locals 6

    .line 361
    sget-object v0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Filled:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v2, 0x6

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->check(Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;I)V

    .line 362
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->shapeType:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    sget-object v1, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;->Line:Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer$ShapeType;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    .line 363
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, p7, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, p7, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, p7, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v5, p7, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v3, v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 364
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v0, p1, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 365
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, p8, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, p8, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, p8, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v5, p8, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v3, v4, v5}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 366
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {v0, p3, p4, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 368
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, p8, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, p8, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, p8, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p8, p8, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v3, v4, p8}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 369
    iget-object p8, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p8, p3, p4, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 370
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget p4, p9, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget p8, p9, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v0, p9, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget v1, p9, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p3, p4, p8, v0, v1}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 371
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p5, p6, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 373
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget p4, p9, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget p8, p9, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v0, p9, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p9, p9, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p3, p4, p8, v0, p9}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 374
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p5, p6, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 375
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget p4, p7, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget p5, p7, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget p6, p7, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p7, p7, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p3, p4, p5, p6, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 376
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p3, p1, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    goto :goto_0

    .line 378
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget v1, p7, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget v3, p7, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v4, p7, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p7, p7, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {v0, v1, v3, v4, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 379
    iget-object p7, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p7, p1, p2, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 380
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget p2, p8, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget p7, p8, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget v0, p8, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p8, p8, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p1, p2, p7, v0, p8}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 381
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p1, p3, p4, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    .line 382
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    iget p2, p9, Lcom/badlogic/gdx/graphics/Color;->r:F

    iget p3, p9, Lcom/badlogic/gdx/graphics/Color;->g:F

    iget p4, p9, Lcom/badlogic/gdx/graphics/Color;->b:F

    iget p7, p9, Lcom/badlogic/gdx/graphics/Color;->a:F

    invoke-interface {p1, p2, p3, p4, p7}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->color(FFFF)V

    .line 383
    iget-object p1, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->renderer:Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;

    invoke-interface {p1, p5, p6, v2}, Lcom/badlogic/gdx/graphics/glutils/ImmediateModeRenderer;->vertex(FFF)V

    :goto_0
    return-void
.end method

.method public updateMatrices()V
    .locals 1

    const/4 v0, 0x1

    .line 139
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->matrixDirty:Z

    return-void
.end method

.method public x(FFF)V
    .locals 2

    sub-float v0, p1, p3

    sub-float v1, p2, p3

    add-float/2addr p1, p3

    add-float/2addr p2, p3

    .line 819
    invoke-virtual {p0, v0, v1, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->line(FFFF)V

    .line 820
    invoke-virtual {p0, v0, p2, p1, v1}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->line(FFFF)V

    return-void
.end method

.method public x(Lcom/badlogic/gdx/math/Vector2;F)V
    .locals 1

    .line 825
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-virtual {p0, v0, p1, p2}, Lcom/badlogic/gdx/graphics/glutils/ShapeRenderer;->x(FFF)V

    return-void
.end method
