# Explore: explore_0953
# Auto-generated LookML Explore File

include: "/views/domain_10/view_02860.view.lkml"
include: "/views/domain_12/view_02862.view.lkml"
include: "/views/domain_13/view_02863.view.lkml"
include: "/views/domain_14/view_02864.view.lkml"

explore: explore_0953 {
  label: "Explore Explore 0953"
  description: "Comprehensive analytics explore joining base view_02860 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_02860
  
  always_filter: {
    filters: [view_02860.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02860.created_at_date: "7 days"]
    unless: [view_02860.id, view_02860.status]
  }

  join: view_02862 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02860.user_id} = ${view_02862.id} ;;
    required_joins: []
  }

  join: view_02863 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02860.account_id} = ${view_02863.account_id} ;;
    required_joins: [view_02862]
  }

  join: view_02864 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02860.category} = ${view_02864.category} ;;
  }

  access_filter: {
    field: view_02860.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02860.is_deleted} = false ;;
}
