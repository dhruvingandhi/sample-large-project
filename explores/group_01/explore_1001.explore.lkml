# Explore: explore_1001
# Auto-generated LookML Explore File

include: "/views/domain_04/view_03004.view.lkml"
include: "/views/domain_06/view_03006.view.lkml"
include: "/views/domain_07/view_03007.view.lkml"
include: "/views/domain_08/view_03008.view.lkml"

explore: explore_1001 {
  label: "Explore Explore 1001"
  description: "Comprehensive analytics explore joining base view_03004 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_03004
  
  always_filter: {
    filters: [view_03004.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_03004.created_at_date: "7 days"]
    unless: [view_03004.id, view_03004.status]
  }

  join: view_03006 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_03004.user_id} = ${view_03006.id} ;;
    required_joins: []
  }

  join: view_03007 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_03004.account_id} = ${view_03007.account_id} ;;
    required_joins: [view_03006]
  }

  join: view_03008 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_03004.category} = ${view_03008.category} ;;
  }

  access_filter: {
    field: view_03004.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_03004.is_deleted} = false ;;
}
