# Explore: explore_3054
# Auto-generated LookML Explore File

include: "/views/domain_13/view_09163.view.lkml"
include: "/views/domain_15/view_09165.view.lkml"
include: "/views/domain_16/view_09166.view.lkml"
include: "/views/domain_17/view_09167.view.lkml"

explore: explore_3054 {
  label: "Explore Explore 3054"
  description: "Comprehensive analytics explore joining base view_09163 with related tables."
  group_label: "Analytics Domain 15"
  
  view_name: view_09163
  
  always_filter: {
    filters: [view_09163.is_active: "yes"]
  }

  conditionally_filter: {
    filters: [view_09163.created_at_date: "7 days"]
    unless: [view_09163.id, view_09163.status]
  }

  join: view_09165 {
    type: left_outer
    relationship: many_to_one
    sql_on: ${view_09163.user_id} = ${view_09165.id} ;;
    required_joins: []
  }

  join: view_09166 {
    type: left_outer
    relationship: one_to_many
    sql_on: ${view_09163.account_id} = ${view_09166.account_id} ;;
    required_joins: [view_09165]
  }

  join: view_09167 {
    type: inner
    relationship: many_to_many
    sql_on: ${view_09163.category} = ${view_09167.category} ;;
  }

  access_filter: {
    field: view_09163.country_code
    user_attribute: allowed_countries
  }

  sql_always_where: ${view_09163.is_deleted} = false ;;
}
