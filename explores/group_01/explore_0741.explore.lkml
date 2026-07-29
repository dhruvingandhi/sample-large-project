# Explore: explore_0741
# Auto-generated LookML Explore File

include: "/views/domain_24/view_02224.view.lkml"
include: "/views/domain_26/view_02226.view.lkml"
include: "/views/domain_27/view_02227.view.lkml"
include: "/views/domain_28/view_02228.view.lkml"

explore: explore_0741 {
  label: "Explore Explore 0741"
  description: "Comprehensive analytics explore joining base view_02224 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02224
  
  always_filter: {
    filters: [view_02224.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02224.created_at_date: "7 days"]
    unless: [view_02224.id, view_02224.status]
  }

  join: view_02226 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02224.user_id} = ${view_02226.id} ;;
    required_joins: []
  }

  join: view_02227 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02224.account_id} = ${view_02227.account_id} ;;
    required_joins: [view_02226]
  }

  join: view_02228 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02224.category} = ${view_02228.category} ;;
  }

  access_filter: {
    field: view_02224.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02224.is_deleted} = false ;;
}
