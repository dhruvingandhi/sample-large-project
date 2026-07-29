# Explore: explore_3074
# Auto-generated LookML Explore File

include: "/views/domain_23/view_09223.view.lkml"
include: "/views/domain_25/view_09225.view.lkml"
include: "/views/domain_26/view_09226.view.lkml"
include: "/views/domain_27/view_09227.view.lkml"

explore: explore_3074 {
  label: "Explore Explore 3074"
  description: "Comprehensive analytics explore joining base view_09223 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09223
  
  always_filter: {
    filters: [view_09223.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09223.created_at_date: "7 days"]
    unless: [view_09223.id, view_09223.status]
  }

  join: view_09225 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09223.user_id} = ${view_09225.id} ;;
    required_joins: []
  }

  join: view_09226 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09223.account_id} = ${view_09226.account_id} ;;
    required_joins: [view_09225]
  }

  join: view_09227 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09223.category} = ${view_09227.category} ;;
  }

  access_filter: {
    field: view_09223.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09223.is_deleted} = false ;;
}
