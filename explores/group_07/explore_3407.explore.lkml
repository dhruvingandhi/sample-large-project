# Explore: explore_3407
# Auto-generated LookML Explore File

include: "/views/domain_22/view_10222.view.lkml"
include: "/views/domain_24/view_10224.view.lkml"
include: "/views/domain_25/view_10225.view.lkml"
include: "/views/domain_26/view_10226.view.lkml"

explore: explore_3407 {
  label: "Explore Explore 3407"
  description: "Comprehensive analytics explore joining base view_10222 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_10222
  
  always_filter: {
    filters: [view_10222.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10222.created_at_date: "7 days"]
    unless: [view_10222.id, view_10222.status]
  }

  join: view_10224 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10222.user_id} = ${view_10224.id} ;;
    required_joins: []
  }

  join: view_10225 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10222.account_id} = ${view_10225.account_id} ;;
    required_joins: [view_10224]
  }

  join: view_10226 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10222.category} = ${view_10226.category} ;;
  }

  access_filter: {
    field: view_10222.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10222.is_deleted} = false ;;
}
