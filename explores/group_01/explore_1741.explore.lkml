# Explore: explore_1741
# Auto-generated LookML Explore File

include: "/views/domain_24/view_05224.view.lkml"
include: "/views/domain_26/view_05226.view.lkml"
include: "/views/domain_27/view_05227.view.lkml"
include: "/views/domain_28/view_05228.view.lkml"

explore: explore_1741 {
  label: "Explore Explore 1741"
  description: "Comprehensive analytics explore joining base view_05224 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_05224
  
  always_filter: {
    filters: [view_05224.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05224.created_at_date: "7 days"]
    unless: [view_05224.id, view_05224.status]
  }

  join: view_05226 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05224.user_id} = ${view_05226.id} ;;
    required_joins: []
  }

  join: view_05227 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05224.account_id} = ${view_05227.account_id} ;;
    required_joins: [view_05226]
  }

  join: view_05228 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05224.category} = ${view_05228.category} ;;
  }

  access_filter: {
    field: view_05224.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05224.is_deleted} = false ;;
}
