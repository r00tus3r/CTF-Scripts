.class public Lcom/brashmonkey/spriter/XmlReader;
.super Ljava/lang/Object;
.source "XmlReader.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/brashmonkey/spriter/XmlReader$Element;
    }
.end annotation


# static fields
.field private static final _xml_actions:[B

.field private static final _xml_index_offsets:[S

.field private static final _xml_indicies:[B

.field private static final _xml_key_offsets:[B

.field private static final _xml_range_lengths:[B

.field private static final _xml_single_lengths:[B

.field private static final _xml_trans_actions:[B

.field private static final _xml_trans_keys:[C

.field private static final _xml_trans_targs:[B

.field static final xml_en_elementBody:I = 0xf

.field static final xml_en_main:I = 0x1

.field static final xml_error:I = 0x0

.field static final xml_first_final:I = 0x22

.field static final xml_start:I = 0x1


# instance fields
.field private current:Lcom/brashmonkey/spriter/XmlReader$Element;

.field private final elements:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/brashmonkey/spriter/XmlReader$Element;",
            ">;"
        }
    .end annotation
.end field

.field private root:Lcom/brashmonkey/spriter/XmlReader$Element;

.field private final textBuffer:Ljava/lang/StringBuilder;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 303
    invoke-static {}, Lcom/brashmonkey/spriter/XmlReader;->init__xml_actions_0()[B

    move-result-object v0

    sput-object v0, Lcom/brashmonkey/spriter/XmlReader;->_xml_actions:[B

    .line 310
    invoke-static {}, Lcom/brashmonkey/spriter/XmlReader;->init__xml_key_offsets_0()[B

    move-result-object v0

    sput-object v0, Lcom/brashmonkey/spriter/XmlReader;->_xml_key_offsets:[B

    .line 319
    invoke-static {}, Lcom/brashmonkey/spriter/XmlReader;->init__xml_trans_keys_0()[C

    move-result-object v0

    sput-object v0, Lcom/brashmonkey/spriter/XmlReader;->_xml_trans_keys:[C

    .line 326
    invoke-static {}, Lcom/brashmonkey/spriter/XmlReader;->init__xml_single_lengths_0()[B

    move-result-object v0

    sput-object v0, Lcom/brashmonkey/spriter/XmlReader;->_xml_single_lengths:[B

    .line 333
    invoke-static {}, Lcom/brashmonkey/spriter/XmlReader;->init__xml_range_lengths_0()[B

    move-result-object v0

    sput-object v0, Lcom/brashmonkey/spriter/XmlReader;->_xml_range_lengths:[B

    .line 340
    invoke-static {}, Lcom/brashmonkey/spriter/XmlReader;->init__xml_index_offsets_0()[S

    move-result-object v0

    sput-object v0, Lcom/brashmonkey/spriter/XmlReader;->_xml_index_offsets:[S

    .line 350
    invoke-static {}, Lcom/brashmonkey/spriter/XmlReader;->init__xml_indicies_0()[B

    move-result-object v0

    sput-object v0, Lcom/brashmonkey/spriter/XmlReader;->_xml_indicies:[B

    .line 358
    invoke-static {}, Lcom/brashmonkey/spriter/XmlReader;->init__xml_trans_targs_0()[B

    move-result-object v0

    sput-object v0, Lcom/brashmonkey/spriter/XmlReader;->_xml_trans_targs:[B

    .line 365
    invoke-static {}, Lcom/brashmonkey/spriter/XmlReader;->init__xml_trans_actions_0()[B

    move-result-object v0

    sput-object v0, Lcom/brashmonkey/spriter/XmlReader;->_xml_trans_actions:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->elements:Ljava/util/ArrayList;

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x40

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    iput-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->textBuffer:Ljava/lang/StringBuilder;

    return-void
.end method

.method private static init__xml_actions_0()[B
    .locals 1

    const/16 v0, 0x1a

    .line 300
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 1
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x1t
        0x2t
        0x1t
        0x3t
        0x1t
        0x4t
        0x1t
        0x5t
        0x1t
        0x6t
        0x1t
        0x7t
        0x2t
        0x0t
        0x6t
        0x2t
        0x1t
        0x4t
        0x2t
        0x2t
        0x4t
    .end array-data
.end method

.method private static init__xml_index_offsets_0()[S
    .locals 1

    const/16 v0, 0x24

    .line 336
    new-array v0, v0, [S

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 2
        0x0s
        0x0s
        0x4s
        0x9s
        0xes
        0x14s
        0x1as
        0x1es
        0x23s
        0x25s
        0x27s
        0x2cs
        0x30s
        0x34s
        0x36s
        0x38s
        0x3cs
        0x3es
        0x43s
        0x48s
        0x4es
        0x54s
        0x58s
        0x5ds
        0x5fs
        0x61s
        0x66s
        0x6as
        0x6es
        0x70s
        0x74s
        0x76s
        0x78s
        0x7as
        0x7cs
        0x7fs
    .end array-data
.end method

.method private static init__xml_indicies_0()[B
    .locals 1

    const/16 v0, 0x81

    .line 343
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 1
        0x0t
        0x2t
        0x0t
        0x1t
        0x2t
        0x1t
        0x1t
        0x2t
        0x3t
        0x5t
        0x6t
        0x7t
        0x5t
        0x4t
        0x9t
        0xat
        0x1t
        0xbt
        0x9t
        0x8t
        0xdt
        0x1t
        0xet
        0x1t
        0xdt
        0xct
        0xft
        0x10t
        0xft
        0x1t
        0x10t
        0x11t
        0x12t
        0x10t
        0x1t
        0x14t
        0x13t
        0x16t
        0x15t
        0x9t
        0xat
        0xbt
        0x9t
        0x1t
        0x17t
        0x18t
        0x17t
        0x1t
        0x19t
        0xbt
        0x19t
        0x1t
        0x14t
        0x1at
        0x16t
        0x1bt
        0x1dt
        0x1et
        0x1dt
        0x1ct
        0x20t
        0x1ft
        0x1et
        0x22t
        0x1t
        0x1et
        0x21t
        0x24t
        0x25t
        0x26t
        0x24t
        0x23t
        0x28t
        0x29t
        0x1t
        0x2at
        0x28t
        0x27t
        0x2ct
        0x1t
        0x2dt
        0x1t
        0x2ct
        0x2bt
        0x2et
        0x2ft
        0x2et
        0x1t
        0x2ft
        0x30t
        0x31t
        0x2ft
        0x1t
        0x33t
        0x32t
        0x35t
        0x34t
        0x28t
        0x29t
        0x2at
        0x28t
        0x1t
        0x36t
        0x37t
        0x36t
        0x1t
        0x38t
        0x2at
        0x38t
        0x1t
        0x39t
        0x1t
        0x39t
        0x22t
        0x39t
        0x1t
        0x1t
        0x3at
        0x3bt
        0x3at
        0x33t
        0x3ct
        0x35t
        0x3dt
        0x3et
        0x3et
        0x1t
        0x1t
        0x0t
    .end array-data
.end method

.method private static init__xml_key_offsets_0()[B
    .locals 1

    const/16 v0, 0x24

    .line 306
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x4t
        0x9t
        0xet
        0x14t
        0x1at
        0x1et
        0x23t
        0x24t
        0x25t
        0x2at
        0x2et
        0x32t
        0x33t
        0x34t
        0x38t
        0x39t
        0x3et
        0x43t
        0x49t
        0x4ft
        0x53t
        0x58t
        0x59t
        0x5at
        0x5ft
        0x63t
        0x67t
        0x68t
        0x6ct
        0x6dt
        0x6et
        0x6ft
        0x70t
        0x73t
    .end array-data
.end method

.method private static init__xml_range_lengths_0()[B
    .locals 1

    const/16 v0, 0x24

    .line 329
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 1
        0x0t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x0t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x0t
        0x0t
        0x1t
        0x1t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
    .end array-data
.end method

.method private static init__xml_single_lengths_0()[B
    .locals 1

    const/16 v0, 0x24

    .line 322
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 1
        0x0t
        0x2t
        0x3t
        0x3t
        0x4t
        0x4t
        0x2t
        0x3t
        0x1t
        0x1t
        0x3t
        0x2t
        0x2t
        0x1t
        0x1t
        0x2t
        0x1t
        0x3t
        0x3t
        0x4t
        0x4t
        0x2t
        0x3t
        0x1t
        0x1t
        0x3t
        0x2t
        0x2t
        0x1t
        0x2t
        0x1t
        0x1t
        0x1t
        0x1t
        0x1t
        0x0t
    .end array-data
.end method

.method private static init__xml_trans_actions_0()[B
    .locals 1

    const/16 v0, 0x3f

    .line 361
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 1
        0x0t
        0x0t
        0x0t
        0x1t
        0x0t
        0x3t
        0x3t
        0x14t
        0x1t
        0x0t
        0x0t
        0x9t
        0x0t
        0xbt
        0xbt
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x11t
        0x0t
        0xdt
        0x5t
        0x17t
        0x0t
        0x1t
        0x0t
        0x1t
        0x0t
        0x0t
        0x0t
        0xft
        0x1t
        0x0t
        0x0t
        0x3t
        0x3t
        0x14t
        0x1t
        0x0t
        0x0t
        0x9t
        0x0t
        0xbt
        0xbt
        0x0t
        0x0t
        0x0t
        0x0t
        0x1t
        0x11t
        0x0t
        0xdt
        0x5t
        0x17t
        0x0t
        0x0t
        0x0t
        0x7t
        0x1t
        0x0t
        0x0t
    .end array-data
.end method

.method private static init__xml_trans_keys_0()[C
    .locals 1

    const/16 v0, 0x74

    .line 313
    new-array v0, v0, [C

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 2
        0x20s
        0x3cs
        0x9s
        0xds
        0x20s
        0x2fs
        0x3es
        0x9s
        0xds
        0x20s
        0x2fs
        0x3es
        0x9s
        0xds
        0x20s
        0x2fs
        0x3ds
        0x3es
        0x9s
        0xds
        0x20s
        0x2fs
        0x3ds
        0x3es
        0x9s
        0xds
        0x20s
        0x3ds
        0x9s
        0xds
        0x20s
        0x22s
        0x27s
        0x9s
        0xds
        0x22s
        0x22s
        0x20s
        0x2fs
        0x3es
        0x9s
        0xds
        0x20s
        0x3es
        0x9s
        0xds
        0x20s
        0x3es
        0x9s
        0xds
        0x27s
        0x27s
        0x20s
        0x3cs
        0x9s
        0xds
        0x3cs
        0x20s
        0x2fs
        0x3es
        0x9s
        0xds
        0x20s
        0x2fs
        0x3es
        0x9s
        0xds
        0x20s
        0x2fs
        0x3ds
        0x3es
        0x9s
        0xds
        0x20s
        0x2fs
        0x3ds
        0x3es
        0x9s
        0xds
        0x20s
        0x3ds
        0x9s
        0xds
        0x20s
        0x22s
        0x27s
        0x9s
        0xds
        0x22s
        0x22s
        0x20s
        0x2fs
        0x3es
        0x9s
        0xds
        0x20s
        0x3es
        0x9s
        0xds
        0x20s
        0x3es
        0x9s
        0xds
        0x3cs
        0x20s
        0x2fs
        0x9s
        0xds
        0x3es
        0x3es
        0x27s
        0x27s
        0x20s
        0x9s
        0xds
        0x0s
    .end array-data
.end method

.method private static init__xml_trans_targs_0()[B
    .locals 1

    const/16 v0, 0x3f

    .line 353
    new-array v0, v0, [B

    fill-array-data v0, :array_0

    return-object v0

    :array_0
    .array-data 1
        0x1t
        0x0t
        0x2t
        0x3t
        0x3t
        0x4t
        0xbt
        0x22t
        0x5t
        0x4t
        0xbt
        0x22t
        0x5t
        0x6t
        0x7t
        0x6t
        0x7t
        0x8t
        0xdt
        0x9t
        0xat
        0x9t
        0xat
        0xct
        0x22t
        0xct
        0xet
        0xet
        0x10t
        0xft
        0x11t
        0x10t
        0x11t
        0x12t
        0x1et
        0x12t
        0x13t
        0x1at
        0x1ct
        0x14t
        0x13t
        0x1at
        0x1ct
        0x14t
        0x15t
        0x16t
        0x15t
        0x16t
        0x17t
        0x20t
        0x18t
        0x19t
        0x18t
        0x19t
        0x1bt
        0x1ct
        0x1bt
        0x1dt
        0x1ft
        0x23t
        0x21t
        0x21t
        0x22t
    .end array-data
.end method


# virtual methods
.method protected attribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 385
    iget-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->current:Lcom/brashmonkey/spriter/XmlReader$Element;

    invoke-virtual {v0, p1, p2}, Lcom/brashmonkey/spriter/XmlReader$Element;->setAttribute(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method protected close()V
    .locals 2

    .line 403
    iget-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->elements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/brashmonkey/spriter/XmlReader$Element;

    iput-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->root:Lcom/brashmonkey/spriter/XmlReader$Element;

    .line 404
    iget-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->elements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 405
    iget-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->elements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->elements:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/brashmonkey/spriter/XmlReader$Element;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->current:Lcom/brashmonkey/spriter/XmlReader$Element;

    return-void
.end method

.method protected entity(Ljava/lang/String;)Ljava/lang/String;
    .locals 1

    const-string v0, "lt"

    .line 389
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "<"

    return-object p1

    :cond_0
    const-string v0, "gt"

    .line 390
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, ">"

    return-object p1

    :cond_1
    const-string v0, "amp"

    .line 391
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string p1, "&"

    return-object p1

    :cond_2
    const-string v0, "apos"

    .line 392
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    const-string p1, "\'"

    return-object p1

    :cond_3
    const-string v0, "quot"

    .line 393
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    const-string p1, "\""

    return-object p1

    :cond_4
    const/4 p1, 0x0

    return-object p1
.end method

.method protected open(Ljava/lang/String;)V
    .locals 2

    .line 377
    new-instance v0, Lcom/brashmonkey/spriter/XmlReader$Element;

    iget-object v1, p0, Lcom/brashmonkey/spriter/XmlReader;->current:Lcom/brashmonkey/spriter/XmlReader$Element;

    invoke-direct {v0, p1, v1}, Lcom/brashmonkey/spriter/XmlReader$Element;-><init>(Ljava/lang/String;Lcom/brashmonkey/spriter/XmlReader$Element;)V

    .line 378
    iget-object p1, p0, Lcom/brashmonkey/spriter/XmlReader;->current:Lcom/brashmonkey/spriter/XmlReader$Element;

    if-eqz p1, :cond_0

    .line 379
    invoke-virtual {p1, v0}, Lcom/brashmonkey/spriter/XmlReader$Element;->addChild(Lcom/brashmonkey/spriter/XmlReader$Element;)V

    .line 380
    :cond_0
    iget-object p1, p0, Lcom/brashmonkey/spriter/XmlReader;->elements:Ljava/util/ArrayList;

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 381
    iput-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->current:Lcom/brashmonkey/spriter/XmlReader$Element;

    return-void
.end method

.method public parse(Ljava/io/InputStream;)Lcom/brashmonkey/spriter/XmlReader$Element;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    new-instance v0, Ljava/io/InputStreamReader;

    const-string v1, "ISO-8859-1"

    invoke-direct {v0, p1, v1}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/brashmonkey/spriter/XmlReader;->parse(Ljava/io/Reader;)Lcom/brashmonkey/spriter/XmlReader$Element;

    move-result-object p1

    return-object p1
.end method

.method public parse(Ljava/io/Reader;)Lcom/brashmonkey/spriter/XmlReader$Element;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0x400

    .line 29
    new-array v0, v0, [C

    const/4 v1, 0x0

    const/4 v2, 0x0

    .line 32
    :goto_0
    array-length v3, v0

    sub-int/2addr v3, v2

    invoke-virtual {p1, v0, v2, v3}, Ljava/io/Reader;->read([CII)I

    move-result v3

    const/4 v4, -0x1

    if-ne v3, v4, :cond_0

    .line 41
    invoke-virtual {p0, v0, v1, v2}, Lcom/brashmonkey/spriter/XmlReader;->parse([CII)Lcom/brashmonkey/spriter/XmlReader$Element;

    move-result-object p1

    return-object p1

    :cond_0
    if-nez v3, :cond_1

    .line 35
    array-length v3, v0

    mul-int/lit8 v3, v3, 0x2

    new-array v3, v3, [C

    .line 36
    array-length v4, v0

    invoke-static {v0, v1, v3, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    move-object v0, v3

    goto :goto_0

    :cond_1
    add-int/2addr v2, v3

    goto :goto_0
.end method

.method public parse(Ljava/lang/String;)Lcom/brashmonkey/spriter/XmlReader$Element;
    .locals 2

    .line 24
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    .line 25
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/brashmonkey/spriter/XmlReader;->parse([CII)Lcom/brashmonkey/spriter/XmlReader$Element;

    move-result-object p1

    return-object p1
.end method

.method public parse([CII)Lcom/brashmonkey/spriter/XmlReader$Element;
    .locals 22

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move/from16 v2, p3

    const/4 v7, 0x2

    const/4 v8, 0x1

    move/from16 v10, p2

    const/4 v9, 0x0

    const/4 v11, 0x1

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_0
    const/4 v14, 0x0

    :goto_1
    const/16 v15, 0xa

    if-eqz v9, :cond_1

    if-eq v9, v8, :cond_3

    if-eq v9, v7, :cond_0

    const/4 v6, 0x0

    goto/16 :goto_18

    :cond_0
    const/4 v6, 0x0

    const/4 v8, 0x2

    goto/16 :goto_16

    :cond_1
    if-ne v10, v2, :cond_2

    const/4 v9, 0x4

    goto :goto_1

    :cond_2
    if-nez v11, :cond_3

    goto/16 :goto_17

    .line 85
    :cond_3
    sget-object v9, Lcom/brashmonkey/spriter/XmlReader;->_xml_key_offsets:[B

    aget-byte v9, v9, v11

    .line 86
    sget-object v16, Lcom/brashmonkey/spriter/XmlReader;->_xml_index_offsets:[S

    aget-short v16, v16, v11

    .line 87
    sget-object v17, Lcom/brashmonkey/spriter/XmlReader;->_xml_single_lengths:[B

    aget-byte v17, v17, v11

    if-lez v17, :cond_7

    add-int v18, v9, v17

    add-int/lit8 v19, v18, -0x1

    move v3, v9

    move/from16 v5, v19

    :goto_2
    if-ge v5, v3, :cond_4

    add-int v16, v16, v17

    goto :goto_3

    :cond_4
    sub-int v20, v5, v3

    shr-int/lit8 v20, v20, 0x1

    add-int v20, v3, v20

    .line 96
    aget-char v6, v1, v10

    sget-object v21, Lcom/brashmonkey/spriter/XmlReader;->_xml_trans_keys:[C

    aget-char v4, v21, v20

    if-ge v6, v4, :cond_5

    add-int/lit8 v5, v20, -0x1

    goto :goto_2

    .line 98
    :cond_5
    aget-char v3, v1, v10

    aget-char v4, v21, v20

    if-le v3, v4, :cond_6

    add-int/lit8 v3, v20, 0x1

    goto :goto_2

    :cond_6
    sub-int v20, v20, v9

    add-int v16, v16, v20

    goto :goto_7

    :cond_7
    move/from16 v18, v9

    .line 109
    :goto_3
    sget-object v3, Lcom/brashmonkey/spriter/XmlReader;->_xml_range_lengths:[B

    aget-byte v3, v3, v11

    if-lez v3, :cond_b

    shl-int/lit8 v4, v3, 0x1

    add-int v4, v18, v4

    sub-int/2addr v4, v7

    move/from16 v5, v18

    :goto_4
    if-ge v4, v5, :cond_8

    :goto_5
    add-int v16, v16, v3

    goto :goto_7

    :cond_8
    sub-int v6, v4, v5

    shr-int/2addr v6, v8

    and-int/lit8 v6, v6, -0x2

    add-int/2addr v6, v5

    .line 118
    aget-char v9, v1, v10

    sget-object v11, Lcom/brashmonkey/spriter/XmlReader;->_xml_trans_keys:[C

    aget-char v7, v11, v6

    if-ge v9, v7, :cond_9

    add-int/lit8 v4, v6, -0x2

    :goto_6
    const/4 v7, 0x2

    goto :goto_4

    .line 120
    :cond_9
    aget-char v5, v1, v10

    add-int/lit8 v7, v6, 0x1

    aget-char v7, v11, v7

    if-le v5, v7, :cond_a

    add-int/lit8 v5, v6, 0x2

    goto :goto_6

    :cond_a
    sub-int v6, v6, v18

    shr-int/lit8 v3, v6, 0x1

    goto :goto_5

    .line 131
    :cond_b
    :goto_7
    sget-object v3, Lcom/brashmonkey/spriter/XmlReader;->_xml_indicies:[B

    aget-byte v3, v3, v16

    .line 132
    sget-object v4, Lcom/brashmonkey/spriter/XmlReader;->_xml_trans_targs:[B

    aget-byte v4, v4, v3

    .line 134
    sget-object v5, Lcom/brashmonkey/spriter/XmlReader;->_xml_trans_actions:[B

    aget-byte v6, v5, v3

    if-eqz v6, :cond_1c

    .line 135
    aget-byte v3, v5, v3

    .line 136
    sget-object v5, Lcom/brashmonkey/spriter/XmlReader;->_xml_actions:[B

    add-int/lit8 v6, v3, 0x1

    aget-byte v3, v5, v3

    :goto_8
    add-int/lit8 v5, v3, -0x1

    if-lez v3, :cond_1c

    .line 138
    sget-object v3, Lcom/brashmonkey/spriter/XmlReader;->_xml_actions:[B

    add-int/lit8 v7, v6, 0x1

    aget-byte v3, v3, v6

    packed-switch v3, :pswitch_data_0

    const/4 v6, 0x0

    goto/16 :goto_f

    :pswitch_0
    move v3, v10

    :goto_9
    if-eq v3, v13, :cond_d

    add-int/lit8 v6, v3, -0x1

    .line 225
    aget-char v6, v1, v6

    const/16 v9, 0x9

    if-eq v6, v9, :cond_c

    if-eq v6, v15, :cond_c

    const/16 v9, 0xd

    if-eq v6, v9, :cond_c

    const/16 v9, 0x20

    if-eq v6, v9, :cond_c

    goto :goto_a

    :cond_c
    add-int/lit8 v3, v3, -0x1

    goto :goto_9

    :cond_d
    :goto_a
    move v9, v13

    const/4 v6, 0x0

    :goto_b
    if-eq v13, v3, :cond_12

    add-int/lit8 v11, v13, 0x1

    .line 238
    aget-char v13, v1, v13

    const/16 v15, 0x26

    if-eq v13, v15, :cond_e

    move v13, v11

    :goto_c
    const/16 v15, 0xa

    goto :goto_b

    :cond_e
    move v13, v11

    :goto_d
    if-eq v13, v3, :cond_11

    add-int/lit8 v15, v13, 0x1

    .line 241
    aget-char v13, v1, v13

    const/16 v8, 0x3b

    if-eq v13, v8, :cond_f

    move v13, v15

    const/4 v8, 0x1

    goto :goto_d

    .line 242
    :cond_f
    iget-object v6, v0, Lcom/brashmonkey/spriter/XmlReader;->textBuffer:Ljava/lang/StringBuilder;

    sub-int v8, v11, v9

    const/4 v13, 0x1

    sub-int/2addr v8, v13

    invoke-virtual {v6, v1, v9, v8}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 243
    new-instance v6, Ljava/lang/String;

    sub-int v8, v15, v11

    sub-int/2addr v8, v13

    invoke-direct {v6, v1, v11, v8}, Ljava/lang/String;-><init>([CII)V

    .line 244
    invoke-virtual {v0, v6}, Lcom/brashmonkey/spriter/XmlReader;->entity(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 245
    iget-object v9, v0, Lcom/brashmonkey/spriter/XmlReader;->textBuffer:Ljava/lang/StringBuilder;

    if-eqz v8, :cond_10

    move-object v6, v8

    :cond_10
    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v9, v15

    move v13, v9

    const/4 v6, 0x1

    :cond_11
    const/4 v8, 0x1

    goto :goto_c

    :cond_12
    if-eqz v6, :cond_14

    if-ge v9, v3, :cond_13

    .line 252
    iget-object v6, v0, Lcom/brashmonkey/spriter/XmlReader;->textBuffer:Ljava/lang/StringBuilder;

    sub-int/2addr v3, v9

    invoke-virtual {v6, v1, v9, v3}, Ljava/lang/StringBuilder;->append([CII)Ljava/lang/StringBuilder;

    .line 253
    :cond_13
    iget-object v3, v0, Lcom/brashmonkey/spriter/XmlReader;->textBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/brashmonkey/spriter/XmlReader;->text(Ljava/lang/String;)V

    .line 254
    iget-object v3, v0, Lcom/brashmonkey/spriter/XmlReader;->textBuffer:Ljava/lang/StringBuilder;

    const/4 v6, 0x0

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->setLength(I)V

    goto :goto_e

    :cond_14
    const/4 v6, 0x0

    .line 256
    new-instance v8, Ljava/lang/String;

    sub-int/2addr v3, v9

    invoke-direct {v8, v1, v9, v3}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v8}, Lcom/brashmonkey/spriter/XmlReader;->text(Ljava/lang/String;)V

    :goto_e
    move v13, v9

    goto :goto_f

    :pswitch_1
    const/4 v6, 0x0

    .line 217
    new-instance v3, Ljava/lang/String;

    sub-int v8, v10, v13

    invoke-direct {v3, v1, v13, v8}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v12, v3}, Lcom/brashmonkey/spriter/XmlReader;->attribute(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_f

    :pswitch_2
    const/4 v6, 0x0

    .line 211
    new-instance v12, Ljava/lang/String;

    sub-int v3, v10, v13

    invoke-direct {v12, v1, v13, v3}, Ljava/lang/String;-><init>([CII)V

    :cond_15
    :goto_f
    const/4 v8, 0x2

    goto/16 :goto_15

    :pswitch_3
    const/4 v6, 0x0

    if-eqz v14, :cond_15

    goto :goto_10

    :pswitch_4
    const/4 v6, 0x0

    .line 190
    invoke-virtual/range {p0 .. p0}, Lcom/brashmonkey/spriter/XmlReader;->close()V

    :cond_16
    :goto_10
    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x2

    const/16 v11, 0xf

    goto/16 :goto_1

    :pswitch_5
    const/4 v6, 0x0

    .line 179
    invoke-virtual/range {p0 .. p0}, Lcom/brashmonkey/spriter/XmlReader;->close()V

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x2

    const/16 v11, 0xf

    goto/16 :goto_0

    :pswitch_6
    const/4 v6, 0x0

    .line 148
    aget-char v3, v1, v13

    const/16 v8, 0x3f

    if-eq v3, v8, :cond_18

    const/16 v8, 0x21

    if-ne v3, v8, :cond_17

    goto :goto_11

    .line 172
    :cond_17
    new-instance v3, Ljava/lang/String;

    sub-int v8, v10, v13

    invoke-direct {v3, v1, v13, v8}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v3}, Lcom/brashmonkey/spriter/XmlReader;->open(Ljava/lang/String;)V

    const/4 v8, 0x2

    const/4 v14, 0x1

    goto/16 :goto_15

    :cond_18
    :goto_11
    add-int/lit8 v3, v13, 0x1

    .line 150
    aget-char v3, v1, v3

    const/16 v4, 0x3e

    const/16 v5, 0x5b

    if-ne v3, v5, :cond_1b

    add-int/lit8 v3, v13, 0x2

    aget-char v3, v1, v3

    const/16 v7, 0x43

    if-ne v3, v7, :cond_1b

    add-int/lit8 v3, v13, 0x3

    aget-char v3, v1, v3

    const/16 v7, 0x44

    if-ne v3, v7, :cond_1b

    add-int/lit8 v3, v13, 0x4

    aget-char v3, v1, v3

    const/16 v7, 0x41

    if-ne v3, v7, :cond_1b

    add-int/lit8 v3, v13, 0x5

    aget-char v3, v1, v3

    const/16 v8, 0x54

    if-ne v3, v8, :cond_1b

    add-int/lit8 v3, v13, 0x6

    aget-char v3, v1, v3

    if-ne v3, v7, :cond_1b

    add-int/lit8 v3, v13, 0x7

    aget-char v3, v1, v3

    if-ne v3, v5, :cond_1b

    add-int/lit8 v3, v13, 0x8

    add-int/lit8 v5, v3, 0x2

    :goto_12
    add-int/lit8 v7, v5, -0x2

    .line 159
    aget-char v7, v1, v7

    const/16 v8, 0x5d

    if-ne v7, v8, :cond_1a

    add-int/lit8 v7, v5, -0x1

    aget-char v7, v1, v7

    if-ne v7, v8, :cond_1a

    aget-char v7, v1, v5

    if-eq v7, v4, :cond_19

    goto :goto_13

    .line 161
    :cond_19
    new-instance v4, Ljava/lang/String;

    sub-int v7, v5, v3

    const/4 v8, 0x2

    sub-int/2addr v7, v8

    invoke-direct {v4, v1, v3, v7}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v0, v4}, Lcom/brashmonkey/spriter/XmlReader;->text(Ljava/lang/String;)V

    move v13, v3

    move v10, v5

    goto/16 :goto_10

    :cond_1a
    :goto_13
    const/4 v8, 0x2

    add-int/lit8 v5, v5, 0x1

    goto :goto_12

    :cond_1b
    const/4 v8, 0x2

    .line 163
    :goto_14
    aget-char v3, v1, v10

    if-eq v3, v4, :cond_16

    add-int/lit8 v10, v10, 0x1

    goto :goto_14

    :pswitch_7
    const/4 v6, 0x0

    const/4 v8, 0x2

    move v13, v10

    :goto_15
    move v3, v5

    move v6, v7

    const/4 v8, 0x1

    const/16 v15, 0xa

    goto/16 :goto_8

    :cond_1c
    const/4 v6, 0x0

    const/4 v8, 0x2

    move v11, v4

    :goto_16
    if-nez v11, :cond_1d

    const/4 v7, 0x2

    const/4 v8, 0x1

    :goto_17
    const/4 v9, 0x5

    goto/16 :goto_1

    :cond_1d
    add-int/lit8 v10, v10, 0x1

    if-eq v10, v2, :cond_1e

    const/4 v7, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x1

    goto/16 :goto_1

    :cond_1e
    :goto_18
    if-ge v10, v2, :cond_21

    const/4 v3, 0x1

    :goto_19
    if-ge v6, v10, :cond_20

    .line 285
    aget-char v4, v1, v6

    const/16 v5, 0xa

    if-ne v4, v5, :cond_1f

    add-int/lit8 v3, v3, 0x1

    :cond_1f
    add-int/lit8 v6, v6, 0x1

    goto :goto_19

    .line 286
    :cond_20
    new-instance v4, Lcom/brashmonkey/spriter/SpriterException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error parsing XML on line "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " near: "

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    new-instance v3, Ljava/lang/String;

    sub-int/2addr v2, v10

    const/16 v6, 0x20

    invoke-static {v6, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-direct {v3, v1, v10, v2}, Ljava/lang/String;-><init>([CII)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v4, v1}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 288
    :cond_21
    iget-object v1, v0, Lcom/brashmonkey/spriter/XmlReader;->elements:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-nez v1, :cond_22

    .line 293
    iget-object v1, v0, Lcom/brashmonkey/spriter/XmlReader;->root:Lcom/brashmonkey/spriter/XmlReader$Element;

    const/4 v2, 0x0

    .line 294
    iput-object v2, v0, Lcom/brashmonkey/spriter/XmlReader;->root:Lcom/brashmonkey/spriter/XmlReader$Element;

    return-object v1

    .line 289
    :cond_22
    iget-object v1, v0, Lcom/brashmonkey/spriter/XmlReader;->elements:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/brashmonkey/spriter/XmlReader$Element;

    .line 290
    iget-object v2, v0, Lcom/brashmonkey/spriter/XmlReader;->elements:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    .line 291
    new-instance v2, Lcom/brashmonkey/spriter/SpriterException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error parsing XML, unclosed element: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Lcom/brashmonkey/spriter/XmlReader$Element;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Lcom/brashmonkey/spriter/SpriterException;-><init>(Ljava/lang/String;)V

    goto :goto_1b

    :goto_1a
    throw v2

    :goto_1b
    goto :goto_1a

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method protected text(Ljava/lang/String;)V
    .locals 3

    .line 398
    iget-object v0, p0, Lcom/brashmonkey/spriter/XmlReader;->current:Lcom/brashmonkey/spriter/XmlReader$Element;

    invoke-virtual {v0}, Lcom/brashmonkey/spriter/XmlReader$Element;->getText()Ljava/lang/String;

    move-result-object v0

    .line 399
    iget-object v1, p0, Lcom/brashmonkey/spriter/XmlReader;->current:Lcom/brashmonkey/spriter/XmlReader$Element;

    if-eqz v0, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :cond_0
    invoke-virtual {v1, p1}, Lcom/brashmonkey/spriter/XmlReader$Element;->setText(Ljava/lang/String;)V

    return-void
.end method
