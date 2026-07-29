# Explore: explore_0941
# Auto-generated LookML Explore File

include: "/views/domain_24/view_02824.view.lkml"
include: "/views/domain_26/view_02826.view.lkml"
include: "/views/domain_27/view_02827.view.lkml"
include: "/views/domain_28/view_02828.view.lkml"

explore: explore_0941 {
  label: "Explore Explore 0941"
  description: "Comprehensive analytics explore joining base view_02824 with related tables."
  group_label: "Analytics Domain 02"
  
  view_name: view_02824
  
  always_filter: {
    filters: [view_02824.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_02824.created_at_date: "7 days"]
    unless: [view_02824.id, view_02824.status]
  }

  join: view_02826 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_02824.user_id} = ${view_02826.id} ;;
    required_joins: []
  }

  join: view_02827 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_02824.account_id} = ${view_02827.account_id} ;;
    required_joins: [view_02826]
  }

  join: view_02828 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_02824.category} = ${view_02828.category} ;;
  }

  access_filter: {
    field: view_02824.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_02824.is_deleted} = false ;;
}
