# Explore: explore_3141
# Auto-generated LookML Explore File

include: "/views/domain_24/view_09424.view.lkml"
include: "/views/domain_26/view_09426.view.lkml"
include: "/views/domain_27/view_09427.view.lkml"
include: "/views/domain_28/view_09428.view.lkml"

explore: explore_3141 {
  label: "Explore Explore 3141"
  description: "Comprehensive analytics explore joining base view_09424 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_09424
  
  always_filter: {
    filters: [view_09424.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09424.created_at_date: "7 days"]
    unless: [view_09424.id, view_09424.status]
  }

  join: view_09426 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09424.user_id} = ${view_09426.id} ;;
    required_joins: []
  }

  join: view_09427 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09424.account_id} = ${view_09427.account_id} ;;
    required_joins: [view_09426]
  }

  join: view_09428 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09424.category} = ${view_09428.category} ;;
  }

  access_filter: {
    field: view_09424.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09424.is_deleted} = false ;;
}
