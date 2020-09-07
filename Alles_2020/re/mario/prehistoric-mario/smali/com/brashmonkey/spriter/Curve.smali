.class public Lcom/brashmonkey/spriter/Curve;
.super Ljava/lang/Object;
.source "Curve.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/brashmonkey/spriter/Curve$Constraints;,
        Lcom/brashmonkey/spriter/Curve$Type;
    }
.end annotation


# instance fields
.field public final constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

.field private lastCubicSolution:F

.field public subCurve:Lcom/brashmonkey/spriter/Curve;

.field private type:Lcom/brashmonkey/spriter/Curve$Type;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 54
    sget-object v0, Lcom/brashmonkey/spriter/Curve$Type;->Linear:Lcom/brashmonkey/spriter/Curve$Type;

    invoke-direct {p0, v0}, Lcom/brashmonkey/spriter/Curve;-><init>(Lcom/brashmonkey/spriter/Curve$Type;)V

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Curve$Type;)V
    .locals 1

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, p1, v0}, Lcom/brashmonkey/spriter/Curve;-><init>(Lcom/brashmonkey/spriter/Curve$Type;Lcom/brashmonkey/spriter/Curve;)V

    return-void
.end method

.method public constructor <init>(Lcom/brashmonkey/spriter/Curve$Type;Lcom/brashmonkey/spriter/Curve;)V
    .locals 2

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    new-instance v0, Lcom/brashmonkey/spriter/Curve$Constraints;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1, v1, v1}, Lcom/brashmonkey/spriter/Curve$Constraints;-><init>(FFFF)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    .line 94
    iput v1, p0, Lcom/brashmonkey/spriter/Curve;->lastCubicSolution:F

    .line 71
    invoke-virtual {p0, p1}, Lcom/brashmonkey/spriter/Curve;->setType(Lcom/brashmonkey/spriter/Curve$Type;)V

    .line 72
    iput-object p2, p0, Lcom/brashmonkey/spriter/Curve;->subCurve:Lcom/brashmonkey/spriter/Curve;

    return-void
.end method

.method public static getType(Ljava/lang/String;)Lcom/brashmonkey/spriter/Curve$Type;
    .locals 1

    const-string v0, "instant"

    .line 31
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p0, Lcom/brashmonkey/spriter/Curve$Type;->Instant:Lcom/brashmonkey/spriter/Curve$Type;

    return-object p0

    :cond_0
    const-string v0, "quadratic"

    .line 32
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    sget-object p0, Lcom/brashmonkey/spriter/Curve$Type;->Quadratic:Lcom/brashmonkey/spriter/Curve$Type;

    return-object p0

    :cond_1
    const-string v0, "cubic"

    .line 33
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    sget-object p0, Lcom/brashmonkey/spriter/Curve$Type;->Cubic:Lcom/brashmonkey/spriter/Curve$Type;

    return-object p0

    :cond_2
    const-string v0, "quartic"

    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    sget-object p0, Lcom/brashmonkey/spriter/Curve$Type;->Quartic:Lcom/brashmonkey/spriter/Curve$Type;

    return-object p0

    :cond_3
    const-string v0, "quintic"

    .line 35
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    sget-object p0, Lcom/brashmonkey/spriter/Curve$Type;->Quintic:Lcom/brashmonkey/spriter/Curve$Type;

    return-object p0

    :cond_4
    const-string v0, "bezier"

    .line 36
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5

    sget-object p0, Lcom/brashmonkey/spriter/Curve$Type;->Bezier:Lcom/brashmonkey/spriter/Curve$Type;

    return-object p0

    .line 37
    :cond_5
    sget-object p0, Lcom/brashmonkey/spriter/Curve$Type;->Linear:Lcom/brashmonkey/spriter/Curve$Type;

    return-object p0
.end method

.method private tweenSub(FFF)F
    .locals 1

    .line 132
    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->subCurve:Lcom/brashmonkey/spriter/Curve;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1, p2, p3}, Lcom/brashmonkey/spriter/Curve;->tween(FFF)F

    move-result p1

    return p1

    :cond_0
    return p3
.end method


# virtual methods
.method public getType()Lcom/brashmonkey/spriter/Curve$Type;
    .locals 1

    .line 90
    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->type:Lcom/brashmonkey/spriter/Curve$Type;

    return-object v0
.end method

