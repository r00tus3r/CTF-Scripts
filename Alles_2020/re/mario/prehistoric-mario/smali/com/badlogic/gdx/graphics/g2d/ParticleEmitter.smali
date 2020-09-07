.class public Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;
.super Ljava/lang/Object;
.source "ParticleEmitter.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;,
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnEllipseSide;,
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;,
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;,
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;,
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;,
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;,
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;,
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$NumericValue;,
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ParticleValue;,
        Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;
    }
.end annotation


# static fields
.field private static final UPDATE_ANGLE:I = 0x2

.field private static final UPDATE_GRAVITY:I = 0x20

.field private static final UPDATE_ROTATION:I = 0x4

.field private static final UPDATE_SCALE:I = 0x1

.field private static final UPDATE_SPRITE:I = 0x80

.field private static final UPDATE_TINT:I = 0x40

.field private static final UPDATE_VELOCITY:I = 0x8

.field private static final UPDATE_WIND:I = 0x10


# instance fields
.field private accumulator:F

.field private active:[Z

.field private activeCount:I

.field private additive:Z

.field private aligned:Z

.field private allowCompletion:Z

.field private angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private attached:Z

.field private behind:Z

.field private bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

.field cleansUpBlendFunction:Z

.field private continuous:Z

.field private delay:F

.field private delayTimer:F

.field private delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

.field public duration:F

.field public durationTimer:F

.field private durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

.field private emission:I

.field private emissionDelta:I

.field private emissionDiff:I

.field private emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private firstUpdate:Z

.field private flipX:Z

.field private flipY:Z

.field private gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private imagePaths:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private life:I

.field private lifeDiff:I

.field private lifeOffset:I

.field private lifeOffsetDiff:I

.field private lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

.field private lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

.field private maxParticleCount:I

.field private minParticleCount:I

.field private motionValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

.field private name:Ljava/lang/String;

.field private particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

.field private premultipliedAlpha:Z

.field private rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private spawnHeight:F

.field private spawnHeightDiff:F

.field private spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

.field private spawnWidth:F

.field private spawnWidthDiff:F

.field private spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

.field private sprites:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g2d/Sprite;",
            ">;"
        }
    .end annotation
.end field

.field private tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

.field private transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private updateFlags:I

.field private velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private x:F

.field private xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

.field private xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private xSizeValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

.field private y:F

.field private yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

.field private yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

.field private ySizeValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 42
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    .line 43
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 44
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    .line 45
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 46
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 47
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 48
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 50
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 52
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 53
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 54
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    .line 55
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 56
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 57
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 58
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 59
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    .line 67
    sget-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;->single:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    const/4 v0, 0x4

    .line 69
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 86
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    const/4 v0, 0x1

    .line 93
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    const/4 v1, 0x0

    .line 94
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    .line 95
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->cleansUpBlendFunction:Z

    .line 98
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->initialize()V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;)V
    .locals 2

    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 42
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    .line 43
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 44
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    .line 45
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 46
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 47
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 48
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 50
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 52
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 53
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 54
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    .line 55
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 56
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 57
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 58
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 59
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    .line 67
    sget-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;->single:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    const/4 v0, 0x4

    .line 69
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 86
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    const/4 v0, 0x1

    .line 93
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    const/4 v1, 0x0

    .line 94
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    .line 95
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->cleansUpBlendFunction:Z

    .line 107
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->sprites:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(Lcom/badlogic/gdx/utils/Array;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->sprites:Lcom/badlogic/gdx/utils/Array;

    .line 108
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->name:Ljava/lang/String;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->name:Ljava/lang/String;

    .line 109
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->imagePaths:Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/utils/Array;-><init>(Lcom/badlogic/gdx/utils/Array;)V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->imagePaths:Lcom/badlogic/gdx/utils/Array;

    .line 110
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setMaxParticleCount(I)V

    .line 111
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->minParticleCount:I

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->minParticleCount:I

    .line 112
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V

    .line 113
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V

    .line 114
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 115
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;)V

    .line 116
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;)V

    .line 117
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 118
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 119
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 120
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 121
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 122
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 123
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 124
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 125
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;)V

    .line 126
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V

    .line 127
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V

    .line 128
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 129
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;)V

    .line 130
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    iget-object v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;->load(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;)V

    .line 131
    iget-boolean v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->attached:Z

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->attached:Z

    .line 132
    iget-boolean v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->continuous:Z

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->continuous:Z

    .line 133
    iget-boolean v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->aligned:Z

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->aligned:Z

    .line 134
    iget-boolean v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->behind:Z

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->behind:Z

    .line 135
    iget-boolean v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    .line 136
    iget-boolean v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    .line 137
    iget-boolean v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->cleansUpBlendFunction:Z

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->cleansUpBlendFunction:Z

    .line 138
    iget-object v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    .line 139
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getX()F

    move-result v0

    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getY()F

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setPosition(FF)V

    return-void
.end method

