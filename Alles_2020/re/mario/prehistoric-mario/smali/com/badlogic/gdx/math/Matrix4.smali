.class public Lcom/badlogic/gdx/math/Matrix4;
.super Ljava/lang/Object;
.source "Matrix4.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final M00:I = 0x0

.field public static final M01:I = 0x4

.field public static final M02:I = 0x8

.field public static final M03:I = 0xc

.field public static final M10:I = 0x1

.field public static final M11:I = 0x5

.field public static final M12:I = 0x9

.field public static final M13:I = 0xd

.field public static final M20:I = 0x2

.field public static final M21:I = 0x6

.field public static final M22:I = 0xa

.field public static final M23:I = 0xe

.field public static final M30:I = 0x3

.field public static final M31:I = 0x7

.field public static final M32:I = 0xb

.field public static final M33:I = 0xf

.field static final l_vex:Lcom/badlogic/gdx/math/Vector3;

.field static final l_vey:Lcom/badlogic/gdx/math/Vector3;

.field static final l_vez:Lcom/badlogic/gdx/math/Vector3;

.field static quat:Lcom/badlogic/gdx/math/Quaternion; = null

.field static quat2:Lcom/badlogic/gdx/math/Quaternion; = null

.field static final right:Lcom/badlogic/gdx/math/Vector3;

.field private static final serialVersionUID:J = -0x25b70d0e1a139be1L

