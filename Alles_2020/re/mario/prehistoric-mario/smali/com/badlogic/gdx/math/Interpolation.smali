.class public abstract Lcom/badlogic/gdx/math/Interpolation;
.super Ljava/lang/Object;
.source "Interpolation.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/badlogic/gdx/math/Interpolation$SwingIn;,
        Lcom/badlogic/gdx/math/Interpolation$SwingOut;,
        Lcom/badlogic/gdx/math/Interpolation$Swing;,
        Lcom/badlogic/gdx/math/Interpolation$BounceIn;,
        Lcom/badlogic/gdx/math/Interpolation$BounceOut;,
        Lcom/badlogic/gdx/math/Interpolation$Bounce;,
        Lcom/badlogic/gdx/math/Interpolation$ElasticOut;,
        Lcom/badlogic/gdx/math/Interpolation$ElasticIn;,
        Lcom/badlogic/gdx/math/Interpolation$Elastic;,
        Lcom/badlogic/gdx/math/Interpolation$ExpOut;,
        Lcom/badlogic/gdx/math/Interpolation$ExpIn;,
        Lcom/badlogic/gdx/math/Interpolation$Exp;,
        Lcom/badlogic/gdx/math/Interpolation$PowOut;,
        Lcom/badlogic/gdx/math/Interpolation$PowIn;,
        Lcom/badlogic/gdx/math/Interpolation$Pow;
    }
.end annotation


# static fields
.field public static final bounce:Lcom/badlogic/gdx/math/Interpolation$Bounce;

.field public static final bounceIn:Lcom/badlogic/gdx/math/Interpolation$BounceIn;

.field public static final bounceOut:Lcom/badlogic/gdx/math/Interpolation$BounceOut;

.field public static final circle:Lcom/badlogic/gdx/math/Interpolation;

.field public static final circleIn:Lcom/badlogic/gdx/math/Interpolation;

.field public static final circleOut:Lcom/badlogic/gdx/math/Interpolation;

.field public static final elastic:Lcom/badlogic/gdx/math/Interpolation$Elastic;

.field public static final elasticIn:Lcom/badlogic/gdx/math/Interpolation$ElasticIn;

.field public static final elasticOut:Lcom/badlogic/gdx/math/Interpolation$ElasticOut;

.field public static final exp10:Lcom/badlogic/gdx/math/Interpolation$Exp;

.field public static final exp10In:Lcom/badlogic/gdx/math/Interpolation$ExpIn;

.field public static final exp10Out:Lcom/badlogic/gdx/math/Interpolation$ExpOut;

.field public static final exp5:Lcom/badlogic/gdx/math/Interpolation$Exp;

.field public static final exp5In:Lcom/badlogic/gdx/math/Interpolation$ExpIn;

.field public static final exp5Out:Lcom/badlogic/gdx/math/Interpolation$ExpOut;

.field public static final fade:Lcom/badlogic/gdx/math/Interpolation;

.field public static final fastSlow:Lcom/badlogic/gdx/math/Interpolation$PowOut;

.field public static final linear:Lcom/badlogic/gdx/math/Interpolation;

.field public static final pow2:Lcom/badlogic/gdx/math/Interpolation$Pow;

.field public static final pow2In:Lcom/badlogic/gdx/math/Interpolation$PowIn;

.field public static final pow2InInverse:Lcom/badlogic/gdx/math/Interpolation;

.field public static final pow2Out:Lcom/badlogic/gdx/math/Interpolation$PowOut;

.field public static final pow2OutInverse:Lcom/badlogic/gdx/math/Interpolation;

.field public static final pow3:Lcom/badlogic/gdx/math/Interpolation$Pow;

.field public static final pow3In:Lcom/badlogic/gdx/math/Interpolation$PowIn;

.field public static final pow3InInverse:Lcom/badlogic/gdx/math/Interpolation;

.field public static final pow3Out:Lcom/badlogic/gdx/math/Interpolation$PowOut;

.field public static final pow3OutInverse:Lcom/badlogic/gdx/math/Interpolation;

.field public static final pow4:Lcom/badlogic/gdx/math/Interpolation$Pow;

.field public static final pow4In:Lcom/badlogic/gdx/math/Interpolation$PowIn;

.field public static final pow4Out:Lcom/badlogic/gdx/math/Interpolation$PowOut;

.field public static final pow5:Lcom/badlogic/gdx/math/Interpolation$Pow;

.field public static final pow5In:Lcom/badlogic/gdx/math/Interpolation$PowIn;

