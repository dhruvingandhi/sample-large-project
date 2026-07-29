# Explore: explore_2027
# Auto-generated LookML Explore File

include: "/views/domain_32/view_06082.view.lkml"
include: "/views/domain_34/view_06084.view.lkml"
include: "/views/domain_35/view_06085.view.lkml"
include: "/views/domain_36/view_06086.view.lkml"

explore: explore_2027 {
  label: "Explore Explore 2027"
  description: "Comprehensive analytics explore joining base view_06082 with related tables."
  group_label: "Analytics Domain 08"
  
  view_name: view_06082
  
  always_filter: {
    filters: [view_06082.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_06082.created_at_date: "7 days"]
    unless: [view_06082.id, view_06082.status]
  }

  join: view_06084 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_06082.user_id} = ${view_06084.id} ;;
    required_joins: []
  }

  join: view_06085 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_06082.account_id} = ${view_06085.account_id} ;;
    required_joins: [view_06084]
  }

  join: view_06086 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_06082.category} = ${view_06086.category} ;;
  }

  access_filter: {
    field: view_06082.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_06082.is_deleted} = false ;;
}
