# Explore: explore_3989
# Auto-generated LookML Explore File

include: "/views/domain_18/view_11968.view.lkml"
include: "/views/domain_20/view_11970.view.lkml"
include: "/views/domain_21/view_11971.view.lkml"
include: "/views/domain_22/view_11972.view.lkml"

explore: explore_3989 {
  label: "Explore Explore 3989"
  description: "Comprehensive analytics explore joining base view_11968 with related tables."
  group_label: "Analytics Domain 10"
  
  view_name: view_11968
  
  always_filter: {
    filters: [view_11968.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11968.created_at_date: "7 days"]
    unless: [view_11968.id, view_11968.status]
  }

  join: view_11970 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11968.user_id} = ${view_11970.id} ;;
    required_joins: []
  }

  join: view_11971 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11968.account_id} = ${view_11971.account_id} ;;
    required_joins: [view_11970]
  }

  join: view_11972 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11968.category} = ${view_11972.category} ;;
  }

  access_filter: {
    field: view_11968.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11968.is_deleted} = false ;;
}
