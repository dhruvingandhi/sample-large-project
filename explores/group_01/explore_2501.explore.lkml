# Explore: explore_2501
# Auto-generated LookML Explore File

include: "/views/domain_04/view_07504.view.lkml"
include: "/views/domain_06/view_07506.view.lkml"
include: "/views/domain_07/view_07507.view.lkml"
include: "/views/domain_08/view_07508.view.lkml"

explore: explore_2501 {
  label: "Explore Explore 2501"
  description: "Comprehensive analytics explore joining base view_07504 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_07504
  
  always_filter: {
    filters: [view_07504.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07504.created_at_date: "7 days"]
    unless: [view_07504.id, view_07504.status]
  }

  join: view_07506 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07504.user_id} = ${view_07506.id} ;;
    required_joins: []
  }

  join: view_07507 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07504.account_id} = ${view_07507.account_id} ;;
    required_joins: [view_07506]
  }

  join: view_07508 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07504.category} = ${view_07508.category} ;;
  }

  access_filter: {
    field: view_07504.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07504.is_deleted} = false ;;
}
