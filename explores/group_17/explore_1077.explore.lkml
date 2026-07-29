# Explore: explore_1077
# Auto-generated LookML Explore File

include: "/views/domain_32/view_03232.view.lkml"
include: "/views/domain_34/view_03234.view.lkml"
include: "/views/domain_35/view_03235.view.lkml"
include: "/views/domain_36/view_03236.view.lkml"

explore: explore_1077 {
  label: "Explore Explore 1077"
  description: "Comprehensive analytics explore joining base view_03232 with related tables."
  group_label: "Analytics Domain 18"
  
  view_name: view_03232
  
  always_filter: {
    filters: [view_03232.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03232.created_at_date: "7 days"]
    unless: [view_03232.id, view_03232.status]
  }

  join: view_03234 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03232.user_id} = ${view_03234.id} ;;
    required_joins: []
  }

  join: view_03235 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03232.account_id} = ${view_03235.account_id} ;;
    required_joins: [view_03234]
  }

  join: view_03236 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03232.category} = ${view_03236.category} ;;
  }

  access_filter: {
    field: view_03232.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03232.is_deleted} = false ;;
}
