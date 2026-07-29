# Explore: explore_2184
# Auto-generated LookML Explore File

include: "/views/domain_03/view_06553.view.lkml"
include: "/views/domain_05/view_06555.view.lkml"
include: "/views/domain_06/view_06556.view.lkml"
include: "/views/domain_07/view_06557.view.lkml"

explore: explore_2184 {
  label: "Explore Explore 2184"
  description: "Comprehensive analytics explore joining base view_06553 with related tables."
  group_label: "Analytics Domain 05"
  
  view_name: view_06553
  
  always_filter: {
    filters: [view_06553.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06553.created_at_date: "7 days"]
    unless: [view_06553.id, view_06553.status]
  }

  join: view_06555 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06553.user_id} = ${view_06555.id} ;;
    required_joins: []
  }

  join: view_06556 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06553.account_id} = ${view_06556.account_id} ;;
    required_joins: [view_06555]
  }

  join: view_06557 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06553.category} = ${view_06557.category} ;;
  }

  access_filter: {
    field: view_06553.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06553.is_deleted} = false ;;
}
