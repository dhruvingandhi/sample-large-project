# Explore: explore_1318
# Auto-generated LookML Explore File

include: "/views/domain_05/view_03955.view.lkml"
include: "/views/domain_07/view_03957.view.lkml"
include: "/views/domain_08/view_03958.view.lkml"
include: "/views/domain_09/view_03959.view.lkml"

explore: explore_1318 {
  label: "Explore Explore 1318"
  description: "Comprehensive analytics explore joining base view_03955 with related tables."
  group_label: "Analytics Domain 19"
  
  view_name: view_03955
  
  always_filter: {
    filters: [view_03955.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03955.created_at_date: "7 days"]
    unless: [view_03955.id, view_03955.status]
  }

  join: view_03957 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03955.user_id} = ${view_03957.id} ;;
    required_joins: []
  }

  join: view_03958 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03955.account_id} = ${view_03958.account_id} ;;
    required_joins: [view_03957]
  }

  join: view_03959 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03955.category} = ${view_03959.category} ;;
  }

  access_filter: {
    field: view_03955.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03955.is_deleted} = false ;;
}
