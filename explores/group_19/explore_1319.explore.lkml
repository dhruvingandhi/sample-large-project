# Explore: explore_1319
# Auto-generated LookML Explore File

include: "/views/domain_08/view_03958.view.lkml"
include: "/views/domain_10/view_03960.view.lkml"
include: "/views/domain_11/view_03961.view.lkml"
include: "/views/domain_12/view_03962.view.lkml"

explore: explore_1319 {
  label: "Explore Explore 1319"
  description: "Comprehensive analytics explore joining base view_03958 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_03958
  
  always_filter: {
    filters: [view_03958.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03958.created_at_date: "7 days"]
    unless: [view_03958.id, view_03958.status]
  }

  join: view_03960 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03958.user_id} = ${view_03960.id} ;;
    required_joins: []
  }

  join: view_03961 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03958.account_id} = ${view_03961.account_id} ;;
    required_joins: [view_03960]
  }

  join: view_03962 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03958.category} = ${view_03962.category} ;;
  }

  access_filter: {
    field: view_03958.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03958.is_deleted} = false ;;
}
