# Explore: explore_1408
# Auto-generated LookML Explore File

include: "/views/domain_25/view_04225.view.lkml"
include: "/views/domain_27/view_04227.view.lkml"
include: "/views/domain_28/view_04228.view.lkml"
include: "/views/domain_29/view_04229.view.lkml"

explore: explore_1408 {
  label: "Explore Explore 1408"
  description: "Comprehensive analytics explore joining base view_04225 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_04225
  
  always_filter: {
    filters: [view_04225.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04225.created_at_date: "7 days"]
    unless: [view_04225.id, view_04225.status]
  }

  join: view_04227 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04225.user_id} = ${view_04227.id} ;;
    required_joins: []
  }

  join: view_04228 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04225.account_id} = ${view_04228.account_id} ;;
    required_joins: [view_04227]
  }

  join: view_04229 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04225.category} = ${view_04229.category} ;;
  }

  access_filter: {
    field: view_04225.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04225.is_deleted} = false ;;
}
