# Explore: explore_3399
# Auto-generated LookML Explore File

include: "/views/domain_48/view_10198.view.lkml"
include: "/views/domain_50/view_10200.view.lkml"
include: "/views/domain_01/view_10201.view.lkml"
include: "/views/domain_02/view_10202.view.lkml"

explore: explore_3399 {
  label: "Explore Explore 3399"
  description: "Comprehensive analytics explore joining base view_10198 with related tables."
  group_label: "Analytics Domain 20"
  
  view_name: view_10198
  
  always_filter: {
    filters: [view_10198.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10198.created_at_date: "7 days"]
    unless: [view_10198.id, view_10198.status]
  }

  join: view_10200 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10198.user_id} = ${view_10200.id} ;;
    required_joins: []
  }

  join: view_10201 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10198.account_id} = ${view_10201.account_id} ;;
    required_joins: [view_10200]
  }

  join: view_10202 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10198.category} = ${view_10202.category} ;;
  }

  access_filter: {
    field: view_10198.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10198.is_deleted} = false ;;
}
