# Explore: explore_1501
# Auto-generated LookML Explore File

include: "/views/domain_04/view_04504.view.lkml"
include: "/views/domain_06/view_04506.view.lkml"
include: "/views/domain_07/view_04507.view.lkml"
include: "/views/domain_08/view_04508.view.lkml"

explore: explore_1501 {
  label: "Explore Explore 1501"
  description: "Comprehensive analytics explore joining base view_04504 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_04504
  
  always_filter: {
    filters: [view_04504.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04504.created_at_date: "7 days"]
    unless: [view_04504.id, view_04504.status]
  }

  join: view_04506 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04504.user_id} = ${view_04506.id} ;;
    required_joins: []
  }

  join: view_04507 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04504.account_id} = ${view_04507.account_id} ;;
    required_joins: [view_04506]
  }

  join: view_04508 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04504.category} = ${view_04508.category} ;;
  }

  access_filter: {
    field: view_04504.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04504.is_deleted} = false ;;
}
