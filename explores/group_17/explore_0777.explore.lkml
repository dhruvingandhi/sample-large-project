# Explore: explore_0777
# Auto-generated LookML Explore File

include: "/views/domain_32/view_02332.view.lkml"
include: "/views/domain_34/view_02334.view.lkml"
include: "/views/domain_35/view_02335.view.lkml"
include: "/views/domain_36/view_02336.view.lkml"

explore: explore_0777 {
  label: "Explore Explore 0777"
  description: "Comprehensive analytics explore joining base view_02332 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_02332
  
  always_filter: {
    filters: [view_02332.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02332.created_at_date: "7 days"]
    unless: [view_02332.id, view_02332.status]
  }

  join: view_02334 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02332.user_id} = ${view_02334.id} ;;
    required_joins: []
  }

  join: view_02335 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02332.account_id} = ${view_02335.account_id} ;;
    required_joins: [view_02334]
  }

  join: view_02336 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02332.category} = ${view_02336.category} ;;
  }

  access_filter: {
    field: view_02332.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02332.is_deleted} = false ;;
}