.method public setType(Lcom/brashmonkey/spriter/Curve$Type;)V
    .locals 1

    if-eqz p1, :cond_0

    .line 82
    iput-object p1, p0, Lcom/brashmonkey/spriter/Curve;->type:Lcom/brashmonkey/spriter/Curve$Type;

    return-void

    .line 81
    :cond_0
    new-instance p1, Lcom/brashmonkey/spriter/SpriterException;

    const-string v0, "The type of a curve cannot be null!"

    invoke-direct {p1, v0}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 179
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "|["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Curve;->type:Lcom/brashmonkey/spriter/Curve$Type;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", subCurve: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/brashmonkey/spriter/Curve;->subCurve:Lcom/brashmonkey/spriter/Curve;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public tween(FFF)F
    .locals 9

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 104
    invoke-direct {p0, v0, v1, p3}, Lcom/brashmonkey/spriter/Curve;->tweenSub(FFF)F

    move-result p3

    .line 105
    sget-object v2, Lcom/brashmonkey/spriter/Curve$1;->$SwitchMap$com$brashmonkey$spriter$Curve$Type:[I

    iget-object v3, p0, Lcom/brashmonkey/spriter/Curve;->type:Lcom/brashmonkey/spriter/Curve$Type;

    invoke-virtual {v3}, Lcom/brashmonkey/spriter/Curve$Type;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 116
    invoke-static {p1, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result p1

    return p1

    .line 112
    :pswitch_0
    iget-object v2, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v2, v2, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    iget-object v3, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v3, v3, Lcom/brashmonkey/spriter/Curve$Constraints;->c3:F

    sub-float/2addr v2, v3

    const/high16 v3, 0x40400000    # 3.0f

    mul-float v2, v2, v3

    add-float/2addr v2, v1

    iget-object v4, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v4, v4, Lcom/brashmonkey/spriter/Curve$Constraints;->c3:F

    const/high16 v5, 0x40000000    # 2.0f

    iget-object v6, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v6, v6, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    mul-float v6, v6, v5

    sub-float/2addr v4, v6

    mul-float v4, v4, v3

    iget-object v5, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v5, v5, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    mul-float v5, v5, v3

    neg-float p3, p3

    invoke-static {v2, v4, v5, p3}, Lcom/brashmonkey/spriter/Calculator;->solveCubic(FFFF)Ljava/lang/Float;

    move-result-object p3

    if-nez p3, :cond_0

    .line 113
    iget p3, p0, Lcom/brashmonkey/spriter/Curve;->lastCubicSolution:F

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    goto :goto_0

    .line 114
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iput v2, p0, Lcom/brashmonkey/spriter/Curve;->lastCubicSolution:F

    .line 115
    :goto_0
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result p3

    iget-object v2, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v2, v2, Lcom/brashmonkey/spriter/Curve$Constraints;->c2:F

    iget-object v3, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v3, v3, Lcom/brashmonkey/spriter/Curve$Constraints;->c4:F

    invoke-static {p3, v0, v2, v3, v1}, Lcom/brashmonkey/spriter/Interpolator;->bezier(FFFFF)F

    move-result p3

    invoke-static {p1, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result p1

    return p1

    .line 111
    :pswitch_1
    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result v3

    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c2:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result v4

    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c3:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result v5

    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c4:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result v6

    move v2, p1

    move v7, p2

    move v8, p3

    invoke-static/range {v2 .. v8}, Lcom/brashmonkey/spriter/Interpolator;->quintic(FFFFFFF)F

    move-result p1

    return p1

    .line 110
    :pswitch_2
    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result v3

    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c2:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result v4

    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c3:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result v5

    move v2, p1

    move v6, p2

    move v7, p3

    invoke-static/range {v2 .. v7}, Lcom/brashmonkey/spriter/Interpolator;->quartic(FFFFFF)F

    move-result p1

    return p1

    .line 109
    :pswitch_3
    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result v0

    iget-object v1, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v1, v1, Lcom/brashmonkey/spriter/Curve$Constraints;->c2:F

    invoke-static {p1, p2, v1}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result v1

    invoke-static {p1, v0, v1, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->cubic(FFFFF)F

    move-result p1

    return p1

    .line 108
    :pswitch_4
    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result v0

    invoke-static {p1, v0, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->quadratic(FFFF)F

    move-result p1

    return p1

    .line 107
    :pswitch_5
    invoke-static {p1, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->linear(FFF)F

    move-result p1

    :pswitch_6
    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public tweenAngle(FFF)F
    .locals 9

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 162
    invoke-direct {p0, v0, v1, p3}, Lcom/brashmonkey/spriter/Curve;->tweenSub(FFF)F

    move-result p3

    .line 163
    sget-object v2, Lcom/brashmonkey/spriter/Curve$1;->$SwitchMap$com$brashmonkey$spriter$Curve$Type:[I

    iget-object v3, p0, Lcom/brashmonkey/spriter/Curve;->type:Lcom/brashmonkey/spriter/Curve$Type;

    invoke-virtual {v3}, Lcom/brashmonkey/spriter/Curve$Type;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    .line 174
    invoke-static {p1, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result p1

    return p1

    .line 170
    :pswitch_0
    iget-object v2, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v2, v2, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    iget-object v3, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v3, v3, Lcom/brashmonkey/spriter/Curve$Constraints;->c3:F

    sub-float/2addr v2, v3

    const/high16 v3, 0x40400000    # 3.0f

    mul-float v2, v2, v3

    add-float/2addr v2, v1

    iget-object v4, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v4, v4, Lcom/brashmonkey/spriter/Curve$Constraints;->c3:F

    const/high16 v5, 0x40000000    # 2.0f

    iget-object v6, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v6, v6, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    mul-float v6, v6, v5

    sub-float/2addr v4, v6

    mul-float v4, v4, v3

    iget-object v5, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v5, v5, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    mul-float v5, v5, v3

    neg-float p3, p3

    invoke-static {v2, v4, v5, p3}, Lcom/brashmonkey/spriter/Calculator;->solveCubic(FFFF)Ljava/lang/Float;

    move-result-object p3

    if-nez p3, :cond_0

    .line 171
    iget p3, p0, Lcom/brashmonkey/spriter/Curve;->lastCubicSolution:F

    invoke-static {p3}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p3

    goto :goto_0

    .line 172
    :cond_0
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result v2

    iput v2, p0, Lcom/brashmonkey/spriter/Curve;->lastCubicSolution:F

    .line 173
    :goto_0
    invoke-virtual {p3}, Ljava/lang/Float;->floatValue()F

    move-result p3

    iget-object v2, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v2, v2, Lcom/brashmonkey/spriter/Curve$Constraints;->c2:F

    iget-object v3, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v3, v3, Lcom/brashmonkey/spriter/Curve$Constraints;->c4:F

    invoke-static {p3, v0, v2, v3, v1}, Lcom/brashmonkey/spriter/Interpolator;->bezier(FFFFF)F

    move-result p3

    invoke-static {p1, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result p1

    return p1

    .line 169
    :pswitch_1
    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result v3

    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c2:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result v4

    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c3:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result v5

    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c4:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result v6

    move v2, p1

    move v7, p2

    move v8, p3

    invoke-static/range {v2 .. v8}, Lcom/brashmonkey/spriter/Interpolator;->quinticAngle(FFFFFFF)F

    move-result p1

    return p1

    .line 168
    :pswitch_2
    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result v3

    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c2:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result v4

    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c3:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result v5

    move v2, p1

    move v6, p2

    move v7, p3

    invoke-static/range {v2 .. v7}, Lcom/brashmonkey/spriter/Interpolator;->quarticAngle(FFFFFF)F

    move-result p1

    return p1

    .line 167
    :pswitch_3
    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result v0

    iget-object v1, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v1, v1, Lcom/brashmonkey/spriter/Curve$Constraints;->c2:F

    invoke-static {p1, p2, v1}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result v1

    invoke-static {p1, v0, v1, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->cubicAngle(FFFFF)F

    move-result p1

    return p1

    .line 166
    :pswitch_4
    iget-object v0, p0, Lcom/brashmonkey/spriter/Curve;->constraints:Lcom/brashmonkey/spriter/Curve$Constraints;

    iget v0, v0, Lcom/brashmonkey/spriter/Curve$Constraints;->c1:F

    invoke-static {p1, p2, v0}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result v0

    invoke-static {p1, v0, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->quadraticAngle(FFFF)F

    move-result p1

    return p1

    .line 165
    :pswitch_5
    invoke-static {p1, p2, p3}, Lcom/brashmonkey/spriter/Interpolator;->linearAngle(FFF)F

    move-result p1

    :pswitch_6
    return p1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public tweenAngle(FFFI)F
    .locals 2

    const/high16 v0, 0x43b40000    # 360.0f

    const/4 v1, 0x0

    if-lez p4, :cond_0

    sub-float p4, p2, p1

    cmpg-float p4, p4, v1

    if-gez p4, :cond_1

    add-float/2addr p2, v0

    goto :goto_0

    :cond_0
    if-gez p4, :cond_2

    sub-float p4, p2, p1

    cmpl-float p4, p4, v1

    if-lez p4, :cond_1

    sub-float/2addr p2, v0

    .line 155
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2, p3}, Lcom/brashmonkey/spriter/Curve;->tween(FFF)F

    move-result p1

    :cond_2
    return p1
.end method

.method public tweenPoint(Lcom/brashmonkey/spriter/Point;Lcom/brashmonkey/spriter/Point;FLcom/brashmonkey/spriter/Point;)V
    .locals 2

    .line 128
    iget v0, p1, Lcom/brashmonkey/spriter/Point;->x:F

    iget v1, p2, Lcom/brashmonkey/spriter/Point;->x:F

    invoke-virtual {p0, v0, v1, p3}, Lcom/brashmonkey/spriter/Curve;->tween(FFF)F

    move-result v0

    iget p1, p1, Lcom/brashmonkey/spriter/Point;->y:F

    iget p2, p2, Lcom/brashmonkey/spriter/Point;->y:F

    invoke-virtual {p0, p1, p2, p3}, Lcom/brashmonkey/spriter/Curve;->tween(FFF)F

    move-result p1

    invoke-virtual {p4, v0, p1}, Lcom/brashmonkey/spriter/Point;->set(FF)Lcom/brashmonkey/spriter/Point;

    return-void
.end method
