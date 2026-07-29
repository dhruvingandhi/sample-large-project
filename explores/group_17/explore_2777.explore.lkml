# Explore: explore_2777
# Auto-generated LookML Explore File

include: "/views/domain_32/view_08332.view.lkml"
include: "/views/domain_34/view_08334.view.lkml"
include: "/views/domain_35/view_08335.view.lkml"
include: "/views/domain_36/view_08336.view.lkml"

explore: explore_2777 {
  label: "Explore Explore 2777"
  description: "Comprehensive analytics explore joining base view_08332 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_08332
  
  always_filter: {
    filters: [view_08332.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08332.created_at_date: "7 days"]
    unless: [view_08332.id, view_08332.status]
  }

  join: view_08334 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08332.user_id} = ${view_08334.id} ;;
    required_joins: []
  }

  join: view_08335 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08332.account_id} = ${view_08335.account_id} ;;
    required_joins: [view_08334]
  }

  join: view_08336 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08332.category} = ${view_08336.category} ;;
  }

  access_filter: {
    field: view_08332.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08332.is_deleted} = false ;;
}
