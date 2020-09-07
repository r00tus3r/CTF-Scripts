.class public final Lcom/badlogic/gdx/physics/box2d/World;
.super Ljava/lang/Object;
.source "World.java"

# interfaces
.implements Lcom/badlogic/gdx/utils/Disposable;


# instance fields
.field protected final addr:J

.field protected final bodies:Lcom/badlogic/gdx/utils/LongMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/LongMap<",
            "Lcom/badlogic/gdx/physics/box2d/Body;",
            ">;"
        }
    .end annotation
.end field

.field private final contact:Lcom/badlogic/gdx/physics/box2d/Contact;

.field private contactAddrs:[J

.field protected contactFilter:Lcom/badlogic/gdx/physics/box2d/ContactFilter;

.field protected contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

.field private final contacts:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/physics/box2d/Contact;",
            ">;"
        }
    .end annotation
.end field

.field protected final fixtures:Lcom/badlogic/gdx/utils/LongMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/LongMap<",
            "Lcom/badlogic/gdx/physics/box2d/Fixture;",
            ">;"
        }
    .end annotation
.end field

.field protected final freeBodies:Lcom/badlogic/gdx/utils/Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/physics/box2d/Body;",
            ">;"
        }
    .end annotation
.end field

.field private final freeContacts:Lcom/badlogic/gdx/utils/Array;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/physics/box2d/Contact;",
            ">;"
        }
    .end annotation
.end field

.field protected final freeFixtures:Lcom/badlogic/gdx/utils/Pool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/Pool<",
            "Lcom/badlogic/gdx/physics/box2d/Fixture;",
            ">;"
        }
    .end annotation
.end field

.field final gravity:Lcom/badlogic/gdx/math/Vector2;

.field private final impulse:Lcom/badlogic/gdx/physics/box2d/ContactImpulse;

.field protected final joints:Lcom/badlogic/gdx/utils/LongMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/badlogic/gdx/utils/LongMap<",
            "Lcom/badlogic/gdx/physics/box2d/Joint;",
            ">;"
        }
    .end annotation
.end field

.field private final manifold:Lcom/badlogic/gdx/physics/box2d/Manifold;

.field private queryCallback:Lcom/badlogic/gdx/physics/box2d/QueryCallback;

.field private rayCastCallback:Lcom/badlogic/gdx/physics/box2d/RayCastCallback;

.field private rayNormal:Lcom/badlogic/gdx/math/Vector2;

.field private rayPoint:Lcom/badlogic/gdx/math/Vector2;

