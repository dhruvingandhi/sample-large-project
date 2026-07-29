# Explore: explore_1666
# Auto-generated LookML Explore File

include: "/views/domain_49/view_04999.view.lkml"
include: "/views/domain_01/view_05001.view.lkml"
include: "/views/domain_02/view_05002.view.lkml"
include: "/views/domain_03/view_05003.view.lkml"

explore: explore_1666 {
  label: "Explore Explore 1666"
  description: "Comprehensive analytics explore joining base view_04999 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_04999
  
  always_filter: {
    filters: [view_04999.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_04999.created_at_date: "7 days"]
    unless: [view_04999.id, view_04999.status]
  }

  join: view_05001 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_04999.user_id} = ${view_05001.id} ;;
    required_joins: []
  }

  join: view_05002 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_04999.account_id} = ${view_05002.account_id} ;;
    required_joins: [view_05001]
  }

  join: view_05003 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_04999.category} = ${view_05003.category} ;;
  }

  access_filter: {
    field: view_04999.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_04999.is_deleted} = false ;;
}
