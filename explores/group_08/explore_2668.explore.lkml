# Explore: explore_2668
# Auto-generated LookML Explore File

include: "/views/domain_05/view_08005.view.lkml"
include: "/views/domain_07/view_08007.view.lkml"
include: "/views/domain_08/view_08008.view.lkml"
include: "/views/domain_09/view_08009.view.lkml"

explore: explore_2668 {
  label: "Explore Explore 2668"
  description: "Comprehensive analytics explore joining base view_08005 with related tables."
  group_label: "Analytics Domain 09"
  
  view_name: view_08005
  
  always_filter: {
    filters: [view_08005.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_08005.created_at_date: "7 days"]
    unless: [view_08005.id, view_08005.status]
  }

  join: view_08007 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_08005.user_id} = ${view_08007.id} ;;
    required_joins: []
  }

  join: view_08008 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_08005.account_id} = ${view_08008.account_id} ;;
    required_joins: [view_08007]
  }

  join: view_08009 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_08005.category} = ${view_08009.category} ;;
  }

  access_filter: {
    field: view_08005.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_08005.is_deleted} = false ;;
}