.field final tmpGravity:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 187
    new-instance v0, Lcom/badlogic/gdx/utils/SharedLibraryLoader;

    invoke-direct {v0}, Lcom/badlogic/gdx/utils/SharedLibraryLoader;-><init>()V

    const-string v1, "gdx-box2d"

    invoke-virtual {v0, v1}, Lcom/badlogic/gdx/utils/SharedLibraryLoader;->load(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lcom/badlogic/gdx/math/Vector2;Z)V
    .locals 4

    .line 227
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 191
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/World$1;

    const/16 v1, 0xc8

    const/16 v2, 0x64

    invoke-direct {v0, p0, v2, v1}, Lcom/badlogic/gdx/physics/box2d/World$1;-><init>(Lcom/badlogic/gdx/physics/box2d/World;II)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeBodies:Lcom/badlogic/gdx/utils/Pool;

    .line 199
    new-instance v0, Lcom/badlogic/gdx/physics/box2d/World$2;

    invoke-direct {v0, p0, v2, v1}, Lcom/badlogic/gdx/physics/box2d/World$2;-><init>(Lcom/badlogic/gdx/physics/box2d/World;II)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeFixtures:Lcom/badlogic/gdx/utils/Pool;

    .line 210
    new-instance v0, Lcom/badlogic/gdx/utils/LongMap;

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/utils/LongMap;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->bodies:Lcom/badlogic/gdx/utils/LongMap;

    .line 213
    new-instance v0, Lcom/badlogic/gdx/utils/LongMap;

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/utils/LongMap;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    .line 216
    new-instance v0, Lcom/badlogic/gdx/utils/LongMap;

    invoke-direct {v0, v2}, Lcom/badlogic/gdx/utils/LongMap;-><init>(I)V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->joints:Lcom/badlogic/gdx/utils/LongMap;

    const/4 v0, 0x0

    .line 219
    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactFilter:Lcom/badlogic/gdx/physics/box2d/ContactFilter;

    .line 222
    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    const/4 v2, 0x2

    .line 793
    new-array v2, v2, [F

    iput-object v2, p0, Lcom/badlogic/gdx/physics/box2d/World;->tmpGravity:[F

    .line 794
    new-instance v2, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v2}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v2, p0, Lcom/badlogic/gdx/physics/box2d/World;->gravity:Lcom/badlogic/gdx/math/Vector2;

    .line 851
    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->queryCallback:Lcom/badlogic/gdx/physics/box2d/QueryCallback;

    .line 878
    new-array v1, v1, [J

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    .line 879
    new-instance v1, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v1}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contacts:Lcom/badlogic/gdx/utils/Array;

    .line 880
    new-instance v1, Lcom/badlogic/gdx/utils/Array;

    invoke-direct {v1}, Lcom/badlogic/gdx/utils/Array;-><init>()V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Lcom/badlogic/gdx/utils/Array;

    .line 979
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/Contact;

    const-wide/16 v2, 0x0

    invoke-direct {v1, p0, v2, v3}, Lcom/badlogic/gdx/physics/box2d/Contact;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    .line 980
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/Manifold;

    invoke-direct {v1, v2, v3}, Lcom/badlogic/gdx/physics/box2d/Manifold;-><init>(J)V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->manifold:Lcom/badlogic/gdx/physics/box2d/Manifold;

    .line 981
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;

    invoke-direct {v1, p0, v2, v3}, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    iput-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->impulse:Lcom/badlogic/gdx/physics/box2d/ContactImpulse;

    .line 1042
    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->rayCastCallback:Lcom/badlogic/gdx/physics/box2d/RayCastCallback;

    .line 1050
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->rayPoint:Lcom/badlogic/gdx/math/Vector2;

    .line 1051
    new-instance v0, Lcom/badlogic/gdx/math/Vector2;

    invoke-direct {v0}, Lcom/badlogic/gdx/math/Vector2;-><init>()V

    iput-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->rayNormal:Lcom/badlogic/gdx/math/Vector2;

    .line 228
    iget v0, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-direct {p0, v0, p1, p2}, Lcom/badlogic/gdx/physics/box2d/World;->newWorld(FFZ)J

    move-result-wide p1

    iput-wide p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    .line 230
    iget-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contacts:Lcom/badlogic/gdx/utils/Array;

    iget-object p2, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    array-length p2, p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 231
    iget-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Lcom/badlogic/gdx/utils/Array;

    iget-object p2, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    array-length p2, p2

    invoke-virtual {p1, p2}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    const/4 p1, 0x0

    .line 233
    :goto_0
    iget-object p2, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    array-length p2, p2

    if-ge p1, p2, :cond_0

    .line 234
    iget-object p2, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Lcom/badlogic/gdx/utils/Array;

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/Contact;

    invoke-direct {v0, p0, v2, v3}, Lcom/badlogic/gdx/physics/box2d/Contact;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    invoke-virtual {p2, v0}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private beginContact(J)V
    .locals 1

    .line 984
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    iput-wide p1, v0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    .line 985
    iget-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    if-eqz p1, :cond_0

    invoke-interface {p1, v0}, Lcom/badlogic/gdx/physics/box2d/ContactListener;->beginContact(Lcom/badlogic/gdx/physics/box2d/Contact;)V

    :cond_0
    return-void
.end method

.method private contactFilter(JJ)Z
    .locals 2

    .line 964
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactFilter:Lcom/badlogic/gdx/physics/box2d/ContactFilter;

    if-eqz v0, :cond_0

    .line 965
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/physics/box2d/Fixture;

    iget-object p2, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {p2, p3, p4}, Lcom/badlogic/gdx/utils/LongMap;->get(J)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/physics/box2d/Fixture;

    invoke-interface {v0, p1, p2}, Lcom/badlogic/gdx/physics/box2d/ContactFilter;->shouldCollide(Lcom/badlogic/gdx/physics/box2d/Fixture;Lcom/badlogic/gdx/physics/box2d/Fixture;)Z

    move-result p1

    return p1

    .line 967
    :cond_0
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {v0, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/physics/box2d/Fixture;

    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Fixture;->getFilterData()Lcom/badlogic/gdx/physics/box2d/Filter;

    move-result-object p1

    .line 968
    iget-object p2, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {p2, p3, p4}, Lcom/badlogic/gdx/utils/LongMap;->get(J)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/badlogic/gdx/physics/box2d/Fixture;

    invoke-virtual {p2}, Lcom/badlogic/gdx/physics/box2d/Fixture;->getFilterData()Lcom/badlogic/gdx/physics/box2d/Filter;

    move-result-object p2

    .line 970
    iget-short p3, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    iget-short p4, p2, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p3, p4, :cond_2

    iget-short p3, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    if-eqz p3, :cond_2

    .line 971
    iget-short p1, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->groupIndex:S

    if-lez p1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 974
    :cond_2
    iget-short p3, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    iget-short p4, p2, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    and-int/2addr p3, p4

    if-eqz p3, :cond_3

    iget-short p1, p1, Lcom/badlogic/gdx/physics/box2d/Filter;->categoryBits:S

    iget-short p2, p2, Lcom/badlogic/gdx/physics/box2d/Filter;->maskBits:S

    and-int/2addr p1, p2

    if-eqz p1, :cond_3

    goto :goto_1

    :cond_3
    const/4 v0, 0x0

    :goto_1
    return v0
.end method

.method private createProperJoint(Lcom/badlogic/gdx/physics/box2d/JointDef;)J
    .locals 23

    move-object/from16 v15, p0

    move-object/from16 v0, p1

    .line 416
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->DistanceJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_0

    .line 417
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;

    .line 418
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v9, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->length:F

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->frequencyHz:F

    iget v14, v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJointDef;->dampingRatio:F

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v14}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateDistanceJoint(JJJZFFFFFFF)J

    move-result-wide v0

    return-wide v0

    .line 421
    :cond_0
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->FrictionJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_1

    .line 422
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;

    .line 423
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v9, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->maxForce:F

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJointDef;->maxTorque:F

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v13}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateFrictionJoint(JJJZFFFFFF)J

    move-result-wide v0

    return-wide v0

    .line 426
    :cond_1
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->GearJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_2

    .line 427
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;

    .line 428
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->joint1:Lcom/badlogic/gdx/physics/box2d/Joint;

    iget-wide v8, v8, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    iget-object v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->joint2:Lcom/badlogic/gdx/physics/box2d/Joint;

    iget-wide v10, v10, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    iget v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->ratio:F

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v12}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateGearJoint(JJJZJJF)J

    move-result-wide v0

    return-wide v0

    .line 430
    :cond_2
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->MotorJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_3

    .line 431
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJointDef;

    .line 432
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJointDef;->linearOffset:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v9, v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJointDef;->linearOffset:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJointDef;->angularOffset:F

    iget v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJointDef;->maxForce:F

    iget v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJointDef;->maxTorque:F

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJointDef;->correctionFactor:F

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v13}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateMotorJoint(JJJZFFFFFF)J

    move-result-wide v0

    return-wide v0

    .line 435
    :cond_3
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->MouseJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_4

    .line 436
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;

    .line 437
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->target:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v9, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->target:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->maxForce:F

    iget v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->frequencyHz:F

    iget v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJointDef;->dampingRatio:F

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v12}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateMouseJoint(JJJZFFFFF)J

    move-result-wide v0

    return-wide v0

    .line 440
    :cond_4
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PrismaticJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_5

    .line 441
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;

    .line 442
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v9, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v14, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->referenceAngle:F

    iget-boolean v15, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->enableLimit:Z

    move-wide/from16 v21, v1

    iget v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->lowerTranslation:F

    move/from16 v16, v1

    iget v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->upperTranslation:F

    move/from16 v17, v1

    iget-boolean v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->enableMotor:Z

    move/from16 v18, v1

    iget v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->maxMotorForce:F

    move/from16 v19, v1

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJointDef;->motorSpeed:F

    move/from16 v20, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v21

    invoke-direct/range {v0 .. v20}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreatePrismaticJoint(JJJZFFFFFFFZFFZFF)J

    move-result-wide v0

    return-wide v0

    .line 446
    :cond_5
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PulleyJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_6

    .line 447
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;

    move-object/from16 v15, p0

    .line 448
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v9, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->groundAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v14, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v14, v14, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v15, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v15, v15, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-wide/from16 v19, v1

    iget v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthA:F

    move/from16 v16, v1

    iget v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->lengthB:F

    move/from16 v17, v1

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJointDef;->ratio:F

    move/from16 v18, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v19

    invoke-direct/range {v0 .. v18}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreatePulleyJoint(JJJZFFFFFFFFFFF)J

    move-result-wide v0

    return-wide v0

    .line 453
    :cond_6
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->RevoluteJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_7

    .line 454
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;

    move-object/from16 v15, p0

    .line 455
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v9, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->referenceAngle:F

    iget-boolean v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->enableLimit:Z

    iget v14, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->lowerAngle:F

    iget v15, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->upperAngle:F

    move-wide/from16 v19, v1

    iget-boolean v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->enableMotor:Z

    move/from16 v16, v1

    iget v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->motorSpeed:F

    move/from16 v17, v1

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJointDef;->maxMotorTorque:F

    move/from16 v18, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v19

    invoke-direct/range {v0 .. v18}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateRevoluteJoint(JJJZFFFFFZFFZFF)J

    move-result-wide v0

    return-wide v0

    .line 459
    :cond_7
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->RopeJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_8

    .line 460
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJointDef;

    move-object/from16 v15, p0

    .line 461
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v9, v0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJointDef;->maxLength:F

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v12}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateRopeJoint(JJJZFFFFF)J

    move-result-wide v0

    return-wide v0

    :cond_8
    move-object/from16 v15, p0

    .line 464
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->WeldJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_9

    .line 465
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;

    .line 466
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v9, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->referenceAngle:F

    iget v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->frequencyHz:F

    iget v14, v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJointDef;->dampingRatio:F

    move-object/from16 v0, p0

    invoke-direct/range {v0 .. v14}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateWeldJoint(JJJZFFFFFFF)J

    move-result-wide v0

    return-wide v0

    .line 469
    :cond_9
    iget-object v1, v0, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->WheelJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_a

    .line 470
    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;

    .line 471
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-wide v5, v5, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-boolean v7, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->collideConnected:Z

    iget-object v8, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v9, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->localAnchorA:Lcom/badlogic/gdx/math/Vector2;

    iget v9, v9, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v10, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v10, v10, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v11, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->localAnchorB:Lcom/badlogic/gdx/math/Vector2;

    iget v11, v11, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-object v12, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    iget v12, v12, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v13, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->localAxisA:Lcom/badlogic/gdx/math/Vector2;

    iget v13, v13, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget-boolean v14, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->enableMotor:Z

    iget v15, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->maxMotorTorque:F

    move-wide/from16 v19, v1

    iget v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->motorSpeed:F

    move/from16 v16, v1

    iget v1, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->frequencyHz:F

    move/from16 v17, v1

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJointDef;->dampingRatio:F

    move/from16 v18, v0

    move-object/from16 v0, p0

    move-wide/from16 v1, v19

    invoke-direct/range {v0 .. v18}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateWheelJoint(JJJZFFFFFFZFFFF)J

    move-result-wide v0

    return-wide v0

    :cond_a
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private endContact(J)V
    .locals 1

    .line 989
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    iput-wide p1, v0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    .line 990
    iget-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    if-eqz p1, :cond_0

    invoke-interface {p1, v0}, Lcom/badlogic/gdx/physics/box2d/ContactListener;->endContact(Lcom/badlogic/gdx/physics/box2d/Contact;)V

    :cond_0
    return-void
