# Explore: explore_0107
# Auto-generated LookML Explore File

include: "/views/domain_22/view_00322.view.lkml"
include: "/views/domain_24/view_00324.view.lkml"
include: "/views/domain_25/view_00325.view.lkml"
include: "/views/domain_26/view_00326.view.lkml"

explore: explore_0107 {
  label: "Explore Explore 0107"
  description: "Comprehensive analytics explore joining base view_00322 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_00322
  
  always_filter: {
    filters: [view_00322.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_00322.created_at_date: "7 days"]
    unless: [view_00322.id, view_00322.status]
  }

  join: view_00324 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_00322.user_id} = ${view_00324.id} ;;
    required_joins: []
  }

  join: view_00325 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_00322.account_id} = ${view_00325.account_id} ;;
    required_joins: [view_00324]
  }

  join: view_00326 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_00322.category} = ${view_00326.category} ;;
  }

  access_filter: {
    field: view_00322.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_00322.is_deleted} = false ;;
}