.field public static final pow5Out:Lcom/badlogic/gdx/math/Interpolation$PowOut;

.field public static final sine:Lcom/badlogic/gdx/math/Interpolation;

.field public static final sineIn:Lcom/badlogic/gdx/math/Interpolation;

.field public static final sineOut:Lcom/badlogic/gdx/math/Interpolation;

.field public static final slowFast:Lcom/badlogic/gdx/math/Interpolation$PowIn;

.field public static final smooth:Lcom/badlogic/gdx/math/Interpolation;

.field public static final smooth2:Lcom/badlogic/gdx/math/Interpolation;

.field public static final smoother:Lcom/badlogic/gdx/math/Interpolation;

.field public static final swing:Lcom/badlogic/gdx/math/Interpolation$Swing;

.field public static final swingIn:Lcom/badlogic/gdx/math/Interpolation$SwingIn;

.field public static final swingOut:Lcom/badlogic/gdx/math/Interpolation$SwingOut;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 32
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$1;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$1;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->linear:Lcom/badlogic/gdx/math/Interpolation;

    .line 41
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$2;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->smooth:Lcom/badlogic/gdx/math/Interpolation;

    .line 46
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->smooth2:Lcom/badlogic/gdx/math/Interpolation;

    .line 54
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$4;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->smoother:Lcom/badlogic/gdx/math/Interpolation;

    .line 59
    sget-object v0, Lcom/badlogic/gdx/math/Interpolation;->smoother:Lcom/badlogic/gdx/math/Interpolation;

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->fade:Lcom/badlogic/gdx/math/Interpolation;

    .line 63
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$Pow;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$Pow;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow2:Lcom/badlogic/gdx/math/Interpolation$Pow;

    .line 65
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$PowIn;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$PowIn;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow2In:Lcom/badlogic/gdx/math/Interpolation$PowIn;

    .line 66
    sget-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow2In:Lcom/badlogic/gdx/math/Interpolation$PowIn;

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->slowFast:Lcom/badlogic/gdx/math/Interpolation$PowIn;

    .line 68
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$PowOut;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$PowOut;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow2Out:Lcom/badlogic/gdx/math/Interpolation$PowOut;

    .line 69
    sget-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow2Out:Lcom/badlogic/gdx/math/Interpolation$PowOut;

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->fastSlow:Lcom/badlogic/gdx/math/Interpolation$PowOut;

    .line 70
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$5;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$5;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow2InInverse:Lcom/badlogic/gdx/math/Interpolation;

    .line 75
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$6;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$6;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow2OutInverse:Lcom/badlogic/gdx/math/Interpolation;

    .line 81
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$Pow;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$Pow;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow3:Lcom/badlogic/gdx/math/Interpolation$Pow;

    .line 82
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$PowIn;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$PowIn;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow3In:Lcom/badlogic/gdx/math/Interpolation$PowIn;

    .line 83
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$PowOut;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$PowOut;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow3Out:Lcom/badlogic/gdx/math/Interpolation$PowOut;

    .line 84
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$7;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$7;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow3InInverse:Lcom/badlogic/gdx/math/Interpolation;

    .line 89
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$8;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$8;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow3OutInverse:Lcom/badlogic/gdx/math/Interpolation;

    .line 95
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$Pow;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$Pow;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow4:Lcom/badlogic/gdx/math/Interpolation$Pow;

    .line 96
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$PowIn;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$PowIn;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow4In:Lcom/badlogic/gdx/math/Interpolation$PowIn;

    .line 97
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$PowOut;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$PowOut;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow4Out:Lcom/badlogic/gdx/math/Interpolation$PowOut;

    .line 99
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$Pow;

    const/4 v2, 0x5

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/math/Interpolation$Pow;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow5:Lcom/badlogic/gdx/math/Interpolation$Pow;

    .line 100
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$PowIn;

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/math/Interpolation$PowIn;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow5In:Lcom/badlogic/gdx/math/Interpolation$PowIn;

    .line 101
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$PowOut;

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/math/Interpolation$PowOut;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->pow5Out:Lcom/badlogic/gdx/math/Interpolation$PowOut;

    .line 103
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$9;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$9;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->sine:Lcom/badlogic/gdx/math/Interpolation;

    .line 109
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$10;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$10;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->sineIn:Lcom/badlogic/gdx/math/Interpolation;

    .line 115
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$11;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$11;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->sineOut:Lcom/badlogic/gdx/math/Interpolation;

    .line 121
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$Exp;

    const/high16 v2, 0x41200000    # 10.0f

    const/high16 v3, 0x40000000    # 2.0f

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/math/Interpolation$Exp;-><init>(FF)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->exp10:Lcom/badlogic/gdx/math/Interpolation$Exp;

    .line 122
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$ExpIn;

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/math/Interpolation$ExpIn;-><init>(FF)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->exp10In:Lcom/badlogic/gdx/math/Interpolation$ExpIn;

    .line 123
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$ExpOut;

    invoke-direct {v0, v3, v2}, Lcom/badlogic/gdx/math/Interpolation$ExpOut;-><init>(FF)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->exp10Out:Lcom/badlogic/gdx/math/Interpolation$ExpOut;

    .line 125
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$Exp;

    const/high16 v4, 0x40a00000    # 5.0f

    invoke-direct {v0, v3, v4}, Lcom/badlogic/gdx/math/Interpolation$Exp;-><init>(FF)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->exp5:Lcom/badlogic/gdx/math/Interpolation$Exp;

    .line 126
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$ExpIn;

    invoke-direct {v0, v3, v4}, Lcom/badlogic/gdx/math/Interpolation$ExpIn;-><init>(FF)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->exp5In:Lcom/badlogic/gdx/math/Interpolation$ExpIn;

    .line 127
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$ExpOut;

    invoke-direct {v0, v3, v4}, Lcom/badlogic/gdx/math/Interpolation$ExpOut;-><init>(FF)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->exp5Out:Lcom/badlogic/gdx/math/Interpolation$ExpOut;

    .line 129
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$12;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$12;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->circle:Lcom/badlogic/gdx/math/Interpolation;

    .line 141
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$13;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$13;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->circleIn:Lcom/badlogic/gdx/math/Interpolation;

    .line 147
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$14;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Interpolation$14;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->circleOut:Lcom/badlogic/gdx/math/Interpolation;

    .line 154
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$Elastic;

    const/4 v4, 0x7

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-direct {v0, v3, v2, v4, v5}, Lcom/badlogic/gdx/math/Interpolation$Elastic;-><init>(FFIF)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->elastic:Lcom/badlogic/gdx/math/Interpolation$Elastic;

    .line 155
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$ElasticIn;

    const/4 v6, 0x6

    invoke-direct {v0, v3, v2, v6, v5}, Lcom/badlogic/gdx/math/Interpolation$ElasticIn;-><init>(FFIF)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->elasticIn:Lcom/badlogic/gdx/math/Interpolation$ElasticIn;

    .line 156
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$ElasticOut;

    invoke-direct {v0, v3, v2, v4, v5}, Lcom/badlogic/gdx/math/Interpolation$ElasticOut;-><init>(FFIF)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->elasticOut:Lcom/badlogic/gdx/math/Interpolation$ElasticOut;

    .line 158
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$Swing;

    const/high16 v2, 0x3fc00000    # 1.5f

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/math/Interpolation$Swing;-><init>(F)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->swing:Lcom/badlogic/gdx/math/Interpolation$Swing;

    .line 159
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$SwingIn;

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/math/Interpolation$SwingIn;-><init>(F)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->swingIn:Lcom/badlogic/gdx/math/Interpolation$SwingIn;

    .line 160
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$SwingOut;

    invoke-direct {v0, v3}, Lcom/badlogic/gdx/math/Interpolation$SwingOut;-><init>(F)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->swingOut:Lcom/badlogic/gdx/math/Interpolation$SwingOut;

    .line 162
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$Bounce;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$Bounce;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->bounce:Lcom/badlogic/gdx/math/Interpolation$Bounce;

    .line 163
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$BounceIn;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$BounceIn;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->bounceIn:Lcom/badlogic/gdx/math/Interpolation$BounceIn;

    .line 164
    new-instance v0, Lcom/badlogic/gdx/math/Interpolation$BounceOut;

    invoke-direct {v0, v1}, Lcom/badlogic/gdx/math/Interpolation$BounceOut;-><init>(I)V

    sput-object v0, Lcom/badlogic/gdx/math/Interpolation;->bounceOut:Lcom/badlogic/gdx/math/Interpolation$BounceOut;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract apply(F)F
.end method

.method public apply(FFF)F
    .locals 0

    sub-float/2addr p2, p1

    .line 27
    invoke-virtual {p0, p3}, Lcom/badlogic/gdx/math/Interpolation;->apply(F)F

    move-result p3

    mul-float p2, p2, p3

    add-float/2addr p1, p2

    return p1
.end method
