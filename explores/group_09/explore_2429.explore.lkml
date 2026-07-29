# Explore: explore_2429
# Auto-generated LookML Explore File

include: "/views/domain_38/view_07288.view.lkml"
include: "/views/domain_40/view_07290.view.lkml"
include: "/views/domain_41/view_07291.view.lkml"
include: "/views/domain_42/view_07292.view.lkml"

explore: explore_2429 {
  label: "Explore Explore 2429"
  description: "Comprehensive analytics explore joining base view_07288 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_07288
  
  always_filter: {
    filters: [view_07288.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07288.created_at_date: "7 days"]
    unless: [view_07288.id, view_07288.status]
  }

  join: view_07290 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07288.user_id} = ${view_07290.id} ;;
    required_joins: []
  }

  join: view_07291 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07288.account_id} = ${view_07291.account_id} ;;
    required_joins: [view_07290]
  }

  join: view_07292 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07288.category} = ${view_07292.category} ;;
  }

  access_filter: {
    field: view_07288.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07288.is_deleted} = false ;;
}
