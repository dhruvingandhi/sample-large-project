# Explore: explore_3501
# Auto-generated LookML Explore File

include: "/views/domain_04/view_10504.view.lkml"
include: "/views/domain_06/view_10506.view.lkml"
include: "/views/domain_07/view_10507.view.lkml"
include: "/views/domain_08/view_10508.view.lkml"

explore: explore_3501 {
  label: "Explore Explore 3501"
  description: "Comprehensive analytics explore joining base view_10504 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_10504
  
  always_filter: {
    filters: [view_10504.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_10504.created_at_date: "7 days"]
    unless: [view_10504.id, view_10504.status]
  }

  join: view_10506 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_10504.user_id} = ${view_10506.id} ;;
    required_joins: []
  }

  join: view_10507 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_10504.account_id} = ${view_10507.account_id} ;;
    required_joins: [view_10506]
  }

  join: view_10508 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_10504.category} = ${view_10508.category} ;;
  }

  access_filter: {
    field: view_10504.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_10504.is_deleted} = false ;;
}
