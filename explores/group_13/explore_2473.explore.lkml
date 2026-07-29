# Explore: explore_2473
# Auto-generated LookML Explore File

include: "/views/domain_20/view_07420.view.lkml"
include: "/views/domain_22/view_07422.view.lkml"
include: "/views/domain_23/view_07423.view.lkml"
include: "/views/domain_24/view_07424.view.lkml"

explore: explore_2473 {
  label: "Explore Explore 2473"
  description: "Comprehensive analytics explore joining base view_07420 with related tables."
  group_label: "Analytics Domain 14"
  
  view_name: view_07420
  
  always_filter: {
    filters: [view_07420.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07420.created_at_date: "7 days"]
    unless: [view_07420.id, view_07420.status]
  }

  join: view_07422 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07420.user_id} = ${view_07422.id} ;;
    required_joins: []
  }

  join: view_07423 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07420.account_id} = ${view_07423.account_id} ;;
    required_joins: [view_07422]
  }

  join: view_07424 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07420.category} = ${view_07424.category} ;;
  }

  access_filter: {
    field: view_07420.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07420.is_deleted} = false ;;
}
