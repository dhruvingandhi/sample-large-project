# Explore: explore_1292
# Auto-generated LookML Explore File

include: "/views/domain_27/view_03877.view.lkml"
include: "/views/domain_29/view_03879.view.lkml"
include: "/views/domain_30/view_03880.view.lkml"
include: "/views/domain_31/view_03881.view.lkml"

explore: explore_1292 {
  label: "Explore Explore 1292"
  description: "Comprehensive analytics explore joining base view_03877 with related tables."
  group_label: "Analytics Domain 13"
  
  view_name: view_03877
  
  always_filter: {
    filters: [view_03877.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03877.created_at_date: "7 days"]
    unless: [view_03877.id, view_03877.status]
  }

  join: view_03879 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03877.user_id} = ${view_03879.id} ;;
    required_joins: []
  }

  join: view_03880 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03877.account_id} = ${view_03880.account_id} ;;
    required_joins: [view_03879]
  }

  join: view_03881 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03877.category} = ${view_03881.category} ;;
  }

  access_filter: {
    field: view_03877.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03877.is_deleted} = false ;;
}