.field private static final tmp:[F

.field static final tmpForward:Lcom/badlogic/gdx/math/Vector3;

.field static final tmpMat:Lcom/badlogic/gdx/math/Matrix4;

.field static final tmpUp:Lcom/badlogic/gdx/math/Vector3;

.field static final tmpVec:Lcom/badlogic/gdx/math/Vector3;


# instance fields
.field public final val:[F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const/16 v0, 0x10

    .line 73
    new-array v0, v0, [F

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmp:[F

    .line 701
    new-instance v0, Lcom/badlogic/gdx/math/Quaternion;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Quaternion;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    .line 702
    new-instance v0, Lcom/badlogic/gdx/math/Quaternion;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Quaternion;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat2:Lcom/badlogic/gdx/math/Quaternion;

    .line 826
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->l_vez:Lcom/badlogic/gdx/math/Vector3;

    .line 827
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->l_vex:Lcom/badlogic/gdx/math/Vector3;

    .line 828
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->l_vey:Lcom/badlogic/gdx/math/Vector3;

    .line 855
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    .line 856
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Matrix4;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    .line 872
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->right:Lcom/badlogic/gdx/math/Vector3;

    .line 873
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    .line 874
    new-instance v0, Lcom/badlogic/gdx/math/Vector3;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector3;-><init>()V

    sput-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 77
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    .line 74
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 78
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    aput v1, v0, v2

    const/4 v2, 0x5

    .line 79
    aput v1, v0, v2

    const/16 v2, 0xa

    .line 80
    aput v1, v0, v2

    const/16 v2, 0xf

    .line 81
    aput v1, v0, v2

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Matrix4;)V
    .locals 1

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    .line 74
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 88
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Quaternion;)V
    .locals 1

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    .line 74
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 101
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Quaternion;Lcom/badlogic/gdx/math/Vector3;)V
    .locals 1

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    .line 74
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 109
    invoke-virtual {p0, p1, p2, p3}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Quaternion;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    return-void
.end method

.method public constructor <init>([F)V
    .locals 1

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    .line 74
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    .line 95
    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set([F)Lcom/badlogic/gdx/math/Matrix4;

    return-void
.end method

.method public static native det([F)F
.end method

.method public static native inv([F)Z
.end method

.method public static native mul([F[F)V
.end method

.method public static native mulVec([F[F)V
.end method

.method public static native mulVec([F[FIII)V
.end method

.method public static native prj([F[F)V
.end method

.method public static native prj([F[FIII)V
.end method

.method public static native rot([F[F)V
.end method

.method public static native rot([F[FIII)V
.end method


# virtual methods
.method public avg(Lcom/badlogic/gdx/math/Matrix4;F)Lcom/badlogic/gdx/math/Matrix4;
    .locals 2

    .line 907
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/math/Matrix4;->getScale(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 908
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Matrix4;->getScale(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 910
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/math/Matrix4;->getRotation(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    .line 911
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat2:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Matrix4;->getRotation(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    .line 913
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/math/Matrix4;->getTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 914
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->right:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Matrix4;->getTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 916
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p2

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->setToScaling(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    .line 917
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat2:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p1, v0, v1}, Lcom/badlogic/gdx/math/Quaternion;->slerp(Lcom/badlogic/gdx/math/Quaternion;F)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->rotate(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    .line 918
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->right:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p2, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->setTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    return-object p0
.end method

.method public avg([Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 5

    .line 928
    array-length v0, p1

    int-to-float v0, v0

    const/high16 v1, 0x3f800000    # 1.0f

    div-float/2addr v1, v0

    .line 930
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    const/4 v2, 0x0

    aget-object v3, p1, v2

    sget-object v4, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Matrix4;->getScale(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 931
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    aget-object v3, p1, v2

    sget-object v4, Lcom/badlogic/gdx/math/Matrix4;->quat2:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Matrix4;->getRotation(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/math/Quaternion;->exp(F)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    .line 932
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    aget-object v2, p1, v2

    sget-object v3, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Matrix4;->getTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    const/4 v0, 0x1

    .line 934
    :goto_0
    array-length v2, p1

    if-ge v0, v2, :cond_0

    .line 935
    sget-object v2, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    aget-object v3, p1, v0

    sget-object v4, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Matrix4;->getScale(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 936
    sget-object v2, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    aget-object v3, p1, v0

    sget-object v4, Lcom/badlogic/gdx/math/Matrix4;->quat2:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Matrix4;->getRotation(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/math/Quaternion;->exp(F)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Quaternion;->mul(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    .line 937
    sget-object v2, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    aget-object v3, p1, v0

    sget-object v4, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v3, v4}, Lcom/badlogic/gdx/math/Matrix4;->getTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 939
    :cond_0
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Quaternion;->nor()Lcom/badlogic/gdx/math/Quaternion;

    .line 941
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->setToScaling(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    .line 942
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->rotate(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    .line 943
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->setTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    return-object p0
.end method

.method public avg([Lcom/badlogic/gdx/math/Matrix4;[F)Lcom/badlogic/gdx/math/Matrix4;
    .locals 4

    .line 955
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    const/4 v1, 0x0

    aget-object v2, p1, v1

    sget-object v3, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Matrix4;->getScale(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    aget v3, p2, v1

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 956
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    aget-object v2, p1, v1

    sget-object v3, Lcom/badlogic/gdx/math/Matrix4;->quat2:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Matrix4;->getRotation(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v2

    aget v3, p2, v1

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Quaternion;->exp(F)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    .line 957
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    aget-object v2, p1, v1

    sget-object v3, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Matrix4;->getTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    aget v1, p2, v1

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    const/4 v0, 0x1

    .line 959
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 960
    sget-object v1, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    aget-object v2, p1, v0

    sget-object v3, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Matrix4;->getScale(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    aget v3, p2, v0

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 961
    sget-object v1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    aget-object v2, p1, v0

    sget-object v3, Lcom/badlogic/gdx/math/Matrix4;->quat2:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Matrix4;->getRotation(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v2

    aget v3, p2, v0

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Quaternion;->exp(F)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Quaternion;->mul(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;

    .line 962
    sget-object v1, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    aget-object v2, p1, v0

    sget-object v3, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Matrix4;->getTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    aget v3, p2, v0

    invoke-virtual {v2, v3}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/math/Vector3;->add(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 964
    :cond_0
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Quaternion;->nor()Lcom/badlogic/gdx/math/Quaternion;

    .line 966
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->setToScaling(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    .line 967
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->rotate(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    .line 968
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->setTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    return-object p0
.end method

.method public cpy()Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 278
    new-instance v0, Lcom/badlogic/gdx/math/Matrix4;

    invoke-direct {v0, p0}, Lcom/badlogic/gdx/math/Matrix4;-><init>(Lcom/badlogic/gdx/math/Matrix4;)V

    return-object v0
.end method

.method public det()F
    .locals 18

    move-object/from16 v0, p0

    .line 452
    iget-object v1, v0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x3

    aget v3, v1, v2

    const/4 v4, 0x6

    aget v5, v1, v4

    mul-float v3, v3, v5

    const/16 v5, 0x9

    aget v6, v1, v5

    mul-float v3, v3, v6

    const/16 v6, 0xc

    aget v7, v1, v6

    mul-float v3, v3, v7

    const/4 v7, 0x2

    aget v8, v1, v7

    const/4 v9, 0x7

    aget v10, v1, v9

    mul-float v8, v8, v10

    aget v10, v1, v5

    mul-float v8, v8, v10

    aget v10, v1, v6

    mul-float v8, v8, v10

    sub-float/2addr v3, v8

    aget v8, v1, v2

    const/4 v10, 0x5

    aget v11, v1, v10

    mul-float v8, v8, v11

    const/16 v11, 0xa

    aget v12, v1, v11

    mul-float v8, v8, v12

    aget v12, v1, v6

    mul-float v8, v8, v12

    sub-float/2addr v3, v8

    const/4 v8, 0x1

    aget v12, v1, v8

    aget v13, v1, v9

    mul-float v12, v12, v13

    aget v13, v1, v11

    mul-float v12, v12, v13

    aget v13, v1, v6

    mul-float v12, v12, v13

    add-float/2addr v3, v12

    aget v12, v1, v7

    aget v13, v1, v10

    mul-float v12, v12, v13

    const/16 v13, 0xb

    aget v14, v1, v13

    mul-float v12, v12, v14

    aget v14, v1, v6

    mul-float v12, v12, v14

    add-float/2addr v3, v12

    aget v12, v1, v8

    aget v14, v1, v4

    mul-float v12, v12, v14

    aget v14, v1, v13

    mul-float v12, v12, v14

    aget v6, v1, v6

    mul-float v12, v12, v6

    sub-float/2addr v3, v12

    aget v6, v1, v2

    aget v12, v1, v4

    mul-float v6, v6, v12

    const/16 v12, 0x8

    aget v14, v1, v12

    mul-float v6, v6, v14

    const/16 v14, 0xd

    aget v15, v1, v14

    mul-float v6, v6, v15

    sub-float/2addr v3, v6

    aget v6, v1, v7

    aget v15, v1, v9

    mul-float v6, v6, v15

    aget v15, v1, v12

    mul-float v6, v6, v15

    aget v15, v1, v14

    mul-float v6, v6, v15

    add-float/2addr v3, v6

    aget v6, v1, v2

    const/4 v15, 0x4

    aget v16, v1, v15

    mul-float v6, v6, v16

    aget v16, v1, v11

    mul-float v6, v6, v16

    aget v16, v1, v14

    mul-float v6, v6, v16

    add-float/2addr v3, v6

    const/4 v6, 0x0

    aget v16, v1, v6

    aget v17, v1, v9

    mul-float v16, v16, v17

    aget v17, v1, v11

    mul-float v16, v16, v17

    aget v17, v1, v14

    mul-float v16, v16, v17

    sub-float v3, v3, v16

    aget v16, v1, v7

    aget v17, v1, v15

    mul-float v16, v16, v17

    aget v17, v1, v13

    mul-float v16, v16, v17

    aget v17, v1, v14

    mul-float v16, v16, v17

    sub-float v3, v3, v16

    aget v16, v1, v6

    aget v17, v1, v4

    mul-float v16, v16, v17

    aget v17, v1, v13

    mul-float v16, v16, v17

    aget v14, v1, v14

    mul-float v16, v16, v14

    add-float v3, v3, v16

    aget v14, v1, v2

    aget v16, v1, v10

    mul-float v14, v14, v16

    aget v16, v1, v12

    mul-float v14, v14, v16

    const/16 v16, 0xe

    aget v17, v1, v16

    mul-float v14, v14, v17

    add-float/2addr v3, v14

    aget v14, v1, v8

    aget v17, v1, v9

    mul-float v14, v14, v17

    aget v17, v1, v12

    mul-float v14, v14, v17

    aget v17, v1, v16

    mul-float v14, v14, v17

    sub-float/2addr v3, v14

    aget v2, v1, v2

    aget v14, v1, v15

    mul-float v2, v2, v14

    aget v14, v1, v5

    mul-float v2, v2, v14

    aget v14, v1, v16

    mul-float v2, v2, v14

    sub-float/2addr v3, v2

    aget v2, v1, v6

    aget v9, v1, v9

    mul-float v2, v2, v9

    aget v9, v1, v5

    mul-float v2, v2, v9

    aget v9, v1, v16

    mul-float v2, v2, v9

    add-float/2addr v3, v2

    aget v2, v1, v8

    aget v9, v1, v15

    mul-float v2, v2, v9

    aget v9, v1, v13

    mul-float v2, v2, v9

    aget v9, v1, v16

    mul-float v2, v2, v9

    add-float/2addr v3, v2

    aget v2, v1, v6

    aget v9, v1, v10

    mul-float v2, v2, v9

    aget v9, v1, v13

    mul-float v2, v2, v9

    aget v9, v1, v16

    mul-float v2, v2, v9

    sub-float/2addr v3, v2

    aget v2, v1, v7

    aget v9, v1, v10

    mul-float v2, v2, v9

    aget v9, v1, v12

    mul-float v2, v2, v9

    const/16 v9, 0xf

    aget v9, v1, v9

    mul-float v2, v2, v9

    sub-float/2addr v3, v2

    aget v2, v1, v8

    aget v9, v1, v4

    mul-float v2, v2, v9

    aget v9, v1, v12

    mul-float v2, v2, v9

    const/16 v9, 0xf

    aget v9, v1, v9

    mul-float v2, v2, v9

    add-float/2addr v3, v2

    aget v2, v1, v7

    aget v7, v1, v15

    mul-float v2, v2, v7

    aget v7, v1, v5

    mul-float v2, v2, v7

    const/16 v7, 0xf

    aget v7, v1, v7

    mul-float v2, v2, v7

    add-float/2addr v3, v2

    aget v2, v1, v6

    aget v4, v1, v4

    mul-float v2, v2, v4

    aget v4, v1, v5

    mul-float v2, v2, v4

    const/16 v4, 0xf

    aget v4, v1, v4

    mul-float v2, v2, v4

    sub-float/2addr v3, v2

    aget v2, v1, v8

    aget v4, v1, v15

    mul-float v2, v2, v4

    aget v4, v1, v11

    mul-float v2, v2, v4

    const/16 v4, 0xf

    aget v4, v1, v4

    mul-float v2, v2, v4

    sub-float/2addr v3, v2

    aget v2, v1, v6

    aget v4, v1, v10

    mul-float v2, v2, v4

    aget v4, v1, v11

    mul-float v2, v2, v4

    const/16 v4, 0xf

    aget v1, v1, v4

    mul-float v2, v2, v1

    add-float/2addr v3, v2

    return v3
.end method

.method public det3x3()F
    .locals 13

    .line 465
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    const/4 v3, 0x5

    aget v4, v0, v3

    mul-float v2, v2, v4

    const/16 v4, 0xa

    aget v5, v0, v4

    mul-float v2, v2, v5

    const/4 v5, 0x4

    aget v6, v0, v5

    const/16 v7, 0x9

    aget v8, v0, v7

    mul-float v6, v6, v8

    const/4 v8, 0x2

    aget v9, v0, v8

    mul-float v6, v6, v9

    add-float/2addr v2, v6

    const/16 v6, 0x8

    aget v9, v0, v6

    const/4 v10, 0x1

    aget v11, v0, v10

    mul-float v9, v9, v11

    const/4 v11, 0x6

    aget v12, v0, v11

    mul-float v9, v9, v12

    add-float/2addr v2, v9

    aget v1, v0, v1

    aget v7, v0, v7

    mul-float v1, v1, v7

    aget v7, v0, v11

    mul-float v1, v1, v7

    sub-float/2addr v2, v1

    aget v1, v0, v5

    aget v5, v0, v10

    mul-float v1, v1, v5

    aget v4, v0, v4

    mul-float v1, v1, v4

    sub-float/2addr v2, v1

    aget v1, v0, v6

    aget v3, v0, v3

    mul-float v1, v1, v3

    aget v0, v0, v8

    mul-float v1, v1, v0

    sub-float/2addr v2, v1

    return v2
.end method

.method public extract4x3Matrix([F)V
    .locals 5

    .line 1547
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    aput v2, p1, v1

    const/4 v1, 0x1

    .line 1548
    aget v2, v0, v1

    aput v2, p1, v1

    const/4 v1, 0x2

    .line 1549
    aget v2, v0, v1

    aput v2, p1, v1

    const/4 v1, 0x4

    .line 1550
    aget v2, v0, v1

    const/4 v3, 0x3

    aput v2, p1, v3

    const/4 v2, 0x5

    .line 1551
    aget v3, v0, v2

    aput v3, p1, v1

    const/4 v1, 0x6

    .line 1552
    aget v3, v0, v1

    aput v3, p1, v2

    const/16 v2, 0x8

    .line 1553
    aget v3, v0, v2

    aput v3, p1, v1

    const/16 v1, 0x9

    .line 1554
    aget v3, v0, v1

    const/4 v4, 0x7

    aput v3, p1, v4

    const/16 v3, 0xa

    .line 1555
    aget v4, v0, v3

    aput v4, p1, v2

    const/16 v2, 0xc

    .line 1556
    aget v2, v0, v2

    aput v2, p1, v1

    const/16 v1, 0xd

    .line 1557
    aget v1, v0, v1

    aput v1, p1, v3

    const/16 v1, 0xe

    .line 1558
    aget v0, v0, v1

    const/16 v1, 0xb

    aput v0, p1, v1

    return-void
.end method

.method public getRotation(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Quaternion;
    .locals 0

    .line 1106
    invoke-virtual {p1, p0}, Lcom/badlogic/gdx/math/Quaternion;->setFromMatrix(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object p1

    return-object p1
.end method

.method public getRotation(Lcom/badlogic/gdx/math/Quaternion;Z)Lcom/badlogic/gdx/math/Quaternion;
    .locals 0

    .line 1099
    invoke-virtual {p1, p2, p0}, Lcom/badlogic/gdx/math/Quaternion;->setFromMatrix(ZLcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object p1

    return-object p1
.end method

.method public getScale(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 3

    .line 1145
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->getScaleX()F

    move-result v0

    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->getScaleY()F

    move-result v1

    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->getScaleZ()F

    move-result v2

    invoke-virtual {p1, v0, v1, v2}, Lcom/badlogic/gdx/math/Vector3;->set(FFF)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    return-object p1
.end method

.method public getScaleX()F
    .locals 2

    .line 1126
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x4

    aget v0, v0, v1

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0x8

    aget v0, v0, v1

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    goto :goto_0

    .line 1127
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->getScaleXSquared()F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    :goto_0
    return v0
.end method

.method public getScaleXSquared()F
    .locals 4

    .line 1111
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    aget v1, v0, v1

    mul-float v2, v2, v1

    const/4 v1, 0x4

    aget v3, v0, v1

    aget v1, v0, v1

    mul-float v3, v3, v1

    add-float/2addr v2, v3

    const/16 v1, 0x8

    aget v3, v0, v1

    aget v0, v0, v1

    mul-float v3, v3, v0

    add-float/2addr v2, v3

    return v2
.end method

.method public getScaleY()F
    .locals 2

    .line 1132
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x1

    aget v0, v0, v1

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0x9

    aget v0, v0, v1

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x5

    aget v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    goto :goto_0

    .line 1133
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->getScaleYSquared()F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    :goto_0
    return v0
.end method

.method public getScaleYSquared()F
    .locals 4

    .line 1116
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x1

    aget v2, v0, v1

    aget v1, v0, v1

    mul-float v2, v2, v1

    const/4 v1, 0x5

    aget v3, v0, v1

    aget v1, v0, v1

    mul-float v3, v3, v1

    add-float/2addr v2, v3

    const/16 v1, 0x9

    aget v3, v0, v1

    aget v0, v0, v1

    mul-float v3, v3, v0

    add-float/2addr v2, v3

    return v2
.end method

.method public getScaleZ()F
    .locals 2

    .line 1138
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x2

    aget v0, v0, v1

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x6

    aget v0, v0, v1

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xa

    aget v0, v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    goto :goto_0

    .line 1139
    :cond_0
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->getScaleZSquared()F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-float v0, v0

    :goto_0
    return v0
.end method

.method public getScaleZSquared()F
    .locals 4

    .line 1121
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x2

    aget v2, v0, v1

    aget v1, v0, v1

    mul-float v2, v2, v1

    const/4 v1, 0x6

    aget v3, v0, v1

    aget v1, v0, v1

    mul-float v3, v3, v1

    add-float/2addr v2, v3

    const/16 v1, 0xa

    aget v3, v0, v1

    aget v0, v0, v1

    mul-float v3, v3, v0

    add-float/2addr v2, v3

    return v2
.end method

.method public getTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;
    .locals 2

    .line 1088
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xc

    aget v1, v0, v1

    iput v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/16 v1, 0xd

    .line 1089
    aget v1, v0, v1

    iput v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/16 v1, 0xe

    .line 1090
    aget v0, v0, v1

    iput v0, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    return-object p1
.end method

.method public getValues()[F
    .locals 1

    .line 307
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    return-object v0
.end method

.method public hasRotationOrScaling()Z
    .locals 5

    .line 1563
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v0, v2}, Lcom/badlogic/gdx/math/MathUtils;->isEqual(FF)Z

    move-result v0

    const/4 v3, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v4, 0x5

    aget v0, v0, v4

    invoke-static {v0, v2}, Lcom/badlogic/gdx/math/MathUtils;->isEqual(FF)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v4, 0xa

    aget v0, v0, v4

    invoke-static {v0, v2}, Lcom/badlogic/gdx/math/MathUtils;->isEqual(FF)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x4

    aget v0, v0, v2

    .line 1564
    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v2, 0x8

    aget v0, v0, v2

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    aget v0, v0, v3

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v2, 0x9

    aget v0, v0, v2

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x2

    aget v0, v0, v2

    .line 1565
    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x6

    aget v0, v0, v2

    invoke-static {v0}, Lcom/badlogic/gdx/math/MathUtils;->isZero(F)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v1, 0x1

    :cond_1
    return v1
.end method

.method public idt()Lcom/badlogic/gdx/math/Matrix4;
    .locals 4

    .line 364
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    aput v1, v0, v2

    const/4 v2, 0x0

    const/4 v3, 0x4

    .line 365
    aput v2, v0, v3

    const/16 v3, 0x8

    .line 366
    aput v2, v0, v3

    const/16 v3, 0xc

    .line 367
    aput v2, v0, v3

    const/4 v3, 0x1

    .line 368
    aput v2, v0, v3

    const/4 v3, 0x5

    .line 369
    aput v1, v0, v3

    const/16 v3, 0x9

    .line 370
    aput v2, v0, v3

    const/16 v3, 0xd

    .line 371
    aput v2, v0, v3

    const/4 v3, 0x2

    .line 372
    aput v2, v0, v3

    const/4 v3, 0x6

    .line 373
    aput v2, v0, v3

    const/16 v3, 0xa

    .line 374
    aput v1, v0, v3

    const/16 v3, 0xe

    .line 375
    aput v2, v0, v3

    const/4 v3, 0x3

    .line 376
    aput v2, v0, v3

    const/4 v3, 0x7

    .line 377
    aput v2, v0, v3

    const/16 v3, 0xb

    .line 378
    aput v2, v0, v3

    const/16 v2, 0xf

    .line 379
    aput v1, v0, v2

    return-object p0
.end method

.method public inv()Lcom/badlogic/gdx/math/Matrix4;
    .locals 23

    move-object/from16 v0, p0

    .line 388
    iget-object v1, v0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x3

    aget v3, v1, v2

    const/4 v4, 0x6

    aget v5, v1, v4

    mul-float v3, v3, v5

    const/16 v5, 0x9

    aget v6, v1, v5

    mul-float v3, v3, v6

    const/16 v6, 0xc

    aget v7, v1, v6

    mul-float v3, v3, v7

    const/4 v7, 0x2

    aget v8, v1, v7

    const/4 v9, 0x7

    aget v10, v1, v9

    mul-float v8, v8, v10

    aget v10, v1, v5

    mul-float v8, v8, v10

    aget v10, v1, v6

    mul-float v8, v8, v10

    sub-float/2addr v3, v8

    aget v8, v1, v2

    const/4 v10, 0x5

    aget v11, v1, v10

    mul-float v8, v8, v11

    const/16 v11, 0xa

    aget v12, v1, v11

    mul-float v8, v8, v12

    aget v12, v1, v6

    mul-float v8, v8, v12

    sub-float/2addr v3, v8

    const/4 v8, 0x1

    aget v12, v1, v8

    aget v13, v1, v9

    mul-float v12, v12, v13

    aget v13, v1, v11

    mul-float v12, v12, v13

    aget v13, v1, v6

    mul-float v12, v12, v13

    add-float/2addr v3, v12

    aget v12, v1, v7

    aget v13, v1, v10

    mul-float v12, v12, v13

    const/16 v13, 0xb

    aget v14, v1, v13

    mul-float v12, v12, v14

    aget v14, v1, v6

    mul-float v12, v12, v14

    add-float/2addr v3, v12

    aget v12, v1, v8

    aget v14, v1, v4

    mul-float v12, v12, v14

    aget v14, v1, v13

    mul-float v12, v12, v14

    aget v14, v1, v6

    mul-float v12, v12, v14

    sub-float/2addr v3, v12

    aget v12, v1, v2

    aget v14, v1, v4

    mul-float v12, v12, v14

    const/16 v14, 0x8

    aget v15, v1, v14

    mul-float v12, v12, v15

    const/16 v15, 0xd

    aget v16, v1, v15

    mul-float v12, v12, v16

    sub-float/2addr v3, v12

    aget v12, v1, v7

    aget v16, v1, v9

    mul-float v12, v12, v16

    aget v16, v1, v14

    mul-float v12, v12, v16

    aget v16, v1, v15

    mul-float v12, v12, v16

    add-float/2addr v3, v12

    aget v12, v1, v2

    const/16 v16, 0x4

    aget v17, v1, v16

    mul-float v12, v12, v17

    aget v17, v1, v11

    mul-float v12, v12, v17

    aget v17, v1, v15

    mul-float v12, v12, v17

    add-float/2addr v3, v12

    const/4 v12, 0x0

    aget v17, v1, v12

    aget v18, v1, v9

    mul-float v17, v17, v18

    aget v18, v1, v11

    mul-float v17, v17, v18

    aget v18, v1, v15

    mul-float v17, v17, v18

    sub-float v3, v3, v17

    aget v17, v1, v7

    aget v18, v1, v16

    mul-float v17, v17, v18

    aget v18, v1, v13

    mul-float v17, v17, v18

    aget v18, v1, v15

    mul-float v17, v17, v18

    sub-float v3, v3, v17

    aget v17, v1, v12

    aget v18, v1, v4

    mul-float v17, v17, v18

    aget v18, v1, v13

    mul-float v17, v17, v18

    aget v18, v1, v15

    mul-float v17, v17, v18

    add-float v3, v3, v17

    aget v17, v1, v2

    aget v18, v1, v10

    mul-float v17, v17, v18

    aget v18, v1, v14

    mul-float v17, v17, v18

    const/16 v18, 0xe

    aget v19, v1, v18

    mul-float v17, v17, v19

    add-float v3, v3, v17

    aget v17, v1, v8

    aget v19, v1, v9

    mul-float v17, v17, v19

    aget v19, v1, v14

    mul-float v17, v17, v19

    aget v19, v1, v18

    mul-float v17, v17, v19

    sub-float v3, v3, v17

    aget v17, v1, v2

    aget v19, v1, v16

    mul-float v17, v17, v19

    aget v19, v1, v5

    mul-float v17, v17, v19

    aget v19, v1, v18

    mul-float v17, v17, v19

    sub-float v3, v3, v17

    aget v17, v1, v12

    aget v19, v1, v9

    mul-float v17, v17, v19

    aget v19, v1, v5

    mul-float v17, v17, v19

    aget v19, v1, v18

    mul-float v17, v17, v19

    add-float v3, v3, v17

    aget v17, v1, v8

    aget v19, v1, v16

    mul-float v17, v17, v19

    aget v19, v1, v13

    mul-float v17, v17, v19

    aget v19, v1, v18

    mul-float v17, v17, v19

    add-float v3, v3, v17

    aget v17, v1, v12

    aget v19, v1, v10

    mul-float v17, v17, v19

    aget v19, v1, v13

    mul-float v17, v17, v19

    aget v19, v1, v18

    mul-float v17, v17, v19

    sub-float v3, v3, v17

    aget v17, v1, v7

    aget v19, v1, v10

    mul-float v17, v17, v19

    aget v19, v1, v14

    mul-float v17, v17, v19

    const/16 v19, 0xf

    aget v19, v1, v19

    mul-float v17, v17, v19

    sub-float v3, v3, v17

    aget v17, v1, v8

    aget v19, v1, v4

    mul-float v17, v17, v19

    aget v19, v1, v14

    mul-float v17, v17, v19

    const/16 v19, 0xf

    aget v19, v1, v19

    mul-float v17, v17, v19

    add-float v3, v3, v17

    aget v17, v1, v7

    aget v19, v1, v16

    mul-float v17, v17, v19

    aget v19, v1, v5

    mul-float v17, v17, v19

    const/16 v19, 0xf

    aget v19, v1, v19

    mul-float v17, v17, v19

    add-float v3, v3, v17

    aget v17, v1, v12

    aget v19, v1, v4

    mul-float v17, v17, v19

    aget v19, v1, v5

    mul-float v17, v17, v19

    const/16 v19, 0xf

    aget v19, v1, v19

    mul-float v17, v17, v19

    sub-float v3, v3, v17

    aget v17, v1, v8

    aget v19, v1, v16

    mul-float v17, v17, v19

    aget v19, v1, v11

    mul-float v17, v17, v19

    const/16 v19, 0xf

    aget v19, v1, v19

    mul-float v17, v17, v19

    sub-float v3, v3, v17

    aget v17, v1, v12

    aget v19, v1, v10

    mul-float v17, v17, v19

    aget v19, v1, v11

    mul-float v17, v17, v19

    const/16 v19, 0xf

    aget v19, v1, v19

    mul-float v17, v17, v19

    add-float v3, v3, v17

    const/16 v17, 0x0

    cmpl-float v17, v3, v17

    if-eqz v17, :cond_0

    const/high16 v17, 0x3f800000    # 1.0f

    div-float v17, v17, v3

    .line 399
    sget-object v3, Lcom/badlogic/gdx/math/Matrix4;->tmp:[F

    aget v19, v1, v5

    aget v20, v1, v18

    mul-float v19, v19, v20

    aget v20, v1, v9

    mul-float v19, v19, v20

    aget v20, v1, v15

    aget v21, v1, v11

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v15

    aget v21, v1, v4

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v10

    aget v21, v1, v18

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v5

    aget v21, v1, v4

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v10

    aget v21, v1, v11

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aput v19, v3, v12

    .line 401
    aget v19, v1, v6

    aget v20, v1, v11

    mul-float v19, v19, v20

    aget v20, v1, v9

    mul-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v18

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v4

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v18

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v4

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v11

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aput v19, v3, v16

    .line 403
    aget v19, v1, v14

    aget v20, v1, v15

    mul-float v19, v19, v20

    aget v20, v1, v9

    mul-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v5

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v10

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v15

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v10

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v5

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aput v19, v3, v14

    .line 405
    aget v19, v1, v6

    aget v20, v1, v5

    mul-float v19, v19, v20

    aget v20, v1, v4

    mul-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v15

    mul-float v20, v20, v21

    aget v21, v1, v4

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v10

    mul-float v20, v20, v21

    aget v21, v1, v11

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v15

    mul-float v20, v20, v21

    aget v21, v1, v11

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v10

    mul-float v20, v20, v21

    aget v21, v1, v18

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v5

    mul-float v20, v20, v21

    aget v21, v1, v18

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aput v19, v3, v6

    .line 407
    aget v19, v1, v15

    aget v20, v1, v11

    mul-float v19, v19, v20

    aget v20, v1, v2

    mul-float v19, v19, v20

    aget v20, v1, v5

    aget v21, v1, v18

    mul-float v20, v20, v21

    aget v21, v1, v2

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v15

    aget v21, v1, v7

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v8

    aget v21, v1, v18

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v5

    aget v21, v1, v7

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v8

    aget v21, v1, v11

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aput v19, v3, v8

    .line 409
    aget v19, v1, v14

    aget v20, v1, v18

    mul-float v19, v19, v20

    aget v20, v1, v2

    mul-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v11

    mul-float v20, v20, v21

    aget v21, v1, v2

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v7

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v18

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v7

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v11

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aput v19, v3, v10

    .line 411
    aget v19, v1, v6

    aget v20, v1, v5

    mul-float v19, v19, v20

    aget v20, v1, v2

    mul-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v15

    mul-float v20, v20, v21

    aget v21, v1, v2

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v8

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v15

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v8

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v5

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aput v19, v3, v5

    .line 413
    aget v19, v1, v14

    aget v20, v1, v15

    mul-float v19, v19, v20

    aget v20, v1, v7

    mul-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v5

    mul-float v20, v20, v21

    aget v21, v1, v7

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v8

    mul-float v20, v20, v21

    aget v21, v1, v11

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v15

    mul-float v20, v20, v21

    aget v21, v1, v11

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v8

    mul-float v20, v20, v21

    aget v21, v1, v18

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v5

    mul-float v20, v20, v21

    aget v21, v1, v18

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aput v19, v3, v15

    .line 415
    aget v19, v1, v10

    aget v20, v1, v18

    mul-float v19, v19, v20

    aget v20, v1, v2

    mul-float v19, v19, v20

    aget v20, v1, v15

    aget v21, v1, v4

    mul-float v20, v20, v21

    aget v21, v1, v2

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v15

    aget v21, v1, v7

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v8

    aget v21, v1, v18

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v10

    aget v21, v1, v7

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v8

    aget v21, v1, v4

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aput v19, v3, v7

    .line 417
    aget v19, v1, v6

    aget v20, v1, v4

    mul-float v19, v19, v20

    aget v20, v1, v2

    mul-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v18

    mul-float v20, v20, v21

    aget v21, v1, v2

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v7

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v18

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v7

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v4

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aput v19, v3, v4

    .line 419
    aget v19, v1, v16

    aget v20, v1, v15

    mul-float v19, v19, v20

    aget v20, v1, v2

    mul-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v10

    mul-float v20, v20, v21

    aget v21, v1, v2

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v8

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v15

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v8

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v10

    mul-float v20, v20, v21

    const/16 v21, 0xf

    aget v21, v1, v21

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aput v19, v3, v11

    .line 421
    aget v19, v1, v6

    aget v20, v1, v10

    mul-float v19, v19, v20

    aget v20, v1, v7

    mul-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v15

    mul-float v20, v20, v21

    aget v21, v1, v7

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v6

    aget v21, v1, v8

    mul-float v20, v20, v21

    aget v21, v1, v4

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v15

    mul-float v20, v20, v21

    aget v21, v1, v4

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v8

    mul-float v20, v20, v21

    aget v21, v1, v18

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v10

    mul-float v20, v20, v21

    aget v21, v1, v18

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aput v19, v3, v18

    .line 423
    aget v19, v1, v5

    aget v20, v1, v4

    mul-float v19, v19, v20

    aget v20, v1, v2

    mul-float v19, v19, v20

    aget v20, v1, v10

    aget v21, v1, v11

    mul-float v20, v20, v21

    aget v21, v1, v2

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v5

    aget v21, v1, v7

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v8

    aget v21, v1, v11

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v10

    aget v21, v1, v7

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v8

    aget v21, v1, v4

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aput v19, v3, v2

    .line 425
    aget v19, v1, v16

    aget v20, v1, v11

    mul-float v19, v19, v20

    aget v20, v1, v2

    mul-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v4

    mul-float v20, v20, v21

    aget v21, v1, v2

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v7

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v11

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v7

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v4

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aput v19, v3, v9

    .line 427
    aget v19, v1, v14

    aget v20, v1, v10

    mul-float v19, v19, v20

    aget v20, v1, v2

    mul-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v5

    mul-float v20, v20, v21

    aget v21, v1, v2

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v14

    aget v21, v1, v8

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v5

    mul-float v20, v20, v21

    aget v21, v1, v9

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v16

    aget v21, v1, v8

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    add-float v19, v19, v20

    aget v20, v1, v12

    aget v21, v1, v10

    mul-float v20, v20, v21

    aget v21, v1, v13

    mul-float v20, v20, v21

    sub-float v19, v19, v20

    aput v19, v3, v13

    const/16 v19, 0xf

    .line 429
    aget v20, v1, v16

    aget v21, v1, v5

    mul-float v20, v20, v21

    aget v21, v1, v7

    mul-float v20, v20, v21

    aget v21, v1, v14

    aget v22, v1, v10

    mul-float v21, v21, v22

    aget v22, v1, v7

    mul-float v21, v21, v22

    sub-float v20, v20, v21

    aget v21, v1, v14

    aget v22, v1, v8

    mul-float v21, v21, v22

    aget v22, v1, v4

    mul-float v21, v21, v22

    add-float v20, v20, v21

    aget v21, v1, v12

    aget v22, v1, v5

    mul-float v21, v21, v22

    aget v22, v1, v4

    mul-float v21, v21, v22

    sub-float v20, v20, v21

    aget v21, v1, v16

    aget v22, v1, v8

    mul-float v21, v21, v22

    aget v22, v1, v11

    mul-float v21, v21, v22

    sub-float v20, v20, v21

    aget v21, v1, v12

    aget v22, v1, v10

    mul-float v21, v21, v22

    aget v22, v1, v11

    mul-float v21, v21, v22

    add-float v20, v20, v21

    aput v20, v3, v19

    .line 431
    aget v19, v3, v12

    mul-float v19, v19, v17

    aput v19, v1, v12

    .line 432
    aget v12, v3, v16

    mul-float v12, v12, v17

    aput v12, v1, v16

    .line 433
    aget v12, v3, v14

    mul-float v12, v12, v17

    aput v12, v1, v14

    .line 434
    aget v12, v3, v6

    mul-float v12, v12, v17

    aput v12, v1, v6

    .line 435
    aget v6, v3, v8

    mul-float v6, v6, v17

    aput v6, v1, v8

    .line 436
    aget v6, v3, v10

    mul-float v6, v6, v17

    aput v6, v1, v10

    .line 437
    aget v6, v3, v5

    mul-float v6, v6, v17

    aput v6, v1, v5

    .line 438
    aget v5, v3, v15

    mul-float v5, v5, v17

    aput v5, v1, v15

    .line 439
    aget v5, v3, v7

    mul-float v5, v5, v17

    aput v5, v1, v7

    .line 440
    aget v5, v3, v4

    mul-float v5, v5, v17

    aput v5, v1, v4

    .line 441
    aget v4, v3, v11

    mul-float v4, v4, v17

    aput v4, v1, v11

    .line 442
    aget v4, v3, v18

    mul-float v4, v4, v17

    aput v4, v1, v18

    .line 443
    aget v4, v3, v2

    mul-float v4, v4, v17

    aput v4, v1, v2

    .line 444
    aget v2, v3, v9

    mul-float v2, v2, v17

    aput v2, v1, v9

    .line 445
    aget v2, v3, v13

    mul-float v2, v2, v17

    aput v2, v1, v13

    const/16 v2, 0xf

    const/16 v4, 0xf

    .line 446
    aget v3, v3, v4

    mul-float v3, v3, v17

    aput v3, v1, v2

    return-object v0

    .line 397
    :cond_0
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "non-invertible matrix"

    invoke-direct {v1, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public lerp(Lcom/badlogic/gdx/math/Matrix4;F)Lcom/badlogic/gdx/math/Matrix4;
    .locals 4

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    .line 897
    iget-object v1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    aget v2, v1, v0

    const/high16 v3, 0x3f800000    # 1.0f

    sub-float/2addr v3, p2

    mul-float v2, v2, v3

    iget-object v3, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    aget v3, v3, v0

    mul-float v3, v3, p2

    add-float/2addr v2, v3

    aput v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 319
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    invoke-static {v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->mul([F[F)V

    return-object p0
.end method

.method public mulLeft(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 332
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    .line 333
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    invoke-static {p1, v0}, Lcom/badlogic/gdx/math/Matrix4;->mul([F[F)V

    .line 334
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public rotate(FFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p4, v0

    if-nez v0, :cond_0

    return-object p0

    .line 1480
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Quaternion;->setFromAxis(FFFF)Lcom/badlogic/gdx/math/Quaternion;

    .line 1481
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->rotate(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public rotate(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 1503
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmp:[F

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/math/Quaternion;->toMatrix([F)V

    .line 1504
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmp:[F

    invoke-static {p1, v0}, Lcom/badlogic/gdx/math/Matrix4;->mul([F[F)V

    return-object p0
.end method

.method public rotate(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    return-object p0

    .line 1455
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Quaternion;

    .line 1456
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->rotate(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public rotate(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 1513
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Quaternion;->setFromCross(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->rotate(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public rotateRad(FFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p4, v0

    if-nez v0, :cond_0

    return-object p0

    .line 1493
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Quaternion;->setFromAxisRad(FFFF)Lcom/badlogic/gdx/math/Quaternion;

    .line 1494
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->rotate(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public rotateRad(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    return-object p0

    .line 1467
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Quaternion;->setFromAxisRad(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Quaternion;

    .line 1468
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->rotate(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public scale(FFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 2

    .line 1523
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmp:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 p1, 0x0

    const/4 v1, 0x4

    .line 1524
    aput p1, v0, v1

    const/16 v1, 0x8

    .line 1525
    aput p1, v0, v1

    const/16 v1, 0xc

    .line 1526
    aput p1, v0, v1

    const/4 v1, 0x1

    .line 1527
    aput p1, v0, v1

    const/4 v1, 0x5

    .line 1528
    aput p2, v0, v1

    const/16 p2, 0x9

    .line 1529
    aput p1, v0, p2

    const/16 p2, 0xd

    .line 1530
    aput p1, v0, p2

    const/4 p2, 0x2

    .line 1531
    aput p1, v0, p2

    const/4 p2, 0x6

    .line 1532
    aput p1, v0, p2

    const/16 p2, 0xa

    .line 1533
    aput p3, v0, p2

    const/16 p2, 0xe

    .line 1534
    aput p1, v0, p2

    const/4 p2, 0x3

    .line 1535
    aput p1, v0, p2

    const/4 p2, 0x7

    .line 1536
    aput p1, v0, p2

    const/16 p2, 0xb

    .line 1537
    aput p1, v0, p2

    const/16 p1, 0xf

    const/high16 p2, 0x3f800000    # 1.0f

    .line 1538
    aput p2, v0, p1

    .line 1540
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    invoke-static {p1, v0}, Lcom/badlogic/gdx/math/Matrix4;->mul([F[F)V

    return-object p0
.end method

.method public scl(F)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 1081
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    mul-float v2, v2, p1

    aput v2, v0, v1

    const/4 v1, 0x5

    .line 1082
    aget v2, v0, v1

    mul-float v2, v2, p1

    aput v2, v0, v1

    const/16 v1, 0xa

    .line 1083
    aget v2, v0, v1

    mul-float v2, v2, p1

    aput v2, v0, v1

    return-object p0
.end method

.method public scl(FFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 1074
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    mul-float v2, v2, p1

    aput v2, v0, v1

    const/4 p1, 0x5

    .line 1075
    aget v1, v0, p1

    mul-float v1, v1, p2

    aput v1, v0, p1

    const/16 p1, 0xa

    .line 1076
    aget p2, v0, p1

    mul-float p2, p2, p3

    aput p2, v0, p1

    return-object p0
.end method

.method public scl(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 4

    .line 1067
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    aget v2, v0, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    mul-float v2, v2, v3

    aput v2, v0, v1

    .line 1068
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x5

    aget v2, v0, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    mul-float v2, v2, v3

    aput v2, v0, v1

    .line 1069
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xa

    aget v2, v0, v1

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    mul-float v2, v2, p1

    aput v2, v0, v1

    return-object p0
.end method

.method public set(FFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 8

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v0, p0

    move v4, p1

    move v5, p2

    move v6, p3

    move v7, p4

    .line 147
    invoke-virtual/range {v0 .. v7}, Lcom/badlogic/gdx/math/Matrix4;->set(FFFFFFF)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public set(FFFFFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 14

    move-object v0, p0

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v2, p4, v1

    mul-float v3, p5, v1

    mul-float v1, v1, p6

    mul-float v4, p7, v2

    mul-float v5, p7, v3

    mul-float v6, p7, v1

    mul-float v2, v2, p4

    mul-float v7, p4, v3

    mul-float v8, p4, v1

    mul-float v3, v3, p5

    mul-float v9, p5, v1

    mul-float v1, v1, p6

    .line 175
    iget-object v10, v0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    add-float v11, v3, v1

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float v11, v12, v11

    const/4 v13, 0x0

    aput v11, v10, v13

    sub-float v11, v7, v6

    const/4 v13, 0x4

    .line 176
    aput v11, v10, v13

    add-float v11, v8, v5

    const/16 v13, 0x8

    .line 177
    aput v11, v10, v13

    const/16 v11, 0xc

    .line 178
    aput p1, v10, v11

    add-float/2addr v7, v6

    const/4 v6, 0x1

    .line 180
    aput v7, v10, v6

    add-float/2addr v1, v2

    sub-float v1, v12, v1

    const/4 v6, 0x5

    .line 181
    aput v1, v10, v6

    sub-float v1, v9, v4

    const/16 v6, 0x9

    .line 182
    aput v1, v10, v6

    const/16 v1, 0xd

    .line 183
    aput p2, v10, v1

    sub-float/2addr v8, v5

    const/4 v1, 0x2

    .line 185
    aput v8, v10, v1

    add-float/2addr v9, v4

    const/4 v1, 0x6

    .line 186
    aput v9, v10, v1

    add-float/2addr v2, v3

    sub-float v1, v12, v2

    const/16 v2, 0xa

    .line 187
    aput v1, v10, v2

    const/16 v1, 0xe

    .line 188
    aput p3, v10, v1

    const/4 v1, 0x0

    const/4 v2, 0x3

    .line 190
    aput v1, v10, v2

    const/4 v2, 0x7

    .line 191
    aput v1, v10, v2

    const/16 v2, 0xb

    .line 192
    aput v1, v10, v2

    const/16 v1, 0xf

    .line 193
    aput v12, v10, v1

    return-object v0
.end method

.method public set(FFFFFFFFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 14

    move-object v0, p0

    const/high16 v1, 0x40000000    # 2.0f

    mul-float v2, p4, v1

    mul-float v3, p5, v1

    mul-float v1, v1, p6

    mul-float v4, p7, v2

    mul-float v5, p7, v3

    mul-float v6, p7, v1

    mul-float v2, v2, p4

    mul-float v7, p4, v3

    mul-float v8, p4, v1

    mul-float v3, v3, p5

    mul-float v9, p5, v1

    mul-float v1, v1, p6

    .line 227
    iget-object v10, v0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    add-float v11, v3, v1

    const/high16 v12, 0x3f800000    # 1.0f

    sub-float v11, v12, v11

    mul-float v11, v11, p8

    const/4 v13, 0x0

    aput v11, v10, v13

    sub-float v11, v7, v6

    mul-float v11, v11, p9

    const/4 v13, 0x4

    .line 228
    aput v11, v10, v13

    add-float v11, v8, v5

    mul-float v11, v11, p10

    const/16 v13, 0x8

    .line 229
    aput v11, v10, v13

    const/16 v11, 0xc

    .line 230
    aput p1, v10, v11

    add-float/2addr v7, v6

    mul-float v6, p8, v7

    const/4 v7, 0x1

    .line 232
    aput v6, v10, v7

    add-float/2addr v1, v2

    sub-float v1, v12, v1

    mul-float v1, v1, p9

    const/4 v6, 0x5

    .line 233
    aput v1, v10, v6

    sub-float v1, v9, v4

    mul-float v1, v1, p10

    const/16 v6, 0x9

    .line 234
    aput v1, v10, v6

    const/16 v1, 0xd

    .line 235
    aput p2, v10, v1

    sub-float/2addr v8, v5

    mul-float v1, p8, v8

    const/4 v5, 0x2

    .line 237
    aput v1, v10, v5

    add-float/2addr v9, v4

    mul-float v1, p9, v9

    const/4 v4, 0x6

    .line 238
    aput v1, v10, v4

    add-float/2addr v2, v3

    sub-float v1, v12, v2

    mul-float v1, v1, p10

    const/16 v2, 0xa

    .line 239
    aput v1, v10, v2

    const/16 v1, 0xe

    .line 240
    aput p3, v10, v1

    const/4 v1, 0x0

    const/4 v2, 0x3

    .line 242
    aput v1, v10, v2

    const/4 v2, 0x7

    .line 243
    aput v1, v10, v2

    const/16 v2, 0xb

    .line 244
    aput v1, v10, v2

    const/16 v1, 0xf

    .line 245
    aput v12, v10, v1

    return-object v0
.end method

.method public set(Lcom/badlogic/gdx/math/Affine2;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 5

    .line 1006
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 1007
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m10:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 1008
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    const/4 v2, 0x2

    aput v1, v0, v2

    const/4 v2, 0x3

    .line 1009
    aput v1, v0, v2

    .line 1010
    iget v2, p1, Lcom/badlogic/gdx/math/Affine2;->m01:F

    const/4 v3, 0x4

    aput v2, v0, v3

    .line 1011
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v2, p1, Lcom/badlogic/gdx/math/Affine2;->m11:F

    const/4 v3, 0x5

    aput v2, v0, v3

    .line 1012
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x6

    aput v1, v0, v2

    const/4 v2, 0x7

    .line 1013
    aput v1, v0, v2

    const/16 v2, 0x8

    .line 1014
    aput v1, v0, v2

    const/16 v2, 0x9

    .line 1015
    aput v1, v0, v2

    const/high16 v2, 0x3f800000    # 1.0f

    const/16 v3, 0xa

    .line 1016
    aput v2, v0, v3

    const/16 v3, 0xb

    .line 1017
    aput v1, v0, v3

    .line 1018
    iget v3, p1, Lcom/badlogic/gdx/math/Affine2;->m02:F

    const/16 v4, 0xc

    aput v3, v0, v4

    .line 1019
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p1, p1, Lcom/badlogic/gdx/math/Affine2;->m12:F

    const/16 v3, 0xd

    aput p1, v0, v3

    .line 1020
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v0, 0xe

    aput v1, p1, v0

    const/16 v0, 0xf

    .line 1021
    aput v2, p1, v0

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/Matrix3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 7

    .line 976
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    aput v1, v0, v2

    .line 977
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v2, 0x1

    aget v1, v1, v2

    aput v1, v0, v2

    .line 978
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    const/4 v2, 0x2

    aget v1, v1, v2

    aput v1, v0, v2

    .line 979
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x3

    const/4 v2, 0x0

    aput v2, v0, v1

    .line 980
    iget-object v3, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    aget v1, v3, v1

    const/4 v3, 0x4

    aput v1, v0, v3

    .line 981
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    aget v1, v1, v3

    const/4 v3, 0x5

    aput v1, v0, v3

    .line 982
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v1, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    aget v1, v1, v3

    const/4 v3, 0x6

    aput v1, v0, v3

    .line 983
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x7

    aput v2, v0, v1

    const/16 v4, 0x8

    .line 984
    aput v2, v0, v4

    const/16 v5, 0x9

    .line 985
    aput v2, v0, v5

    const/16 v5, 0xa

    const/high16 v6, 0x3f800000    # 1.0f

    .line 986
    aput v6, v0, v5

    const/16 v5, 0xb

    .line 987
    aput v2, v0, v5

    .line 988
    iget-object v5, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    aget v3, v5, v3

    const/16 v5, 0xc

    aput v3, v0, v5

    .line 989
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object v3, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    aget v1, v3, v1

    const/16 v3, 0xd

    aput v1, v0, v3

    .line 990
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xe

    aput v2, v0, v1

    .line 991
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix3;->val:[F

    aget p1, p1, v4

    const/16 v1, 0xf

    aput p1, v0, v1

    return-object p0
.end method

.method public set(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 0

    .line 117
    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set([F)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 136
    iget v0, p1, Lcom/badlogic/gdx/math/Quaternion;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Quaternion;->y:F

    iget v2, p1, Lcom/badlogic/gdx/math/Quaternion;->z:F

    iget p1, p1, Lcom/badlogic/gdx/math/Quaternion;->w:F

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(FFFF)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 8

    .line 155
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v4, p2, Lcom/badlogic/gdx/math/Quaternion;->x:F

    iget v5, p2, Lcom/badlogic/gdx/math/Quaternion;->y:F

    iget v6, p2, Lcom/badlogic/gdx/math/Quaternion;->z:F

    iget v7, p2, Lcom/badlogic/gdx/math/Quaternion;->w:F

    move-object v0, p0

    invoke-virtual/range {v0 .. v7}, Lcom/badlogic/gdx/math/Matrix4;->set(FFFFFFF)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Quaternion;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 11

    .line 203
    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v2, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    iget v4, p2, Lcom/badlogic/gdx/math/Quaternion;->x:F

    iget v5, p2, Lcom/badlogic/gdx/math/Quaternion;->y:F

    iget v6, p2, Lcom/badlogic/gdx/math/Quaternion;->z:F

    iget v7, p2, Lcom/badlogic/gdx/math/Quaternion;->w:F

    iget v8, p3, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v9, p3, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget v10, p3, Lcom/badlogic/gdx/math/Vector3;->z:F

    move-object v0, p0

    invoke-virtual/range {v0 .. v10}, Lcom/badlogic/gdx/math/Matrix4;->set(FFFFFFFFFF)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 257
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 258
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v2, 0x4

    aput v1, v0, v2

    .line 259
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v1, 0x8

    aput p1, v0, v1

    .line 260
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v0, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x1

    aput v0, p1, v1

    .line 261
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v0, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v1, 0x5

    aput v0, p1, v1

    .line 262
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v0, 0x9

    aput p2, p1, v0

    .line 263
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p2, p3, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v0, 0x2

    aput p2, p1, v0

    .line 264
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p2, p3, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v0, 0x6

    aput p2, p1, v0

    .line 265
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p2, p3, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 p3, 0xa

    aput p2, p1, p3

    .line 266
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p2, p4, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/16 p3, 0xc

    aput p2, p1, p3

    .line 267
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p2, p4, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/16 p3, 0xd

    aput p2, p1, p3

    .line 268
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p2, p4, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 p3, 0xe

    aput p2, p1, p3

    .line 269
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 p2, 0x0

    const/4 p3, 0x3

    aput p2, p1, p3

    const/4 p3, 0x7

    .line 270
    aput p2, p1, p3

    const/16 p3, 0xb

    .line 271
    aput p2, p1, p3

    const/16 p2, 0xf

    const/high16 p3, 0x3f800000    # 1.0f

    .line 272
    aput p3, p1, p2

    return-object p0
.end method

.method public set([F)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 127
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    array-length v1, v0

    const/4 v2, 0x0

    invoke-static {p1, v2, v0, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-object p0
.end method

.method public setAsAffine(Lcom/badlogic/gdx/math/Affine2;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 1037
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m00:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 1038
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m10:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 1039
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m01:F

    const/4 v2, 0x4

    aput v1, v0, v2

    .line 1040
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m11:F

    const/4 v2, 0x5

    aput v1, v0, v2

    .line 1041
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Affine2;->m02:F

    const/16 v2, 0xc

    aput v1, v0, v2

    .line 1042
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p1, p1, Lcom/badlogic/gdx/math/Affine2;->m12:F

    const/16 v1, 0xd

    aput p1, v0, v1

    return-object p0
.end method

.method public setAsAffine(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 1057
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget-object p1, p1, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    aget v2, p1, v1

    aput v2, v0, v1

    const/4 v1, 0x1

    .line 1058
    aget v2, p1, v1

    aput v2, v0, v1

    const/4 v1, 0x4

    .line 1059
    aget v2, p1, v1

    aput v2, v0, v1

    const/4 v1, 0x5

    .line 1060
    aget v2, p1, v1

    aput v2, v0, v1

    const/16 v1, 0xc

    .line 1061
    aget v2, p1, v1

    aput v2, v0, v1

    const/16 v1, 0xd

    .line 1062
    aget p1, p1, v1

    aput p1, v0, v1

    return-object p0
.end method

.method public setFromEulerAngles(FFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 786
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Quaternion;->setEulerAngles(FFF)Lcom/badlogic/gdx/math/Quaternion;

    .line 787
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public setFromEulerAnglesRad(FFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 796
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2, p3}, Lcom/badlogic/gdx/math/Quaternion;->setEulerAnglesRad(FFF)Lcom/badlogic/gdx/math/Quaternion;

    .line 797
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public setToLookAt(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 837
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->l_vez:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 838
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->l_vex:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 839
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->l_vex:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 840
    sget-object p1, Lcom/badlogic/gdx/math/Matrix4;->l_vey:Lcom/badlogic/gdx/math/Vector3;

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vex:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vez:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p1

    invoke-virtual {p1}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 841
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    .line 842
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vex:Lcom/badlogic/gdx/math/Vector3;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v0, 0x0

    aput p2, p1, v0

    .line 843
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vex:Lcom/badlogic/gdx/math/Vector3;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v0, 0x4

    aput p2, p1, v0

    .line 844
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vex:Lcom/badlogic/gdx/math/Vector3;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v0, 0x8

    aput p2, p1, v0

    .line 845
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vey:Lcom/badlogic/gdx/math/Vector3;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v0, 0x1

    aput p2, p1, v0

    .line 846
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vey:Lcom/badlogic/gdx/math/Vector3;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v0, 0x5

    aput p2, p1, v0

    .line 847
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vey:Lcom/badlogic/gdx/math/Vector3;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v0, 0x9

    aput p2, p1, v0

    .line 848
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vez:Lcom/badlogic/gdx/math/Vector3;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float p2, p2

    const/4 v0, 0x2

    aput p2, p1, v0

    .line 849
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vez:Lcom/badlogic/gdx/math/Vector3;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float p2, p2

    const/4 v0, 0x6

    aput p2, p1, v0

    .line 850
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->l_vez:Lcom/badlogic/gdx/math/Vector3;

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float p2, p2

    const/16 v0, 0xa

    aput p2, p1, v0

    return-object p0
.end method

.method public setToLookAt(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 865
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/badlogic/gdx/math/Vector3;->sub(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    .line 866
    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->tmpVec:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p0, p2, p3}, Lcom/badlogic/gdx/math/Matrix4;->setToLookAt(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    .line 867
    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->tmpMat:Lcom/badlogic/gdx/math/Matrix4;

    iget p3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    neg-float p3, p3

    iget v0, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    neg-float v0, v0

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    neg-float p1, p1

    invoke-virtual {p2, p3, v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->setToTranslation(FFF)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->mul(Lcom/badlogic/gdx/math/Matrix4;)Lcom/badlogic/gdx/math/Matrix4;

    return-object p0
.end method

.method public setToOrtho(FFFFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 6

    .line 581
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    sub-float v0, p2, p1

    const/high16 v1, 0x40000000    # 2.0f

    div-float v2, v1, v0

    sub-float v3, p4, p3

    div-float/2addr v1, v3

    sub-float v4, p6, p5

    const/high16 v5, -0x40000000    # -2.0f

    div-float/2addr v5, v4

    add-float/2addr p2, p1

    neg-float p1, p2

    div-float/2addr p1, v0

    add-float/2addr p4, p3

    neg-float p2, p4

    div-float/2addr p2, v3

    add-float/2addr p6, p5

    neg-float p3, p6

    div-float/2addr p3, v4

    .line 590
    iget-object p4, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 p5, 0x0

    aput v2, p4, p5

    const/4 p5, 0x0

    const/4 p6, 0x1

    .line 591
    aput p5, p4, p6

    const/4 p6, 0x2

    .line 592
    aput p5, p4, p6

    const/4 p6, 0x3

    .line 593
    aput p5, p4, p6

    const/4 p6, 0x4

    .line 594
    aput p5, p4, p6

    const/4 p6, 0x5

    .line 595
    aput v1, p4, p6

    const/4 p6, 0x6

    .line 596
    aput p5, p4, p6

    const/4 p6, 0x7

    .line 597
    aput p5, p4, p6

    const/16 p6, 0x8

    .line 598
    aput p5, p4, p6

    const/16 p6, 0x9

    .line 599
    aput p5, p4, p6

    const/16 p6, 0xa

    .line 600
    aput v5, p4, p6

    const/16 p6, 0xb

    .line 601
    aput p5, p4, p6

    const/16 p5, 0xc

    .line 602
    aput p1, p4, p5

    const/16 p1, 0xd

    .line 603
    aput p2, p4, p1

    const/16 p1, 0xe

    .line 604
    aput p3, p4, p1

    const/16 p1, 0xf

    const/high16 p2, 0x3f800000    # 1.0f

    .line 605
    aput p2, p4, p1

    return-object p0
.end method

.method public setToOrtho2D(FFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 7

    add-float v2, p1, p3

    add-float v4, p2, p4

    const/4 v5, 0x0

    const/high16 v6, 0x3f800000    # 1.0f

    move-object v0, p0

    move v1, p1

    move v3, p2

    .line 550
    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/math/Matrix4;->setToOrtho(FFFFFF)Lcom/badlogic/gdx/math/Matrix4;

    return-object p0
.end method

.method public setToOrtho2D(FFFFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 7

    add-float v2, p1, p3

    add-float v4, p2, p4

    move-object v0, p0

    move v1, p1

    move v3, p2

    move v5, p5

    move v6, p6

    .line 565
    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/math/Matrix4;->setToOrtho(FFFFFF)Lcom/badlogic/gdx/math/Matrix4;

    return-object p0
.end method

.method public setToProjection(FFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 4

    .line 479
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    float-to-double v0, p3

    const-wide v2, 0x3f91df46a2529d39L    # 0.017453292519943295

    .line 480
    invoke-static {v0, v1}, Ljava/lang/Double;->isNaN(D)Z

    mul-double v0, v0, v2

    const-wide/high16 v2, 0x4000000000000000L    # 2.0

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->tan(D)D

    move-result-wide v0

    const-wide/high16 v2, 0x3ff0000000000000L    # 1.0

    div-double/2addr v2, v0

    double-to-float p3, v2

    add-float v0, p2, p1

    sub-float v1, p1, p2

    div-float/2addr v0, v1

    const/high16 v2, 0x40000000    # 2.0f

    mul-float p2, p2, v2

    mul-float p2, p2, p1

    div-float/2addr p2, v1

    .line 483
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    div-float p4, p3, p4

    const/4 v1, 0x0

    aput p4, p1, v1

    const/4 p4, 0x0

    const/4 v1, 0x1

    .line 484
    aput p4, p1, v1

    const/4 v1, 0x2

    .line 485
    aput p4, p1, v1

    const/4 v1, 0x3

    .line 486
    aput p4, p1, v1

    const/4 v1, 0x4

    .line 487
    aput p4, p1, v1

    const/4 v1, 0x5

    .line 488
    aput p3, p1, v1

    const/4 p3, 0x6

    .line 489
    aput p4, p1, p3

    const/4 p3, 0x7

    .line 490
    aput p4, p1, p3

    const/16 p3, 0x8

    .line 491
    aput p4, p1, p3

    const/16 p3, 0x9

    .line 492
    aput p4, p1, p3

    const/16 p3, 0xa

    .line 493
    aput v0, p1, p3

    const/16 p3, 0xb

    const/high16 v0, -0x40800000    # -1.0f

    .line 494
    aput v0, p1, p3

    const/16 p3, 0xc

    .line 495
    aput p4, p1, p3

    const/16 p3, 0xd

    .line 496
    aput p4, p1, p3

    const/16 p3, 0xe

    .line 497
    aput p2, p1, p3

    const/16 p2, 0xf

    .line 498
    aput p4, p1, p2

    return-object p0
.end method

.method public setToProjection(FFFFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 5

    const/high16 v0, 0x40000000    # 2.0f

    mul-float v1, p5, v0

    sub-float v2, p2, p1

    div-float v3, v1, v2

    sub-float v4, p4, p3

    div-float/2addr v1, v4

    add-float/2addr p2, p1

    div-float/2addr p2, v2

    add-float/2addr p4, p3

    div-float/2addr p4, v4

    add-float p1, p6, p5

    sub-float p3, p5, p6

    div-float/2addr p1, p3

    mul-float p6, p6, v0

    mul-float p6, p6, p5

    div-float/2addr p6, p3

    .line 521
    iget-object p3, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 p5, 0x0

    aput v3, p3, p5

    const/4 p5, 0x0

    const/4 v0, 0x1

    .line 522
    aput p5, p3, v0

    const/4 v0, 0x2

    .line 523
    aput p5, p3, v0

    const/4 v0, 0x3

    .line 524
    aput p5, p3, v0

    const/4 v0, 0x4

    .line 525
    aput p5, p3, v0

    const/4 v0, 0x5

    .line 526
    aput v1, p3, v0

    const/4 v0, 0x6

    .line 527
    aput p5, p3, v0

    const/4 v0, 0x7

    .line 528
    aput p5, p3, v0

    const/16 v0, 0x8

    .line 529
    aput p2, p3, v0

    const/16 p2, 0x9

    .line 530
    aput p4, p3, p2

    const/16 p2, 0xa

    .line 531
    aput p1, p3, p2

    const/16 p1, 0xb

    const/high16 p2, -0x40800000    # -1.0f

    .line 532
    aput p2, p3, p1

    const/16 p1, 0xc

    .line 533
    aput p5, p3, p1

    const/16 p1, 0xd

    .line 534
    aput p5, p3, p1

    const/16 p1, 0xe

    .line 535
    aput p6, p3, p1

    const/16 p1, 0xf

    .line 536
    aput p5, p3, p1

    return-object p0
.end method

.method public setToRotation(FFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p4, v0

    if-nez v0, :cond_0

    .line 739
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    return-object p0

    .line 742
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Quaternion;->setFromAxis(FFFF)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public setToRotation(FFFFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 7

    .line 777
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Lcom/badlogic/gdx/math/Quaternion;->setFromCross(FFFFFF)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public setToRotation(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    .line 711
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    return-object p0

    .line 714
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Quaternion;->set(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public setToRotation(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    .line 765
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Quaternion;->setFromCross(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public setToRotationRad(FFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p4, v0

    if-nez v0, :cond_0

    .line 754
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    return-object p0

    .line 757
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/badlogic/gdx/math/Quaternion;->setFromAxisRad(FFFF)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public setToRotationRad(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Matrix4;
    .locals 1

    const/4 v0, 0x0

    cmpl-float v0, p2, v0

    if-nez v0, :cond_0

    .line 724
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    return-object p0

    .line 727
    :cond_0
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->quat:Lcom/badlogic/gdx/math/Quaternion;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/math/Quaternion;->setFromAxisRad(Lcom/badlogic/gdx/math/Vector3;F)Lcom/badlogic/gdx/math/Quaternion;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Quaternion;)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public setToScaling(FFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 2

    .line 819
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    .line 820
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 p1, 0x5

    .line 821
    aput p2, v0, p1

    const/16 p1, 0xa

    .line 822
    aput p3, v0, p1

    return-object p0
.end method

.method public setToScaling(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 805
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    .line 806
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 807
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v2, 0x5

    aput v1, v0, v2

    .line 808
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v1, 0xa

    aput p1, v0, v1

    return-object p0
.end method

.method public setToTranslation(FFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 2

    .line 655
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    .line 656
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xc

    aput p1, v0, v1

    const/16 p1, 0xd

    .line 657
    aput p2, v0, p1

    const/16 p1, 0xe

    .line 658
    aput p3, v0, p1

    return-object p0
.end method

.method public setToTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 640
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    .line 641
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/16 v2, 0xc

    aput v1, v0, v2

    .line 642
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/16 v2, 0xd

    aput v1, v0, v2

    .line 643
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v1, 0xe

    aput p1, v0, v1

    return-object p0
.end method

.method public setToTranslationAndScaling(FFFFFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 2

    .line 691
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    .line 692
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xc

    aput p1, v0, v1

    const/16 p1, 0xd

    .line 693
    aput p2, v0, p1

    const/16 p1, 0xe

    .line 694
    aput p3, v0, p1

    const/4 p1, 0x0

    .line 695
    aput p4, v0, p1

    const/4 p1, 0x5

    .line 696
    aput p5, v0, p1

    const/16 p1, 0xa

    .line 697
    aput p6, v0, p1

    return-object p0
.end method

.method public setToTranslationAndScaling(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 669
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->idt()Lcom/badlogic/gdx/math/Matrix4;

    .line 670
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/16 v2, 0xc

    aput v1, v0, v2

    .line 671
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/16 v2, 0xd

    aput v1, v0, v2

    .line 672
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v1, 0xe

    aput p1, v0, v1

    .line 673
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v0, p2, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/4 v1, 0x0

    aput v0, p1, v1

    .line 674
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v0, p2, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/4 v1, 0x5

    aput v0, p1, v1

    .line 675
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p2, p2, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v0, 0xa

    aput p2, p1, v0

    return-object p0
.end method

.method public setToWorld(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 2

    .line 877
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {v0, p2}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 878
    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->right:Lcom/badlogic/gdx/math/Vector3;

    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p2, p3}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 879
    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    sget-object p3, Lcom/badlogic/gdx/math/Matrix4;->right:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p2, p3}, Lcom/badlogic/gdx/math/Vector3;->set(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    sget-object p3, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    invoke-virtual {p2, p3}, Lcom/badlogic/gdx/math/Vector3;->crs(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Vector3;

    move-result-object p2

    invoke-virtual {p2}, Lcom/badlogic/gdx/math/Vector3;->nor()Lcom/badlogic/gdx/math/Vector3;

    .line 881
    sget-object p2, Lcom/badlogic/gdx/math/Matrix4;->right:Lcom/badlogic/gdx/math/Vector3;

    sget-object p3, Lcom/badlogic/gdx/math/Matrix4;->tmpUp:Lcom/badlogic/gdx/math/Vector3;

    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmpForward:Lcom/badlogic/gdx/math/Vector3;

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/math/Vector3;->scl(F)Lcom/badlogic/gdx/math/Vector3;

    move-result-object v0

    invoke-virtual {p0, p2, p3, v0, p1}, Lcom/badlogic/gdx/math/Matrix4;->set(Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;

    return-object p0
.end method

.method public setTranslation(FFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 2

    .line 628
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xc

    aput p1, v0, v1

    const/16 p1, 0xd

    .line 629
    aput p2, v0, p1

    const/16 p1, 0xe

    .line 630
    aput p3, v0, p1

    return-object p0
.end method

.method public setTranslation(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 615
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    const/16 v2, 0xc

    aput v1, v0, v2

    .line 616
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    const/16 v2, 0xd

    aput v1, v0, v2

    .line 617
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    const/16 v1, 0xe

    aput p1, v0, v1

    return-object p0
.end method

.method public toNormalMatrix()Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 1150
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v1, 0x0

    const/16 v2, 0xc

    aput v1, v0, v2

    const/16 v2, 0xd

    .line 1151
    aput v1, v0, v2

    const/16 v2, 0xe

    .line 1152
    aput v1, v0, v2

    .line 1153
    invoke-virtual {p0}, Lcom/badlogic/gdx/math/Matrix4;->inv()Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v0

    invoke-virtual {v0}, Lcom/badlogic/gdx/math/Matrix4;->tra()Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 886
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x0

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v3, 0x4

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v3, 0x8

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v3, 0xc

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v2, "]\n["

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v4, 0x1

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v4, 0x5

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v4, 0x9

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v4, 0xd

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v4, 0x2

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v4, 0x6

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v4, 0xa

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v4, 0xe

    aget v3, v3, v4

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v3, 0x3

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v3, 0x7

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v3, 0xb

    aget v2, v2, v3

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v2, 0xf

    aget v1, v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, "]\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public tra()Lcom/badlogic/gdx/math/Matrix4;
    .locals 11

    .line 341
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmp:[F

    iget-object v1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/4 v2, 0x0

    aget v3, v1, v2

    aput v3, v0, v2

    const/4 v2, 0x1

    .line 342
    aget v3, v1, v2

    const/4 v4, 0x4

    aput v3, v0, v4

    const/4 v3, 0x2

    .line 343
    aget v5, v1, v3

    const/16 v6, 0x8

    aput v5, v0, v6

    const/4 v5, 0x3

    .line 344
    aget v7, v1, v5

    const/16 v8, 0xc

    aput v7, v0, v8

    .line 345
    aget v4, v1, v4

    aput v4, v0, v2

    const/4 v2, 0x5

    .line 346
    aget v4, v1, v2

    aput v4, v0, v2

    const/4 v2, 0x6

    .line 347
    aget v4, v1, v2

    const/16 v7, 0x9

    aput v4, v0, v7

    const/4 v4, 0x7

    .line 348
    aget v9, v1, v4

    const/16 v10, 0xd

    aput v9, v0, v10

    .line 349
    aget v6, v1, v6

    aput v6, v0, v3

    .line 350
    aget v3, v1, v7

    aput v3, v0, v2

    const/16 v2, 0xa

    .line 351
    aget v3, v1, v2

    aput v3, v0, v2

    const/16 v2, 0xb

    .line 352
    aget v3, v1, v2

    const/16 v6, 0xe

    aput v3, v0, v6

    .line 353
    aget v3, v1, v8

    aput v3, v0, v5

    .line 354
    aget v3, v1, v10

    aput v3, v0, v4

    .line 355
    aget v3, v1, v6

    aput v3, v0, v2

    const/16 v2, 0xf

    .line 356
    aget v1, v1, v2

    aput v1, v0, v2

    .line 357
    invoke-virtual {p0, v0}, Lcom/badlogic/gdx/math/Matrix4;->set([F)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object v0

    return-object v0
.end method

.method public translate(FFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 4

    .line 1426
    sget-object v0, Lcom/badlogic/gdx/math/Matrix4;->tmp:[F

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    aput v1, v0, v2

    const/4 v2, 0x0

    const/4 v3, 0x4

    .line 1427
    aput v2, v0, v3

    const/16 v3, 0x8

    .line 1428
    aput v2, v0, v3

    const/16 v3, 0xc

    .line 1429
    aput p1, v0, v3

    const/4 p1, 0x1

    .line 1430
    aput v2, v0, p1

    const/4 p1, 0x5

    .line 1431
    aput v1, v0, p1

    const/16 p1, 0x9

    .line 1432
    aput v2, v0, p1

    const/16 p1, 0xd

    .line 1433
    aput p2, v0, p1

    const/4 p1, 0x2

    .line 1434
    aput v2, v0, p1

    const/4 p1, 0x6

    .line 1435
    aput v2, v0, p1

    const/16 p1, 0xa

    .line 1436
    aput v1, v0, p1

    const/16 p1, 0xe

    .line 1437
    aput p3, v0, p1

    const/4 p1, 0x3

    .line 1438
    aput v2, v0, p1

    const/4 p1, 0x7

    .line 1439
    aput v2, v0, p1

    const/16 p1, 0xb

    .line 1440
    aput v2, v0, p1

    const/16 p1, 0xf

    .line 1441
    aput v1, v0, p1

    .line 1443
    iget-object p1, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    invoke-static {p1, v0}, Lcom/badlogic/gdx/math/Matrix4;->mul([F[F)V

    return-object p0
.end method

.method public translate(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 2

    .line 1416
    iget v0, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    iget v1, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    invoke-virtual {p0, v0, v1, p1}, Lcom/badlogic/gdx/math/Matrix4;->translate(FFF)Lcom/badlogic/gdx/math/Matrix4;

    move-result-object p1

    return-object p1
.end method

.method public trn(FFF)Lcom/badlogic/gdx/math/Matrix4;
    .locals 3

    .line 299
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xc

    aget v2, v0, v1

    add-float/2addr v2, p1

    aput v2, v0, v1

    const/16 p1, 0xd

    .line 300
    aget v1, v0, p1

    add-float/2addr v1, p2

    aput v1, v0, p1

    const/16 p1, 0xe

    .line 301
    aget p2, v0, p1

    add-float/2addr p2, p3

    aput p2, v0, p1

    return-object p0
.end method

.method public trn(Lcom/badlogic/gdx/math/Vector3;)Lcom/badlogic/gdx/math/Matrix4;
    .locals 4

    .line 286
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xc

    aget v2, v0, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->x:F

    add-float/2addr v2, v3

    aput v2, v0, v1

    .line 287
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xd

    aget v2, v0, v1

    iget v3, p1, Lcom/badlogic/gdx/math/Vector3;->y:F

    add-float/2addr v2, v3

    aput v2, v0, v1

    .line 288
    iget-object v0, p0, Lcom/badlogic/gdx/math/Matrix4;->val:[F

    const/16 v1, 0xe

    aget v2, v0, v1

    iget p1, p1, Lcom/badlogic/gdx/math/Vector3;->z:F

    add-float/2addr v2, p1

    aput v2, v0, v1

    return-object p0
.end method
