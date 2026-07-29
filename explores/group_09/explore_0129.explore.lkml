# Explore: explore_0129
# Auto-generated LookML Explore File

include: "/views/domain_38/view_00388.view.lkml"
include: "/views/domain_40/view_00390.view.lkml"
include: "/views/domain_41/view_00391.view.lkml"
include: "/views/domain_42/view_00392.view.lkml"

explore: explore_0129 {
  label: "Explore Explore 0129"
  description: "Comprehensive analytics explore joining base view_00388 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_00388
  
  always_filter: {
    filters: [view_00388.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00388.created_at_date: "7 days"]
    unless: [view_00388.id, view_00388.status]
  }

  join: view_00390 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00388.user_id} = ${view_00390.id} ;;
    required_joins: []
  }

  join: view_00391 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00388.account_id} = ${view_00391.account_id} ;;
    required_joins: [view_00390]
  }

  join: view_00392 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00388.category} = ${view_00392.category} ;;
  }

  access_filter: {
    field: view_00388.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00388.is_deleted} = false ;;
}
