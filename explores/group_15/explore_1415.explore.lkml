# Explore: explore_1415
# Auto-generated LookML Explore File

include: "/views/domain_46/view_04246.view.lkml"
include: "/views/domain_48/view_04248.view.lkml"
include: "/views/domain_49/view_04249.view.lkml"
include: "/views/domain_50/view_04250.view.lkml"

explore: explore_1415 {
  label: "Explore Explore 1415"
  description: "Comprehensive analytics explore joining base view_04246 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_04246
  
  always_filter: {
    filters: [view_04246.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04246.created_at_date: "7 days"]
    unless: [view_04246.id, view_04246.status]
  }

  join: view_04248 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04246.user_id} = ${view_04248.id} ;;
    required_joins: []
  }

  join: view_04249 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04246.account_id} = ${view_04249.account_id} ;;
    required_joins: [view_04248]
  }

  join: view_04250 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04246.category} = ${view_04250.category} ;;
  }

  access_filter: {
    field: view_04246.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04246.is_deleted} = false ;;
}
