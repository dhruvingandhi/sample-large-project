# Explore: explore_3841
# Auto-generated LookML Explore File

include: "/views/domain_24/view_11524.view.lkml"
include: "/views/domain_26/view_11526.view.lkml"
include: "/views/domain_27/view_11527.view.lkml"
include: "/views/domain_28/view_11528.view.lkml"

explore: explore_3841 {
  label: "Explore Explore 3841"
  description: "Comprehensive analytics explore joining base view_11524 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_11524
  
  always_filter: {
    filters: [view_11524.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11524.created_at_date: "7 days"]
    unless: [view_11524.id, view_11524.status]
  }

  join: view_11526 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11524.user_id} = ${view_11526.id} ;;
    required_joins: []
  }

  join: view_11527 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11524.account_id} = ${view_11527.account_id} ;;
    required_joins: [view_11526]
  }

  join: view_11528 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11524.category} = ${view_11528.category} ;;
  }

  access_filter: {
    field: view_11524.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11524.is_deleted} = false ;;
}
