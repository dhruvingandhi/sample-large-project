# Explore: explore_1835
# Auto-generated LookML Explore File

include: "/views/domain_06/view_05506.view.lkml"
include: "/views/domain_08/view_05508.view.lkml"
include: "/views/domain_09/view_05509.view.lkml"
include: "/views/domain_10/view_05510.view.lkml"

explore: explore_1835 {
  label: "Explore Explore 1835"
  description: "Comprehensive analytics explore joining base view_05506 with related tables."
  group_label: "Analytics Domain 16"
  
  view_name: view_05506
  
  always_filter: {
    filters: [view_05506.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_05506.created_at_date: "7 days"]
    unless: [view_05506.id, view_05506.status]
  }

  join: view_05508 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_05506.user_id} = ${view_05508.id} ;;
    required_joins: []
  }

  join: view_05509 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_05506.account_id} = ${view_05509.account_id} ;;
    required_joins: [view_05508]
  }

  join: view_05510 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_05506.category} = ${view_05510.category} ;;
  }

  access_filter: {
    field: view_05506.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_05506.is_deleted} = false ;;
}
