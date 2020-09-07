.class public Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;
.super Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$LocalSetter;
.source "DefaultShader.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ACubemap"
.end annotation


# static fields
.field private static final ones:[F

.field private static final tmpV1:Lcom/badlogic/gdx/math/Vector3;


# instance fields
.field private final cacheAmbientCubemap:Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

.field public final dirLightsOffset:I

.field public final pointLightsOffset:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x12

    .line 339
    new-array v0, v0, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->ones:[F

    .line 341
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    return-void

    nop

    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(II)V
    .locals 1

    .line 345
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader$LocalSetter;-><init>()V

    .line 340
    new-instance v0, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->cacheAmbientCubemap:Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    .line 346
    iput p1, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->dirLightsOffset:I

    .line 347
    iput p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->pointLightsOffset:I

    return-void
.end method


# virtual methods
.method public set(Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;ILcom/badlogic/gdx/graphics/g3d/Renderable;Lcom/badlogic/gdx/graphics/g3d/Attributes;)V
    .locals 6

    .line 352
    iget-object v0, p3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->environment:Lcom/badlogic/gdx/graphics/g3d/Environment;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 353
    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->loc(I)I

    move-result p1

    sget-object p2, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->ones:[F

    array-length p4, p2

    invoke-virtual {p3, p1, p2, v1, p4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniform3fv(I[FII)V

    goto/16 :goto_2

    .line 355
    :cond_0
    iget-object p3, p3, Lcom/badlogic/gdx/graphics/g3d/Renderable;->worldTransform:Lcom/badlogic/gdx/math/Matrix4;

    sget-object v0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/math/Matrix4;->getTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 356
    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->AmbientLight:J

    invoke-virtual {p4, v2, v3}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->has(J)Z

    move-result p3

    if-eqz p3, :cond_1

    .line 357
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->cacheAmbientCubemap:Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->AmbientLight:J

    invoke-virtual {p4, v2, v3}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object v0

    check-cast v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g3d/attributes/ColorAttribute;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->set(Lcom/badlogic/gdx/graphics/Color;)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    .line 359
    :cond_1
    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->Type:J

    invoke-virtual {p4, v2, v3}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->has(J)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 360
    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->Type:J

    .line 361
    invoke-virtual {p4, v2, v3}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;

    iget-object p3, p3, Lcom/badlogic/gdx/graphics/g3d/attributes/DirectionalLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    .line 362
    iget v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->dirLightsOffset:I

    :goto_0
    iget v2, p3, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge v0, v2, :cond_2

    .line 363
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->cacheAmbientCubemap:Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p3, v0}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;

    iget-object v4, v4, Lcom/badlogic/gdx/graphics/g3d/environment/DirectionalLight;->direction:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3, v4}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->add(Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 366
    :cond_2
    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;->Type:J

    invoke-virtual {p4, v2, v3}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->has(J)Z

    move-result p3

    if-eqz p3, :cond_3

    .line 367
    sget-wide v2, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;->Type:J

    invoke-virtual {p4, v2, v3}, Lcom/badlogic/gdx/graphics/g3d/Attributes;->get(J)Lcom/badlogic/gdx/graphics/g3d/Attribute;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;

    iget-object p3, p3, Lcom/badlogic/gdx/graphics/g3d/attributes/PointLightsAttribute;->lights:Lcom/badlogic/gdx/utils/Array;

    .line 368
    iget p4, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->pointLightsOffset:I

    :goto_1
    iget v0, p3, Lcom/badlogic/gdx/utils/Array;->size:I

    if-ge p4, v0, :cond_3

    .line 369
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->cacheAmbientCubemap:Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    invoke-virtual {p3, p4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;

    iget-object v2, v2, Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;->color:Lcom/badlogic/gdx/graphics/Color;

    invoke-virtual {p3, p4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;

    iget-object v3, v3, Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;->position:Lcom/badlogic/gdx/math/Vector3;

    sget-object v4, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->tmpV1:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p3, p4}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;

    iget v5, v5, Lcom/badlogic/gdx/graphics/g3d/environment/PointLight;->intensity:F

    invoke-virtual {v0, v2, v3, v4, v5}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->add(Lcom/badlogic/gdx/graphics/Color;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    add-int/lit8 p4, p4, 0x1

    goto :goto_1

    .line 372
    :cond_3
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->cacheAmbientCubemap:Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->clamp()Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    .line 373
    iget-object p3, p1, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->program:Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/g3d/shaders/BaseShader;->loc(I)I

    move-result p1

    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->cacheAmbientCubemap:Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    iget-object p2, p2, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    iget-object p4, p0, Lcom/badlogic/gdx/graphics/g3d/shaders/DefaultShader$Setters$ACubemap;->cacheAmbientCubemap:Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;

    iget-object p4, p4, Lcom/badlogic/gdx/graphics/g3d/environment/AmbientCubemap;->data:[F

    array-length p4, p4

    invoke-virtual {p3, p1, p2, v1, p4}, Lcom/badlogic/gdx/graphics/glutils/ShaderProgram;->setUniform3fv(I[FII)V

    :goto_2
    return-void
.end method
