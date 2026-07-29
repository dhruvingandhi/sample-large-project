# Explore: explore_2666
# Auto-generated LookML Explore File

include: "/views/domain_49/view_07999.view.lkml"
include: "/views/domain_01/view_08001.view.lkml"
include: "/views/domain_02/view_08002.view.lkml"
include: "/views/domain_03/view_08003.view.lkml"

explore: explore_2666 {
  label: "Explore Explore 2666"
  description: "Comprehensive analytics explore joining base view_07999 with related tables."
  group_label: "Analytics Domain 07"
  
  view_name: view_07999
  
  always_filter: {
    filters: [view_07999.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_07999.created_at_date: "7 days"]
    unless: [view_07999.id, view_07999.status]
  }

  join: view_08001 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_07999.user_id} = ${view_08001.id} ;;
    required_joins: []
  }

  join: view_08002 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_07999.account_id} = ${view_08002.account_id} ;;
    required_joins: [view_08001]
  }

  join: view_08003 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_07999.category} = ${view_08003.category} ;;
  }

  access_filter: {
    field: view_07999.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_07999.is_deleted} = false ;;
}
