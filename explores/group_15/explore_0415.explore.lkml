# Explore: explore_0415
# Auto-generated LookML Explore File

include: "/views/domain_46/view_01246.view.lkml"
include: "/views/domain_48/view_01248.view.lkml"
include: "/views/domain_49/view_01249.view.lkml"
include: "/views/domain_50/view_01250.view.lkml"

explore: explore_0415 {
  label: "Explore Explore 0415"
  description: "Comprehensive analytics explore joining base view_01246 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_01246
  
  always_filter: {
    filters: [view_01246.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_01246.created_at_date: "7 days"]
    unless: [view_01246.id, view_01246.status]
  }

  join: view_01248 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_01246.user_id} = ${view_01248.id} ;;
    required_joins: []
  }

  join: view_01249 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_01246.account_id} = ${view_01249.account_id} ;;
    required_joins: [view_01248]
  }

  join: view_01250 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_01246.category} = ${view_01250.category} ;;
  }

  access_filter: {
    field: view_01246.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_01246.is_deleted} = false ;;
}
