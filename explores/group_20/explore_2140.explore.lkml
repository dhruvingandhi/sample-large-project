# Explore: explore_2140
# Auto-generated LookML Explore File

include: "/views/domain_21/view_06421.view.lkml"
include: "/views/domain_23/view_06423.view.lkml"
include: "/views/domain_24/view_06424.view.lkml"
include: "/views/domain_25/view_06425.view.lkml"

explore: explore_2140 {
  label: "Explore Explore 2140"
  description: "Comprehensive analytics explore joining base view_06421 with related tables."
  group_label: "Analytics Domain 01"
  
  view_name: view_06421
  
  always_filter: {
    filters: [view_06421.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06421.created_at_date: "7 days"]
    unless: [view_06421.id, view_06421.status]
  }

  join: view_06423 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06421.user_id} = ${view_06423.id} ;;
    required_joins: []
  }

  join: view_06424 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06421.account_id} = ${view_06424.account_id} ;;
    required_joins: [view_06423]
  }

  join: view_06425 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06421.category} = ${view_06425.category} ;;
  }

  access_filter: {
    field: view_06421.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06421.is_deleted} = false ;;
}
