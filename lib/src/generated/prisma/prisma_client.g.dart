// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prisma_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserWhereInput _$UserWhereInputFromJson(Map<String, dynamic> json) =>
    UserWhereInput(
      AND: (json['AND'] as List<dynamic>?)
          ?.map((e) => UserWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)
          ?.map((e) => UserWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)
          ?.map((e) => UserWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : IntFilter.fromJson(json['id'] as Map<String, dynamic>),
      username: json['username'] == null
          ? null
          : StringFilter.fromJson(json['username'] as Map<String, dynamic>),
      passwordHash: json['passwordHash'] == null
          ? null
          : StringFilter.fromJson(json['passwordHash'] as Map<String, dynamic>),
      posts: json['posts'] == null
          ? null
          : PostListRelationFilter.fromJson(
              json['posts'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentListRelationFilter.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserWhereInputToJson(UserWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('username', instance.username?.toJson());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  writeNotNull('posts', instance.posts?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

UserOrderByWithRelationInput _$UserOrderByWithRelationInputFromJson(
        Map<String, dynamic> json) =>
    UserOrderByWithRelationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      username: $enumDecodeNullable(_$SortOrderEnumMap, json['username']),
      passwordHash:
          $enumDecodeNullable(_$SortOrderEnumMap, json['passwordHash']),
      posts: json['posts'] == null
          ? null
          : PostOrderByRelationAggregateInput.fromJson(
              json['posts'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentOrderByRelationAggregateInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserOrderByWithRelationInputToJson(
    UserOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('username', _$SortOrderEnumMap[instance.username]);
  writeNotNull('passwordHash', _$SortOrderEnumMap[instance.passwordHash]);
  writeNotNull('posts', instance.posts?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

const _$SortOrderEnumMap = {
  SortOrder.asc: 'asc',
  SortOrder.desc: 'desc',
};

UserWhereUniqueInput _$UserWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    UserWhereUniqueInput(
      id: json['id'] as int?,
      username: json['username'] as String?,
      AND: (json['AND'] as List<dynamic>?)
          ?.map((e) => UserWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)
          ?.map((e) => UserWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)
          ?.map((e) => UserWhereInput.fromJson(e as Map<String, dynamic>)),
      passwordHash: json['passwordHash'] == null
          ? null
          : StringFilter.fromJson(json['passwordHash'] as Map<String, dynamic>),
      posts: json['posts'] == null
          ? null
          : PostListRelationFilter.fromJson(
              json['posts'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentListRelationFilter.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserWhereUniqueInputToJson(
    UserWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('username', instance.username);
  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  writeNotNull('posts', instance.posts?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

UserOrderByWithAggregationInput _$UserOrderByWithAggregationInputFromJson(
        Map<String, dynamic> json) =>
    UserOrderByWithAggregationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      username: $enumDecodeNullable(_$SortOrderEnumMap, json['username']),
      passwordHash:
          $enumDecodeNullable(_$SortOrderEnumMap, json['passwordHash']),
      $count: json['_count'] == null
          ? null
          : UserCountOrderByAggregateInput.fromJson(
              json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : UserAvgOrderByAggregateInput.fromJson(
              json['_avg'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : UserMaxOrderByAggregateInput.fromJson(
              json['_max'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : UserMinOrderByAggregateInput.fromJson(
              json['_min'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : UserSumOrderByAggregateInput.fromJson(
              json['_sum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserOrderByWithAggregationInputToJson(
    UserOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('username', _$SortOrderEnumMap[instance.username]);
  writeNotNull('passwordHash', _$SortOrderEnumMap[instance.passwordHash]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

UserScalarWhereWithAggregatesInput _$UserScalarWhereWithAggregatesInputFromJson(
        Map<String, dynamic> json) =>
    UserScalarWhereWithAggregatesInput(
      AND: (json['AND'] as List<dynamic>?)?.map((e) =>
          UserScalarWhereWithAggregatesInput.fromJson(
              e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map((e) =>
          UserScalarWhereWithAggregatesInput.fromJson(
              e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
          UserScalarWhereWithAggregatesInput.fromJson(
              e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : IntWithAggregatesFilter.fromJson(
              json['id'] as Map<String, dynamic>),
      username: json['username'] == null
          ? null
          : StringWithAggregatesFilter.fromJson(
              json['username'] as Map<String, dynamic>),
      passwordHash: json['passwordHash'] == null
          ? null
          : StringWithAggregatesFilter.fromJson(
              json['passwordHash'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserScalarWhereWithAggregatesInputToJson(
    UserScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('username', instance.username?.toJson());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  return val;
}

PostWhereInput _$PostWhereInputFromJson(Map<String, dynamic> json) =>
    PostWhereInput(
      AND: (json['AND'] as List<dynamic>?)
          ?.map((e) => PostWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)
          ?.map((e) => PostWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)
          ?.map((e) => PostWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : IntFilter.fromJson(json['id'] as Map<String, dynamic>),
      imageId: json['imageId'] == null
          ? null
          : StringNullableFilter.fromJson(
              json['imageId'] as Map<String, dynamic>),
      ext: json['ext'] == null
          ? null
          : StringNullableFilter.fromJson(json['ext'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFilter.fromJson(json['content'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntFilter.fromJson(json['userId'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserRelationFilter.fromJson(json['user'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentListRelationFilter.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostWhereInputToJson(PostWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostOrderByWithRelationInput _$PostOrderByWithRelationInputFromJson(
        Map<String, dynamic> json) =>
    PostOrderByWithRelationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      imageId: $enumDecodeNullable(_$SortOrderEnumMap, json['imageId']),
      ext: $enumDecodeNullable(_$SortOrderEnumMap, json['ext']),
      content: $enumDecodeNullable(_$SortOrderEnumMap, json['content']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
      user: json['user'] == null
          ? null
          : UserOrderByWithRelationInput.fromJson(
              json['user'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentOrderByRelationAggregateInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostOrderByWithRelationInputToJson(
    PostOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('imageId', _$SortOrderEnumMap[instance.imageId]);
  writeNotNull('ext', _$SortOrderEnumMap[instance.ext]);
  writeNotNull('content', _$SortOrderEnumMap[instance.content]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostWhereUniqueInput _$PostWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    PostWhereUniqueInput(
      id: json['id'] as int?,
      AND: (json['AND'] as List<dynamic>?)
          ?.map((e) => PostWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)
          ?.map((e) => PostWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)
          ?.map((e) => PostWhereInput.fromJson(e as Map<String, dynamic>)),
      imageId: json['imageId'] == null
          ? null
          : StringNullableFilter.fromJson(
              json['imageId'] as Map<String, dynamic>),
      ext: json['ext'] == null
          ? null
          : StringNullableFilter.fromJson(json['ext'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFilter.fromJson(json['content'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntFilter.fromJson(json['userId'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserRelationFilter.fromJson(json['user'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentListRelationFilter.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostWhereUniqueInputToJson(
    PostWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostOrderByWithAggregationInput _$PostOrderByWithAggregationInputFromJson(
        Map<String, dynamic> json) =>
    PostOrderByWithAggregationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      imageId: $enumDecodeNullable(_$SortOrderEnumMap, json['imageId']),
      ext: $enumDecodeNullable(_$SortOrderEnumMap, json['ext']),
      content: $enumDecodeNullable(_$SortOrderEnumMap, json['content']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
      $count: json['_count'] == null
          ? null
          : PostCountOrderByAggregateInput.fromJson(
              json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : PostAvgOrderByAggregateInput.fromJson(
              json['_avg'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : PostMaxOrderByAggregateInput.fromJson(
              json['_max'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : PostMinOrderByAggregateInput.fromJson(
              json['_min'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : PostSumOrderByAggregateInput.fromJson(
              json['_sum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostOrderByWithAggregationInputToJson(
    PostOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('imageId', _$SortOrderEnumMap[instance.imageId]);
  writeNotNull('ext', _$SortOrderEnumMap[instance.ext]);
  writeNotNull('content', _$SortOrderEnumMap[instance.content]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

PostScalarWhereWithAggregatesInput _$PostScalarWhereWithAggregatesInputFromJson(
        Map<String, dynamic> json) =>
    PostScalarWhereWithAggregatesInput(
      AND: (json['AND'] as List<dynamic>?)?.map((e) =>
          PostScalarWhereWithAggregatesInput.fromJson(
              e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map((e) =>
          PostScalarWhereWithAggregatesInput.fromJson(
              e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
          PostScalarWhereWithAggregatesInput.fromJson(
              e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : IntWithAggregatesFilter.fromJson(
              json['id'] as Map<String, dynamic>),
      imageId: json['imageId'] == null
          ? null
          : StringNullableWithAggregatesFilter.fromJson(
              json['imageId'] as Map<String, dynamic>),
      ext: json['ext'] == null
          ? null
          : StringNullableWithAggregatesFilter.fromJson(
              json['ext'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringWithAggregatesFilter.fromJson(
              json['content'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntWithAggregatesFilter.fromJson(
              json['userId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostScalarWhereWithAggregatesInputToJson(
    PostScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  return val;
}

CommentWhereInput _$CommentWhereInputFromJson(Map<String, dynamic> json) =>
    CommentWhereInput(
      AND: (json['AND'] as List<dynamic>?)
          ?.map((e) => CommentWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)
          ?.map((e) => CommentWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)
          ?.map((e) => CommentWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : IntFilter.fromJson(json['id'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFilter.fromJson(json['content'] as Map<String, dynamic>),
      postId: json['postId'] == null
          ? null
          : IntFilter.fromJson(json['postId'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntFilter.fromJson(json['userId'] as Map<String, dynamic>),
      post: json['post'] == null
          ? null
          : PostRelationFilter.fromJson(json['post'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : UserRelationFilter.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentWhereInputToJson(CommentWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('postId', instance.postId?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  writeNotNull('post', instance.post?.toJson());
  writeNotNull('author', instance.author?.toJson());
  return val;
}

CommentOrderByWithRelationInput _$CommentOrderByWithRelationInputFromJson(
        Map<String, dynamic> json) =>
    CommentOrderByWithRelationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      content: $enumDecodeNullable(_$SortOrderEnumMap, json['content']),
      postId: $enumDecodeNullable(_$SortOrderEnumMap, json['postId']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
      post: json['post'] == null
          ? null
          : PostOrderByWithRelationInput.fromJson(
              json['post'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : UserOrderByWithRelationInput.fromJson(
              json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentOrderByWithRelationInputToJson(
    CommentOrderByWithRelationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('content', _$SortOrderEnumMap[instance.content]);
  writeNotNull('postId', _$SortOrderEnumMap[instance.postId]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  writeNotNull('post', instance.post?.toJson());
  writeNotNull('author', instance.author?.toJson());
  return val;
}

CommentWhereUniqueInput _$CommentWhereUniqueInputFromJson(
        Map<String, dynamic> json) =>
    CommentWhereUniqueInput(
      id: json['id'] as int?,
      AND: (json['AND'] as List<dynamic>?)
          ?.map((e) => CommentWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)
          ?.map((e) => CommentWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)
          ?.map((e) => CommentWhereInput.fromJson(e as Map<String, dynamic>)),
      content: json['content'] == null
          ? null
          : StringFilter.fromJson(json['content'] as Map<String, dynamic>),
      postId: json['postId'] == null
          ? null
          : IntFilter.fromJson(json['postId'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntFilter.fromJson(json['userId'] as Map<String, dynamic>),
      post: json['post'] == null
          ? null
          : PostRelationFilter.fromJson(json['post'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : UserRelationFilter.fromJson(json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentWhereUniqueInputToJson(
    CommentWhereUniqueInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('postId', instance.postId?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  writeNotNull('post', instance.post?.toJson());
  writeNotNull('author', instance.author?.toJson());
  return val;
}

CommentOrderByWithAggregationInput _$CommentOrderByWithAggregationInputFromJson(
        Map<String, dynamic> json) =>
    CommentOrderByWithAggregationInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      content: $enumDecodeNullable(_$SortOrderEnumMap, json['content']),
      postId: $enumDecodeNullable(_$SortOrderEnumMap, json['postId']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
      $count: json['_count'] == null
          ? null
          : CommentCountOrderByAggregateInput.fromJson(
              json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : CommentAvgOrderByAggregateInput.fromJson(
              json['_avg'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : CommentMaxOrderByAggregateInput.fromJson(
              json['_max'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : CommentMinOrderByAggregateInput.fromJson(
              json['_min'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : CommentSumOrderByAggregateInput.fromJson(
              json['_sum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentOrderByWithAggregationInputToJson(
    CommentOrderByWithAggregationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('content', _$SortOrderEnumMap[instance.content]);
  writeNotNull('postId', _$SortOrderEnumMap[instance.postId]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  return val;
}

CommentScalarWhereWithAggregatesInput
    _$CommentScalarWhereWithAggregatesInputFromJson(
            Map<String, dynamic> json) =>
        CommentScalarWhereWithAggregatesInput(
          AND: (json['AND'] as List<dynamic>?)?.map((e) =>
              CommentScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          OR: (json['OR'] as List<dynamic>?)?.map((e) =>
              CommentScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          NOT: (json['NOT'] as List<dynamic>?)?.map((e) =>
              CommentScalarWhereWithAggregatesInput.fromJson(
                  e as Map<String, dynamic>)),
          id: json['id'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['id'] as Map<String, dynamic>),
          content: json['content'] == null
              ? null
              : StringWithAggregatesFilter.fromJson(
                  json['content'] as Map<String, dynamic>),
          postId: json['postId'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['postId'] as Map<String, dynamic>),
          userId: json['userId'] == null
              ? null
              : IntWithAggregatesFilter.fromJson(
                  json['userId'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentScalarWhereWithAggregatesInputToJson(
    CommentScalarWhereWithAggregatesInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('postId', instance.postId?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  return val;
}

UserCreateInput _$UserCreateInputFromJson(Map<String, dynamic> json) =>
    UserCreateInput(
      username: json['username'] as String,
      passwordHash: json['passwordHash'] as String,
      posts: json['posts'] == null
          ? null
          : PostCreateNestedManyWithoutUserInput.fromJson(
              json['posts'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentCreateNestedManyWithoutAuthorInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCreateInputToJson(UserCreateInput instance) {
  final val = <String, dynamic>{
    'username': instance.username,
    'passwordHash': instance.passwordHash,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('posts', instance.posts?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

UserUncheckedCreateInput _$UserUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    UserUncheckedCreateInput(
      id: json['id'] as int?,
      username: json['username'] as String,
      passwordHash: json['passwordHash'] as String,
      posts: json['posts'] == null
          ? null
          : PostUncheckedCreateNestedManyWithoutUserInput.fromJson(
              json['posts'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentUncheckedCreateNestedManyWithoutAuthorInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUncheckedCreateInputToJson(
    UserUncheckedCreateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['username'] = instance.username;
  val['passwordHash'] = instance.passwordHash;
  writeNotNull('posts', instance.posts?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

UserUpdateInput _$UserUpdateInputFromJson(Map<String, dynamic> json) =>
    UserUpdateInput(
      username: json['username'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['username'] as Map<String, dynamic>),
      passwordHash: json['passwordHash'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['passwordHash'] as Map<String, dynamic>),
      posts: json['posts'] == null
          ? null
          : PostUpdateManyWithoutUserNestedInput.fromJson(
              json['posts'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentUpdateManyWithoutAuthorNestedInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUpdateInputToJson(UserUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username?.toJson());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  writeNotNull('posts', instance.posts?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

UserUncheckedUpdateInput _$UserUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    UserUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      username: json['username'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['username'] as Map<String, dynamic>),
      passwordHash: json['passwordHash'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['passwordHash'] as Map<String, dynamic>),
      posts: json['posts'] == null
          ? null
          : PostUncheckedUpdateManyWithoutUserNestedInput.fromJson(
              json['posts'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentUncheckedUpdateManyWithoutAuthorNestedInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUncheckedUpdateInputToJson(
    UserUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('username', instance.username?.toJson());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  writeNotNull('posts', instance.posts?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

UserCreateManyInput _$UserCreateManyInputFromJson(Map<String, dynamic> json) =>
    UserCreateManyInput(
      id: json['id'] as int?,
      username: json['username'] as String,
      passwordHash: json['passwordHash'] as String,
    );

Map<String, dynamic> _$UserCreateManyInputToJson(UserCreateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['username'] = instance.username;
  val['passwordHash'] = instance.passwordHash;
  return val;
}

UserUpdateManyMutationInput _$UserUpdateManyMutationInputFromJson(
        Map<String, dynamic> json) =>
    UserUpdateManyMutationInput(
      username: json['username'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['username'] as Map<String, dynamic>),
      passwordHash: json['passwordHash'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['passwordHash'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUpdateManyMutationInputToJson(
    UserUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username?.toJson());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  return val;
}

UserUncheckedUpdateManyInput _$UserUncheckedUpdateManyInputFromJson(
        Map<String, dynamic> json) =>
    UserUncheckedUpdateManyInput(
      id: json['id'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      username: json['username'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['username'] as Map<String, dynamic>),
      passwordHash: json['passwordHash'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['passwordHash'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUncheckedUpdateManyInputToJson(
    UserUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('username', instance.username?.toJson());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  return val;
}

PostCreateInput _$PostCreateInputFromJson(Map<String, dynamic> json) =>
    PostCreateInput(
      imageId: json['imageId'] as String?,
      ext: json['ext'] as String?,
      content: json['content'] as String,
      user: UserCreateNestedOneWithoutPostsInput.fromJson(
          json['user'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentCreateNestedManyWithoutPostInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostCreateInputToJson(PostCreateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageId', instance.imageId);
  writeNotNull('ext', instance.ext);
  val['content'] = instance.content;
  val['user'] = instance.user.toJson();
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostUncheckedCreateInput _$PostUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    PostUncheckedCreateInput(
      id: json['id'] as int?,
      imageId: json['imageId'] as String?,
      ext: json['ext'] as String?,
      content: json['content'] as String,
      userId: json['userId'] as int,
      comments: json['comments'] == null
          ? null
          : CommentUncheckedCreateNestedManyWithoutPostInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostUncheckedCreateInputToJson(
    PostUncheckedCreateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('imageId', instance.imageId);
  writeNotNull('ext', instance.ext);
  val['content'] = instance.content;
  val['userId'] = instance.userId;
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostUpdateInput _$PostUpdateInputFromJson(Map<String, dynamic> json) =>
    PostUpdateInput(
      imageId: json['imageId'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['imageId'] as Map<String, dynamic>),
      ext: json['ext'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['ext'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserUpdateOneRequiredWithoutPostsNestedInput.fromJson(
              json['user'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentUpdateManyWithoutPostNestedInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostUpdateInputToJson(PostUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('user', instance.user?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostUncheckedUpdateInput _$PostUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    PostUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      imageId: json['imageId'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['imageId'] as Map<String, dynamic>),
      ext: json['ext'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['ext'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['userId'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentUncheckedUpdateManyWithoutPostNestedInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostUncheckedUpdateInputToJson(
    PostUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostCreateManyInput _$PostCreateManyInputFromJson(Map<String, dynamic> json) =>
    PostCreateManyInput(
      id: json['id'] as int?,
      imageId: json['imageId'] as String?,
      ext: json['ext'] as String?,
      content: json['content'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$PostCreateManyInputToJson(PostCreateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('imageId', instance.imageId);
  writeNotNull('ext', instance.ext);
  val['content'] = instance.content;
  val['userId'] = instance.userId;
  return val;
}

PostUpdateManyMutationInput _$PostUpdateManyMutationInputFromJson(
        Map<String, dynamic> json) =>
    PostUpdateManyMutationInput(
      imageId: json['imageId'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['imageId'] as Map<String, dynamic>),
      ext: json['ext'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['ext'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostUpdateManyMutationInputToJson(
    PostUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  return val;
}

PostUncheckedUpdateManyInput _$PostUncheckedUpdateManyInputFromJson(
        Map<String, dynamic> json) =>
    PostUncheckedUpdateManyInput(
      id: json['id'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      imageId: json['imageId'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['imageId'] as Map<String, dynamic>),
      ext: json['ext'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['ext'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['userId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostUncheckedUpdateManyInputToJson(
    PostUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  return val;
}

CommentCreateInput _$CommentCreateInputFromJson(Map<String, dynamic> json) =>
    CommentCreateInput(
      content: json['content'] as String,
      post: PostCreateNestedOneWithoutCommentsInput.fromJson(
          json['post'] as Map<String, dynamic>),
      author: UserCreateNestedOneWithoutCommentsInput.fromJson(
          json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentCreateInputToJson(CommentCreateInput instance) =>
    <String, dynamic>{
      'content': instance.content,
      'post': instance.post.toJson(),
      'author': instance.author.toJson(),
    };

CommentUncheckedCreateInput _$CommentUncheckedCreateInputFromJson(
        Map<String, dynamic> json) =>
    CommentUncheckedCreateInput(
      id: json['id'] as int?,
      content: json['content'] as String,
      postId: json['postId'] as int,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$CommentUncheckedCreateInputToJson(
    CommentUncheckedCreateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['content'] = instance.content;
  val['postId'] = instance.postId;
  val['userId'] = instance.userId;
  return val;
}

CommentUpdateInput _$CommentUpdateInputFromJson(Map<String, dynamic> json) =>
    CommentUpdateInput(
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
      post: json['post'] == null
          ? null
          : PostUpdateOneRequiredWithoutCommentsNestedInput.fromJson(
              json['post'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : UserUpdateOneRequiredWithoutCommentsNestedInput.fromJson(
              json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentUpdateInputToJson(CommentUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content?.toJson());
  writeNotNull('post', instance.post?.toJson());
  writeNotNull('author', instance.author?.toJson());
  return val;
}

CommentUncheckedUpdateInput _$CommentUncheckedUpdateInputFromJson(
        Map<String, dynamic> json) =>
    CommentUncheckedUpdateInput(
      id: json['id'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
      postId: json['postId'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['postId'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['userId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentUncheckedUpdateInputToJson(
    CommentUncheckedUpdateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('postId', instance.postId?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  return val;
}

CommentCreateManyInput _$CommentCreateManyInputFromJson(
        Map<String, dynamic> json) =>
    CommentCreateManyInput(
      id: json['id'] as int?,
      content: json['content'] as String,
      postId: json['postId'] as int,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$CommentCreateManyInputToJson(
    CommentCreateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['content'] = instance.content;
  val['postId'] = instance.postId;
  val['userId'] = instance.userId;
  return val;
}

CommentUpdateManyMutationInput _$CommentUpdateManyMutationInputFromJson(
        Map<String, dynamic> json) =>
    CommentUpdateManyMutationInput(
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentUpdateManyMutationInputToJson(
    CommentUpdateManyMutationInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content?.toJson());
  return val;
}

CommentUncheckedUpdateManyInput _$CommentUncheckedUpdateManyInputFromJson(
        Map<String, dynamic> json) =>
    CommentUncheckedUpdateManyInput(
      id: json['id'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['id'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
      postId: json['postId'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['postId'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntFieldUpdateOperationsInput.fromJson(
              json['userId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentUncheckedUpdateManyInputToJson(
    CommentUncheckedUpdateManyInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('postId', instance.postId?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  return val;
}

IntFilter _$IntFilterFromJson(Map<String, dynamic> json) => IntFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntFilterToJson(IntFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

StringFilter _$StringFilterFromJson(Map<String, dynamic> json) => StringFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      mode: $enumDecodeNullable(_$QueryModeEnumMap, json['mode']),
      not: json['not'] == null
          ? null
          : NestedStringFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StringFilterToJson(StringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('mode', _$QueryModeEnumMap[instance.mode]);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

const _$QueryModeEnumMap = {
  QueryMode.$default: 'default',
  QueryMode.insensitive: 'insensitive',
};

PostListRelationFilter _$PostListRelationFilterFromJson(
        Map<String, dynamic> json) =>
    PostListRelationFilter(
      every: json['every'] == null
          ? null
          : PostWhereInput.fromJson(json['every'] as Map<String, dynamic>),
      some: json['some'] == null
          ? null
          : PostWhereInput.fromJson(json['some'] as Map<String, dynamic>),
      none: json['none'] == null
          ? null
          : PostWhereInput.fromJson(json['none'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostListRelationFilterToJson(
    PostListRelationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('every', instance.every?.toJson());
  writeNotNull('some', instance.some?.toJson());
  writeNotNull('none', instance.none?.toJson());
  return val;
}

CommentListRelationFilter _$CommentListRelationFilterFromJson(
        Map<String, dynamic> json) =>
    CommentListRelationFilter(
      every: json['every'] == null
          ? null
          : CommentWhereInput.fromJson(json['every'] as Map<String, dynamic>),
      some: json['some'] == null
          ? null
          : CommentWhereInput.fromJson(json['some'] as Map<String, dynamic>),
      none: json['none'] == null
          ? null
          : CommentWhereInput.fromJson(json['none'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentListRelationFilterToJson(
    CommentListRelationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('every', instance.every?.toJson());
  writeNotNull('some', instance.some?.toJson());
  writeNotNull('none', instance.none?.toJson());
  return val;
}

PostOrderByRelationAggregateInput _$PostOrderByRelationAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PostOrderByRelationAggregateInput(
      $count: $enumDecodeNullable(_$SortOrderEnumMap, json['_count']),
    );

Map<String, dynamic> _$PostOrderByRelationAggregateInputToJson(
    PostOrderByRelationAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_count', _$SortOrderEnumMap[instance.$count]);
  return val;
}

CommentOrderByRelationAggregateInput
    _$CommentOrderByRelationAggregateInputFromJson(Map<String, dynamic> json) =>
        CommentOrderByRelationAggregateInput(
          $count: $enumDecodeNullable(_$SortOrderEnumMap, json['_count']),
        );

Map<String, dynamic> _$CommentOrderByRelationAggregateInputToJson(
    CommentOrderByRelationAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('_count', _$SortOrderEnumMap[instance.$count]);
  return val;
}

UserCountOrderByAggregateInput _$UserCountOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    UserCountOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      username: $enumDecodeNullable(_$SortOrderEnumMap, json['username']),
      passwordHash:
          $enumDecodeNullable(_$SortOrderEnumMap, json['passwordHash']),
    );

Map<String, dynamic> _$UserCountOrderByAggregateInputToJson(
    UserCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('username', _$SortOrderEnumMap[instance.username]);
  writeNotNull('passwordHash', _$SortOrderEnumMap[instance.passwordHash]);
  return val;
}

UserAvgOrderByAggregateInput _$UserAvgOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    UserAvgOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
    );

Map<String, dynamic> _$UserAvgOrderByAggregateInputToJson(
    UserAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

UserMaxOrderByAggregateInput _$UserMaxOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    UserMaxOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      username: $enumDecodeNullable(_$SortOrderEnumMap, json['username']),
      passwordHash:
          $enumDecodeNullable(_$SortOrderEnumMap, json['passwordHash']),
    );

Map<String, dynamic> _$UserMaxOrderByAggregateInputToJson(
    UserMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('username', _$SortOrderEnumMap[instance.username]);
  writeNotNull('passwordHash', _$SortOrderEnumMap[instance.passwordHash]);
  return val;
}

UserMinOrderByAggregateInput _$UserMinOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    UserMinOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      username: $enumDecodeNullable(_$SortOrderEnumMap, json['username']),
      passwordHash:
          $enumDecodeNullable(_$SortOrderEnumMap, json['passwordHash']),
    );

Map<String, dynamic> _$UserMinOrderByAggregateInputToJson(
    UserMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('username', _$SortOrderEnumMap[instance.username]);
  writeNotNull('passwordHash', _$SortOrderEnumMap[instance.passwordHash]);
  return val;
}

UserSumOrderByAggregateInput _$UserSumOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    UserSumOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
    );

Map<String, dynamic> _$UserSumOrderByAggregateInputToJson(
    UserSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  return val;
}

IntWithAggregatesFilter _$IntWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    IntWithAggregatesFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : NestedFloatFilter.fromJson(json['_avg'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : NestedIntFilter.fromJson(json['_sum'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedIntFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedIntFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$IntWithAggregatesFilterToJson(
    IntWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

StringWithAggregatesFilter _$StringWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    StringWithAggregatesFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      mode: $enumDecodeNullable(_$QueryModeEnumMap, json['mode']),
      not: json['not'] == null
          ? null
          : NestedStringWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedStringFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedStringFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StringWithAggregatesFilterToJson(
    StringWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('mode', _$QueryModeEnumMap[instance.mode]);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

StringNullableFilter _$StringNullableFilterFromJson(
        Map<String, dynamic> json) =>
    StringNullableFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      mode: $enumDecodeNullable(_$QueryModeEnumMap, json['mode']),
      not: json['not'] == null
          ? null
          : NestedStringNullableFilter.fromJson(
              json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StringNullableFilterToJson(
    StringNullableFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('mode', _$QueryModeEnumMap[instance.mode]);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

UserRelationFilter _$UserRelationFilterFromJson(Map<String, dynamic> json) =>
    UserRelationFilter(
      $is: json['is'] == null
          ? null
          : UserWhereInput.fromJson(json['is'] as Map<String, dynamic>),
      isNot: json['isNot'] == null
          ? null
          : UserWhereInput.fromJson(json['isNot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserRelationFilterToJson(UserRelationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is', instance.$is?.toJson());
  writeNotNull('isNot', instance.isNot?.toJson());
  return val;
}

SortOrderInput _$SortOrderInputFromJson(Map<String, dynamic> json) =>
    SortOrderInput(
      sort: $enumDecode(_$SortOrderEnumMap, json['sort']),
      nulls: $enumDecodeNullable(_$NullsOrderEnumMap, json['nulls']),
    );

Map<String, dynamic> _$SortOrderInputToJson(SortOrderInput instance) {
  final val = <String, dynamic>{
    'sort': _$SortOrderEnumMap[instance.sort]!,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('nulls', _$NullsOrderEnumMap[instance.nulls]);
  return val;
}

const _$NullsOrderEnumMap = {
  NullsOrder.first: 'first',
  NullsOrder.last: 'last',
};

PostCountOrderByAggregateInput _$PostCountOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PostCountOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      imageId: $enumDecodeNullable(_$SortOrderEnumMap, json['imageId']),
      ext: $enumDecodeNullable(_$SortOrderEnumMap, json['ext']),
      content: $enumDecodeNullable(_$SortOrderEnumMap, json['content']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
    );

Map<String, dynamic> _$PostCountOrderByAggregateInputToJson(
    PostCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('imageId', _$SortOrderEnumMap[instance.imageId]);
  writeNotNull('ext', _$SortOrderEnumMap[instance.ext]);
  writeNotNull('content', _$SortOrderEnumMap[instance.content]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  return val;
}

PostAvgOrderByAggregateInput _$PostAvgOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PostAvgOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
    );

Map<String, dynamic> _$PostAvgOrderByAggregateInputToJson(
    PostAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  return val;
}

PostMaxOrderByAggregateInput _$PostMaxOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PostMaxOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      imageId: $enumDecodeNullable(_$SortOrderEnumMap, json['imageId']),
      ext: $enumDecodeNullable(_$SortOrderEnumMap, json['ext']),
      content: $enumDecodeNullable(_$SortOrderEnumMap, json['content']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
    );

Map<String, dynamic> _$PostMaxOrderByAggregateInputToJson(
    PostMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('imageId', _$SortOrderEnumMap[instance.imageId]);
  writeNotNull('ext', _$SortOrderEnumMap[instance.ext]);
  writeNotNull('content', _$SortOrderEnumMap[instance.content]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  return val;
}

PostMinOrderByAggregateInput _$PostMinOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PostMinOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      imageId: $enumDecodeNullable(_$SortOrderEnumMap, json['imageId']),
      ext: $enumDecodeNullable(_$SortOrderEnumMap, json['ext']),
      content: $enumDecodeNullable(_$SortOrderEnumMap, json['content']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
    );

Map<String, dynamic> _$PostMinOrderByAggregateInputToJson(
    PostMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('imageId', _$SortOrderEnumMap[instance.imageId]);
  writeNotNull('ext', _$SortOrderEnumMap[instance.ext]);
  writeNotNull('content', _$SortOrderEnumMap[instance.content]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  return val;
}

PostSumOrderByAggregateInput _$PostSumOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    PostSumOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
    );

Map<String, dynamic> _$PostSumOrderByAggregateInputToJson(
    PostSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  return val;
}

StringNullableWithAggregatesFilter _$StringNullableWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    StringNullableWithAggregatesFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      mode: $enumDecodeNullable(_$QueryModeEnumMap, json['mode']),
      not: json['not'] == null
          ? null
          : NestedStringNullableWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntNullableFilter.fromJson(
              json['_count'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedStringNullableFilter.fromJson(
              json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedStringNullableFilter.fromJson(
              json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StringNullableWithAggregatesFilterToJson(
    StringNullableWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('mode', _$QueryModeEnumMap[instance.mode]);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

PostRelationFilter _$PostRelationFilterFromJson(Map<String, dynamic> json) =>
    PostRelationFilter(
      $is: json['is'] == null
          ? null
          : PostWhereInput.fromJson(json['is'] as Map<String, dynamic>),
      isNot: json['isNot'] == null
          ? null
          : PostWhereInput.fromJson(json['isNot'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostRelationFilterToJson(PostRelationFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('is', instance.$is?.toJson());
  writeNotNull('isNot', instance.isNot?.toJson());
  return val;
}

CommentCountOrderByAggregateInput _$CommentCountOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    CommentCountOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      content: $enumDecodeNullable(_$SortOrderEnumMap, json['content']),
      postId: $enumDecodeNullable(_$SortOrderEnumMap, json['postId']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
    );

Map<String, dynamic> _$CommentCountOrderByAggregateInputToJson(
    CommentCountOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('content', _$SortOrderEnumMap[instance.content]);
  writeNotNull('postId', _$SortOrderEnumMap[instance.postId]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  return val;
}

CommentAvgOrderByAggregateInput _$CommentAvgOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    CommentAvgOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      postId: $enumDecodeNullable(_$SortOrderEnumMap, json['postId']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
    );

Map<String, dynamic> _$CommentAvgOrderByAggregateInputToJson(
    CommentAvgOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('postId', _$SortOrderEnumMap[instance.postId]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  return val;
}

CommentMaxOrderByAggregateInput _$CommentMaxOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    CommentMaxOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      content: $enumDecodeNullable(_$SortOrderEnumMap, json['content']),
      postId: $enumDecodeNullable(_$SortOrderEnumMap, json['postId']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
    );

Map<String, dynamic> _$CommentMaxOrderByAggregateInputToJson(
    CommentMaxOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('content', _$SortOrderEnumMap[instance.content]);
  writeNotNull('postId', _$SortOrderEnumMap[instance.postId]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  return val;
}

CommentMinOrderByAggregateInput _$CommentMinOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    CommentMinOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      content: $enumDecodeNullable(_$SortOrderEnumMap, json['content']),
      postId: $enumDecodeNullable(_$SortOrderEnumMap, json['postId']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
    );

Map<String, dynamic> _$CommentMinOrderByAggregateInputToJson(
    CommentMinOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('content', _$SortOrderEnumMap[instance.content]);
  writeNotNull('postId', _$SortOrderEnumMap[instance.postId]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  return val;
}

CommentSumOrderByAggregateInput _$CommentSumOrderByAggregateInputFromJson(
        Map<String, dynamic> json) =>
    CommentSumOrderByAggregateInput(
      id: $enumDecodeNullable(_$SortOrderEnumMap, json['id']),
      postId: $enumDecodeNullable(_$SortOrderEnumMap, json['postId']),
      userId: $enumDecodeNullable(_$SortOrderEnumMap, json['userId']),
    );

Map<String, dynamic> _$CommentSumOrderByAggregateInputToJson(
    CommentSumOrderByAggregateInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', _$SortOrderEnumMap[instance.id]);
  writeNotNull('postId', _$SortOrderEnumMap[instance.postId]);
  writeNotNull('userId', _$SortOrderEnumMap[instance.userId]);
  return val;
}

PostCreateNestedManyWithoutUserInput
    _$PostCreateNestedManyWithoutUserInputFromJson(Map<String, dynamic> json) =>
        PostCreateNestedManyWithoutUserInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              PostCreateWithoutUserInput.fromJson(e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => PostCreateOrConnectWithoutUserInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : PostCreateManyUserInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          connect: (json['connect'] as List<dynamic>?)?.map(
              (e) => PostWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$PostCreateNestedManyWithoutUserInputToJson(
    PostCreateNestedManyWithoutUserInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

CommentCreateNestedManyWithoutAuthorInput
    _$CommentCreateNestedManyWithoutAuthorInputFromJson(
            Map<String, dynamic> json) =>
        CommentCreateNestedManyWithoutAuthorInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              CommentCreateWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => CommentCreateOrConnectWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : CommentCreateManyAuthorInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$CommentCreateNestedManyWithoutAuthorInputToJson(
    CommentCreateNestedManyWithoutAuthorInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

PostUncheckedCreateNestedManyWithoutUserInput
    _$PostUncheckedCreateNestedManyWithoutUserInputFromJson(
            Map<String, dynamic> json) =>
        PostUncheckedCreateNestedManyWithoutUserInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              PostCreateWithoutUserInput.fromJson(e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => PostCreateOrConnectWithoutUserInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : PostCreateManyUserInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          connect: (json['connect'] as List<dynamic>?)?.map(
              (e) => PostWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$PostUncheckedCreateNestedManyWithoutUserInputToJson(
    PostUncheckedCreateNestedManyWithoutUserInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

CommentUncheckedCreateNestedManyWithoutAuthorInput
    _$CommentUncheckedCreateNestedManyWithoutAuthorInputFromJson(
            Map<String, dynamic> json) =>
        CommentUncheckedCreateNestedManyWithoutAuthorInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              CommentCreateWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => CommentCreateOrConnectWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : CommentCreateManyAuthorInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$CommentUncheckedCreateNestedManyWithoutAuthorInputToJson(
    CommentUncheckedCreateNestedManyWithoutAuthorInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

StringFieldUpdateOperationsInput _$StringFieldUpdateOperationsInputFromJson(
        Map<String, dynamic> json) =>
    StringFieldUpdateOperationsInput(
      set: json['set'] as String?,
    );

Map<String, dynamic> _$StringFieldUpdateOperationsInputToJson(
    StringFieldUpdateOperationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('set', instance.set);
  return val;
}

PostUpdateManyWithoutUserNestedInput
    _$PostUpdateManyWithoutUserNestedInputFromJson(Map<String, dynamic> json) =>
        PostUpdateManyWithoutUserNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              PostCreateWithoutUserInput.fromJson(e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => PostCreateOrConnectWithoutUserInput.fromJson(
                  e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              PostUpsertWithWhereUniqueWithoutUserInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : PostCreateManyUserInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          set: (json['set'] as List<dynamic>?)?.map(
              (e) => PostWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map(
              (e) => PostWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map(
              (e) => PostWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map(
              (e) => PostWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              PostUpdateWithWhereUniqueWithoutUserInput.fromJson(
                  e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              PostUpdateManyWithWhereWithoutUserInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map(
              (e) => PostScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$PostUpdateManyWithoutUserNestedInputToJson(
    PostUpdateManyWithoutUserNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

CommentUpdateManyWithoutAuthorNestedInput
    _$CommentUpdateManyWithoutAuthorNestedInputFromJson(
            Map<String, dynamic> json) =>
        CommentUpdateManyWithoutAuthorNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              CommentCreateWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => CommentCreateOrConnectWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              CommentUpsertWithWhereUniqueWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : CommentCreateManyAuthorInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          set: (json['set'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              CommentUpdateWithWhereUniqueWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              CommentUpdateManyWithWhereWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map((e) =>
              CommentScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$CommentUpdateManyWithoutAuthorNestedInputToJson(
    CommentUpdateManyWithoutAuthorNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

IntFieldUpdateOperationsInput _$IntFieldUpdateOperationsInputFromJson(
        Map<String, dynamic> json) =>
    IntFieldUpdateOperationsInput(
      set: json['set'] as int?,
      increment: json['increment'] as int?,
      decrement: json['decrement'] as int?,
      multiply: json['multiply'] as int?,
      divide: json['divide'] as int?,
    );

Map<String, dynamic> _$IntFieldUpdateOperationsInputToJson(
    IntFieldUpdateOperationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('set', instance.set);
  writeNotNull('increment', instance.increment);
  writeNotNull('decrement', instance.decrement);
  writeNotNull('multiply', instance.multiply);
  writeNotNull('divide', instance.divide);
  return val;
}

PostUncheckedUpdateManyWithoutUserNestedInput
    _$PostUncheckedUpdateManyWithoutUserNestedInputFromJson(
            Map<String, dynamic> json) =>
        PostUncheckedUpdateManyWithoutUserNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              PostCreateWithoutUserInput.fromJson(e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => PostCreateOrConnectWithoutUserInput.fromJson(
                  e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              PostUpsertWithWhereUniqueWithoutUserInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : PostCreateManyUserInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          set: (json['set'] as List<dynamic>?)?.map(
              (e) => PostWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map(
              (e) => PostWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map(
              (e) => PostWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map(
              (e) => PostWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              PostUpdateWithWhereUniqueWithoutUserInput.fromJson(
                  e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              PostUpdateManyWithWhereWithoutUserInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map(
              (e) => PostScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$PostUncheckedUpdateManyWithoutUserNestedInputToJson(
    PostUncheckedUpdateManyWithoutUserNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

CommentUncheckedUpdateManyWithoutAuthorNestedInput
    _$CommentUncheckedUpdateManyWithoutAuthorNestedInputFromJson(
            Map<String, dynamic> json) =>
        CommentUncheckedUpdateManyWithoutAuthorNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              CommentCreateWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => CommentCreateOrConnectWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              CommentUpsertWithWhereUniqueWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : CommentCreateManyAuthorInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          set: (json['set'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              CommentUpdateWithWhereUniqueWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              CommentUpdateManyWithWhereWithoutAuthorInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map((e) =>
              CommentScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$CommentUncheckedUpdateManyWithoutAuthorNestedInputToJson(
    CommentUncheckedUpdateManyWithoutAuthorNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

UserCreateNestedOneWithoutPostsInput
    _$UserCreateNestedOneWithoutPostsInputFromJson(Map<String, dynamic> json) =>
        UserCreateNestedOneWithoutPostsInput(
          create: json['create'] == null
              ? null
              : UserCreateWithoutPostsInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : UserCreateOrConnectWithoutPostsInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : UserWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserCreateNestedOneWithoutPostsInputToJson(
    UserCreateNestedOneWithoutPostsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  return val;
}

CommentCreateNestedManyWithoutPostInput
    _$CommentCreateNestedManyWithoutPostInputFromJson(
            Map<String, dynamic> json) =>
        CommentCreateNestedManyWithoutPostInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              CommentCreateWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => CommentCreateOrConnectWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : CommentCreateManyPostInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$CommentCreateNestedManyWithoutPostInputToJson(
    CommentCreateNestedManyWithoutPostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

CommentUncheckedCreateNestedManyWithoutPostInput
    _$CommentUncheckedCreateNestedManyWithoutPostInputFromJson(
            Map<String, dynamic> json) =>
        CommentUncheckedCreateNestedManyWithoutPostInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              CommentCreateWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => CommentCreateOrConnectWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : CommentCreateManyPostInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$CommentUncheckedCreateNestedManyWithoutPostInputToJson(
    CommentUncheckedCreateNestedManyWithoutPostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  return val;
}

NullableStringFieldUpdateOperationsInput
    _$NullableStringFieldUpdateOperationsInputFromJson(
            Map<String, dynamic> json) =>
        NullableStringFieldUpdateOperationsInput(
          set: json['set'] as String?,
        );

Map<String, dynamic> _$NullableStringFieldUpdateOperationsInputToJson(
    NullableStringFieldUpdateOperationsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('set', instance.set);
  return val;
}

UserUpdateOneRequiredWithoutPostsNestedInput
    _$UserUpdateOneRequiredWithoutPostsNestedInputFromJson(
            Map<String, dynamic> json) =>
        UserUpdateOneRequiredWithoutPostsNestedInput(
          create: json['create'] == null
              ? null
              : UserCreateWithoutPostsInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : UserCreateOrConnectWithoutPostsInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          upsert: json['upsert'] == null
              ? null
              : UserUpsertWithoutPostsInput.fromJson(
                  json['upsert'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : UserWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
          update: json['update'] == null
              ? null
              : UserUpdateToOneWithWhereWithoutPostsInput.fromJson(
                  json['update'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserUpdateOneRequiredWithoutPostsNestedInputToJson(
    UserUpdateOneRequiredWithoutPostsNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('upsert', instance.upsert?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  writeNotNull('update', instance.update?.toJson());
  return val;
}

CommentUpdateManyWithoutPostNestedInput
    _$CommentUpdateManyWithoutPostNestedInputFromJson(
            Map<String, dynamic> json) =>
        CommentUpdateManyWithoutPostNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              CommentCreateWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => CommentCreateOrConnectWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              CommentUpsertWithWhereUniqueWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : CommentCreateManyPostInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          set: (json['set'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              CommentUpdateWithWhereUniqueWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              CommentUpdateManyWithWhereWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map((e) =>
              CommentScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$CommentUpdateManyWithoutPostNestedInputToJson(
    CommentUpdateManyWithoutPostNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

CommentUncheckedUpdateManyWithoutPostNestedInput
    _$CommentUncheckedUpdateManyWithoutPostNestedInputFromJson(
            Map<String, dynamic> json) =>
        CommentUncheckedUpdateManyWithoutPostNestedInput(
          create: (json['create'] as List<dynamic>?)?.map((e) =>
              CommentCreateWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          connectOrCreate: (json['connectOrCreate'] as List<dynamic>?)?.map(
              (e) => CommentCreateOrConnectWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          upsert: (json['upsert'] as List<dynamic>?)?.map((e) =>
              CommentUpsertWithWhereUniqueWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          createMany: json['createMany'] == null
              ? null
              : CommentCreateManyPostInputEnvelope.fromJson(
                  json['createMany'] as Map<String, dynamic>),
          set: (json['set'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          disconnect: (json['disconnect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          delete: (json['delete'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          connect: (json['connect'] as List<dynamic>?)?.map((e) =>
              CommentWhereUniqueInput.fromJson(e as Map<String, dynamic>)),
          update: (json['update'] as List<dynamic>?)?.map((e) =>
              CommentUpdateWithWhereUniqueWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          updateMany: (json['updateMany'] as List<dynamic>?)?.map((e) =>
              CommentUpdateManyWithWhereWithoutPostInput.fromJson(
                  e as Map<String, dynamic>)),
          deleteMany: (json['deleteMany'] as List<dynamic>?)?.map((e) =>
              CommentScalarWhereInput.fromJson(e as Map<String, dynamic>)),
        );

Map<String, dynamic> _$CommentUncheckedUpdateManyWithoutPostNestedInputToJson(
    CommentUncheckedUpdateManyWithoutPostNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.map((e) => e.toJson()).toList());
  writeNotNull('connectOrCreate',
      instance.connectOrCreate?.map((e) => e.toJson()).toList());
  writeNotNull('upsert', instance.upsert?.map((e) => e.toJson()).toList());
  writeNotNull('createMany', instance.createMany?.toJson());
  writeNotNull('set', instance.set?.map((e) => e.toJson()).toList());
  writeNotNull(
      'disconnect', instance.disconnect?.map((e) => e.toJson()).toList());
  writeNotNull('delete', instance.delete?.map((e) => e.toJson()).toList());
  writeNotNull('connect', instance.connect?.map((e) => e.toJson()).toList());
  writeNotNull('update', instance.update?.map((e) => e.toJson()).toList());
  writeNotNull(
      'updateMany', instance.updateMany?.map((e) => e.toJson()).toList());
  writeNotNull(
      'deleteMany', instance.deleteMany?.map((e) => e.toJson()).toList());
  return val;
}

PostCreateNestedOneWithoutCommentsInput
    _$PostCreateNestedOneWithoutCommentsInputFromJson(
            Map<String, dynamic> json) =>
        PostCreateNestedOneWithoutCommentsInput(
          create: json['create'] == null
              ? null
              : PostCreateWithoutCommentsInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : PostCreateOrConnectWithoutCommentsInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : PostWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostCreateNestedOneWithoutCommentsInputToJson(
    PostCreateNestedOneWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  return val;
}

UserCreateNestedOneWithoutCommentsInput
    _$UserCreateNestedOneWithoutCommentsInputFromJson(
            Map<String, dynamic> json) =>
        UserCreateNestedOneWithoutCommentsInput(
          create: json['create'] == null
              ? null
              : UserCreateWithoutCommentsInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : UserCreateOrConnectWithoutCommentsInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : UserWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserCreateNestedOneWithoutCommentsInputToJson(
    UserCreateNestedOneWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  return val;
}

PostUpdateOneRequiredWithoutCommentsNestedInput
    _$PostUpdateOneRequiredWithoutCommentsNestedInputFromJson(
            Map<String, dynamic> json) =>
        PostUpdateOneRequiredWithoutCommentsNestedInput(
          create: json['create'] == null
              ? null
              : PostCreateWithoutCommentsInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : PostCreateOrConnectWithoutCommentsInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          upsert: json['upsert'] == null
              ? null
              : PostUpsertWithoutCommentsInput.fromJson(
                  json['upsert'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : PostWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
          update: json['update'] == null
              ? null
              : PostUpdateToOneWithWhereWithoutCommentsInput.fromJson(
                  json['update'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostUpdateOneRequiredWithoutCommentsNestedInputToJson(
    PostUpdateOneRequiredWithoutCommentsNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('upsert', instance.upsert?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  writeNotNull('update', instance.update?.toJson());
  return val;
}

UserUpdateOneRequiredWithoutCommentsNestedInput
    _$UserUpdateOneRequiredWithoutCommentsNestedInputFromJson(
            Map<String, dynamic> json) =>
        UserUpdateOneRequiredWithoutCommentsNestedInput(
          create: json['create'] == null
              ? null
              : UserCreateWithoutCommentsInput.fromJson(
                  json['create'] as Map<String, dynamic>),
          connectOrCreate: json['connectOrCreate'] == null
              ? null
              : UserCreateOrConnectWithoutCommentsInput.fromJson(
                  json['connectOrCreate'] as Map<String, dynamic>),
          upsert: json['upsert'] == null
              ? null
              : UserUpsertWithoutCommentsInput.fromJson(
                  json['upsert'] as Map<String, dynamic>),
          connect: json['connect'] == null
              ? null
              : UserWhereUniqueInput.fromJson(
                  json['connect'] as Map<String, dynamic>),
          update: json['update'] == null
              ? null
              : UserUpdateToOneWithWhereWithoutCommentsInput.fromJson(
                  json['update'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserUpdateOneRequiredWithoutCommentsNestedInputToJson(
    UserUpdateOneRequiredWithoutCommentsNestedInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('create', instance.create?.toJson());
  writeNotNull('connectOrCreate', instance.connectOrCreate?.toJson());
  writeNotNull('upsert', instance.upsert?.toJson());
  writeNotNull('connect', instance.connect?.toJson());
  writeNotNull('update', instance.update?.toJson());
  return val;
}

NestedIntFilter _$NestedIntFilterFromJson(Map<String, dynamic> json) =>
    NestedIntFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedIntFilterToJson(NestedIntFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedStringFilter _$NestedStringFilterFromJson(Map<String, dynamic> json) =>
    NestedStringFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedStringFilterToJson(NestedStringFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedIntWithAggregatesFilter _$NestedIntWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    NestedIntWithAggregatesFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $avg: json['_avg'] == null
          ? null
          : NestedFloatFilter.fromJson(json['_avg'] as Map<String, dynamic>),
      $sum: json['_sum'] == null
          ? null
          : NestedIntFilter.fromJson(json['_sum'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedIntFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedIntFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedIntWithAggregatesFilterToJson(
    NestedIntWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_avg', instance.$avg?.toJson());
  writeNotNull('_sum', instance.$sum?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

NestedFloatFilter _$NestedFloatFilterFromJson(Map<String, dynamic> json) =>
    NestedFloatFilter(
      equals: (json['equals'] as num?)?.toDouble(),
      $in: (json['in'] as List<dynamic>?)?.map((e) => (e as num).toDouble()),
      notIn:
          (json['notIn'] as List<dynamic>?)?.map((e) => (e as num).toDouble()),
      lt: (json['lt'] as num?)?.toDouble(),
      lte: (json['lte'] as num?)?.toDouble(),
      gt: (json['gt'] as num?)?.toDouble(),
      gte: (json['gte'] as num?)?.toDouble(),
      not: json['not'] == null
          ? null
          : NestedFloatFilter.fromJson(json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedFloatFilterToJson(NestedFloatFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedStringWithAggregatesFilter _$NestedStringWithAggregatesFilterFromJson(
        Map<String, dynamic> json) =>
    NestedStringWithAggregatesFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringWithAggregatesFilter.fromJson(
              json['not'] as Map<String, dynamic>),
      $count: json['_count'] == null
          ? null
          : NestedIntFilter.fromJson(json['_count'] as Map<String, dynamic>),
      $min: json['_min'] == null
          ? null
          : NestedStringFilter.fromJson(json['_min'] as Map<String, dynamic>),
      $max: json['_max'] == null
          ? null
          : NestedStringFilter.fromJson(json['_max'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedStringWithAggregatesFilterToJson(
    NestedStringWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

NestedStringNullableFilter _$NestedStringNullableFilterFromJson(
        Map<String, dynamic> json) =>
    NestedStringNullableFilter(
      equals: json['equals'] as String?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
      lt: json['lt'] as String?,
      lte: json['lte'] as String?,
      gt: json['gt'] as String?,
      gte: json['gte'] as String?,
      contains: json['contains'] as String?,
      startsWith: json['startsWith'] as String?,
      endsWith: json['endsWith'] as String?,
      not: json['not'] == null
          ? null
          : NestedStringNullableFilter.fromJson(
              json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedStringNullableFilterToJson(
    NestedStringNullableFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

NestedStringNullableWithAggregatesFilter
    _$NestedStringNullableWithAggregatesFilterFromJson(
            Map<String, dynamic> json) =>
        NestedStringNullableWithAggregatesFilter(
          equals: json['equals'] as String?,
          $in: (json['in'] as List<dynamic>?)?.map((e) => e as String),
          notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as String),
          lt: json['lt'] as String?,
          lte: json['lte'] as String?,
          gt: json['gt'] as String?,
          gte: json['gte'] as String?,
          contains: json['contains'] as String?,
          startsWith: json['startsWith'] as String?,
          endsWith: json['endsWith'] as String?,
          not: json['not'] == null
              ? null
              : NestedStringNullableWithAggregatesFilter.fromJson(
                  json['not'] as Map<String, dynamic>),
          $count: json['_count'] == null
              ? null
              : NestedIntNullableFilter.fromJson(
                  json['_count'] as Map<String, dynamic>),
          $min: json['_min'] == null
              ? null
              : NestedStringNullableFilter.fromJson(
                  json['_min'] as Map<String, dynamic>),
          $max: json['_max'] == null
              ? null
              : NestedStringNullableFilter.fromJson(
                  json['_max'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$NestedStringNullableWithAggregatesFilterToJson(
    NestedStringNullableWithAggregatesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('contains', instance.contains);
  writeNotNull('startsWith', instance.startsWith);
  writeNotNull('endsWith', instance.endsWith);
  writeNotNull('not', instance.not?.toJson());
  writeNotNull('_count', instance.$count?.toJson());
  writeNotNull('_min', instance.$min?.toJson());
  writeNotNull('_max', instance.$max?.toJson());
  return val;
}

NestedIntNullableFilter _$NestedIntNullableFilterFromJson(
        Map<String, dynamic> json) =>
    NestedIntNullableFilter(
      equals: json['equals'] as int?,
      $in: (json['in'] as List<dynamic>?)?.map((e) => e as int),
      notIn: (json['notIn'] as List<dynamic>?)?.map((e) => e as int),
      lt: json['lt'] as int?,
      lte: json['lte'] as int?,
      gt: json['gt'] as int?,
      gte: json['gte'] as int?,
      not: json['not'] == null
          ? null
          : NestedIntNullableFilter.fromJson(
              json['not'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NestedIntNullableFilterToJson(
    NestedIntNullableFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('equals', instance.equals);
  writeNotNull('in', instance.$in?.toList());
  writeNotNull('notIn', instance.notIn?.toList());
  writeNotNull('lt', instance.lt);
  writeNotNull('lte', instance.lte);
  writeNotNull('gt', instance.gt);
  writeNotNull('gte', instance.gte);
  writeNotNull('not', instance.not?.toJson());
  return val;
}

PostCreateWithoutUserInput _$PostCreateWithoutUserInputFromJson(
        Map<String, dynamic> json) =>
    PostCreateWithoutUserInput(
      imageId: json['imageId'] as String?,
      ext: json['ext'] as String?,
      content: json['content'] as String,
      comments: json['comments'] == null
          ? null
          : CommentCreateNestedManyWithoutPostInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostCreateWithoutUserInputToJson(
    PostCreateWithoutUserInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageId', instance.imageId);
  writeNotNull('ext', instance.ext);
  val['content'] = instance.content;
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostUncheckedCreateWithoutUserInput
    _$PostUncheckedCreateWithoutUserInputFromJson(Map<String, dynamic> json) =>
        PostUncheckedCreateWithoutUserInput(
          id: json['id'] as int?,
          imageId: json['imageId'] as String?,
          ext: json['ext'] as String?,
          content: json['content'] as String,
          comments: json['comments'] == null
              ? null
              : CommentUncheckedCreateNestedManyWithoutPostInput.fromJson(
                  json['comments'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostUncheckedCreateWithoutUserInputToJson(
    PostUncheckedCreateWithoutUserInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('imageId', instance.imageId);
  writeNotNull('ext', instance.ext);
  val['content'] = instance.content;
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostCreateOrConnectWithoutUserInput
    _$PostCreateOrConnectWithoutUserInputFromJson(Map<String, dynamic> json) =>
        PostCreateOrConnectWithoutUserInput(
          where: PostWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: PostCreateWithoutUserInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostCreateOrConnectWithoutUserInputToJson(
        PostCreateOrConnectWithoutUserInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

PostCreateManyUserInputEnvelope _$PostCreateManyUserInputEnvelopeFromJson(
        Map<String, dynamic> json) =>
    PostCreateManyUserInputEnvelope(
      data: (json['data'] as List<dynamic>).map(
          (e) => PostCreateManyUserInput.fromJson(e as Map<String, dynamic>)),
      skipDuplicates: json['skipDuplicates'] as bool?,
    );

Map<String, dynamic> _$PostCreateManyUserInputEnvelopeToJson(
    PostCreateManyUserInputEnvelope instance) {
  final val = <String, dynamic>{
    'data': instance.data.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('skipDuplicates', instance.skipDuplicates);
  return val;
}

CommentCreateWithoutAuthorInput _$CommentCreateWithoutAuthorInputFromJson(
        Map<String, dynamic> json) =>
    CommentCreateWithoutAuthorInput(
      content: json['content'] as String,
      post: PostCreateNestedOneWithoutCommentsInput.fromJson(
          json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentCreateWithoutAuthorInputToJson(
        CommentCreateWithoutAuthorInput instance) =>
    <String, dynamic>{
      'content': instance.content,
      'post': instance.post.toJson(),
    };

CommentUncheckedCreateWithoutAuthorInput
    _$CommentUncheckedCreateWithoutAuthorInputFromJson(
            Map<String, dynamic> json) =>
        CommentUncheckedCreateWithoutAuthorInput(
          id: json['id'] as int?,
          content: json['content'] as String,
          postId: json['postId'] as int,
        );

Map<String, dynamic> _$CommentUncheckedCreateWithoutAuthorInputToJson(
    CommentUncheckedCreateWithoutAuthorInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['content'] = instance.content;
  val['postId'] = instance.postId;
  return val;
}

CommentCreateOrConnectWithoutAuthorInput
    _$CommentCreateOrConnectWithoutAuthorInputFromJson(
            Map<String, dynamic> json) =>
        CommentCreateOrConnectWithoutAuthorInput(
          where: CommentWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: CommentCreateWithoutAuthorInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentCreateOrConnectWithoutAuthorInputToJson(
        CommentCreateOrConnectWithoutAuthorInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

CommentCreateManyAuthorInputEnvelope
    _$CommentCreateManyAuthorInputEnvelopeFromJson(Map<String, dynamic> json) =>
        CommentCreateManyAuthorInputEnvelope(
          data: (json['data'] as List<dynamic>).map((e) =>
              CommentCreateManyAuthorInput.fromJson(e as Map<String, dynamic>)),
          skipDuplicates: json['skipDuplicates'] as bool?,
        );

Map<String, dynamic> _$CommentCreateManyAuthorInputEnvelopeToJson(
    CommentCreateManyAuthorInputEnvelope instance) {
  final val = <String, dynamic>{
    'data': instance.data.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('skipDuplicates', instance.skipDuplicates);
  return val;
}

PostUpsertWithWhereUniqueWithoutUserInput
    _$PostUpsertWithWhereUniqueWithoutUserInputFromJson(
            Map<String, dynamic> json) =>
        PostUpsertWithWhereUniqueWithoutUserInput(
          where: PostWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          update: PostUpdateWithoutUserInput.fromJson(
              json['update'] as Map<String, dynamic>),
          create: PostCreateWithoutUserInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostUpsertWithWhereUniqueWithoutUserInputToJson(
        PostUpsertWithWhereUniqueWithoutUserInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'update': instance.update.toJson(),
      'create': instance.create.toJson(),
    };

PostUpdateWithWhereUniqueWithoutUserInput
    _$PostUpdateWithWhereUniqueWithoutUserInputFromJson(
            Map<String, dynamic> json) =>
        PostUpdateWithWhereUniqueWithoutUserInput(
          where: PostWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: PostUpdateWithoutUserInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostUpdateWithWhereUniqueWithoutUserInputToJson(
        PostUpdateWithWhereUniqueWithoutUserInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'data': instance.data.toJson(),
    };

PostUpdateManyWithWhereWithoutUserInput
    _$PostUpdateManyWithWhereWithoutUserInputFromJson(
            Map<String, dynamic> json) =>
        PostUpdateManyWithWhereWithoutUserInput(
          where: PostScalarWhereInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: PostUpdateManyMutationInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostUpdateManyWithWhereWithoutUserInputToJson(
        PostUpdateManyWithWhereWithoutUserInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'data': instance.data.toJson(),
    };

PostScalarWhereInput _$PostScalarWhereInputFromJson(
        Map<String, dynamic> json) =>
    PostScalarWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map(
          (e) => PostScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map(
          (e) => PostScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map(
          (e) => PostScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : IntFilter.fromJson(json['id'] as Map<String, dynamic>),
      imageId: json['imageId'] == null
          ? null
          : StringNullableFilter.fromJson(
              json['imageId'] as Map<String, dynamic>),
      ext: json['ext'] == null
          ? null
          : StringNullableFilter.fromJson(json['ext'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFilter.fromJson(json['content'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntFilter.fromJson(json['userId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostScalarWhereInputToJson(
    PostScalarWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  return val;
}

CommentUpsertWithWhereUniqueWithoutAuthorInput
    _$CommentUpsertWithWhereUniqueWithoutAuthorInputFromJson(
            Map<String, dynamic> json) =>
        CommentUpsertWithWhereUniqueWithoutAuthorInput(
          where: CommentWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          update: CommentUpdateWithoutAuthorInput.fromJson(
              json['update'] as Map<String, dynamic>),
          create: CommentCreateWithoutAuthorInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentUpsertWithWhereUniqueWithoutAuthorInputToJson(
        CommentUpsertWithWhereUniqueWithoutAuthorInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'update': instance.update.toJson(),
      'create': instance.create.toJson(),
    };

CommentUpdateWithWhereUniqueWithoutAuthorInput
    _$CommentUpdateWithWhereUniqueWithoutAuthorInputFromJson(
            Map<String, dynamic> json) =>
        CommentUpdateWithWhereUniqueWithoutAuthorInput(
          where: CommentWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: CommentUpdateWithoutAuthorInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentUpdateWithWhereUniqueWithoutAuthorInputToJson(
        CommentUpdateWithWhereUniqueWithoutAuthorInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'data': instance.data.toJson(),
    };

CommentUpdateManyWithWhereWithoutAuthorInput
    _$CommentUpdateManyWithWhereWithoutAuthorInputFromJson(
            Map<String, dynamic> json) =>
        CommentUpdateManyWithWhereWithoutAuthorInput(
          where: CommentScalarWhereInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: CommentUpdateManyMutationInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentUpdateManyWithWhereWithoutAuthorInputToJson(
        CommentUpdateManyWithWhereWithoutAuthorInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'data': instance.data.toJson(),
    };

CommentScalarWhereInput _$CommentScalarWhereInputFromJson(
        Map<String, dynamic> json) =>
    CommentScalarWhereInput(
      AND: (json['AND'] as List<dynamic>?)?.map(
          (e) => CommentScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      OR: (json['OR'] as List<dynamic>?)?.map(
          (e) => CommentScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      NOT: (json['NOT'] as List<dynamic>?)?.map(
          (e) => CommentScalarWhereInput.fromJson(e as Map<String, dynamic>)),
      id: json['id'] == null
          ? null
          : IntFilter.fromJson(json['id'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFilter.fromJson(json['content'] as Map<String, dynamic>),
      postId: json['postId'] == null
          ? null
          : IntFilter.fromJson(json['postId'] as Map<String, dynamic>),
      userId: json['userId'] == null
          ? null
          : IntFilter.fromJson(json['userId'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentScalarWhereInputToJson(
    CommentScalarWhereInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AND', instance.AND?.map((e) => e.toJson()).toList());
  writeNotNull('OR', instance.OR?.map((e) => e.toJson()).toList());
  writeNotNull('NOT', instance.NOT?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('postId', instance.postId?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  return val;
}

UserCreateWithoutPostsInput _$UserCreateWithoutPostsInputFromJson(
        Map<String, dynamic> json) =>
    UserCreateWithoutPostsInput(
      username: json['username'] as String,
      passwordHash: json['passwordHash'] as String,
      comments: json['comments'] == null
          ? null
          : CommentCreateNestedManyWithoutAuthorInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCreateWithoutPostsInputToJson(
    UserCreateWithoutPostsInput instance) {
  final val = <String, dynamic>{
    'username': instance.username,
    'passwordHash': instance.passwordHash,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

UserUncheckedCreateWithoutPostsInput
    _$UserUncheckedCreateWithoutPostsInputFromJson(Map<String, dynamic> json) =>
        UserUncheckedCreateWithoutPostsInput(
          id: json['id'] as int?,
          username: json['username'] as String,
          passwordHash: json['passwordHash'] as String,
          comments: json['comments'] == null
              ? null
              : CommentUncheckedCreateNestedManyWithoutAuthorInput.fromJson(
                  json['comments'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserUncheckedCreateWithoutPostsInputToJson(
    UserUncheckedCreateWithoutPostsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['username'] = instance.username;
  val['passwordHash'] = instance.passwordHash;
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

UserCreateOrConnectWithoutPostsInput
    _$UserCreateOrConnectWithoutPostsInputFromJson(Map<String, dynamic> json) =>
        UserCreateOrConnectWithoutPostsInput(
          where: UserWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: UserCreateWithoutPostsInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserCreateOrConnectWithoutPostsInputToJson(
        UserCreateOrConnectWithoutPostsInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

CommentCreateWithoutPostInput _$CommentCreateWithoutPostInputFromJson(
        Map<String, dynamic> json) =>
    CommentCreateWithoutPostInput(
      content: json['content'] as String,
      author: UserCreateNestedOneWithoutCommentsInput.fromJson(
          json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentCreateWithoutPostInputToJson(
        CommentCreateWithoutPostInput instance) =>
    <String, dynamic>{
      'content': instance.content,
      'author': instance.author.toJson(),
    };

CommentUncheckedCreateWithoutPostInput
    _$CommentUncheckedCreateWithoutPostInputFromJson(
            Map<String, dynamic> json) =>
        CommentUncheckedCreateWithoutPostInput(
          id: json['id'] as int?,
          content: json['content'] as String,
          userId: json['userId'] as int,
        );

Map<String, dynamic> _$CommentUncheckedCreateWithoutPostInputToJson(
    CommentUncheckedCreateWithoutPostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['content'] = instance.content;
  val['userId'] = instance.userId;
  return val;
}

CommentCreateOrConnectWithoutPostInput
    _$CommentCreateOrConnectWithoutPostInputFromJson(
            Map<String, dynamic> json) =>
        CommentCreateOrConnectWithoutPostInput(
          where: CommentWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: CommentCreateWithoutPostInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentCreateOrConnectWithoutPostInputToJson(
        CommentCreateOrConnectWithoutPostInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

CommentCreateManyPostInputEnvelope _$CommentCreateManyPostInputEnvelopeFromJson(
        Map<String, dynamic> json) =>
    CommentCreateManyPostInputEnvelope(
      data: (json['data'] as List<dynamic>).map((e) =>
          CommentCreateManyPostInput.fromJson(e as Map<String, dynamic>)),
      skipDuplicates: json['skipDuplicates'] as bool?,
    );

Map<String, dynamic> _$CommentCreateManyPostInputEnvelopeToJson(
    CommentCreateManyPostInputEnvelope instance) {
  final val = <String, dynamic>{
    'data': instance.data.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('skipDuplicates', instance.skipDuplicates);
  return val;
}

UserUpsertWithoutPostsInput _$UserUpsertWithoutPostsInputFromJson(
        Map<String, dynamic> json) =>
    UserUpsertWithoutPostsInput(
      update: UserUpdateWithoutPostsInput.fromJson(
          json['update'] as Map<String, dynamic>),
      create: UserCreateWithoutPostsInput.fromJson(
          json['create'] as Map<String, dynamic>),
      where: json['where'] == null
          ? null
          : UserWhereInput.fromJson(json['where'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUpsertWithoutPostsInputToJson(
    UserUpsertWithoutPostsInput instance) {
  final val = <String, dynamic>{
    'update': instance.update.toJson(),
    'create': instance.create.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('where', instance.where?.toJson());
  return val;
}

UserUpdateToOneWithWhereWithoutPostsInput
    _$UserUpdateToOneWithWhereWithoutPostsInputFromJson(
            Map<String, dynamic> json) =>
        UserUpdateToOneWithWhereWithoutPostsInput(
          where: json['where'] == null
              ? null
              : UserWhereInput.fromJson(json['where'] as Map<String, dynamic>),
          data: UserUpdateWithoutPostsInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserUpdateToOneWithWhereWithoutPostsInputToJson(
    UserUpdateToOneWithWhereWithoutPostsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('where', instance.where?.toJson());
  val['data'] = instance.data.toJson();
  return val;
}

UserUpdateWithoutPostsInput _$UserUpdateWithoutPostsInputFromJson(
        Map<String, dynamic> json) =>
    UserUpdateWithoutPostsInput(
      username: json['username'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['username'] as Map<String, dynamic>),
      passwordHash: json['passwordHash'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['passwordHash'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentUpdateManyWithoutAuthorNestedInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUpdateWithoutPostsInputToJson(
    UserUpdateWithoutPostsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username?.toJson());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

UserUncheckedUpdateWithoutPostsInput
    _$UserUncheckedUpdateWithoutPostsInputFromJson(Map<String, dynamic> json) =>
        UserUncheckedUpdateWithoutPostsInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          username: json['username'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['username'] as Map<String, dynamic>),
          passwordHash: json['passwordHash'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['passwordHash'] as Map<String, dynamic>),
          comments: json['comments'] == null
              ? null
              : CommentUncheckedUpdateManyWithoutAuthorNestedInput.fromJson(
                  json['comments'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserUncheckedUpdateWithoutPostsInputToJson(
    UserUncheckedUpdateWithoutPostsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('username', instance.username?.toJson());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

CommentUpsertWithWhereUniqueWithoutPostInput
    _$CommentUpsertWithWhereUniqueWithoutPostInputFromJson(
            Map<String, dynamic> json) =>
        CommentUpsertWithWhereUniqueWithoutPostInput(
          where: CommentWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          update: CommentUpdateWithoutPostInput.fromJson(
              json['update'] as Map<String, dynamic>),
          create: CommentCreateWithoutPostInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentUpsertWithWhereUniqueWithoutPostInputToJson(
        CommentUpsertWithWhereUniqueWithoutPostInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'update': instance.update.toJson(),
      'create': instance.create.toJson(),
    };

CommentUpdateWithWhereUniqueWithoutPostInput
    _$CommentUpdateWithWhereUniqueWithoutPostInputFromJson(
            Map<String, dynamic> json) =>
        CommentUpdateWithWhereUniqueWithoutPostInput(
          where: CommentWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: CommentUpdateWithoutPostInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentUpdateWithWhereUniqueWithoutPostInputToJson(
        CommentUpdateWithWhereUniqueWithoutPostInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'data': instance.data.toJson(),
    };

CommentUpdateManyWithWhereWithoutPostInput
    _$CommentUpdateManyWithWhereWithoutPostInputFromJson(
            Map<String, dynamic> json) =>
        CommentUpdateManyWithWhereWithoutPostInput(
          where: CommentScalarWhereInput.fromJson(
              json['where'] as Map<String, dynamic>),
          data: CommentUpdateManyMutationInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentUpdateManyWithWhereWithoutPostInputToJson(
        CommentUpdateManyWithWhereWithoutPostInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'data': instance.data.toJson(),
    };

PostCreateWithoutCommentsInput _$PostCreateWithoutCommentsInputFromJson(
        Map<String, dynamic> json) =>
    PostCreateWithoutCommentsInput(
      imageId: json['imageId'] as String?,
      ext: json['ext'] as String?,
      content: json['content'] as String,
      user: UserCreateNestedOneWithoutPostsInput.fromJson(
          json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostCreateWithoutCommentsInputToJson(
    PostCreateWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageId', instance.imageId);
  writeNotNull('ext', instance.ext);
  val['content'] = instance.content;
  val['user'] = instance.user.toJson();
  return val;
}

PostUncheckedCreateWithoutCommentsInput
    _$PostUncheckedCreateWithoutCommentsInputFromJson(
            Map<String, dynamic> json) =>
        PostUncheckedCreateWithoutCommentsInput(
          id: json['id'] as int?,
          imageId: json['imageId'] as String?,
          ext: json['ext'] as String?,
          content: json['content'] as String,
          userId: json['userId'] as int,
        );

Map<String, dynamic> _$PostUncheckedCreateWithoutCommentsInputToJson(
    PostUncheckedCreateWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('imageId', instance.imageId);
  writeNotNull('ext', instance.ext);
  val['content'] = instance.content;
  val['userId'] = instance.userId;
  return val;
}

PostCreateOrConnectWithoutCommentsInput
    _$PostCreateOrConnectWithoutCommentsInputFromJson(
            Map<String, dynamic> json) =>
        PostCreateOrConnectWithoutCommentsInput(
          where: PostWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: PostCreateWithoutCommentsInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostCreateOrConnectWithoutCommentsInputToJson(
        PostCreateOrConnectWithoutCommentsInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

UserCreateWithoutCommentsInput _$UserCreateWithoutCommentsInputFromJson(
        Map<String, dynamic> json) =>
    UserCreateWithoutCommentsInput(
      username: json['username'] as String,
      passwordHash: json['passwordHash'] as String,
      posts: json['posts'] == null
          ? null
          : PostCreateNestedManyWithoutUserInput.fromJson(
              json['posts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserCreateWithoutCommentsInputToJson(
    UserCreateWithoutCommentsInput instance) {
  final val = <String, dynamic>{
    'username': instance.username,
    'passwordHash': instance.passwordHash,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('posts', instance.posts?.toJson());
  return val;
}

UserUncheckedCreateWithoutCommentsInput
    _$UserUncheckedCreateWithoutCommentsInputFromJson(
            Map<String, dynamic> json) =>
        UserUncheckedCreateWithoutCommentsInput(
          id: json['id'] as int?,
          username: json['username'] as String,
          passwordHash: json['passwordHash'] as String,
          posts: json['posts'] == null
              ? null
              : PostUncheckedCreateNestedManyWithoutUserInput.fromJson(
                  json['posts'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserUncheckedCreateWithoutCommentsInputToJson(
    UserUncheckedCreateWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['username'] = instance.username;
  val['passwordHash'] = instance.passwordHash;
  writeNotNull('posts', instance.posts?.toJson());
  return val;
}

UserCreateOrConnectWithoutCommentsInput
    _$UserCreateOrConnectWithoutCommentsInputFromJson(
            Map<String, dynamic> json) =>
        UserCreateOrConnectWithoutCommentsInput(
          where: UserWhereUniqueInput.fromJson(
              json['where'] as Map<String, dynamic>),
          create: UserCreateWithoutCommentsInput.fromJson(
              json['create'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserCreateOrConnectWithoutCommentsInputToJson(
        UserCreateOrConnectWithoutCommentsInput instance) =>
    <String, dynamic>{
      'where': instance.where.toJson(),
      'create': instance.create.toJson(),
    };

PostUpsertWithoutCommentsInput _$PostUpsertWithoutCommentsInputFromJson(
        Map<String, dynamic> json) =>
    PostUpsertWithoutCommentsInput(
      update: PostUpdateWithoutCommentsInput.fromJson(
          json['update'] as Map<String, dynamic>),
      create: PostCreateWithoutCommentsInput.fromJson(
          json['create'] as Map<String, dynamic>),
      where: json['where'] == null
          ? null
          : PostWhereInput.fromJson(json['where'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostUpsertWithoutCommentsInputToJson(
    PostUpsertWithoutCommentsInput instance) {
  final val = <String, dynamic>{
    'update': instance.update.toJson(),
    'create': instance.create.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('where', instance.where?.toJson());
  return val;
}

PostUpdateToOneWithWhereWithoutCommentsInput
    _$PostUpdateToOneWithWhereWithoutCommentsInputFromJson(
            Map<String, dynamic> json) =>
        PostUpdateToOneWithWhereWithoutCommentsInput(
          where: json['where'] == null
              ? null
              : PostWhereInput.fromJson(json['where'] as Map<String, dynamic>),
          data: PostUpdateWithoutCommentsInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostUpdateToOneWithWhereWithoutCommentsInputToJson(
    PostUpdateToOneWithWhereWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('where', instance.where?.toJson());
  val['data'] = instance.data.toJson();
  return val;
}

PostUpdateWithoutCommentsInput _$PostUpdateWithoutCommentsInputFromJson(
        Map<String, dynamic> json) =>
    PostUpdateWithoutCommentsInput(
      imageId: json['imageId'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['imageId'] as Map<String, dynamic>),
      ext: json['ext'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['ext'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
      user: json['user'] == null
          ? null
          : UserUpdateOneRequiredWithoutPostsNestedInput.fromJson(
              json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostUpdateWithoutCommentsInputToJson(
    PostUpdateWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('user', instance.user?.toJson());
  return val;
}

PostUncheckedUpdateWithoutCommentsInput
    _$PostUncheckedUpdateWithoutCommentsInputFromJson(
            Map<String, dynamic> json) =>
        PostUncheckedUpdateWithoutCommentsInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          imageId: json['imageId'] == null
              ? null
              : NullableStringFieldUpdateOperationsInput.fromJson(
                  json['imageId'] as Map<String, dynamic>),
          ext: json['ext'] == null
              ? null
              : NullableStringFieldUpdateOperationsInput.fromJson(
                  json['ext'] as Map<String, dynamic>),
          content: json['content'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['content'] as Map<String, dynamic>),
          userId: json['userId'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['userId'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostUncheckedUpdateWithoutCommentsInputToJson(
    PostUncheckedUpdateWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  return val;
}

UserUpsertWithoutCommentsInput _$UserUpsertWithoutCommentsInputFromJson(
        Map<String, dynamic> json) =>
    UserUpsertWithoutCommentsInput(
      update: UserUpdateWithoutCommentsInput.fromJson(
          json['update'] as Map<String, dynamic>),
      create: UserCreateWithoutCommentsInput.fromJson(
          json['create'] as Map<String, dynamic>),
      where: json['where'] == null
          ? null
          : UserWhereInput.fromJson(json['where'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUpsertWithoutCommentsInputToJson(
    UserUpsertWithoutCommentsInput instance) {
  final val = <String, dynamic>{
    'update': instance.update.toJson(),
    'create': instance.create.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('where', instance.where?.toJson());
  return val;
}

UserUpdateToOneWithWhereWithoutCommentsInput
    _$UserUpdateToOneWithWhereWithoutCommentsInputFromJson(
            Map<String, dynamic> json) =>
        UserUpdateToOneWithWhereWithoutCommentsInput(
          where: json['where'] == null
              ? null
              : UserWhereInput.fromJson(json['where'] as Map<String, dynamic>),
          data: UserUpdateWithoutCommentsInput.fromJson(
              json['data'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserUpdateToOneWithWhereWithoutCommentsInputToJson(
    UserUpdateToOneWithWhereWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('where', instance.where?.toJson());
  val['data'] = instance.data.toJson();
  return val;
}

UserUpdateWithoutCommentsInput _$UserUpdateWithoutCommentsInputFromJson(
        Map<String, dynamic> json) =>
    UserUpdateWithoutCommentsInput(
      username: json['username'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['username'] as Map<String, dynamic>),
      passwordHash: json['passwordHash'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['passwordHash'] as Map<String, dynamic>),
      posts: json['posts'] == null
          ? null
          : PostUpdateManyWithoutUserNestedInput.fromJson(
              json['posts'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserUpdateWithoutCommentsInputToJson(
    UserUpdateWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('username', instance.username?.toJson());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  writeNotNull('posts', instance.posts?.toJson());
  return val;
}

UserUncheckedUpdateWithoutCommentsInput
    _$UserUncheckedUpdateWithoutCommentsInputFromJson(
            Map<String, dynamic> json) =>
        UserUncheckedUpdateWithoutCommentsInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          username: json['username'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['username'] as Map<String, dynamic>),
          passwordHash: json['passwordHash'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['passwordHash'] as Map<String, dynamic>),
          posts: json['posts'] == null
              ? null
              : PostUncheckedUpdateManyWithoutUserNestedInput.fromJson(
                  json['posts'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$UserUncheckedUpdateWithoutCommentsInputToJson(
    UserUncheckedUpdateWithoutCommentsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('username', instance.username?.toJson());
  writeNotNull('passwordHash', instance.passwordHash?.toJson());
  writeNotNull('posts', instance.posts?.toJson());
  return val;
}

PostCreateManyUserInput _$PostCreateManyUserInputFromJson(
        Map<String, dynamic> json) =>
    PostCreateManyUserInput(
      id: json['id'] as int?,
      imageId: json['imageId'] as String?,
      ext: json['ext'] as String?,
      content: json['content'] as String,
    );

Map<String, dynamic> _$PostCreateManyUserInputToJson(
    PostCreateManyUserInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('imageId', instance.imageId);
  writeNotNull('ext', instance.ext);
  val['content'] = instance.content;
  return val;
}

CommentCreateManyAuthorInput _$CommentCreateManyAuthorInputFromJson(
        Map<String, dynamic> json) =>
    CommentCreateManyAuthorInput(
      id: json['id'] as int?,
      content: json['content'] as String,
      postId: json['postId'] as int,
    );

Map<String, dynamic> _$CommentCreateManyAuthorInputToJson(
    CommentCreateManyAuthorInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['content'] = instance.content;
  val['postId'] = instance.postId;
  return val;
}

PostUpdateWithoutUserInput _$PostUpdateWithoutUserInputFromJson(
        Map<String, dynamic> json) =>
    PostUpdateWithoutUserInput(
      imageId: json['imageId'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['imageId'] as Map<String, dynamic>),
      ext: json['ext'] == null
          ? null
          : NullableStringFieldUpdateOperationsInput.fromJson(
              json['ext'] as Map<String, dynamic>),
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
      comments: json['comments'] == null
          ? null
          : CommentUpdateManyWithoutPostNestedInput.fromJson(
              json['comments'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostUpdateWithoutUserInputToJson(
    PostUpdateWithoutUserInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostUncheckedUpdateWithoutUserInput
    _$PostUncheckedUpdateWithoutUserInputFromJson(Map<String, dynamic> json) =>
        PostUncheckedUpdateWithoutUserInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          imageId: json['imageId'] == null
              ? null
              : NullableStringFieldUpdateOperationsInput.fromJson(
                  json['imageId'] as Map<String, dynamic>),
          ext: json['ext'] == null
              ? null
              : NullableStringFieldUpdateOperationsInput.fromJson(
                  json['ext'] as Map<String, dynamic>),
          content: json['content'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['content'] as Map<String, dynamic>),
          comments: json['comments'] == null
              ? null
              : CommentUncheckedUpdateManyWithoutPostNestedInput.fromJson(
                  json['comments'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostUncheckedUpdateWithoutUserInputToJson(
    PostUncheckedUpdateWithoutUserInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('comments', instance.comments?.toJson());
  return val;
}

PostUncheckedUpdateManyWithoutUserInput
    _$PostUncheckedUpdateManyWithoutUserInputFromJson(
            Map<String, dynamic> json) =>
        PostUncheckedUpdateManyWithoutUserInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          imageId: json['imageId'] == null
              ? null
              : NullableStringFieldUpdateOperationsInput.fromJson(
                  json['imageId'] as Map<String, dynamic>),
          ext: json['ext'] == null
              ? null
              : NullableStringFieldUpdateOperationsInput.fromJson(
                  json['ext'] as Map<String, dynamic>),
          content: json['content'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['content'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$PostUncheckedUpdateManyWithoutUserInputToJson(
    PostUncheckedUpdateManyWithoutUserInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('imageId', instance.imageId?.toJson());
  writeNotNull('ext', instance.ext?.toJson());
  writeNotNull('content', instance.content?.toJson());
  return val;
}

CommentUpdateWithoutAuthorInput _$CommentUpdateWithoutAuthorInputFromJson(
        Map<String, dynamic> json) =>
    CommentUpdateWithoutAuthorInput(
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
      post: json['post'] == null
          ? null
          : PostUpdateOneRequiredWithoutCommentsNestedInput.fromJson(
              json['post'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentUpdateWithoutAuthorInputToJson(
    CommentUpdateWithoutAuthorInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content?.toJson());
  writeNotNull('post', instance.post?.toJson());
  return val;
}

CommentUncheckedUpdateWithoutAuthorInput
    _$CommentUncheckedUpdateWithoutAuthorInputFromJson(
            Map<String, dynamic> json) =>
        CommentUncheckedUpdateWithoutAuthorInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          content: json['content'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['content'] as Map<String, dynamic>),
          postId: json['postId'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['postId'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentUncheckedUpdateWithoutAuthorInputToJson(
    CommentUncheckedUpdateWithoutAuthorInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('postId', instance.postId?.toJson());
  return val;
}

CommentUncheckedUpdateManyWithoutAuthorInput
    _$CommentUncheckedUpdateManyWithoutAuthorInputFromJson(
            Map<String, dynamic> json) =>
        CommentUncheckedUpdateManyWithoutAuthorInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          content: json['content'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['content'] as Map<String, dynamic>),
          postId: json['postId'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['postId'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentUncheckedUpdateManyWithoutAuthorInputToJson(
    CommentUncheckedUpdateManyWithoutAuthorInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('postId', instance.postId?.toJson());
  return val;
}

CommentCreateManyPostInput _$CommentCreateManyPostInputFromJson(
        Map<String, dynamic> json) =>
    CommentCreateManyPostInput(
      id: json['id'] as int?,
      content: json['content'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$CommentCreateManyPostInputToJson(
    CommentCreateManyPostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['content'] = instance.content;
  val['userId'] = instance.userId;
  return val;
}

CommentUpdateWithoutPostInput _$CommentUpdateWithoutPostInputFromJson(
        Map<String, dynamic> json) =>
    CommentUpdateWithoutPostInput(
      content: json['content'] == null
          ? null
          : StringFieldUpdateOperationsInput.fromJson(
              json['content'] as Map<String, dynamic>),
      author: json['author'] == null
          ? null
          : UserUpdateOneRequiredWithoutCommentsNestedInput.fromJson(
              json['author'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CommentUpdateWithoutPostInputToJson(
    CommentUpdateWithoutPostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('content', instance.content?.toJson());
  writeNotNull('author', instance.author?.toJson());
  return val;
}

CommentUncheckedUpdateWithoutPostInput
    _$CommentUncheckedUpdateWithoutPostInputFromJson(
            Map<String, dynamic> json) =>
        CommentUncheckedUpdateWithoutPostInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          content: json['content'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['content'] as Map<String, dynamic>),
          userId: json['userId'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['userId'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentUncheckedUpdateWithoutPostInputToJson(
    CommentUncheckedUpdateWithoutPostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  return val;
}

CommentUncheckedUpdateManyWithoutPostInput
    _$CommentUncheckedUpdateManyWithoutPostInputFromJson(
            Map<String, dynamic> json) =>
        CommentUncheckedUpdateManyWithoutPostInput(
          id: json['id'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['id'] as Map<String, dynamic>),
          content: json['content'] == null
              ? null
              : StringFieldUpdateOperationsInput.fromJson(
                  json['content'] as Map<String, dynamic>),
          userId: json['userId'] == null
              ? null
              : IntFieldUpdateOperationsInput.fromJson(
                  json['userId'] as Map<String, dynamic>),
        );

Map<String, dynamic> _$CommentUncheckedUpdateManyWithoutPostInputToJson(
    CommentUncheckedUpdateManyWithoutPostInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id?.toJson());
  writeNotNull('content', instance.content?.toJson());
  writeNotNull('userId', instance.userId?.toJson());
  return val;
}

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      username: json['username'] as String,
      passwordHash: json['passwordHash'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'passwordHash': instance.passwordHash,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      id: json['id'] as int,
      imageId: json['imageId'] as String?,
      ext: json['ext'] as String?,
      content: json['content'] as String,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$PostToJson(Post instance) {
  final val = <String, dynamic>{
    'id': instance.id,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('imageId', instance.imageId);
  writeNotNull('ext', instance.ext);
  val['content'] = instance.content;
  val['userId'] = instance.userId;
  return val;
}

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: json['id'] as int,
      content: json['content'] as String,
      postId: json['postId'] as int,
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'content': instance.content,
      'postId': instance.postId,
      'userId': instance.userId,
    };

UserGroupByOutputType _$UserGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    UserGroupByOutputType(
      id: json['id'] as int?,
      username: json['username'] as String?,
      passwordHash: json['passwordHash'] as String?,
    );

Map<String, dynamic> _$UserGroupByOutputTypeToJson(
    UserGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('username', instance.username);
  writeNotNull('passwordHash', instance.passwordHash);
  return val;
}

PostGroupByOutputType _$PostGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    PostGroupByOutputType(
      id: json['id'] as int?,
      imageId: json['imageId'] as String?,
      ext: json['ext'] as String?,
      content: json['content'] as String?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$PostGroupByOutputTypeToJson(
    PostGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('imageId', instance.imageId);
  writeNotNull('ext', instance.ext);
  writeNotNull('content', instance.content);
  writeNotNull('userId', instance.userId);
  return val;
}

CommentGroupByOutputType _$CommentGroupByOutputTypeFromJson(
        Map<String, dynamic> json) =>
    CommentGroupByOutputType(
      id: json['id'] as int?,
      content: json['content'] as String?,
      postId: json['postId'] as int?,
      userId: json['userId'] as int?,
    );

Map<String, dynamic> _$CommentGroupByOutputTypeToJson(
    CommentGroupByOutputType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('content', instance.content);
  writeNotNull('postId', instance.postId);
  writeNotNull('userId', instance.userId);
  return val;
}

AffectedRowsOutput _$AffectedRowsOutputFromJson(Map<String, dynamic> json) =>
    AffectedRowsOutput(
      count: json['count'] as int?,
    );

Map<String, dynamic> _$AffectedRowsOutputToJson(AffectedRowsOutput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('count', instance.count);
  return val;
}

Map<String, dynamic> _$DatasourcesToJson(Datasources instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('db', instance.db);
  return val;
}