.end method

.method public static native getVelocityThreshold()F
.end method

.method private native jniClearForces(J)V
.end method

.method private native jniCreateBody(JIFFFFFFFFZZZZZF)J
.end method

.method private native jniCreateDistanceJoint(JJJZFFFFFFF)J
.end method

.method private native jniCreateFrictionJoint(JJJZFFFFFF)J
.end method

.method private native jniCreateGearJoint(JJJZJJF)J
.end method

.method private native jniCreateMotorJoint(JJJZFFFFFF)J
.end method

.method private native jniCreateMouseJoint(JJJZFFFFF)J
.end method

.method private native jniCreatePrismaticJoint(JJJZFFFFFFFZFFZFF)J
.end method

.method private native jniCreatePulleyJoint(JJJZFFFFFFFFFFF)J
.end method

.method private native jniCreateRevoluteJoint(JJJZFFFFFZFFZFF)J
.end method

.method private native jniCreateRopeJoint(JJJZFFFFF)J
.end method

.method private native jniCreateWeldJoint(JJJZFFFFFFF)J
.end method

.method private native jniCreateWheelJoint(JJJZFFFFFFZFFFF)J
.end method

.method private native jniDeactivateBody(JJ)V
.end method

.method private native jniDestroyBody(JJ)V
.end method

