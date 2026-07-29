# Explore: explore_0971
# Auto-generated LookML Explore File

include: "/views/domain_14/view_02914.view.lkml"
include: "/views/domain_16/view_02916.view.lkml"
include: "/views/domain_17/view_02917.view.lkml"
include: "/views/domain_18/view_02918.view.lkml"

explore: explore_0971 {
  label: "Explore Explore 0971"
  description: "Comprehensive analytics explore joining base view_02914 with related tables."
  group_label: "Analytics Domain 12"
  
  view_name: view_02914
  
  always_filter: {
    filters: [view_02914.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02914.created_at_date: "7 days"]
    unless: [view_02914.id, view_02914.status]
  }

  join: view_02916 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02914.user_id} = ${view_02916.id} ;;
    required_joins: []
  }

  join: view_02917 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02914.account_id} = ${view_02917.account_id} ;;
    required_joins: [view_02916]
  }

  join: view_02918 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02914.category} = ${view_02918.category} ;;
  }

  access_filter: {
    field: view_02914.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02914.is_deleted} = false ;;
}