.method public constructor <init>(Ljava/io/BufferedReader;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 42
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    .line 43
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 44
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    .line 45
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 46
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 47
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 48
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 49
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 50
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 51
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 52
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 53
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 54
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    .line 55
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 56
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 57
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 58
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 59
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    invoke-direct {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    .line 67
    sget-object v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;->single:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    const/4 v0, 0x4

    .line 69
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 86
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    const/4 v0, 0x1

    .line 93
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    const/4 v1, 0x0

    .line 94
    iput-boolean v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    .line 95
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->cleansUpBlendFunction:Z

    .line 102
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->initialize()V

    .line 103
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->load(Ljava/io/BufferedReader;)V

    return-void
.end method

.method private activateParticle(I)V
    .locals 17

    move-object/from16 v0, p0

    .line 399
    sget-object v1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$1;->$SwitchMap$com$badlogic$gdx$graphics$g2d$ParticleEmitter$SpriteMode:[I

    iget-object v2, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;->ordinal()I

    move-result v2

    aget v1, v1, v2

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eq v1, v4, :cond_1

    if-eq v1, v3, :cond_1

    if-eq v1, v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    .line 405
    :cond_0
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->sprites:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->random()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    goto :goto_0

    .line 402
    :cond_1
    iget-object v1, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->sprites:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->first()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    .line 409
    :goto_0
    iget-object v5, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    aget-object v6, v5, p1

    if-nez v6, :cond_2

    .line 411
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->newParticle(Lcom/badlogic/gdx/graphics/g2d/Sprite;)Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    move-result-object v6

    aput-object v6, v5, p1

    .line 412
    iget-boolean v5, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->flipX:Z

    iget-boolean v7, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->flipY:Z

    invoke-virtual {v6, v5, v7}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->flip(ZZ)V

    goto :goto_1

    .line 414
    :cond_2
    invoke-virtual {v6, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->set(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    .line 417
    :goto_1
    iget v5, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    div-float/2addr v5, v7

    .line 418
    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    .line 420
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    iget-boolean v8, v8, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    if-eqz v8, :cond_3

    invoke-direct/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->generateLifeValues()V

    .line 422
    :cond_3
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    iget-boolean v8, v8, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    if-eqz v8, :cond_4

    invoke-direct/range {p0 .. p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->generateLifeOffsetValues()V

    .line 424
    :cond_4
    iget v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->life:I

    iget v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeDiff:I

    int-to-float v9, v9

    iget-object v10, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v10, v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->getScale(F)F

    move-result v10

    mul-float v9, v9, v10

    float-to-int v9, v9

    add-int/2addr v8, v9

    iput v8, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->life:I

    iput v8, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->currentLife:I

    .line 426
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v8, v8, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v8, :cond_5

    .line 427
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v8

    iput v8, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->velocity:F

    .line 428
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v8

    iput v8, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->velocityDiff:F

    .line 429
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->isRelative()Z

    move-result v8

    if-nez v8, :cond_5

    iget v8, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->velocityDiff:F

    iget v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->velocity:F

    sub-float/2addr v8, v9

    iput v8, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->velocityDiff:F

    .line 432
    :cond_5
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v8

    iput v8, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angle:F

    .line 433
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v8

    iput v8, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleDiff:F

    .line 434
    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->isRelative()Z

    move-result v8

    if-nez v8, :cond_6

    iget v8, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleDiff:F

    iget v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angle:F

    sub-float/2addr v8, v9

    iput v8, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleDiff:F

    :cond_6
    and-int/2addr v7, v3

    const/4 v8, 0x0

    if-nez v7, :cond_7

    .line 437
    iget v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angle:F

    iget v10, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleDiff:F

    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v11, v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v11

    mul-float v10, v10, v11

    add-float/2addr v9, v10

    .line 438
    iput v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angle:F

    .line 439
    invoke-static {v9}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v10

    iput v10, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleCos:F

    .line 440
    invoke-static {v9}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v10

    iput v10, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleSin:F

    goto :goto_2

    :cond_7
    const/4 v9, 0x0

    .line 443
    :goto_2
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getWidth()F

    move-result v10

    .line 444
    invoke-virtual {v1}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getHeight()F

    move-result v1

    .line 446
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v11

    div-float/2addr v11, v10

    iput v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScale:F

    .line 447
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v11

    div-float/2addr v11, v10

    iput v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScaleDiff:F

    .line 448
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->isRelative()Z

    move-result v11

    if-nez v11, :cond_8

    iget v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScaleDiff:F

    iget v12, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScale:F

    sub-float/2addr v11, v12

    iput v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScaleDiff:F

    .line 450
    :cond_8
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v11, v11, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v11, :cond_a

    .line 451
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v11

    div-float/2addr v11, v1

    iput v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->yScale:F

    .line 452
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v11

    div-float/2addr v11, v1

    iput v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->yScaleDiff:F

    .line 453
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->isRelative()Z

    move-result v11

    if-nez v11, :cond_9

    iget v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->yScaleDiff:F

    iget v12, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->yScale:F

    sub-float/2addr v11, v12

    iput v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->yScaleDiff:F

    .line 454
    :cond_9
    iget v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScale:F

    iget v12, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScaleDiff:F

    iget-object v13, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v13, v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v13

    mul-float v12, v12, v13

    add-float/2addr v11, v12

    iget v12, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->yScale:F

    iget v13, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->yScaleDiff:F

    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 455
    invoke-virtual {v14, v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v14

    mul-float v13, v13, v14

    add-float/2addr v12, v13

    .line 454
    invoke-virtual {v6, v11, v12}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setScale(FF)V

    goto :goto_3

    .line 457
    :cond_a
    iget v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScale:F

    iget v12, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScaleDiff:F

    iget-object v13, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v13, v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v13

    mul-float v12, v12, v13

    add-float/2addr v11, v12

    invoke-virtual {v6, v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setScale(F)V

    .line 460
    :goto_3
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v11, v11, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v11, :cond_d

    .line 461
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v11

    iput v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotation:F

    .line 462
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v11

    iput v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotationDiff:F

    .line 463
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->isRelative()Z

    move-result v11

    if-nez v11, :cond_b

    iget v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotationDiff:F

    iget v12, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotation:F

    sub-float/2addr v11, v12

    iput v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotationDiff:F

    .line 464
    :cond_b
    iget v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotation:F

    iget v12, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotationDiff:F

    iget-object v13, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v13, v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v13

    mul-float v12, v12, v13

    add-float/2addr v11, v12

    .line 465
    iget-boolean v12, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->aligned:Z

    if-eqz v12, :cond_c

    add-float/2addr v11, v9

    .line 466
    :cond_c
    invoke-virtual {v6, v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setRotation(F)V

    .line 469
    :cond_d
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v9, v9, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v9, :cond_e

    .line 470
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v9

    iput v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->wind:F

    .line 471
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v9

    iput v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->windDiff:F

    .line 472
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->isRelative()Z

    move-result v9

    if-nez v9, :cond_e

    iget v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->windDiff:F

    iget v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->wind:F

    sub-float/2addr v9, v11

    iput v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->windDiff:F

    .line 475
    :cond_e
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v9, v9, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v9, :cond_f

    .line 476
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v9

    iput v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->gravity:F

    .line 477
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v9

    iput v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->gravityDiff:F

    .line 478
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->isRelative()Z

    move-result v9

    if-nez v9, :cond_f

    iget v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->gravityDiff:F

    iget v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->gravity:F

    sub-float/2addr v9, v11

    iput v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->gravityDiff:F

    .line 481
    :cond_f
    iget-object v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->tint:[F

    if-nez v9, :cond_10

    .line 482
    new-array v9, v2, [F

    iput-object v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->tint:[F

    .line 483
    :cond_10
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    invoke-virtual {v11, v8}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->getColor(F)[F

    move-result-object v11

    const/4 v12, 0x0

    .line 484
    aget v13, v11, v12

    aput v13, v9, v12

    .line 485
    aget v12, v11, v4

    aput v12, v9, v4

    .line 486
    aget v11, v11, v3

    aput v11, v9, v3

    .line 488
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v9

    iput v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->transparency:F

    .line 489
    iget-object v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v9}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v9

    iget v11, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->transparency:F

    sub-float/2addr v9, v11

    iput v9, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->transparencyDiff:F

    .line 492
    iget v9, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->x:F

    .line 493
    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    iget-boolean v11, v11, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->active:Z

    if-eqz v11, :cond_11

    iget-object v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v11}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->newLowValue()F

    move-result v11

    add-float/2addr v9, v11

    .line 494
    :cond_11
    iget v11, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->y:F

    .line 495
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    iget-boolean v12, v12, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->active:Z

    if-eqz v12, :cond_12

    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->newLowValue()F

    move-result v12

    add-float/2addr v11, v12

    .line 496
    :cond_12
    sget-object v12, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$1;->$SwitchMap$com$badlogic$gdx$graphics$g2d$ParticleEmitter$SpawnShape:[I

    iget-object v13, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    iget-object v13, v13, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;->shape:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;

    invoke-virtual {v13}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShape;->ordinal()I

    move-result v13

    aget v12, v12, v13

    const/high16 v13, 0x40000000    # 2.0f

    if-eq v12, v4, :cond_1b

    if-eq v12, v3, :cond_15

    if-eq v12, v2, :cond_13

    goto/16 :goto_5

    .line 548
    :cond_13
    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidth:F

    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthDiff:F

    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v7, v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v7

    mul-float v3, v3, v7

    add-float/2addr v2, v3

    .line 549
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeight:F

    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightDiff:F

    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v12, v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v12

    mul-float v7, v7, v12

    add-float/2addr v3, v7

    cmpl-float v7, v2, v8

    if-eqz v7, :cond_14

    .line 551
    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v7

    mul-float v7, v7, v2

    add-float/2addr v9, v7

    div-float/2addr v3, v2

    mul-float v7, v7, v3

    add-float/2addr v11, v7

    goto/16 :goto_5

    .line 555
    :cond_14
    invoke-static {}, Lcom/badlogic/gdx/math/MathUtils;->random()F

    move-result v2

    mul-float v3, v3, v2

    add-float/2addr v11, v3

    goto/16 :goto_5

    .line 505
    :cond_15
    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidth:F

    iget v12, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthDiff:F

    iget-object v14, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v14, v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v14

    mul-float v12, v12, v14

    add-float/2addr v2, v12

    .line 506
    iget v12, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeight:F

    iget v14, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightDiff:F

    iget-object v15, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v15, v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v15

    mul-float v14, v14, v15

    add-float/2addr v12, v14

    div-float v14, v2, v13

    div-float/2addr v12, v13

    cmpl-float v15, v14, v8

    if-eqz v15, :cond_1c

    cmpl-float v8, v12, v8

    if-nez v8, :cond_16

    goto/16 :goto_5

    :cond_16
    div-float v8, v14, v12

    .line 511
    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    iget-boolean v12, v12, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;->edges:Z

    if-eqz v12, :cond_19

    .line 513
    sget-object v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$1;->$SwitchMap$com$badlogic$gdx$graphics$g2d$ParticleEmitter$SpawnEllipseSide:[I

    iget-object v12, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    iget-object v12, v12, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;->side:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnEllipseSide;

    invoke-virtual {v12}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnEllipseSide;->ordinal()I

    move-result v12

    aget v2, v2, v12

    const/high16 v12, 0x43330000    # 179.0f

    if-eq v2, v4, :cond_18

    if-eq v2, v3, :cond_17

    const/high16 v2, 0x43b40000    # 360.0f

    .line 521
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v2

    goto :goto_4

    .line 518
    :cond_17
    invoke-static {v12}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v2

    goto :goto_4

    .line 515
    :cond_18
    invoke-static {v12}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v2

    neg-float v2, v2

    .line 524
    :goto_4
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v3

    .line 525
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v12

    mul-float v15, v3, v14

    add-float/2addr v9, v15

    mul-float v14, v14, v12

    div-float/2addr v14, v8

    add-float/2addr v11, v14

    if-nez v7, :cond_1c

    .line 529
    iput v2, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angle:F

    .line 530
    iput v3, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleCos:F

    .line 531
    iput v12, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleSin:F

    goto :goto_5

    :cond_19
    mul-float v3, v14, v14

    .line 536
    :cond_1a
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v7

    sub-float/2addr v7, v14

    .line 537
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v12

    sub-float/2addr v12, v14

    mul-float v15, v7, v7

    mul-float v16, v12, v12

    add-float v15, v15, v16

    cmpg-float v15, v15, v3

    if-gtz v15, :cond_1a

    add-float/2addr v9, v7

    div-float/2addr v12, v8

    add-float/2addr v11, v12

    goto :goto_5

    .line 498
    :cond_1b
    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidth:F

    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthDiff:F

    iget-object v7, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v7, v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v7

    mul-float v3, v3, v7

    add-float/2addr v2, v3

    .line 499
    iget v3, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeight:F

    iget v7, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightDiff:F

    iget-object v8, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v8, v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v8

    mul-float v7, v7, v8

    add-float/2addr v3, v7

    .line 500
    invoke-static {v2}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v7

    div-float/2addr v2, v13

    sub-float/2addr v7, v2

    add-float/2addr v9, v7

    .line 501
    invoke-static {v3}, Lcom/badlogic/gdx/math/MathUtils;->random(F)F

    move-result v2

    div-float/2addr v3, v13

    sub-float/2addr v2, v3

    add-float/2addr v11, v2

    :cond_1c
    :goto_5
    div-float v2, v10, v13

    sub-float/2addr v9, v2

    div-float v2, v1, v13

    sub-float/2addr v11, v2

    .line 560
    invoke-virtual {v6, v9, v11, v10, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setBounds(FFFF)V

    .line 562
    iget v1, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffset:I

    int-to-float v1, v1

    iget v2, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetDiff:I

    int-to-float v2, v2

    iget-object v3, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v3, v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->getScale(F)F

    move-result v3

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    float-to-int v1, v1

    if-lez v1, :cond_1e

    .line 564
    iget v2, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->currentLife:I

    if-lt v1, v2, :cond_1d

    iget v1, v6, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->currentLife:I

    sub-int/2addr v1, v4

    :cond_1d
    int-to-float v2, v1

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v2, v3

    .line 565
    invoke-direct {v0, v6, v2, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateParticle(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;FI)Z

    :cond_1e
    return-void
.end method

.method private generateLifeOffsetValues()V
    .locals 2

    .line 660
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->active:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->newLowValue()F

    move-result v0

    float-to-int v0, v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffset:I

    .line 661
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->newHighValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetDiff:I

    .line 662
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->isRelative()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetDiff:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffset:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetDiff:I

    :cond_1
    return-void
.end method

.method private generateLifeValues()V
    .locals 2

    .line 654
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->newLowValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->life:I

    .line 655
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->newHighValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeDiff:I

    .line 656
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->isRelative()Z

    move-result v0

    if-nez v0, :cond_0

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeDiff:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->life:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeDiff:I

    :cond_0
    return-void
.end method

.method private initialize()V
    .locals 2

    .line 143
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->sprites:Lcom/badlogic/gdx/utils/Array;

    .line 144
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->imagePaths:Lcom/badlogic/gdx/utils/Array;

    .line 145
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->setAlwaysActive(Z)V

    .line 146
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setAlwaysActive(Z)V

    .line 147
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->setAlwaysActive(Z)V

    .line 148
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setAlwaysActive(Z)V

    .line 149
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setAlwaysActive(Z)V

    .line 150
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;->setAlwaysActive(Z)V

    .line 151
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setAlwaysActive(Z)V

    .line 152
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setAlwaysActive(Z)V

    return-void
.end method

.method static readBoolean(Ljava/io/BufferedReader;Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1195
    invoke-static {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readString(Ljava/io/BufferedReader;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static readBoolean(Ljava/lang/String;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1191
    invoke-static {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static readFloat(Ljava/io/BufferedReader;Ljava/lang/String;)F
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1203
    invoke-static {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readString(Ljava/io/BufferedReader;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0

    return p0
.end method

.method static readInt(Ljava/io/BufferedReader;Ljava/lang/String;)I
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1199
    invoke-static {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readString(Ljava/io/BufferedReader;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method static readString(Ljava/io/BufferedReader;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1185
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 1187
    invoke-static {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 1186
    :cond_0
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Missing value: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static readString(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, ":"

    .line 1181
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private restart()V
    .locals 2

    .line 355
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->active:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->newLowValue()F

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delay:F

    .line 356
    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayTimer:F

    .line 358
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    .line 359
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->newLowValue()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    .line 361
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emission:I

    .line 362
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v0

    float-to-int v0, v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDiff:I

    .line 363
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->isRelative()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDiff:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emission:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDiff:I

    .line 365
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->generateLifeValues()V

    .line 367
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->independent:Z

    if-nez v0, :cond_3

    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->generateLifeOffsetValues()V

    .line 369
    :cond_3
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidth:F

    .line 370
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthDiff:F

    .line 371
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->isRelative()Z

    move-result v0

    if-nez v0, :cond_4

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthDiff:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidth:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthDiff:F

    .line 373
    :cond_4
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newLowValue()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeight:F

    .line 374
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->newHighValue()F

    move-result v0

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightDiff:F

    .line 375
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->isRelative()Z

    move-result v0

    if-nez v0, :cond_5

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightDiff:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeight:F

    sub-float/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightDiff:F

    :cond_5
    const/4 v0, 0x0

    .line 377
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    .line 378
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->timeline:[F

    array-length v0, v0

    if-le v0, v1, :cond_6

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    or-int/lit8 v0, v0, 0x2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    .line 379
    :cond_6
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v0, :cond_7

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    or-int/lit8 v0, v0, 0x8

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    .line 380
    :cond_7
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->timeline:[F

    array-length v0, v0

    if-le v0, v1, :cond_8

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    or-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    .line 381
    :cond_8
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v0, :cond_9

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->timeline:[F

    array-length v0, v0

    if-le v0, v1, :cond_9

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    or-int/2addr v0, v1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    .line 382
    :cond_9
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v0, :cond_a

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->timeline:[F

    array-length v0, v0

    if-le v0, v1, :cond_a

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    or-int/lit8 v0, v0, 0x4

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    .line 383
    :cond_a
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v0, :cond_b

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    or-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    .line 384
    :cond_b
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v0, :cond_c

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    or-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    .line 385
    :cond_c
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    iget-object v0, v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->timeline:[F

    array-length v0, v0

    if-le v0, v1, :cond_d

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    or-int/lit8 v0, v0, 0x40

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    .line 386
    :cond_d
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    sget-object v1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;->animated:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    if-ne v0, v1, :cond_e

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    or-int/lit16 v0, v0, 0x80

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    :cond_e
    return-void
.end method

.method private updateParticle(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;FI)Z
    .locals 9

    .line 570
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->currentLife:I

    sub-int/2addr v0, p3

    const/4 p3, 0x0

    if-gtz v0, :cond_0

    return p3

    .line 572
    :cond_0
    iput v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->currentLife:I

    .line 574
    iget v0, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->currentLife:I

    int-to-float v0, v0

    iget v1, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->life:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float v0, v1, v0

    .line 575
    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateFlags:I

    and-int/lit8 v3, v2, 0x1

    if-eqz v3, :cond_2

    .line 578
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget-boolean v3, v3, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->active:Z

    if-eqz v3, :cond_1

    .line 579
    iget v3, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScale:F

    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScaleDiff:F

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v5, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v5

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->yScale:F

    iget v5, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->yScaleDiff:F

    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 580
    invoke-virtual {v6, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v6

    mul-float v5, v5, v6

    add-float/2addr v4, v5

    .line 579
    invoke-virtual {p1, v3, v4}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setScale(FF)V

    goto :goto_0

    .line 582
    :cond_1
    iget v3, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScale:F

    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->xScaleDiff:F

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v5, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v5

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    invoke-virtual {p1, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setScale(F)V

    :cond_2
    :goto_0
    and-int/lit8 v3, v2, 0x8

    if-eqz v3, :cond_a

    .line 587
    iget v3, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->velocity:F

    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->velocityDiff:F

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v5, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v5

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    mul-float v3, v3, p2

    and-int/lit8 v4, v2, 0x2

    if-eqz v4, :cond_4

    .line 591
    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angle:F

    iget v5, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleDiff:F

    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v6, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v6

    mul-float v5, v5, v6

    add-float/2addr v4, v5

    .line 592
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->cosDeg(F)F

    move-result v5

    mul-float v5, v5, v3

    .line 593
    invoke-static {v4}, Lcom/badlogic/gdx/math/MathUtils;->sinDeg(F)F

    move-result v6

    mul-float v3, v3, v6

    and-int/lit8 v6, v2, 0x4

    if-eqz v6, :cond_7

    .line 595
    iget v6, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotation:F

    iget v7, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotationDiff:F

    iget-object v8, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v8, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v8

    mul-float v7, v7, v8

    add-float/2addr v6, v7

    .line 596
    iget-boolean v7, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->aligned:Z

    if-eqz v7, :cond_3

    add-float/2addr v6, v4

    .line 597
    :cond_3
    invoke-virtual {p1, v6}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setRotation(F)V

    goto :goto_1

    .line 600
    :cond_4
    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleCos:F

    mul-float v5, v3, v4

    .line 601
    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angleSin:F

    mul-float v3, v3, v4

    .line 602
    iget-boolean v4, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->aligned:Z

    if-nez v4, :cond_5

    and-int/lit8 v4, v2, 0x4

    if-eqz v4, :cond_7

    .line 603
    :cond_5
    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotation:F

    iget v6, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotationDiff:F

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v7, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v7

    mul-float v6, v6, v7

    add-float/2addr v4, v6

    .line 604
    iget-boolean v6, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->aligned:Z

    if-eqz v6, :cond_6

    iget v6, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->angle:F

    add-float/2addr v4, v6

    .line 605
    :cond_6
    invoke-virtual {p1, v4}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setRotation(F)V

    :cond_7
    :goto_1
    and-int/lit8 v4, v2, 0x10

    if-eqz v4, :cond_8

    .line 610
    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->wind:F

    iget v6, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->windDiff:F

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v7, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v7

    mul-float v6, v6, v7

    add-float/2addr v4, v6

    mul-float v4, v4, p2

    add-float/2addr v5, v4

    :cond_8
    and-int/lit8 v4, v2, 0x20

    if-eqz v4, :cond_9

    .line 613
    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->gravity:F

    iget v6, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->gravityDiff:F

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v7, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v7

    mul-float v6, v6, v7

    add-float/2addr v4, v6

    mul-float v4, v4, p2

    add-float/2addr v3, v4

    .line 615
    :cond_9
    invoke-virtual {p1, v5, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->translate(FF)V

    goto :goto_2

    :cond_a
    and-int/lit8 p2, v2, 0x4

    if-eqz p2, :cond_b

    .line 618
    iget p2, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotation:F

    iget v3, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->rotationDiff:F

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v4, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v4

    mul-float v3, v3, v4

    add-float/2addr p2, v3

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setRotation(F)V

    :cond_b
    :goto_2
    and-int/lit8 p2, v2, 0x40

    if-eqz p2, :cond_c

    .line 623
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->getColor(F)[F

    move-result-object p2

    goto :goto_3

    .line 625
    :cond_c
    iget-object p2, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->tint:[F

    .line 627
    :goto_3
    iget-boolean v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v3, :cond_e

    .line 628
    iget-boolean v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    if-eqz v3, :cond_d

    const/4 v1, 0x0

    .line 629
    :cond_d
    iget v3, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->transparency:F

    iget v6, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->transparencyDiff:F

    iget-object v7, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v7, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v7

    mul-float v6, v6, v7

    add-float/2addr v3, v6

    .line 630
    aget p3, p2, p3

    mul-float p3, p3, v3

    aget v6, p2, v5

    mul-float v6, v6, v3

    aget p2, p2, v4

    mul-float p2, p2, v3

    mul-float v3, v3, v1

    invoke-virtual {p1, p3, v6, p2, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setColor(FFFF)V

    goto :goto_4

    .line 632
    :cond_e
    aget p3, p2, p3

    aget v1, p2, v5

    aget p2, p2, v4

    iget v3, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->transparency:F

    iget v4, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->transparencyDiff:F

    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    .line 633
    invoke-virtual {v6, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v6

    mul-float v4, v4, v6

    add-float/2addr v3, v4

    .line 632
    invoke-virtual {p1, p3, v1, p2, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setColor(FFFF)V

    :goto_4
    and-int/lit16 p2, v2, 0x80

    if-eqz p2, :cond_f

    .line 637
    iget-object p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->sprites:Lcom/badlogic/gdx/utils/Array;

    iget p2, p2, Lcom/badlogic/gdx/utils/Array;->size:I

    int-to-float p2, p2

    mul-float v0, v0, p2

    float-to-int p2, v0

    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->sprites:Lcom/badlogic/gdx/utils/Array;

    iget p3, p3, Lcom/badlogic/gdx/utils/Array;->size:I

    sub-int/2addr p3, v5

    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result p2

    .line 638
    iget p3, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->frame:I

    if-eq p3, p2, :cond_f

    .line 639
    iget-object p3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->sprites:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p3, p2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    .line 640
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->getWidth()F

    move-result v0

    .line 641
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->getHeight()F

    move-result v1

    .line 642
    invoke-virtual {p1, p3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 643
    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getWidth()F

    move-result v2

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getHeight()F

    move-result v3

    invoke-virtual {p1, v2, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setSize(FF)V

    .line 644
    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getOriginX()F

    move-result v2

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getOriginY()F

    move-result v3

    invoke-virtual {p1, v2, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setOrigin(FF)V

    .line 645
    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getWidth()F

    move-result v2

    sub-float/2addr v0, v2

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v0, v2

    invoke-virtual {p3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getHeight()F

    move-result p3

    sub-float/2addr v1, p3

    div-float/2addr v1, v2

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->translate(FF)V

    .line 646
    iput p2, p1, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->frame:I

    :cond_f
    return v5
.end method


# virtual methods
.method public addParticle()V
    .locals 5

    .line 163
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    .line 164
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    if-ne v0, v1, :cond_0

    return-void

    .line 165
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->active:[Z

    const/4 v2, 0x0

    .line 166
    array-length v3, v1

    :goto_0
    if-ge v2, v3, :cond_2

    .line 167
    aget-boolean v4, v1, v2

    if-nez v4, :cond_1

    .line 168
    invoke-direct {p0, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activateParticle(I)V

    const/4 v3, 0x1

    .line 169
    aput-boolean v3, v1, v2

    add-int/2addr v0, v3

    .line 170
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method

.method public addParticles(I)V
    .locals 6

    .line 177
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    sub-int/2addr v0, v1

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p1

    if-nez p1, :cond_0

    return-void

    .line 179
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->active:[Z

    .line 180
    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v2, p1, :cond_2

    :goto_1
    if-ge v3, v1, :cond_2

    .line 184
    aget-boolean v4, v0, v3

    if-nez v4, :cond_1

    .line 185
    invoke-direct {p0, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activateParticle(I)V

    add-int/lit8 v4, v3, 0x1

    const/4 v5, 0x1

    .line 186
    aput-boolean v5, v0, v3

    add-int/lit8 v2, v2, 0x1

    move v3, v4

    goto :goto_0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 192
    :cond_2
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    return-void
.end method

.method public allowCompletion()V
    .locals 1

    const/4 v0, 0x1

    .line 709
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->allowCompletion:Z

    .line 710
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    return-void
.end method

.method public cleansUpBlendFunction()Z
    .locals 1

    .line 840
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->cleansUpBlendFunction:Z

    return v0
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;)V
    .locals 7

    .line 249
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    const/16 v1, 0x302

    const/16 v2, 0x303

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    .line 250
    invoke-interface {p1, v3, v2}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setBlendFunction(II)V

    goto :goto_0

    .line 251
    :cond_0
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    if-eqz v0, :cond_1

    .line 252
    invoke-interface {p1, v1, v3}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setBlendFunction(II)V

    goto :goto_0

    .line 254
    :cond_1
    invoke-interface {p1, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setBlendFunction(II)V

    .line 256
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    .line 257
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->active:[Z

    const/4 v4, 0x0

    .line 259
    array-length v5, v3

    :goto_1
    if-ge v4, v5, :cond_3

    .line 260
    aget-boolean v6, v3, v4

    if-eqz v6, :cond_2

    aget-object v6, v0, v4

    invoke-virtual {v6, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 263
    :cond_3
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->cleansUpBlendFunction:Z

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    if-nez v0, :cond_4

    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    if-eqz v0, :cond_5

    .line 264
    :cond_4
    invoke-interface {p1, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setBlendFunction(II)V

    :cond_5
    return-void
.end method

.method public draw(Lcom/badlogic/gdx/graphics/g2d/Batch;F)V
    .locals 13

    .line 271
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->accumulator:F

    const/high16 v1, 0x447a0000    # 1000.0f

    mul-float v2, p2, v1

    add-float/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->accumulator:F

    .line 272
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->accumulator:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v2, v0, v2

    if-gez v2, :cond_0

    .line 273
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    return-void

    :cond_0
    float-to-int v2, v0

    int-to-float v3, v2

    sub-float/2addr v0, v3

    .line 277
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->accumulator:F

    .line 279
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    const/16 v4, 0x302

    const/16 v5, 0x303

    const/4 v6, 0x1

    if-eqz v0, :cond_1

    .line 280
    invoke-interface {p1, v6, v5}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setBlendFunction(II)V

    goto :goto_0

    .line 281
    :cond_1
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    if-eqz v0, :cond_2

    .line 282
    invoke-interface {p1, v4, v6}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setBlendFunction(II)V

    goto :goto_0

    .line 284
    :cond_2
    invoke-interface {p1, v4, v5}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setBlendFunction(II)V

    .line 287
    :goto_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    .line 288
    iget-object v6, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->active:[Z

    .line 289
    iget v7, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    .line 290
    array-length v8, v6

    const/4 v9, 0x0

    move v10, v7

    const/4 v7, 0x0

    :goto_1
    if-ge v7, v8, :cond_5

    .line 291
    aget-boolean v11, v6, v7

    if-eqz v11, :cond_4

    .line 292
    aget-object v11, v0, v7

    .line 293
    invoke-direct {p0, v11, p2, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateParticle(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;FI)Z

    move-result v12

    if-eqz v12, :cond_3

    .line 294
    invoke-virtual {v11, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->draw(Lcom/badlogic/gdx/graphics/g2d/Batch;)V

    goto :goto_2

    .line 296
    :cond_3
    aput-boolean v9, v6, v7

    add-int/lit8 v10, v10, -0x1

    :cond_4
    :goto_2
    add-int/lit8 v7, v7, 0x1

    goto :goto_1

    .line 301
    :cond_5
    iput v10, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    .line 303
    iget-boolean p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->cleansUpBlendFunction:Z

    if-eqz p2, :cond_7

    iget-boolean p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    if-nez p2, :cond_6

    iget-boolean p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    if-eqz p2, :cond_7

    .line 304
    :cond_6
    invoke-interface {p1, v4, v5}, Lcom/badlogic/gdx/graphics/g2d/Batch;->setBlendFunction(II)V

    .line 306
    :cond_7
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayTimer:F

    iget p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delay:F

    cmpg-float p2, p1, p2

    if-gez p2, :cond_8

    add-float/2addr p1, v3

    .line 307
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayTimer:F

    return-void

    .line 311
    :cond_8
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->firstUpdate:Z

    if-eqz p1, :cond_9

    .line 312
    iput-boolean v9, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->firstUpdate:Z

    .line 313
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->addParticle()V

    .line 316
    :cond_9
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    iget p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    cmpg-float p2, p1, p2

    if-gez p2, :cond_a

    add-float/2addr p1, v3

    .line 317
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    goto :goto_3

    .line 319
    :cond_a
    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->continuous:Z

    if-eqz p1, :cond_d

    iget-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->allowCompletion:Z

    if-eqz p1, :cond_b

    goto :goto_4

    .line 320
    :cond_b
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->restart()V

    .line 323
    :goto_3
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    add-int/2addr p1, v2

    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    .line 324
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emission:I

    int-to-float p1, p1

    iget p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDiff:I

    int-to-float p2, p2

    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    div-float/2addr v2, v3

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v0

    mul-float p2, p2, v0

    add-float/2addr p1, p2

    const/4 p2, 0x0

    cmpl-float p2, p1, p2

    if-lez p2, :cond_c

    div-float/2addr v1, p1

    .line 327
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    int-to-float p2, p1

    cmpl-float p2, p2, v1

    if-ltz p2, :cond_c

    int-to-float p1, p1

    div-float/2addr p1, v1

    float-to-int p1, p1

    .line 329
    iget p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    sub-int/2addr p2, v10

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    .line 330
    iget p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    int-to-float p2, p2

    int-to-float v0, p1

    mul-float v0, v0, v1

    sub-float/2addr p2, v0

    float-to-int p2, p2

    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    .line 331
    iget p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    int-to-float p2, p2

    rem-float/2addr p2, v1

    float-to-int p2, p2

    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    .line 332
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->addParticles(I)V

    .line 335
    :cond_c
    iget p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->minParticleCount:I

    if-ge v10, p1, :cond_d

    sub-int/2addr p1, v10

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->addParticles(I)V

    :cond_d
    :goto_4
    return-void
.end method

.method public flipY()V
    .locals 3

    .line 925
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getHighMin()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getHighMax()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setHigh(FF)V

    .line 926
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getLowMin()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getLowMax()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setLow(FF)V

    .line 928
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getHighMin()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getHighMax()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setHigh(FF)V

    .line 929
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getLowMin()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getLowMax()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setLow(FF)V

    .line 931
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getHighMin()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getHighMax()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setHigh(FF)V

    .line 932
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getLowMin()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getLowMax()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setLow(FF)V

    .line 934
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getHighMin()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getHighMax()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setHigh(FF)V

    .line 935
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getLowMin()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getLowMax()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setLow(FF)V

    .line 937
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->getLowMin()F

    move-result v1

    neg-float v1, v1

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->getLowMax()F

    move-result v2

    neg-float v2, v2

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->setLow(FF)V

    return-void
.end method

.method public getActiveCount()I
    .locals 1

    .line 903
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    return v0
.end method

.method public getAngle()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 762
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method public getBoundingBox()Lcom/badlogic/gdx/math/collision/BoundingBox;
    .locals 9

    .line 942
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

    if-nez v0, :cond_0

    new-instance v0, Lcom/badlogic/gdx/math/collision/BoundingBox;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/collision/BoundingBox;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

    .line 944
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    .line 945
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->active:[Z

    .line 946
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->bounds:Lcom/badlogic/gdx/math/collision/BoundingBox;

    .line 948
    invoke-virtual {v2}, Lcom/badlogic/gdx/math/collision/BoundingBox;->inf()Lcom/badlogic/gdx/math/collision/BoundingBox;

    const/4 v3, 0x0

    .line 949
    array-length v4, v1

    :goto_0
    if-ge v3, v4, :cond_2

    .line 950
    aget-boolean v5, v1, v3

    if-eqz v5, :cond_1

    .line 951
    aget-object v5, v0, v3

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->getBoundingRectangle()Lcom/badlogic/gdx/math/Rectangle;

    move-result-object v5

    .line 952
    iget v6, v5, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v7, v5, Lcom/badlogic/gdx/math/Rectangle;->y:F

    const/4 v8, 0x0

    invoke-virtual {v2, v6, v7, v8}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(FFF)Lcom/badlogic/gdx/math/collision/BoundingBox;

    .line 953
    iget v6, v5, Lcom/badlogic/gdx/math/Rectangle;->x:F

    iget v7, v5, Lcom/badlogic/gdx/math/Rectangle;->width:F

    add-float/2addr v6, v7

    iget v7, v5, Lcom/badlogic/gdx/math/Rectangle;->y:F

    iget v5, v5, Lcom/badlogic/gdx/math/Rectangle;->height:F

    add-float/2addr v7, v5

    invoke-virtual {v2, v6, v7, v8}, Lcom/badlogic/gdx/math/collision/BoundingBox;->ext(FFF)Lcom/badlogic/gdx/math/collision/BoundingBox;

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return-object v2
.end method

.method public getDelay()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;
    .locals 1

    .line 778
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    return-object v0
.end method

.method public getDuration()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;
    .locals 1

    .line 774
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    return-object v0
.end method

.method public getEmission()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 766
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method public getGravity()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 758
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method public getImagePaths()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 907
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->imagePaths:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getLife()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 730
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    return-object v0
.end method

.method public getLifeOffset()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 782
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    return-object v0
.end method

.method public getMaxParticleCount()I
    .locals 1

    .line 880
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    return v0
.end method

.method public getMinParticleCount()I
    .locals 1

    .line 872
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->minParticleCount:I

    return v0
.end method

.method protected getMotionValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;
    .locals 3

    .line 980
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->motionValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    if-nez v0, :cond_0

    const/4 v0, 0x3

    .line 981
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->motionValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 982
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->motionValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 983
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 984
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    aput-object v2, v0, v1

    .line 986
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->motionValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .line 722
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->name:Ljava/lang/String;

    return-object v0
.end method

.method protected getParticles()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;
    .locals 1

    .line 394
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    return-object v0
.end method

.method public getPercentComplete()F
    .locals 3

    .line 890
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayTimer:F

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delay:F

    cmpg-float v0, v0, v1

    if-gez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/high16 v0, 0x3f800000    # 1.0f

    .line 891
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    div-float/2addr v1, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    return v0
.end method

.method public getRotation()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 742
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method public getSpawnHeight()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 798
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method public getSpawnShape()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;
    .locals 1

    .line 802
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    return-object v0
.end method

.method public getSpawnWidth()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 794
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method public getSpriteMode()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;
    .locals 1

    .line 718
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    return-object v0
.end method

.method public getSprites()Lcom/badlogic/gdx/utils/Array;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g2d/Sprite;",
            ">;"
        }
    .end annotation

    .line 714
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->sprites:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getTint()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;
    .locals 1

    .line 746
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    return-object v0
.end method

.method public getTransparency()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 770
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method public getVelocity()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 750
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method public getWind()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 754
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method public getX()F
    .locals 1

    .line 895
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->x:F

    return v0
.end method

.method public getXOffsetValue()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;
    .locals 1

    .line 786
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    return-object v0
.end method

.method public getXScale()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 734
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method protected getXSizeValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;
    .locals 3

    .line 960
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xSizeValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    if-nez v0, :cond_0

    const/4 v0, 0x3

    .line 961
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xSizeValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 962
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xSizeValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 963
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 964
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    aput-object v2, v0, v1

    .line 966
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xSizeValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    return-object v0
.end method

.method public getY()F
    .locals 1

    .line 899
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->y:F

    return v0
.end method

.method public getYOffsetValue()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;
    .locals 1

    .line 790
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    return-object v0
.end method

.method public getYScale()Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;
    .locals 1

    .line 738
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    return-object v0
.end method

.method protected getYSizeValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;
    .locals 3

    .line 970
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->ySizeValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    if-nez v0, :cond_0

    const/4 v0, 0x3

    .line 971
    new-array v0, v0, [Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->ySizeValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    .line 972
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->ySizeValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    aput-object v2, v0, v1

    const/4 v1, 0x1

    .line 973
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    aput-object v2, v0, v1

    const/4 v1, 0x2

    .line 974
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    aput-object v2, v0, v1

    .line 976
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->ySizeValues:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    return-object v0
.end method

.method public isAdditive()Z
    .locals 1

    .line 830
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    return v0
.end method

.method public isAligned()Z
    .locals 1

    .line 822
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->aligned:Z

    return v0
.end method

.method public isAttached()Z
    .locals 1

    .line 806
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->attached:Z

    return v0
.end method

.method public isBehind()Z
    .locals 1

    .line 856
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->behind:Z

    return v0
.end method

.method public isComplete()Z
    .locals 3

    .line 884
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->continuous:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->allowCompletion:Z

    if-nez v0, :cond_0

    return v1

    .line 885
    :cond_0
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayTimer:F

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delay:F

    cmpg-float v0, v0, v2

    if-gez v0, :cond_1

    return v1

    .line 886
    :cond_1
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    cmpl-float v0, v0, v2

    if-ltz v0, :cond_2

    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    if-nez v0, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method

.method public isContinuous()Z
    .locals 1

    .line 814
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->continuous:Z

    return v0
.end method

.method public isPremultipliedAlpha()Z
    .locals 1

    .line 864
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    return v0
.end method

.method public load(Ljava/io/BufferedReader;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    const-string v0, "name"

    .line 1104
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readString(Ljava/io/BufferedReader;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->name:Ljava/lang/String;

    .line 1105
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1106
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1107
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1108
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1109
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    const-string v0, "minParticleCount"

    .line 1110
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readInt(Ljava/io/BufferedReader;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setMinParticleCount(I)V

    const-string v0, "maxParticleCount"

    .line 1111
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readInt(Ljava/io/BufferedReader;Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setMaxParticleCount(I)V

    .line 1112
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1113
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1114
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1115
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1116
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1117
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1118
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1119
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1120
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1121
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1122
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1123
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;->load(Ljava/io/BufferedReader;)V

    .line 1124
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1125
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1126
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1127
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1128
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    .line 1129
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string v1, "- Scale -"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1130
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1131
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->setActive(Z)V

    goto :goto_0

    .line 1133
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1134
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1135
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1137
    :goto_0
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1138
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1139
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1140
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1141
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1142
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1143
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1144
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1145
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1146
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1147
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1148
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->load(Ljava/io/BufferedReader;)V

    .line 1149
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1150
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->load(Ljava/io/BufferedReader;)V

    .line 1151
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    const-string v0, "attached"

    .line 1152
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readBoolean(Ljava/io/BufferedReader;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->attached:Z

    const-string v0, "continuous"

    .line 1153
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readBoolean(Ljava/io/BufferedReader;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->continuous:Z

    const-string v0, "aligned"

    .line 1154
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readBoolean(Ljava/io/BufferedReader;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->aligned:Z

    const-string v0, "additive"

    .line 1155
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readBoolean(Ljava/io/BufferedReader;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    const-string v0, "behind"

    .line 1156
    invoke-static {p1, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readBoolean(Ljava/io/BufferedReader;Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->behind:Z

    .line 1159
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    const-string v1, "premultipliedAlpha"

    .line 1160
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1161
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readBoolean(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    .line 1162
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    :cond_1
    const-string v1, "spriteMode"

    .line 1164
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1165
    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->readString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;->valueOf(Ljava/lang/String;)Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    move-result-object v0

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    .line 1166
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 1169
    :cond_2
    new-instance v0, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    .line 1170
    :goto_1
    invoke-virtual {p1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_3

    .line 1171
    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_1

    .line 1173
    :cond_3
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->setImagePaths(Lcom/badlogic/gdx/utils/Array;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 1175
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->name:Ljava/lang/String;

    if-nez v0, :cond_4

    throw p1

    .line 1176
    :cond_4
    new-instance v0, Ljava/lang/RuntimeException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error parsing emitter: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->name:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_3

    :goto_2
    throw v0

    :goto_3
    goto :goto_2
.end method

.method public matchMotion(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;)V
    .locals 4

    .line 1037
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getMotionValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    move-result-object v0

    .line 1038
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getMotionValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    move-result-object p1

    const/4 v1, 0x0

    .line 1039
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 1040
    aget-object v2, v0, v1

    aget-object v3, p1, v1

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public matchSize(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;)V
    .locals 0

    .line 1013
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->matchXSize(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;)V

    .line 1014
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->matchYSize(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;)V

    return-void
.end method

.method public matchXSize(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;)V
    .locals 4

    .line 1019
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getXSizeValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    move-result-object v0

    .line 1020
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getXSizeValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    move-result-object p1

    const/4 v1, 0x0

    .line 1021
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 1022
    aget-object v2, v0, v1

    aget-object v3, p1, v1

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public matchYSize(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;)V
    .locals 4

    .line 1028
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getYSizeValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    move-result-object v0

    .line 1029
    invoke-virtual {p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getYSizeValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    move-result-object p1

    const/4 v1, 0x0

    .line 1030
    :goto_0
    array-length v2, v0

    if-ge v1, v2, :cond_0

    .line 1031
    aget-object v2, v0, v1

    aget-object v3, p1, v1

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->set(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method protected newParticle(Lcom/badlogic/gdx/graphics/g2d/Sprite;)Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;
    .locals 1

    .line 390
    new-instance v0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    invoke-direct {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;-><init>(Lcom/badlogic/gdx/graphics/g2d/Sprite;)V

    return-object v0
.end method

.method public reset()V
    .locals 4

    const/4 v0, 0x0

    .line 345
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    .line 346
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    .line 347
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->active:[Z

    .line 348
    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_0

    .line 349
    aput-boolean v0, v1, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 350
    :cond_0
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    .line 351
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->start()V

    return-void
.end method

.method public save(Ljava/io/Writer;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1045
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const-string v0, "- Delay -\n"

    .line 1046
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1047
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Duration - \n"

    .line 1048
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1049
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Count - \n"

    .line 1050
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1051
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "min: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->minParticleCount:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1052
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "max: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const-string v0, "- Emission - \n"

    .line 1053
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1054
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Life - \n"

    .line 1055
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1056
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Life Offset - \n"

    .line 1057
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1058
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->lifeOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$IndependentScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- X Offset - \n"

    .line 1059
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1060
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Y Offset - \n"

    .line 1061
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1062
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yOffsetValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Spawn Shape - \n"

    .line 1063
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1064
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnShapeValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpawnShapeValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Spawn Width - \n"

    .line 1065
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1066
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnWidthValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Spawn Height - \n"

    .line 1067
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1068
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spawnHeightValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- X Scale - \n"

    .line 1069
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1070
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->xScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Y Scale - \n"

    .line 1071
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1072
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->yScaleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Velocity - \n"

    .line 1073
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1074
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->velocityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Angle - \n"

    .line 1075
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1076
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->angleValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Rotation - \n"

    .line 1077
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1078
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->rotationValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Wind - \n"

    .line 1079
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1080
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->windValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Gravity - \n"

    .line 1081
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1082
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->gravityValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Tint - \n"

    .line 1083
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1084
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->tintValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$GradientColorValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Transparency - \n"

    .line 1085
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1086
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->transparencyValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->save(Ljava/io/Writer;)V

    const-string v0, "- Options - \n"

    .line 1087
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1088
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "attached: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->attached:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1089
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "continuous: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->continuous:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1090
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "aligned: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->aligned:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1091
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "additive: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1092
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "behind: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->behind:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1093
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "premultipliedAlpha: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1094
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "spriteMode: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    invoke-virtual {v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    const-string v0, "- Image Paths -\n"

    .line 1095
    invoke-virtual {p1, v0}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 1096
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->imagePaths:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/Array;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 1097
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 1099
    :cond_0
    invoke-virtual {p1, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    return-void
.end method

.method public scaleMotion(F)V
    .locals 4

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    return-void

    .line 1007
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getMotionValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 1008
    invoke-virtual {v3, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->scale(F)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public scaleSize(F)V
    .locals 1

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v0, p1, v0

    if-nez v0, :cond_0

    return-void

    .line 992
    :cond_0
    invoke-virtual {p0, p1, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->scaleSize(FF)V

    return-void
.end method

.method public scaleSize(FF)V
    .locals 5

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float v1, p1, v0

    if-nez v1, :cond_0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    return-void

    .line 998
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getXSizeValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_1

    aget-object v4, v0, v3

    .line 999
    invoke-virtual {v4, p1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->scale(F)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 1000
    :cond_1
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->getYSizeValues()[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;

    move-result-object p1

    array-length v0, p1

    :goto_1
    if-ge v2, v0, :cond_2

    aget-object v1, p1, v2

    .line 1001
    invoke-virtual {v1, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$RangedNumericValue;->scale(F)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    return-void
.end method

.method public setAdditive(Z)V
    .locals 0

    .line 834
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->additive:Z

    return-void
.end method

.method public setAligned(Z)V
    .locals 0

    .line 826
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->aligned:Z

    return-void
.end method

.method public setAttached(Z)V
    .locals 0

    .line 810
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->attached:Z

    return-void
.end method

.method public setBehind(Z)V
    .locals 0

    .line 860
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->behind:Z

    return-void
.end method

.method public setCleansUpBlendFunction(Z)V
    .locals 0

    .line 852
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->cleansUpBlendFunction:Z

    return-void
.end method

.method public setContinuous(Z)V
    .locals 0

    .line 818
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->continuous:Z

    return-void
.end method

.method public setFlip(ZZ)V
    .locals 3

    .line 915
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->flipX:Z

    .line 916
    iput-boolean p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->flipY:Z

    .line 917
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    .line 918
    array-length v0, v0

    :goto_0
    if-ge v1, v0, :cond_2

    .line 919
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    aget-object v2, v2, v1

    if-eqz v2, :cond_1

    .line 920
    invoke-virtual {v2, p1, p2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->flip(ZZ)V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    return-void
.end method

.method public setImagePaths(Lcom/badlogic/gdx/utils/Array;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 911
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->imagePaths:Lcom/badlogic/gdx/utils/Array;

    return-void
.end method

.method public setMaxParticleCount(I)V
    .locals 1

    .line 156
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    .line 157
    new-array v0, p1, [Z

    iput-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->active:[Z

    const/4 v0, 0x0

    .line 158
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    .line 159
    new-array p1, p1, [Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    return-void
.end method

.method public setMinParticleCount(I)V
    .locals 0

    .line 876
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->minParticleCount:I

    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 726
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->name:Ljava/lang/String;

    return-void
.end method

.method public setPosition(FF)V
    .locals 6

    .line 666
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->attached:Z

    if-eqz v0, :cond_1

    .line 667
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->x:F

    sub-float v0, p1, v0

    .line 668
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->y:F

    sub-float v1, p2, v1

    .line 669
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->active:[Z

    const/4 v3, 0x0

    .line 670
    array-length v4, v2

    :goto_0
    if-ge v3, v4, :cond_1

    .line 671
    aget-boolean v5, v2, v3

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    aget-object v5, v5, v3

    invoke-virtual {v5, v0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->translate(FF)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 673
    :cond_1
    iput p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->x:F

    .line 674
    iput p2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->y:F

    return-void
.end method

.method public setPremultipliedAlpha(Z)V
    .locals 0

    .line 868
    iput-boolean p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->premultipliedAlpha:Z

    return-void
.end method

.method public setSpriteMode(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;)V
    .locals 0

    .line 703
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    return-void
.end method

.method public setSprites(Lcom/badlogic/gdx/utils/Array;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/graphics/g2d/Sprite;",
            ">;)V"
        }
    .end annotation

    .line 678
    iput-object p1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->sprites:Lcom/badlogic/gdx/utils/Array;

    .line 679
    iget v0, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 680
    iget-object v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    array-length v1, v1

    :goto_0
    if-ge v0, v1, :cond_5

    .line 681
    iget-object v2, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    aget-object v2, v2, v0

    if-nez v2, :cond_1

    goto :goto_2

    :cond_1
    const/4 v3, 0x0

    .line 684
    sget-object v4, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$1;->$SwitchMap$com$badlogic$gdx$graphics$g2d$ParticleEmitter$SpriteMode:[I

    iget-object v5, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->spriteMode:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;

    invoke-virtual {v5}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$SpriteMode;->ordinal()I

    move-result v5

    aget v4, v4, v5

    const/4 v5, 0x1

    if-eq v4, v5, :cond_4

    const/4 v6, 0x2

    if-eq v4, v6, :cond_3

    const/4 v5, 0x3

    if-eq v4, v5, :cond_2

    goto :goto_1

    .line 689
    :cond_2
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->random()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    goto :goto_1

    :cond_3
    const/high16 v3, 0x3f800000    # 1.0f

    .line 692
    iget v4, v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->currentLife:I

    int-to-float v4, v4

    iget v6, v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->life:I

    int-to-float v6, v6

    div-float/2addr v4, v6

    sub-float/2addr v3, v4

    .line 693
    iget v4, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    int-to-float v4, v4

    mul-float v3, v3, v4

    float-to-int v3, v3

    iget v4, p1, Lcom/badlogic/gdx/utils/Array;->size:I

    sub-int/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    iput v3, v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->frame:I

    .line 694
    iget v3, v2, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->frame:I

    invoke-virtual {p1, v3}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    goto :goto_1

    .line 686
    :cond_4
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->first()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/graphics/g2d/Sprite;

    .line 697
    :goto_1
    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setRegion(Lcom/badlogic/gdx/graphics/g2d/TextureRegion;)V

    .line 698
    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getOriginX()F

    move-result v4

    invoke-virtual {v3}, Lcom/badlogic/gdx/graphics/g2d/Sprite;->getOriginY()F

    move-result v3

    invoke-virtual {v2, v4, v3}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;->setOrigin(FF)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_5
    :goto_2
    return-void
.end method

.method public start()V
    .locals 1

    const/4 v0, 0x1

    .line 339
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->firstUpdate:Z

    const/4 v0, 0x0

    .line 340
    iput-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->allowCompletion:Z

    .line 341
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->restart()V

    return-void
.end method

.method public update(F)V
    .locals 8

    .line 196
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->accumulator:F

    const/high16 v1, 0x447a0000    # 1000.0f

    mul-float v2, p1, v1

    add-float/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->accumulator:F

    .line 197
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->accumulator:F

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v2, v0, v2

    if-gez v2, :cond_0

    return-void

    :cond_0
    float-to-int v2, v0

    int-to-float v3, v2

    sub-float/2addr v0, v3

    .line 199
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->accumulator:F

    .line 201
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayTimer:F

    iget v4, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delay:F

    const/4 v5, 0x0

    cmpg-float v4, v0, v4

    if-gez v4, :cond_1

    add-float/2addr v0, v3

    .line 202
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->delayTimer:F

    goto/16 :goto_3

    .line 205
    :cond_1
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->firstUpdate:Z

    if-eqz v0, :cond_2

    .line 206
    iput-boolean v5, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->firstUpdate:Z

    .line 207
    invoke-virtual {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->addParticle()V

    .line 210
    :cond_2
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    iget v4, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    cmpg-float v4, v0, v4

    if-gez v4, :cond_3

    add-float/2addr v0, v3

    .line 211
    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    goto :goto_0

    .line 213
    :cond_3
    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->continuous:Z

    if-eqz v0, :cond_5

    iget-boolean v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->allowCompletion:Z

    if-eqz v0, :cond_4

    goto :goto_1

    .line 216
    :cond_4
    invoke-direct {p0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->restart()V

    :goto_0
    const/4 v0, 0x0

    goto :goto_2

    :cond_5
    :goto_1
    const/4 v0, 0x1

    :goto_2
    if-nez v0, :cond_7

    .line 220
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    add-int/2addr v0, v2

    iput v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    .line 221
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emission:I

    int-to-float v0, v0

    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDiff:I

    int-to-float v3, v3

    iget-object v4, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionValue:Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;

    iget v6, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->durationTimer:F

    iget v7, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->duration:F

    div-float/2addr v6, v7

    invoke-virtual {v4, v6}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$ScaledNumericValue;->getScale(F)F

    move-result v4

    mul-float v3, v3, v4

    add-float/2addr v0, v3

    const/4 v3, 0x0

    cmpl-float v3, v0, v3

    if-lez v3, :cond_6

    div-float/2addr v1, v0

    .line 224
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    int-to-float v3, v0

    cmpl-float v3, v3, v1

    if-ltz v3, :cond_6

    int-to-float v0, v0

    div-float/2addr v0, v1

    float-to-int v0, v0

    .line 226
    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->maxParticleCount:I

    iget v4, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    sub-int/2addr v3, v4

    invoke-static {v0, v3}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 227
    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    int-to-float v3, v3

    int-to-float v4, v0

    mul-float v4, v4, v1

    sub-float/2addr v3, v4

    float-to-int v3, v3

    iput v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    .line 228
    iget v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    int-to-float v3, v3

    rem-float/2addr v3, v1

    float-to-int v1, v3

    iput v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->emissionDelta:I

    .line 229
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->addParticles(I)V

    .line 232
    :cond_6
    iget v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->minParticleCount:I

    if-ge v0, v1, :cond_7

    sub-int/2addr v1, v0

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->addParticles(I)V

    .line 236
    :cond_7
    :goto_3
    iget-object v0, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->active:[Z

    .line 237
    iget v1, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    .line 238
    iget-object v3, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->particles:[Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;

    .line 239
    array-length v4, v0

    move v6, v1

    const/4 v1, 0x0

    :goto_4
    if-ge v1, v4, :cond_9

    .line 240
    aget-boolean v7, v0, v1

    if-eqz v7, :cond_8

    aget-object v7, v3, v1

    invoke-direct {p0, v7, p1, v2}, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->updateParticle(Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter$Particle;FI)Z

    move-result v7

    if-nez v7, :cond_8

    .line 241
    aput-boolean v5, v0, v1

    add-int/lit8 v6, v6, -0x1

    :cond_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 245
    :cond_9
    iput v6, p0, Lcom/badlogic/gdx/graphics/g2d/ParticleEmitter;->activeCount:I

    return-void
.end method