.method private native jniDestroyFixture(JJJ)V
.end method

.method private native jniDestroyJoint(JJ)V
.end method

.method private native jniDispose(J)V
.end method

.method private native jniGetAutoClearForces(J)Z
.end method

.method private native jniGetBodyCount(J)I
.end method

.method private native jniGetContactCount(J)I
.end method

.method private native jniGetContactList(J[J)V
.end method

.method private native jniGetGravity(J[F)V
.end method

.method private native jniGetJointcount(J)I
.end method

.method private native jniGetProxyCount(J)I
.end method

.method private native jniIsLocked(J)Z
.end method

.method private native jniQueryAABB(JFFFF)V
.end method

.method private native jniRayCast(JFFFF)V
.end method

.method private native jniSetAutoClearForces(JZ)V
.end method

.method private native jniSetContiousPhysics(JZ)V
.end method

.method private native jniSetGravity(JFF)V
.end method

.method private native jniSetWarmStarting(JZ)V
.end method

.method private native jniStep(JFII)V
.end method

.method private native newWorld(FFZ)J
.end method

.method private postSolve(JJ)V
    .locals 1

    .line 1000
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    iput-wide p1, v0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    .line 1001
    iget-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->impulse:Lcom/badlogic/gdx/physics/box2d/ContactImpulse;

    iput-wide p3, p1, Lcom/badlogic/gdx/physics/box2d/ContactImpulse;->addr:J

    .line 1002
    iget-object p2, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    if-eqz p2, :cond_0

    invoke-interface {p2, v0, p1}, Lcom/badlogic/gdx/physics/box2d/ContactListener;->postSolve(Lcom/badlogic/gdx/physics/box2d/Contact;Lcom/badlogic/gdx/physics/box2d/ContactImpulse;)V

    :cond_0
    return-void
.end method

.method private preSolve(JJ)V
    .locals 1

    .line 994
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contact:Lcom/badlogic/gdx/physics/box2d/Contact;

    iput-wide p1, v0, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    .line 995
    iget-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->manifold:Lcom/badlogic/gdx/physics/box2d/Manifold;

    iput-wide p3, p1, Lcom/badlogic/gdx/physics/box2d/Manifold;->addr:J

    .line 996
    iget-object p2, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    if-eqz p2, :cond_0

    invoke-interface {p2, v0, p1}, Lcom/badlogic/gdx/physics/box2d/ContactListener;->preSolve(Lcom/badlogic/gdx/physics/box2d/Contact;Lcom/badlogic/gdx/physics/box2d/Manifold;)V

    :cond_0
    return-void
.end method

.method private reportFixture(J)Z
    .locals 2

    .line 1006
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->queryCallback:Lcom/badlogic/gdx/physics/box2d/QueryCallback;

    if-eqz v0, :cond_0

    .line 1007
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {v1, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/physics/box2d/Fixture;

    invoke-interface {v0, p1}, Lcom/badlogic/gdx/physics/box2d/QueryCallback;->reportFixture(Lcom/badlogic/gdx/physics/box2d/Fixture;)Z

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private reportRayFixture(JFFFFF)F
    .locals 2

    .line 1054
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->rayCastCallback:Lcom/badlogic/gdx/physics/box2d/RayCastCallback;

    if-eqz v0, :cond_0

    .line 1055
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->rayPoint:Lcom/badlogic/gdx/math/Vector2;

    iput p3, v1, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 1056
    iput p4, v1, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 1057
    iget-object p3, p0, Lcom/badlogic/gdx/physics/box2d/World;->rayNormal:Lcom/badlogic/gdx/math/Vector2;

    iput p5, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    .line 1058
    iput p6, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    .line 1059
    iget-object p3, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {p3, p1, p2}, Lcom/badlogic/gdx/utils/LongMap;->get(J)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/badlogic/gdx/physics/box2d/Fixture;

    iget-object p2, p0, Lcom/badlogic/gdx/physics/box2d/World;->rayPoint:Lcom/badlogic/gdx/math/Vector2;

    iget-object p3, p0, Lcom/badlogic/gdx/physics/box2d/World;->rayNormal:Lcom/badlogic/gdx/math/Vector2;

    invoke-interface {v0, p1, p2, p3, p7}, Lcom/badlogic/gdx/physics/box2d/RayCastCallback;->reportRayFixture(Lcom/badlogic/gdx/physics/box2d/Fixture;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;F)F

    move-result p1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method private native setUseDefaultContactFilter(Z)V
.end method

.method public static native setVelocityThreshold(F)V
.end method


# virtual methods
.method public QueryAABB(Lcom/badlogic/gdx/physics/box2d/QueryCallback;FFFF)V
    .locals 7

    .line 847
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->queryCallback:Lcom/badlogic/gdx/physics/box2d/QueryCallback;

    .line 848
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object v0, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/physics/box2d/World;->jniQueryAABB(JFFFF)V

    return-void
.end method

.method public clearForces()V
    .locals 2

    .line 709
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniClearForces(J)V

    return-void
.end method

.method public createBody(Lcom/badlogic/gdx/physics/box2d/BodyDef;)Lcom/badlogic/gdx/physics/box2d/Body;
    .locals 21

    move-object/from16 v15, p0

    move-object/from16 v14, p1

    move-object/from16 v0, p0

    .line 283
    iget-wide v1, v15, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v3, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->type:Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;

    invoke-virtual {v3}, Lcom/badlogic/gdx/physics/box2d/BodyDef$BodyType;->getValue()I

    move-result v3

    iget-object v4, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v4, v4, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v5, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->position:Lcom/badlogic/gdx/math/Vector2;

    iget v5, v5, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v6, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angle:F

    iget-object v7, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    iget v7, v7, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget-object v8, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->linearVelocity:Lcom/badlogic/gdx/math/Vector2;

    iget v8, v8, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v9, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angularVelocity:F

    iget v10, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->linearDamping:F

    iget v11, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->angularDamping:F

    iget-boolean v12, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->allowSleep:Z

    iget-boolean v13, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->awake:Z

    iget-boolean v15, v14, Lcom/badlogic/gdx/physics/box2d/BodyDef;->fixedRotation:Z

    move-object/from16 v18, v0

    move-object v0, v14

    move v14, v15

    iget-boolean v15, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->bullet:Z

    move-wide/from16 v19, v1

    iget-boolean v1, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->active:Z

    move/from16 v16, v1

    iget v0, v0, Lcom/badlogic/gdx/physics/box2d/BodyDef;->gravityScale:F

    move/from16 v17, v0

    move-object/from16 v0, v18

    move-wide/from16 v1, v19

    invoke-direct/range {v0 .. v17}, Lcom/badlogic/gdx/physics/box2d/World;->jniCreateBody(JIFFFFFFFFZZZZZF)J

    move-result-wide v0

    move-object/from16 v2, p0

    .line 286
    iget-object v3, v2, Lcom/badlogic/gdx/physics/box2d/World;->freeBodies:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v3}, Lcom/badlogic/gdx/utils/Pool;->obtain()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/physics/box2d/Body;

    .line 287
    invoke-virtual {v3, v0, v1}, Lcom/badlogic/gdx/physics/box2d/Body;->reset(J)V

    .line 288
    iget-object v0, v2, Lcom/badlogic/gdx/physics/box2d/World;->bodies:Lcom/badlogic/gdx/utils/LongMap;

    iget-wide v4, v3, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-virtual {v0, v4, v5, v3}, Lcom/badlogic/gdx/utils/LongMap;->put(JLjava/lang/Object;)Ljava/lang/Object;

    return-object v3
.end method

.method public createJoint(Lcom/badlogic/gdx/physics/box2d/JointDef;)Lcom/badlogic/gdx/physics/box2d/Joint;
    .locals 9

    .line 392
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->createProperJoint(Lcom/badlogic/gdx/physics/box2d/JointDef;)J

    move-result-wide v6

    .line 394
    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v1, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->DistanceJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v0, v1, :cond_0

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;

    invoke-direct {v0, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/joints/DistanceJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    .line 395
    :goto_0
    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->FrictionJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_1

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJoint;

    invoke-direct {v0, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/joints/FrictionJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 396
    :cond_1
    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->GearJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_2

    new-instance v8, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;

    move-object v0, p1

    check-cast v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;

    iget-object v4, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->joint1:Lcom/badlogic/gdx/physics/box2d/Joint;

    iget-object v5, v0, Lcom/badlogic/gdx/physics/box2d/joints/GearJointDef;->joint2:Lcom/badlogic/gdx/physics/box2d/Joint;

    move-object v0, v8

    move-object v1, p0

    move-wide v2, v6

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/joints/GearJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;JLcom/badlogic/gdx/physics/box2d/Joint;Lcom/badlogic/gdx/physics/box2d/Joint;)V

    .line 397
    :cond_2
    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->MotorJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_3

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;

    invoke-direct {v0, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/joints/MotorJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 398
    :cond_3
    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->MouseJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_4

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/MouseJoint;

    invoke-direct {v0, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/joints/MouseJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 399
    :cond_4
    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PrismaticJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_5

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;

    invoke-direct {v0, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/joints/PrismaticJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 400
    :cond_5
    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->PulleyJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_6

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;

    invoke-direct {v0, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/joints/PulleyJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 401
    :cond_6
    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->RevoluteJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_7

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;

    invoke-direct {v0, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/joints/RevoluteJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 402
    :cond_7
    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->RopeJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_8

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;

    invoke-direct {v0, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/joints/RopeJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 403
    :cond_8
    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->WeldJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_9

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/WeldJoint;

    invoke-direct {v0, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/joints/WeldJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    .line 404
    :cond_9
    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->type:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    sget-object v2, Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;->WheelJoint:Lcom/badlogic/gdx/physics/box2d/JointDef$JointType;

    if-ne v1, v2, :cond_a

    new-instance v0, Lcom/badlogic/gdx/physics/box2d/joints/WheelJoint;

    invoke-direct {v0, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/joints/WheelJoint;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    :cond_a
    if-eqz v0, :cond_b

    .line 405
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->joints:Lcom/badlogic/gdx/utils/LongMap;

    iget-wide v2, v0, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    invoke-virtual {v1, v2, v3, v0}, Lcom/badlogic/gdx/utils/LongMap;->put(JLjava/lang/Object;)Ljava/lang/Object;

    .line 406
    :cond_b
    new-instance v1, Lcom/badlogic/gdx/physics/box2d/JointEdge;

    iget-object v2, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-direct {v1, v2, v0}, Lcom/badlogic/gdx/physics/box2d/JointEdge;-><init>(Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/physics/box2d/Joint;)V

    .line 407
    new-instance v2, Lcom/badlogic/gdx/physics/box2d/JointEdge;

    iget-object v3, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    invoke-direct {v2, v3, v0}, Lcom/badlogic/gdx/physics/box2d/JointEdge;-><init>(Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/physics/box2d/Joint;)V

    .line 408
    iput-object v1, v0, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeA:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    .line 409
    iput-object v2, v0, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeB:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    .line 410
    iget-object v3, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->bodyA:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-object v3, v3, Lcom/badlogic/gdx/physics/box2d/Body;->joints:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    .line 411
    iget-object p1, p1, Lcom/badlogic/gdx/physics/box2d/JointDef;->bodyB:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-object p1, p1, Lcom/badlogic/gdx/physics/box2d/Body;->joints:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {p1, v2}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    return-object v0
.end method

.method deactivateBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 4

    .line 373
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-wide v2, p1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/badlogic/gdx/physics/box2d/World;->jniDeactivateBody(JJ)V

    return-void
.end method

.method public destroyBody(Lcom/badlogic/gdx/physics/box2d/Body;)V
    .locals 7

    .line 320
    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Body;->getJointList()Lcom/badlogic/gdx/utils/Array;

    move-result-object v0

    .line 321
    :goto_0
    iget v1, v0, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v2, 0x0

    if-lez v1, :cond_0

    .line 322
    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Body;->getJointList()Lcom/badlogic/gdx/utils/Array;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/physics/box2d/JointEdge;

    iget-object v1, v1, Lcom/badlogic/gdx/physics/box2d/JointEdge;->joint:Lcom/badlogic/gdx/physics/box2d/Joint;

    invoke-virtual {p0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->destroyJoint(Lcom/badlogic/gdx/physics/box2d/Joint;)V

    goto :goto_0

    .line 323
    :cond_0
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-wide v3, p1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-direct {p0, v0, v1, v3, v4}, Lcom/badlogic/gdx/physics/box2d/World;->jniDestroyBody(JJ)V

    const/4 v0, 0x0

    .line 324
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/physics/box2d/Body;->setUserData(Ljava/lang/Object;)V

    .line 325
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->bodies:Lcom/badlogic/gdx/utils/LongMap;

    iget-wide v3, p1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    invoke-virtual {v1, v3, v4}, Lcom/badlogic/gdx/utils/LongMap;->remove(J)Ljava/lang/Object;

    .line 326
    invoke-virtual {p1}, Lcom/badlogic/gdx/physics/box2d/Body;->getFixtureList()Lcom/badlogic/gdx/utils/Array;

    move-result-object v1

    .line 327
    :goto_1
    iget v3, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    if-lez v3, :cond_1

    .line 328
    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->removeIndex(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/badlogic/gdx/physics/box2d/Fixture;

    .line 329
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    iget-wide v5, v3, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    invoke-virtual {v4, v5, v6}, Lcom/badlogic/gdx/utils/LongMap;->remove(J)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/badlogic/gdx/physics/box2d/Fixture;

    invoke-virtual {v4, v0}, Lcom/badlogic/gdx/physics/box2d/Fixture;->setUserData(Ljava/lang/Object;)V

    .line 330
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeFixtures:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v4, v3}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    goto :goto_1

    .line 333
    :cond_1
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeBodies:Lcom/badlogic/gdx/utils/Pool;

    invoke-virtual {v0, p1}, Lcom/badlogic/gdx/utils/Pool;->free(Ljava/lang/Object;)V

    return-void
.end method

.method destroyFixture(Lcom/badlogic/gdx/physics/box2d/Body;Lcom/badlogic/gdx/physics/box2d/Fixture;)V
    .locals 7

    .line 353
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-wide v3, p1, Lcom/badlogic/gdx/physics/box2d/Body;->addr:J

    iget-wide v5, p2, Lcom/badlogic/gdx/physics/box2d/Fixture;->addr:J

    move-object v0, p0

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/physics/box2d/World;->jniDestroyFixture(JJJ)V

    return-void
.end method

.method public destroyJoint(Lcom/badlogic/gdx/physics/box2d/Joint;)V
    .locals 4

    const/4 v0, 0x0

    .line 665
    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/physics/box2d/Joint;->setUserData(Ljava/lang/Object;)V

    .line 666
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->joints:Lcom/badlogic/gdx/utils/LongMap;

    iget-wide v1, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/LongMap;->remove(J)Ljava/lang/Object;

    .line 667
    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeA:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/JointEdge;->other:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/Body;->joints:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeB:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 668
    iget-object v0, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeB:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/JointEdge;->other:Lcom/badlogic/gdx/physics/box2d/Body;

    iget-object v0, v0, Lcom/badlogic/gdx/physics/box2d/Body;->joints:Lcom/badlogic/gdx/utils/Array;

    iget-object v1, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->jointEdgeA:Lcom/badlogic/gdx/physics/box2d/JointEdge;

    invoke-virtual {v0, v1, v2}, Lcom/badlogic/gdx/utils/Array;->removeValue(Ljava/lang/Object;Z)Z

    .line 669
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-wide v2, p1, Lcom/badlogic/gdx/physics/box2d/Joint;->addr:J

    invoke-direct {p0, v0, v1, v2, v3}, Lcom/badlogic/gdx/physics/box2d/World;->jniDestroyJoint(JJ)V

    return-void
.end method

.method public dispose()V
    .locals 2

    .line 951
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniDispose(J)V

    return-void
.end method

.method public getAutoClearForces()Z
    .locals 2

    .line 832
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetAutoClearForces(J)Z

    move-result v0

    return v0
.end method

.method public getBodies(Lcom/badlogic/gdx/utils/Array;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/physics/box2d/Body;",
            ">;)V"
        }
    .end annotation

    .line 913
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 914
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->bodies:Lcom/badlogic/gdx/utils/LongMap;

    iget v0, v0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 915
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->bodies:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap;->values()Lcom/badlogic/gdx/utils/LongMap$Values;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 916
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getBodyCount()I
    .locals 2

    .line 749
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetBodyCount(J)I

    move-result v0

    return v0
.end method

.method public getContactCount()I
    .locals 2

    .line 774
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetContactCount(J)I

    move-result v0

    return v0
.end method

.method public getContactList()Lcom/badlogic/gdx/utils/Array;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/physics/box2d/Contact;",
            ">;"
        }
    .end annotation

    .line 887
    invoke-virtual {p0}, Lcom/badlogic/gdx/physics/box2d/World;->getContactCount()I

    move-result v0

    .line 888
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    array-length v1, v1

    if-le v0, v1, :cond_0

    mul-int/lit8 v1, v0, 0x2

    .line 890
    new-array v2, v1, [J

    iput-object v2, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    .line 891
    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/World;->contacts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 892
    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v2, v1}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 894
    :cond_0
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v2, 0x0

    if-le v0, v1, :cond_1

    .line 895
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Lcom/badlogic/gdx/utils/Array;

    iget v1, v1, Lcom/badlogic/gdx/utils/Array;->size:I

    const/4 v3, 0x0

    :goto_0
    sub-int v4, v0, v1

    if-ge v3, v4, :cond_1

    .line 897
    iget-object v4, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Lcom/badlogic/gdx/utils/Array;

    new-instance v5, Lcom/badlogic/gdx/physics/box2d/Contact;

    const-wide/16 v6, 0x0

    invoke-direct {v5, p0, v6, v7}, Lcom/badlogic/gdx/physics/box2d/Contact;-><init>(Lcom/badlogic/gdx/physics/box2d/World;J)V

    invoke-virtual {v4, v5}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 899
    :cond_1
    iget-wide v3, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    invoke-direct {p0, v3, v4, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetContactList(J[J)V

    .line 901
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contacts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    :goto_1
    if-ge v2, v0, :cond_2

    .line 903
    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->freeContacts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v1, v2}, Lcom/badlogic/gdx/utils/Array;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/badlogic/gdx/physics/box2d/Contact;

    .line 904
    iget-object v3, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactAddrs:[J

    aget-wide v4, v3, v2

    iput-wide v4, v1, Lcom/badlogic/gdx/physics/box2d/Contact;->addr:J

    .line 905
    iget-object v3, p0, Lcom/badlogic/gdx/physics/box2d/World;->contacts:Lcom/badlogic/gdx/utils/Array;

    invoke-virtual {v3, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 908
    :cond_2
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->contacts:Lcom/badlogic/gdx/utils/Array;

    return-object v0
.end method

.method public getFixtureCount()I
    .locals 1

    .line 759
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    iget v0, v0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    return v0
.end method

.method public getFixtures(Lcom/badlogic/gdx/utils/Array;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/physics/box2d/Fixture;",
            ">;)V"
        }
    .end annotation

    .line 922
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 923
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    iget v0, v0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 924
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->fixtures:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap;->values()Lcom/badlogic/gdx/utils/LongMap$Values;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 925
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getGravity()Lcom/badlogic/gdx/math/Vector2;
    .locals 3

    .line 797
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget-object v2, p0, Lcom/badlogic/gdx/physics/box2d/World;->tmpGravity:[F

    invoke-direct {p0, v0, v1, v2}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetGravity(J[F)V

    .line 798
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->gravity:Lcom/badlogic/gdx/math/Vector2;

    iget-object v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->tmpGravity:[F

    const/4 v2, 0x0

    aget v2, v1, v2

    iput v2, v0, Lcom/badlogic/gdx/math/Vector2;->x:F

    const/4 v2, 0x1

    .line 799
    aget v1, v1, v2

    iput v1, v0, Lcom/badlogic/gdx/math/Vector2;->y:F

    return-object v0
.end method

.method public getJointCount()I
    .locals 2

    .line 764
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetJointcount(J)I

    move-result v0

    return v0
.end method

.method public getJoints(Lcom/badlogic/gdx/utils/Array;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/badlogic/gdx/utils/Array<",
            "Lcom/badlogic/gdx/physics/box2d/Joint;",
            ">;)V"
        }
    .end annotation

    .line 931
    invoke-virtual {p1}, Lcom/badlogic/gdx/utils/Array;->clear()V

    .line 932
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->joints:Lcom/badlogic/gdx/utils/LongMap;

    iget v0, v0, Lcom/badlogic/gdx/utils/LongMap;->size:I

    invoke-virtual {p1, v0}, Lcom/badlogic/gdx/utils/Array;->ensureCapacity(I)[Ljava/lang/Object;

    .line 933
    iget-object v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->joints:Lcom/badlogic/gdx/utils/LongMap;

    invoke-virtual {v0}, Lcom/badlogic/gdx/utils/LongMap;->values()Lcom/badlogic/gdx/utils/LongMap$Values;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 934
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/badlogic/gdx/utils/Array;->add(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public getProxyCount()I
    .locals 2

    .line 739
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniGetProxyCount(J)I

    move-result v0

    return v0
.end method

.method public isLocked()Z
    .locals 2

    .line 812
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1}, Lcom/badlogic/gdx/physics/box2d/World;->jniIsLocked(J)Z

    move-result v0

    return v0
.end method

.method public rayCast(Lcom/badlogic/gdx/physics/box2d/RayCastCallback;FFFF)V
    .locals 7

    .line 1038
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->rayCastCallback:Lcom/badlogic/gdx/physics/box2d/RayCastCallback;

    .line 1039
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object v0, p0

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v0 .. v6}, Lcom/badlogic/gdx/physics/box2d/World;->jniRayCast(JFFFF)V

    return-void
.end method

.method public rayCast(Lcom/badlogic/gdx/physics/box2d/RayCastCallback;Lcom/badlogic/gdx/math/Vector2;Lcom/badlogic/gdx/math/Vector2;)V
    .locals 6

    .line 1028
    iget v2, p2, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v3, p2, Lcom/badlogic/gdx/math/Vector2;->y:F

    iget v4, p3, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget v5, p3, Lcom/badlogic/gdx/math/Vector2;->y:F

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/World;->rayCast(Lcom/badlogic/gdx/physics/box2d/RayCastCallback;FFFF)V

    return-void
.end method

.method public setAutoClearForces(Z)V
    .locals 2

    .line 822
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/World;->jniSetAutoClearForces(JZ)V

    return-void
.end method

.method public setContactFilter(Lcom/badlogic/gdx/physics/box2d/ContactFilter;)V
    .locals 0

    .line 263
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactFilter:Lcom/badlogic/gdx/physics/box2d/ContactFilter;

    if-nez p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 264
    :goto_0
    invoke-direct {p0, p1}, Lcom/badlogic/gdx/physics/box2d/World;->setUseDefaultContactFilter(Z)V

    return-void
.end method

.method public setContactListener(Lcom/badlogic/gdx/physics/box2d/ContactListener;)V
    .locals 0

    .line 274
    iput-object p1, p0, Lcom/badlogic/gdx/physics/box2d/World;->contactListener:Lcom/badlogic/gdx/physics/box2d/ContactListener;

    return-void
.end method

.method public setContinuousPhysics(Z)V
    .locals 2

    .line 729
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/World;->jniSetContiousPhysics(JZ)V

    return-void
.end method

.method public setDestructionListener(Lcom/badlogic/gdx/physics/box2d/DestructionListener;)V
    .locals 0

    return-void
.end method

.method public setGravity(Lcom/badlogic/gdx/math/Vector2;)V
    .locals 3

    .line 784
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    iget v2, p1, Lcom/badlogic/gdx/math/Vector2;->x:F

    iget p1, p1, Lcom/badlogic/gdx/math/Vector2;->y:F

    invoke-direct {p0, v0, v1, v2, p1}, Lcom/badlogic/gdx/physics/box2d/World;->jniSetGravity(JFF)V

    return-void
.end method

.method public setWarmStarting(Z)V
    .locals 2

    .line 719
    iget-wide v0, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    invoke-direct {p0, v0, v1, p1}, Lcom/badlogic/gdx/physics/box2d/World;->jniSetWarmStarting(JZ)V

    return-void
.end method

.method public step(FII)V
    .locals 6

    .line 689
    iget-wide v1, p0, Lcom/badlogic/gdx/physics/box2d/World;->addr:J

    move-object v0, p0

    move v3, p1

    move v4, p2

    move v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/badlogic/gdx/physics/box2d/World;->jniStep(JFII)V

    return-void
.end method
