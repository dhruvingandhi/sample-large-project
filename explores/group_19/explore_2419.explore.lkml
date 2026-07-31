# Update for 2000 file diff target
# Explore: explore_2419
# Auto-generated LookML Explore File

include: "/views/domain_08/view_07258.view.lkml"
include: "/views/domain_10/view_07260.view.lkml"
include: "/views/domain_11/view_07261.view.lkml"
include: "/views/domain_12/view_07262.view.lkml"

explore: explore_2419 {
  label: "Explore Explore 2419"
  description: "Comprehensive analytics explore joining base view_07258 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_07258
  
  always_filter: {
    filters: [view_07258.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07258.created_at_date: "7 days"]
    unless: [view_07258.id, view_07258.status]
  }

  join: view_07260 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07258.user_id} = ${view_07260.id} ;;
    required_joins: []
  }

  join: view_07261 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07258.account_id} = ${view_07261.account_id} ;;
    required_joins: [view_07260]
  }

  join: view_07262 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07258.category} = ${view_07262.category} ;;
  }

  access_filter: {
    field: view_07258.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07258.is_deleted} = false ;;
}
