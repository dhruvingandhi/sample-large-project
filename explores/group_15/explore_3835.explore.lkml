# Explore: explore_3835
# Auto-generated LookML Explore File

include: "/views/domain_06/view_11506.view.lkml"
include: "/views/domain_08/view_11508.view.lkml"
include: "/views/domain_09/view_11509.view.lkml"
include: "/views/domain_10/view_11510.view.lkml"

explore: explore_3835 {
  label: "Explore Explore 3835"
  description: "Comprehensive analytics explore joining base view_11506 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_11506
  
  always_filter: {
    filters: [view_11506.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_11506.created_at_date: "7 days"]
    unless: [view_11506.id, view_11506.status]
  }

  join: view_11508 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_11506.user_id} = ${view_11508.id} ;;
    required_joins: []
  }

  join: view_11509 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_11506.account_id} = ${view_11509.account_id} ;;
    required_joins: [view_11508]
  }

  join: view_11510 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_11506.category} = ${view_11510.category} ;;
  }

  access_filter: {
    field: view_11506.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_11506.is_deleted} = false ;;
}
