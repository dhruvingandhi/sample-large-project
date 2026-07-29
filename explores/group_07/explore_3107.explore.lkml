# Explore: explore_3107
# Auto-generated LookML Explore File

include: "/views/domain_22/view_09322.view.lkml"
include: "/views/domain_24/view_09324.view.lkml"
include: "/views/domain_25/view_09325.view.lkml"
include: "/views/domain_26/view_09326.view.lkml"

explore: explore_3107 {
  label: "Explore Explore 3107"
  description: "Comprehensive analytics explore joining base view_09322 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_09322
  
  always_filter: {
    filters: [view_09322.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09322.created_at_date: "7 days"]
    unless: [view_09322.id, view_09322.status]
  }

  join: view_09324 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09322.user_id} = ${view_09324.id} ;;
    required_joins: []
  }

  join: view_09325 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09322.account_id} = ${view_09325.account_id} ;;
    required_joins: [view_09324]
  }

  join: view_09326 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09322.category} = ${view_09326.category} ;;
  }

  access_filter: {
    field: view_09322.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09322.is_deleted} = false ;;
}
